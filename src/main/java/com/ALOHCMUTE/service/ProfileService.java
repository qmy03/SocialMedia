package com.ALOHCMUTE.service;

import java.util.List;
import java.util.Optional;

import com.ALOHCMUTE.entity.Posts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;


import com.ALOHCMUTE.entity.Profiles;
import com.ALOHCMUTE.repository.ProfileRepository;

@Service
public class ProfileService implements IProfileService{
	private final ProfileRepository profileRepository;
	@Autowired
    public ProfileService(ProfileRepository profileRepository) {
        this.profileRepository = profileRepository;
    }
	@Override
	public List<Profiles> findAll() {
		return profileRepository.findAll();
	}

	@Override
	public List<Posts> findAllById(Iterable<Integer> ids) {
		return null;
	}

	@Override
	public Optional<Profiles> findById(Integer id) {
		return profileRepository.findById(id);
	}

	@Override
	public List<Profiles> findAll(Sort sort) {
		return profileRepository.findAll(sort);
	}

	@Override
	public Page<Profiles> findAll(Pageable pageable) {
		return profileRepository.findAll(pageable);
	}
	@Override
	public <S extends Profiles> S save(S entity) {
		// TODO Auto-generated method stub
		return profileRepository.save(entity);
	}


}
