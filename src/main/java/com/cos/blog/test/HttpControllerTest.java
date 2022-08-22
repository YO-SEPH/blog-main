package com.cos.blog.test;

//@Controller 사용자가 요청 -> 응답 (HTML 파일)
//@RestController 사용자가 요청 -> 응답 (Data파일)

import org.springframework.web.bind.annotation.*;

@RestController
public class HttpControllerTest {

    @GetMapping("/http/get")
    public String getTest(Member m) { //id=1&username=kim&password=1234&email=rladytpq159@gmail.com
        return "get요청 : "+ " , " + m.getId() + " , " + m.getUsername() + " , " + m.getPassword() +" , " + m.getEmail();
    }
    @PostMapping("/http/post")
    public String postTest(@RequestBody Member m) { // text/plain. application/json
        return "post요청 : "+ " , " + m.getId() + " , " + m.getUsername() + " , " + m.getPassword() +" , " + m.getEmail();
    }
    @PutMapping("http/put")
    public String putTest(@RequestBody Member m) {
        return "put요청 : "+ " , " + m.getId() + " , " + m.getUsername() + " , " + m.getPassword() +" , " + m.getEmail();
    }
    @DeleteMapping("http/delete")
    public String deleteTest() {
        return "delete요청";
    }

}
