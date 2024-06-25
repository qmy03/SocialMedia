package com.ALOHCMUTE.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ALOHCMUTE.entity.Messages;
import com.ALOHCMUTE.entity.Users;

@Repository
public interface MessageRepository extends JpaRepository<Messages, Integer>{
	
	@Query("SELECT m FROM Messages m WHERE (:receiverId = m.receiverId AND :userId = m.users.userId) OR (:userId = m.receiverId AND :receiverId = m.users.userId)")
	List<Messages> findUserById(@Param("receiverId") int receiverId, @Param("userId") int userId);
}
