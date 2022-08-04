package com.khs.memo.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

	@GetMapping("/user/signup/view")
	public String singupView() {
		return "user/signup";
	}
	
	@GetMapping("/user/sign/view")
	public String signView() {
		return "user/signin";
	}
	
	
}
