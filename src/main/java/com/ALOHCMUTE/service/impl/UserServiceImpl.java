package com.ALOHCMUTE.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ALOHCMUTE.entity.Users;
import com.ALOHCMUTE.repository.UserRepository;
import com.ALOHCMUTE.service.IUserService;

@Service
public class UserServiceImpl implements IUserService{
	
	@Autowired
	UserRepository userRepository;

	@Override
	public List<Users> findAll() {
		return userRepository.findAll();
	}

	@Override
	public Users findUserById(int receiverId) {
		return userRepository.findUserById(receiverId);
	}

	@Override
	public List<Users> findUserByUserName(String userName) {
		return userRepository.findUserByUserName(userName);
	}

	@Override
	public <S extends Users> S save(S entity) {
		return userRepository.save(entity);
	}

	@Override
	public Optional<Users> findById(Integer id) {
		return userRepository.findById(id);
	}
	
	

}
