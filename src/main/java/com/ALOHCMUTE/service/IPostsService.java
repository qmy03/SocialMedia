package com.ALOHCMUTE.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import com.ALOHCMUTE.entity.Posts;

public interface IPostsService {

	void deleteAll();

	void delete(Posts entity);

	void deleteById(Integer id);

	long count();

	Optional<Posts> findById(Integer id);

	List<Posts> findAllById(Iterable<Integer> ids);

	List<Posts> findAll(Sort sort);

	Page<Posts> findAll(Pageable pageable);

	List<Posts> findAll();

	<S extends Posts> S save(S entity);

	Posts getPostById(int postId);
	List<Posts> findByUserId(int userId);
}
