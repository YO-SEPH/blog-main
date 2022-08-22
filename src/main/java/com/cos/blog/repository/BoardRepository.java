package com.cos.blog.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.blog.model.Board;


// DAO
// 자동으로 bean 등록이 된다.
//@Repository 생략가능하다
public interface BoardRepository extends JpaRepository<Board, Integer>{
    
}





//JPA Naming 쿼리 전략
    //SELECT * FROM user WHERE username = ?  AND password = ? ----> "?" 안에는 괄호 안에 있는 username, password 가 들어온다
    // User findByUsernameAndPassword(String username, String password);
    // @Query(value="SELECT * FROM user WHERE username = ?  AND password = ?", nativeQuery = true)
    // User login(String username, String password);
