package com.ALOHCMUTE.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ALOHCMUTE.entity.Messages;
import com.ALOHCMUTE.repository.MessageRepository;

@Service
public class MessageService {
	@Autowired
    private MessageRepository messageRepository;
	
	public Messages getMessageByUserId(int userId) {
		Optional<Messages> optionalPost = messageRepository.findById(userId);
        return optionalPost.orElse(null);
	}
}
