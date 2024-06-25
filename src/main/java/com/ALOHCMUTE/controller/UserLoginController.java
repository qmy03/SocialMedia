package com.ALOHCMUTE.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;



import lombok.AllArgsConstructor;
import com.ALOHCMUTE.service.*;
import com.ALOHCMUTE.entity.Profiles;
import com.ALOHCMUTE.entity.Users;
import com.ALOHCMUTE.model.*;
@Controller
@AllArgsConstructor
@SessionAttributes("userDto")
public class UserLoginController {
    private IUsersService userService;

    @ModelAttribute("usermodel")
    public UserDto userModel(){
        return new UserDto();
    }
    @GetMapping("/login")
    public String showLoginForm(){
        return "/login";
    }
    @PostMapping("/login")
    public String Login(@ModelAttribute("usermodel") UserDto userModel, Model model, HttpSession session) {
        if (userService.checkUserbyEmail(userModel.getEmail()) == false) {
            return "redirect:/login?emailwrong";
        }
        if (userService.checkPasswordUser(userModel.getEmail(), userModel.getPassword())) {
            int userId = userService.getUserIdByEmail(userModel.getEmail());
            // Set the user ID in the session
            session.setAttribute("userId", userId);

            return "redirect:/home?success";
        }

        return "redirect:/login?passwordwrong";
    }
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        // Xóa thuộc tính "userId" khỏi session
        session.removeAttribute("userId");

        // Chuyển hướng đến trang đăng nhập hoặc trang chính
        return "redirect:/login";
    }


}

