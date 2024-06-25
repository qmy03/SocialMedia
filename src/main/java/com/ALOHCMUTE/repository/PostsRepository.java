package com.ALOHCMUTE.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ALOHCMUTE.entity.Posts;

import java.util.List;

public interface PostsRepository extends JpaRepository<Posts, Integer>{
    List<Posts> findByUsers_UserId(int userId);
}
