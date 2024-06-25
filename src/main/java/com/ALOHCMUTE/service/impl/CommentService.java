package com.ALOHCMUTE.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ALOHCMUTE.entity.Comments;
import com.ALOHCMUTE.repository.CommentRepository;

@Service
public class CommentService{
	
	@Autowired
    private CommentRepository commentsRepository;

    public List<Comments> findAll() {
        return commentsRepository.findAll();
    }

    public List<Comments> getCommentById(int commentId) {
    	return commentsRepository.findById(commentId);
    }

    public void saveComment(Comments comment) {
        comment.setCreateTime(new Date());
        commentsRepository.save(comment);
    }
}
