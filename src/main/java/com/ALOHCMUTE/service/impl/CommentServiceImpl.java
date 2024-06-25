package com.ALOHCMUTE.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.ALOHCMUTE.entity.Comments;
import com.ALOHCMUTE.repository.CommentRepository;
import com.ALOHCMUTE.service.ICommentService;

@Service
public class CommentServiceImpl implements ICommentService{
	@Autowired
	CommentRepository commentRepository;
	
	@Override
	public List<Comments> findAll() {
		return commentRepository.findAll();
	}

	@Override
	public Page<Comments> findAll(Pageable pageable) {
		return commentRepository.findAll(pageable);
	}

	@Override
	public List<Comments> findAll(Sort sort) {
		return commentRepository.findAll(sort);
	}

	@Override
	public int getTotalCommentByPostId(int postId) {
		// TODO Auto-generated method stub
		return commentRepository.countByPosts_PostId(postId);
	}
}
