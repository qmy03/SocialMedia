package com.ALOHCMUTE.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ALOHCMUTE.entity.Users;

@Repository
public interface UsersRepository extends JpaRepository<Users, Integer>{
	Users findByUserName(String username);

	Users findUserByEmail(String email);

	Users getUserByEmail(String email);
	@Query("SELECT u.userId FROM Users u WHERE u.email = :email")
    Integer findUserIdByEmail(String email);

	@Query("SELECT u FROM Users u WHERE u.userName LIKE :prefix%")
	List<Users> findUsersStartingWith(@Param("prefix") String prefix);
}
