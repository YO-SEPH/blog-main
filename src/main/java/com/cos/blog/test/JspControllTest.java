package com.cos.blog.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class JspControllTest {

    @GetMapping("test/jsp")
    public String testjsp() {
        System.out.println("jsp()");
        return "test";
    }
}
