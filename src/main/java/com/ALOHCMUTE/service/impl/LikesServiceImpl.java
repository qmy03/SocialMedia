package com.ALOHCMUTE.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ALOHCMUTE.entity.Likes;
import com.ALOHCMUTE.repository.LikesRepository;
import com.ALOHCMUTE.service.ILikesService;
import com.ALOHCMUTE.service.IPostsService;
import com.ALOHCMUTE.service.IUsersService;

@Service
public class LikesServiceImpl implements ILikesService {

    @Autowired
    private LikesRepository likesRepository;

    @Override
    public Likes saveLike(Likes like) {
        return likesRepository.save(like);
    }

    @Override
    public void deleteLike(int likeId) {
        likesRepository.deleteById(likeId);
    }

    @Override
    public int getTotalLikesByPostId(int postId) {
        return likesRepository.countByPosts_PostId(postId);
    }

    @Override
    public Likes findByUserIdAndPostId(int userId, int postId) {
        return likesRepository.findByUsers_UserIdAndPosts_PostId(userId, postId);
    }
    
    @Override
    public boolean isLikedByUser(int userId, int postId) {
        Likes existingLike = likesRepository.findByUsers_UserIdAndPosts_PostId(userId, postId);
        return existingLike != null;
    }


 
}
