package com.ALOHCMUTE.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ALOHCMUTE.entity.Posts;
import com.ALOHCMUTE.entity.Profiles;
@Repository
public interface ProfileRepository extends JpaRepository<Profiles, Integer>  {

	

}
