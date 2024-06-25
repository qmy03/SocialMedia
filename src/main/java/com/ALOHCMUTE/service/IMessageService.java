package com.ALOHCMUTE.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import com.ALOHCMUTE.entity.Messages;

public interface IMessageService {

	List<Messages> findAll();

	List<Messages> findUserById(int receiverId, int userId);

	void save(Messages entity);
}
