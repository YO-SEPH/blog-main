package com.cos.blog.service;



import com.cos.blog.dto.ResponseDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.cos.blog.model.RoleType;
import com.cos.blog.model.User;
import com.cos.blog.repository.UserRepository;
import org.springframework.transaction.annotation.Transactional;

//스프링이 컴포넌트 스캔을 통해서 Bean에 등록을 해준다. IoC를 해준다.
@Service
public class UserService {

    @Autowired //의존성 주입 (DI)
     private UserRepository userRepository;

     @Autowired
     private BCryptPasswordEncoder encoder;

     @Transactional // 전체가 성공해야 commit, 실패하면 rollback
     public void 회원가입(User user) {
        String rawPassword = user.getPassword();
        String encPassword = encoder.encode(rawPassword);
        user.setPassword(encPassword);
        user.setRole(RoleType.USER);
        userRepository.save(user);
     }
     @Transactional
    public void 회원수정(User user) {
         User persistance = userRepository.findById(user.getId())
                 .orElseThrow(()-> {
                     return new IllegalArgumentException("회원이 존재하지 않습니다. id : " + user.getId());
                 });
         String rawPassword = user.getPassword();
         String encPassword = encoder.encode(rawPassword);
         persistance.setPassword(encPassword);
         persistance.setEmail(user.getEmail());
     }

}



//      회원수정 함수 종료시 = 서비스 종료 = 트랜잭션 종료 = commit 이 자동으로 됩니다.
//       영속화된 persistance 객체의 변화가 감지되면 더티체킹이 되어 update 문을 날려줌
//      @Transactional(readOnly = true)
//       // Select 할 때 트랜잭션 시작 -> 서비스 종료시에 트랜잭션 종료 까지 "정합성" 유지
//      public User 로그인(User user) {
//         return userRepository.findByUsernameAndPassword(user.getUsername(), user.getPassword());
//   }
