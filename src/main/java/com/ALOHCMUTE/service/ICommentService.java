package com.ALOHCMUTE.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import com.ALOHCMUTE.entity.Comments;

public interface ICommentService {
	List<Comments> findAll();

	Page<Comments> findAll(Pageable pageable);

	List<Comments> findAll(Sort sort);
	int getTotalCommentByPostId(int postId);
}
