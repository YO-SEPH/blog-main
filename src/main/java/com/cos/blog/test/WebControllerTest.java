package com.cos.blog.test;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
public class WebControllerTest {
    
    @GetMapping("/vue")
    public String vue() {
        return "static/index";
    }
}
