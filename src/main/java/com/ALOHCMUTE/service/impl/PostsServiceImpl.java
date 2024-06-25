package com.ALOHCMUTE.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.ALOHCMUTE.entity.Posts;
import com.ALOHCMUTE.repository.PostsRepository;
import com.ALOHCMUTE.service.IPostsService;

@Service
public class PostsServiceImpl implements IPostsService{
	@Autowired
	PostsRepository postsRepository;

	public PostsServiceImpl(PostsRepository postsRepository) {
		this.postsRepository = postsRepository;
	}

	@Override
	public <S extends Posts> S save(S entity) {
		return postsRepository.save(entity);
	}

	@Override
	public List<Posts> findAll() {
		return postsRepository.findAll();
	}

	@Override
	public Page<Posts> findAll(Pageable pageable) {
		return postsRepository.findAll(pageable);
	}

	@Override
	public List<Posts> findAll(Sort sort) {
		return postsRepository.findAll(sort);
	}

	@Override
	public List<Posts> findAllById(Iterable<Integer> ids) {
		return postsRepository.findAllById(ids);
	}

	@Override
	public Optional<Posts> findById(Integer id) {
		return postsRepository.findById(id);
	}

	@Override
	public long count() {
		return postsRepository.count();
	}

	@Override
	public void deleteById(Integer id) {
		postsRepository.deleteById(id);
	}

	@Override
	public void delete(Posts entity) {
		postsRepository.delete(entity);
	}

	@Override
	public void deleteAll() {
		postsRepository.deleteAll();
	}

    @Override
    public Posts getPostById(int postId) {
        return postsRepository.findById(postId).orElse(null);
    }

	@Override
	public List<Posts> findByUserId(int userId) {
		return postsRepository.findByUsers_UserId(userId);
	}
}
