package com.cos.blog.config;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.cos.blog.config.auth.PrincipalDetailService;

// 빈 등록 : 스프링 컨테이너에서 객체를 관리할 수 있게 하는 것
// 아래 3개의 어노테이션은 시큐리티에서 세트로 사용

@Configuration // 빈 등록 (IoC관리)
@EnableWebSecurity // Security 필터가 등록됨 = 스프링 시큐리티가 이미 활성화는 되어있지만, 설정은 해당 파일에서 할 것임
@EnableGlobalMethodSecurity(prePostEnabled = true) // 특정 주소로 접근을 하면 권한 및 인증을 미리 체크 (수행한 후에 체크하는 것이 아님)
public class SecurityConfig {

    @Autowired
    private PrincipalDetailService principalDetailService;
    
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }
    
    
    @Bean // Ioc가 된다
    public BCryptPasswordEncoder encodePWD() {
        return new BCryptPasswordEncoder();
    }
    
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(principalDetailService).passwordEncoder(encodePWD());
    }
    
    // 필터링
    //시큐리티가 로그인할 때 어떤 암호화로 인코딩해서 비번을 비교할지 알려줘야 함.
    // 시큐리티가 대신 로그인 함 -> password 가로챔
    // 가로챈 password가 회원가입 될 때 무엇으로 해쉬가 되었는지 알아야함 -> 그래야 같은 해쉬로 암호화 하고 DB에 있는 해쉬와 비교하여 로그인
    // 즉, 패스워드 비교하는 메서드
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
        .csrf().disable() // csrf 토큰 비활성화 (테스트시 걸어두는게 좋음)
        .authorizeRequests() // request가 들어오면
        .antMatchers("/", "/auth/**", "/js/**", "/css/**", "/ image/**") // 여기로 들어오면
        .permitAll() // 모두 가능 (누구나 가능)
        .anyRequest() // 그게 아닌 다른 모든 요청은
        .authenticated() // 인증이 되어야 한다
        .and()
        .formLogin()
        .loginPage("/auth/loginForm")// 인증이 필요한 요청은 이 로그인 폼으로 온다
        .loginProcessingUrl("/auth/loginProc") // 스프링 시큐리티가 해당 주소로 요청이 오는 로그인을 가로채서 대신 로그인을 한다.
        .defaultSuccessUrl("/");
        return http.build(); 
    }
}


    // 참고 : .headers().frameOptions().disable() // 아이프레임 접근 막기
    // 참고 : .csrf().disable() // csrf 토큰 비활성화 (테스트시 걸어주는 것이 좋음)






    //public SecurityFilterChain filterChain
    //return http.build();