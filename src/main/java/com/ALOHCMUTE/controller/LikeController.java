package com.ALOHCMUTE.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ALOHCMUTE.entity.Likes;
import com.ALOHCMUTE.service.ILikesService;
import com.ALOHCMUTE.service.IPostsService;
import com.ALOHCMUTE.service.IUsersService;
@Controller
public class LikeController {
	@Autowired
	ILikesService likesService;
	@Autowired
	IUsersService usersService;
	@Autowired
	IPostsService postsService;
	@GetMapping("/like-post")
	public @ResponseBody int likePost(@RequestParam("postId") int postId, HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId != null) {
            // Kiểm tra xem user đã like post này chưa
            Likes existingLike = likesService.findByUserIdAndPostId(userId, postId);

            if (existingLike == null) {
                // Nếu chưa like, tạo mới một like
                Likes like = new Likes();
                
                like.setUsers(usersService.getUserById(userId));
                like.setPosts(postsService.getPostById(postId));
                likesService.saveLike(like);
                
                
            } else {
            	 likesService.deleteLike(existingLike.getLikeId());
            }
        }

        return likesService.getTotalLikesByPostId(postId);
	
    }
	
}
