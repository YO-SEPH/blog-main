package com.cos.blog.service;


import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.cos.blog.model.Board;
import com.cos.blog.model.Reply;
import com.cos.blog.model.User;
import com.cos.blog.repository.BoardRepository;
import com.cos.blog.repository.ReplyRepository;

@Service // 스프링이 컴포넌트 스캔을 통해서 Bean에 등록을 해줌. (IoC)
public class BoardService {

    @Autowired
    private BoardRepository boardRepository;

    @Autowired
    private ReplyRepository replyRepository;


    @Transactional // 전체가 성공해야 commit, 실패하면 rollback
    public void 글쓰기(Board board, User user) { // title, content
        board.setCount(0);
        board.setUser(user);
        boardRepository.save(board);
    }

    @Transactional(readOnly = true)
    public Page<Board> 글목록(Pageable pageable) {
        return boardRepository.findAll(pageable);
    }

    @Transactional(readOnly = true)
    public Board 글상세보기(int id) {
        return boardRepository.findById(id)
            .orElseThrow(()->{
                return new IllegalArgumentException("글 상세보기 실패 : 아이디를 찾을 수 없습니다.");
             });
    }
    @Transactional
    public void 글삭제하기(int id) {
        System.out.println("board delete : "+ id);
        boardRepository.deleteById(id);
    }

    @Transactional
public void 글수정하기(int id, Board requestBoard) {
	Board board = boardRepository.findById(id) // 영속화 (영속성 컨텍스트에 넣는 것)
            .orElseThrow(()->{
                return new IllegalArgumentException("글 찾기 실패 : 아이디를 찾을 수 없습니다." + id);
            });
    board.setTitle(requestBoard.getTitle());
    board.setContent(requestBoard.getContent());
        // 해당 함수 종료시(Service가 종료될 때) 트랜잭션 종료 -> 영속화 되어있는 board 데이터가 달라졌기 때문에 더티체킹 일어남 -> 변경 감지 -> DB에 자동 flush
    }

    @Transactional // 전체가 성공해야 commit, 실패하면 rollback
    public void 댓글작성(User user, int boardId, Reply requestReply) {
        Board board = boardRepository.findById(boardId)
                .orElseThrow(()->{
                    return new IllegalArgumentException("댓글 쓰기 실패 : 게시글 id를 찾을 수 없습니다. id : " + boardId);
                });
        requestReply.setBoard(board);
        requestReply.setUser(user);

        replyRepository.save(requestReply);
    }
    
    @Transactional
    public void 댓글삭제(int replyId) {
        System.out.println("comment delete : " + replyId);
        replyRepository.deleteById(replyId);
    }
}