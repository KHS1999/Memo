package com.khs.memo.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.khs.memo.post.model.Post;
import com.khs.memo.user.bo.PostBO;

@Controller
public class PostController {
	
	@Autowired
	private PostBO postBO;
	// 메모 post 리스트 페이지
	@GetMapping("/post/list/view")
	public String postList(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		
		// 로그인한 사용자의 userId
		int userId = (Integer)session.getAttribute("userId");
		
		List<Post> postList = postBO.getPostList(userId);
		model.addAttribute("memoList",postList);
		return "post/list";
	}
	
	// 메모 입력 페이지
	@GetMapping("/post/create/view")
	public String postInput() {
		
		return "post/create";

		}
	
	// 메모 세부 페이지
	// post 의 id 를 전달 받고 해당하는 메모를 조회하여 model에 추가
	@GetMapping("/post/detail/view")
	public String postDetail(@RequestParam("id") int id, Model model) {
		
		
		Post post = postBO.getPost(id);
		
		model.addAttribute("memo", post);
		return "post/detail";
	}
		
	
}
