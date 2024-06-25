package com.ALOHCMUTE.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ALOHCMUTE.entity.Messages;
import com.ALOHCMUTE.repository.MessageRepository;
import com.ALOHCMUTE.service.IMessageService;

@Service
public class MessageServiceImpl implements IMessageService{
	
	@Autowired
	MessageRepository messageRepository;

	@Override
	public List<Messages> findAll() {
		return messageRepository.findAll();
	}

	@Override
	public List<Messages> findUserById(int receiverId, int userId) {
		return messageRepository.findUserById(receiverId, userId);
	}

	@Override
	public void save(Messages entity) {
		messageRepository.save(entity);
	}
}
