package com.cos.blog.test;

import java.util.List;
import java.util.function.Supplier;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.blog.model.RoleType;
import com.cos.blog.model.User;
import com.cos.blog.repository.UserRepository;

// html 파일이 아니라 data를 리턴해주는 controller --> RestController
@RestController
public class DummyControllerTest {

   @Autowired(required = false ) //의존성 주입 (DI)
   private UserRepository userRepository;


   @DeleteMapping("dummy/user/{id}")
   public String delete(@PathVariable int id) {
       try{
       userRepository.deleteById(id);
       } catch(Exception e) { //완벽하게 걸려면 EmptyResultDataAccessException 을 걸어주면 된다.
           return "삭제에 실패하였습니다. 해당 id는 DB에 없습니다";
       }
       return "삭제되었습니다";
   }



   // save 함수는 id를 전달하지 않으면 insert를 해주고
   // save 함수는 id를 전달하면 해당 id 에 대한 데이터가 있으면 update를 해주고
   // save 함수는 id를 전달하면 해당 id 에 대한 데이터가 없으면 insert를 해준다.
   @Transactional //함수 종료시에 자동 commit이 됨.
   @PutMapping("/dummy/user/{id}")
   public User updateUser(@PathVariable int id, @RequestBody User requestUser ) { //json 데이터를 요청 --> Java Object(MessageConverter의 Jackson 라이브러리가 변환해서 받아준다.)
       System.out.println("id : " + id);
       System.out.println("password : " + requestUser.getPassword());
       System.out.println("email : " + requestUser.getEmail() );

       User user = userRepository.findById(id).orElseThrow(()->{
           return new IllegalArgumentException("수정에 실패하였습니다.");
       });

       user.setPassword(requestUser.getPassword());
       user.setEmail(requestUser.getEmail());

       // requestUser.setId(id);
       // requestUser.setUsername("sear");
       //userRepository.save(user);

       return user;
   }


   @GetMapping("/dummy/users")
   public List<User> list() {
       return userRepository.findAll();
       //전체를 전부다 받는다.
   }

   @GetMapping("/dummy/user")
   public List<User> pageList(@PageableDefault(size = 2, sort = "id", direction = Sort.Direction.DESC)Pageable pageable) {
       Page<User> paginUser = userRepository.findAll(pageable);

       List<User> users = paginUser.getContent();
       return users;
   }


   //{id} 주소로 파라메터를 전달 받을 수 있음
   //localhost:8000/blog/dummy/user/3    // 3 --> {id}안에 3이 들어간다.
   @GetMapping("/dummy/user/{id}")
   public User detail(@PathVariable int id) {

       // user/4 를 찾으면 내가 데이터베이스에서 못찾아오게 되면 user가 null이 되잖아.
           //그럼 return null이 되잖아. 그럼 프로그램에 문제가 생기니까
           // Optional 로 너의 User객체를 감싸서 가져올테니 너가 null인지 판단해서 retun해
       User user = userRepository.findById(id).orElseThrow(new Supplier<IllegalArgumentException>() {
           @Override
           public IllegalArgumentException get() {
               return new IllegalArgumentException("해당 사용자가 없습니다.");
           }
       });
       // 요청 : 웹브라우저
       // user 객체 = 자바 오브젝트
       // 변환 ( 웹브라우저가 이해할 수 있는 데이터) --> json ( Gson라이브러리)
       // 스프링부트 = MessageConverter 라는 애가 응답시에 자동작동
       // 만약에 자바 오브젝트를 리턴하게 되면 MessageConverter가 Jackson 라이브러리를 호출해서
       // user 오브젝트를 json으로 변환해서 브러우저에게 던져준다.
       return user;
   }


       @PostMapping("/dummy/join")
   public String join(User user) {// key = value (약속된 규칙)
       System.out.println("id :" + user.getId()); //오토 인크리먼트 라는것이 적용된다.
       System.out.println("username :" + user.getUsername());
       System.out.println("password :" + user.getPassword());
       System.out.println("email :" + user.getEmail());
       System.out.println("role :" + user.getRole());
       System.out.println("createDate : " + user.getCreateDate());


       user.setRole(RoleType.USER);
       userRepository.save(user);
       return "회원가입이 완료되었습니다.";
   }

}

