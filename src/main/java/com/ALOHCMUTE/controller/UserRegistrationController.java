package com.ALOHCMUTE.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.ALOHCMUTE.entity.Profiles;
import com.ALOHCMUTE.entity.Users;
import com.ALOHCMUTE.model.UserDto;
import com.ALOHCMUTE.service.IUsersService;
import com.ALOHCMUTE.service.ProfileService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class UserRegistrationController {

    @Autowired
    private ProfileService profileservice;
    @Autowired
    private IUsersService userService;
    @ModelAttribute("userdto")
    public UserDto userResgistrationDto(){
        return new UserDto();
    }
    @GetMapping("/registration")
    public String showRegistrationForm(){
        return "/registration";
    }

    @PostMapping("/registration")
    public String registerUserAccount(@ModelAttribute("userdto") UserDto userDto, HttpSession session){
        Profiles profile = new Profiles();
        if(userService.checkUserbyEmail(userDto.getEmail())){
            return "redirect:/registration?emailexist";
        }
        if(userDto.getPassword().equals(userDto.getCheckPass())==false){
            return "redirect:/registration?checkpass";
        }
        userService.save(userDto);
        int userId = userService.getUserIdByEmail(userDto.getEmail());
        // Set the user ID in the session
        session.setAttribute("userId", userId);

        Users user = new Users();
        user.setUserId(userId);

        // Set the user information in the entity
        profile.setUsers(user);
        profileservice.save(profile);

        return "redirect:/registration?success";
    }
}
