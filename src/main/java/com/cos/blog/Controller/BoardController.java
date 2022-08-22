package com.cos.blog.Controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import com.cos.blog.service.BoardService;

@Controller
public class BoardController {

    @Autowired
    private BoardService boardService;
    
    //@AuthenticationPrincipal PrincipalDetail principal
    @GetMapping({"" , "/"})
    public String index(Model model, @PageableDefault(size = 3, sort = "id", direction = Sort.Direction.DESC)Pageable pageable) {
        model.addAttribute("boards", boardService.글목록(pageable));

        // System.out.println("로그인 사용자 아이디 :" + principal.getUsername());
        return "index";
    }

    @GetMapping("board/{id}")
    public String findByid(@PathVariable int id, Model model) {
        model.addAttribute("board",boardService.글상세보기(id));
        return "board/detail";
    }

    	// 글 수정하기
        @GetMapping("/board/{id}/updateForm")
        public String updateForm(@PathVariable int id, Model model) {
            model.addAttribute("board", boardService.글상세보기(id));
            return "board/updateForm";
        }

    @ GetMapping("/board/saveForm")
        public String saveForm() {
        return "board/saveForm";
        }
}
