package com.ALOHCMUTE.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ALOHCMUTE.entity.Posts;
import com.ALOHCMUTE.service.IPostsService;

@Controller
public class HomeController {
	@Autowired
	IPostsService postsService;
//	@RequestMapping(value="/")
//	public String trangchu() {
//		return "home";
//	}
//	@GetMapping("/home")
//	public String tranghome(ModelMap model) {
//		List<Posts> listposts = postsService.findAll();
//		model.addAttribute("posts", listposts);
//		return "home";
//	}

	@RequestMapping(value="/login")
	public String trangindex() {
		return "login";
	}
	
}
