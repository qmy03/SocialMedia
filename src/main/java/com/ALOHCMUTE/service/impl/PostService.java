package com.ALOHCMUTE.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

import com.ALOHCMUTE.entity.Posts;
import com.ALOHCMUTE.repository.PostsRepository;

@Service
public class PostService {

	@Autowired
    private PostsRepository postRepository;
	
	public Posts getPostById(int postId) {
		Optional<Posts> optionalPost = postRepository.findById(postId);
        return optionalPost.orElse(null);
	}

}
