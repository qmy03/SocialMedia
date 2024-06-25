package com.ALOHCMUTE.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ALOHCMUTE.entity.Likes;

public interface LikesRepository extends JpaRepository<Likes, Integer> {
    int countByPosts_PostId(int postId);

    Likes findByUsers_UserIdAndPosts_PostId(int userId, int postId);
}
