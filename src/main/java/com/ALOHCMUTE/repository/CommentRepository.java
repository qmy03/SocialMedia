package com.ALOHCMUTE.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ALOHCMUTE.entity.Comments;
import com.ALOHCMUTE.entity.Posts;

@Repository
public interface CommentRepository extends JpaRepository<Comments, Integer>{
	List<Comments> findById(int commentId);
	int countByPosts_PostId(int postId);
}
