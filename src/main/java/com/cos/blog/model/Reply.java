package com.cos.blog.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // getter setter
@NoArgsConstructor // 빈 생성자
@AllArgsConstructor // 전체 생성자
@Builder // 빌더 패턴
@Entity
public class Reply {

    @Id // Primary Key
    @GeneratedValue(strategy = GenerationType.IDENTITY) // 프로젝트에서 연결된 DB의 넘버링 전략을 따라간다. auto_increment 사용함 (MySQL)
    private int id;

    @Column(nullable = false, length = 200)
    private String content;

    @ManyToOne // 연관관계 Many = Reply, One = Board
    @JoinColumn(name = "boardId")
    private Board board; // 댓글 달 게시글

    @ManyToOne // 연관관계 Many = Reply, One = User
    @JoinColumn(name = "userId")
    private User user; // 댓글 단 사람

//    @ManyToOne // 연관관계 Many = Reply, One = User
//    @JoinColumn(name = "replyId")
//    private Reply reply; // 댓글 단 사람

    @CreationTimestamp
    private Timestamp createDate;

}