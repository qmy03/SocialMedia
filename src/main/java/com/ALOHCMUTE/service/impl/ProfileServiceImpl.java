package com.ALOHCMUTE.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import com.ALOHCMUTE.entity.Posts;
import com.ALOHCMUTE.entity.Profiles;
import com.ALOHCMUTE.repository.ProfileRepository;
import com.ALOHCMUTE.service.IPostsService;
import com.ALOHCMUTE.service.IProfileService;

public class ProfileServiceImpl implements IProfileService{

	@Autowired
	ProfileRepository profileRepository;

	public ProfileServiceImpl(ProfileRepository profileRepository) {
		this.profileRepository = profileRepository;
	}

	@Override
	public List<Profiles> findAll(Sort sort) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<Profiles> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Profiles> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Posts> findAllById(Iterable<Integer> ids) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Optional<Profiles> findById(Integer id) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}

	@Override
	public <S extends Profiles> S save(S entity) {
		// TODO Auto-generated method stub
		return profileRepository.save(entity);
	}
	
}
