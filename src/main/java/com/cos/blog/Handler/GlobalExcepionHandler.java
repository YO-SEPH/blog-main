package com.cos.blog.Handler;

import com.cos.blog.dto.ResponseDto;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;

@ControllerAdvice // Exception 이 발생하면 여기로 온다.
@RestController
public class GlobalExcepionHandler {

    @ExceptionHandler(value = IllegalArgumentException.class)
    public ResponseDto<String> handleArgumentExcepion(IllegalArgumentException e) {
        return new ResponseDto<String>(HttpStatus.INTERNAL_SERVER_ERROR.value(), e.getMessage());
    }
}
