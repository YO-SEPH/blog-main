package com.cos.blog.Controller.api;

import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import com.cos.blog.dto.ResponseDto;
import com.cos.blog.model.RoleType;
import com.cos.blog.model.User;
import com.cos.blog.service.UserService;



@RestController
public class UserApiController {

    @Autowired
    private UserService userService;

    @Autowired
    private AuthenticationManager authenticationManager;

    @PostMapping("/auth/joinProc")
    public ResponseDto<Integer> save(@RequestBody User user) {
        System.out.println("UserApiController : save 호출됨");
        user.setRole(RoleType.USER);
        userService.회원가입(user);
        return new ResponseDto<Integer>(HttpStatus.OK.value(), 1); // 통신 성공 : 200, 실패 : 500 // 자바 오브젝트를 JSON으로 변환해서 리턴 (Jackson)
    }
    @PutMapping("/user")
    public ResponseDto<Integer> update(@RequestBody User user, HttpSession session) {
        userService.회원수정(user);
        //여기서는 트랜잭션이 종료되기 때문에 DB에 값은 변경이 됐음.
        // 하지만 세션값은 변경되지 않은 상태이기 때문에 우리가 직접 세션값을 변경해줄 것임.
        // 세션 등록
       Authentication authentication  = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword()));
        SecurityContextHolder.getContext().setAuthentication(authentication);
        return  new ResponseDto<Integer>(HttpStatus.OK.value(),1);
    }

    @PostMapping("/idCheck")
    @ResponseBody
    public Optional<User> findByUsername(@RequestParam("username") String username) {

        Optional<User> cnt = userService.idCheck(username);
        return cnt;

    }
}

/*
    // 전통적인 로그인 방식 (시큐리티 이용 X)
  @PostMapping("/api/user/login")
  public ResponseDto<Integer> login(@RequestBody User user ,HttpSession session) {
      System.out.println("UserApiController : login 호출됨");
      User principal = userService.로그인(user); // principal : 접근주체
      System.out.println(principal);
      if (principal != null) { // null이 아니면 세션 만들기
        session.setAttribute("principal", principal);
      }

      return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
  }
  */
