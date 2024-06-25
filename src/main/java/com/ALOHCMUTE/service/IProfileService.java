package com.ALOHCMUTE.service;

import java.util.List;
import java.util.Optional;


import com.ALOHCMUTE.entity.Posts;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import com.ALOHCMUTE.entity.Profiles;

public interface IProfileService {

	List<Profiles> findAll(Sort sort);

	Page<Profiles> findAll(Pageable pageable);
	
    List<Profiles> findAll();

	List<Posts> findAllById(Iterable<Integer> ids);
	Optional<Profiles> findById(Integer id);
	
	<S extends Profiles> S save(S entity);

}
