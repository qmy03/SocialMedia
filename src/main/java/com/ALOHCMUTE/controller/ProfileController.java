package com.ALOHCMUTE.controller;
import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.util.*;

import com.ALOHCMUTE.entity.Comments;
import com.ALOHCMUTE.entity.Posts;
import com.ALOHCMUTE.service.ICommentService;
import com.ALOHCMUTE.service.ILikesService;
import com.ALOHCMUTE.service.IPostsService;
import com.ALOHCMUTE.service.impl.CommentService;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ALOHCMUTE.entity.Profiles;
import com.ALOHCMUTE.entity.Users;
import com.ALOHCMUTE.model.UserModel;
import com.ALOHCMUTE.repository.ProfileRepository;
import com.ALOHCMUTE.repository.UserRepository;
import com.ALOHCMUTE.service.IProfileService;
import com.ALOHCMUTE.service.IUserService;
import com.ALOHCMUTE.service.IUsersService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class ProfileController {
	private final UserRepository userRepository;
	@Autowired
	IProfileService profileService;
    @Autowired
    IPostsService postsService;
    @Autowired
    private CommentService commentsService;
    @Autowired
    ILikesService likesService;
    @Autowired
    ICommentService commentService;
	@Autowired
    private IUserService userService;
    @Autowired
    public ProfileController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
    @RequestMapping("/profile")
    public String showUserProfile(ModelMap model, HttpSession session) {
        // Retrieve userId from the session
        int userId = (int) session.getAttribute("userId");
//        List<Posts> listposts = postsService.findAll();
        List<Posts> listposts = postsService.findByUserId(userId);
//        Optional<Profiles> listProfile = profileService.findById(userId);
        Optional<Profiles> listProfileOptional = profileService.findById(userId);

        listposts.sort(Comparator.comparingInt(Posts::getPostId).reversed());

        List<String> base64Images = new ArrayList<>();
        for (Posts post : listposts) {
            byte[] imageData = post.getImageData();
            if (imageData != null && imageData.length > 0) {
                String base64Image = Base64.getEncoder().encodeToString(imageData);
                base64Images.add(base64Image);
            } else {
                base64Images.add(null); // hoặc có thể là một giá trị mặc định khác
            }
        }
        if (listProfileOptional.isPresent()) {
            Profiles listProfile = listProfileOptional.get();
            // The profile exists, and you can use it.
            System.out.println("có profile");
            model.addAttribute("listProfile", listProfile);
        }
        model.addAttribute("base64Images", base64Images);
        model.addAttribute("posts", listposts);
//        model.addAttribute("listProfile", listProfile);
        model.addAttribute("likesService", likesService);
        model.addAttribute("commentService",commentService);


        // Thêm bình luận vào danh sách
        List<Comments> listComments = commentsService.findAll();
        listComments.sort(Comparator.comparingInt(Comments::getCommentId).reversed());

        List<String> base64Images2 = new ArrayList<>();
        for (Comments comment : listComments) {
            byte[] imageData = comment.getImage();
            if (imageData != null && imageData.length > 0) {
                String base64Image = Base64.getEncoder().encodeToString(imageData);
                base64Images2.add(base64Image);
            } else {
                base64Images2.add(null);
            }
        }

        model.addAttribute("comments", listComments);
        model.addAttribute("base64Images2", base64Images2);
        return "profile";
    }

	@GetMapping("/profile/edit/{userId}")
    public ModelAndView viewProfile(@PathVariable("userId") int userId, ModelMap model) {
		Optional<Users> opt = userService.findById(userId);
		UserModel userModel = new UserModel();
		if(opt.isPresent()) {
			Users entity = opt.get();
			BeanUtils.copyProperties(entity, userModel); //copy từ entity sang Model
			model.addAttribute("user", userModel);
			return new ModelAndView("editProfile",model);
		}
		
		return new ModelAndView("redirect:/home" ,model);
    }

	@PostMapping("/profile/edit/{userId}/save")
    public ModelAndView editProfile(@PathVariable("userId") int userId,
                              @Valid @ModelAttribute("user") UserModel userModel,          
                              BindingResult result,
                              ModelMap model,
                              HttpSession session) {

        if (result.hasErrors()) {
            // Nếu có lỗi, quay lại trang profile để hiển thị thông tin người dùng
			return new ModelAndView("profile");
        }

            Users entity = new Users();
            // Cập nhật thông tin từ UserModel vào entity Users
            BeanUtils.copyProperties(userModel, entity);
            // Lưu thông tin người dùng đã được cập nhật
            userService.save(entity);

            // Redirect đến trang profile của người dùng
            return new ModelAndView("redirect:/profile/" ,model);
    }
    
}
