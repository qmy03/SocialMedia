package com.ALOHCMUTE.service;

import com.ALOHCMUTE.entity.Likes;

public interface ILikesService {
	Likes saveLike(Likes like);

    void deleteLike(int likeId);

    int getTotalLikesByPostId(int postId);

    Likes findByUserIdAndPostId(int userId, int postId);
    
    boolean isLikedByUser(int userId, int postId);
}
