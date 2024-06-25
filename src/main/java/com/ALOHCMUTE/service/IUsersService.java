package com.ALOHCMUTE.service;

import java.util.List;

import com.ALOHCMUTE.entity.Users;
import com.ALOHCMUTE.model.UserDto;

public interface IUsersService {
	List<Users> getAllUsers();

    Users getUserById(int userId);

    void saveUser(Users user);

    void deleteUser(int userId);
    
    Users getUserByUsername(String username);
    
    void save(UserDto userDto);
    Boolean checkPasswordUser(String email,String password);
    Boolean checkUserbyEmail(String email);
    Users getUserbyEmail(String email);
    
    int getUserIdByEmail(String email);
    
    List<Users> getUsernamesStartingWith(String prefix);
}
