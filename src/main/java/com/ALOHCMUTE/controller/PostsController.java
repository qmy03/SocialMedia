package com.ALOHCMUTE.controller;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.ALOHCMUTE.entity.Comments;
import com.ALOHCMUTE.service.ICommentService;
import com.ALOHCMUTE.service.impl.CommentService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

import com.ALOHCMUTE.entity.Posts;
import com.ALOHCMUTE.entity.Users;
import com.ALOHCMUTE.model.PostsModel;
import com.ALOHCMUTE.entity.Users;
import com.ALOHCMUTE.service.ILikesService;
import com.ALOHCMUTE.service.IPostsService;
import com.ALOHCMUTE.service.IUserService;



@Controller
public class PostsController {
	@Autowired
	IPostsService postsService;
    @Autowired
    ILikesService likesService;

	@Autowired
	private CommentService commentsService;
	@Autowired
	ICommentService commentService;
    @Autowired
	IUserService userService;
	@RequestMapping("home")
	public String listposts(ModelMap model) {
		List<Posts> listposts = postsService.findAll();
		List<Users> usersList = userService.findAll();
		// Sắp xếp listposts theo postId từ lớn đến bé

        listposts.sort(Comparator.comparingInt(Posts::getPostId).reversed());
        List<Integer> totalLikes = new ArrayList<>();
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
        model.addAttribute("usersList", usersList);
		model.addAttribute("posts", listposts);
		model.addAttribute("base64Images", base64Images);
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
		return "home";
	}

	@GetMapping("add")
	public String Add(ModelMap model) {
		PostsModel postsModel = new PostsModel();
		postsModel.setEdit(false);
		List<Users> usersList = userService.findAll();
		model.addAttribute("usersList", usersList);
		model.addAttribute("post", postsModel);
		return "AddOrEdit";

	}


	@PostMapping("/SaveOrUpdate")
	public ModelAndView SaveOrUpdate(ModelMap model,
			@Valid @ModelAttribute("posts") PostsModel postsModel,
			@RequestParam("imageData") MultipartFile file,
			BindingResult result,
            HttpSession session) {

		if(result.hasErrors()) {
			return new ModelAndView("AddOrEdit");
		}
		Posts entity = new Posts();
		long currentTimestamp = System.currentTimeMillis();
		Date currentDate = new Date(currentTimestamp);
		SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
		String formattedDate = dateFormat.format(currentDate);

		if (file != null && !file.isEmpty()) {
	        try (InputStream is = file.getInputStream()) {
	            byte[] imageBytes = is.readAllBytes();
	            entity.setImageData(imageBytes);
	        } catch (IOException e) {
	            e.printStackTrace();
	            return new ModelAndView("AddOrEdit");
	        }
	    }
		//copy từ Model sang entity
		BeanUtils.copyProperties(postsModel, entity);

        int userId = (int) session.getAttribute("userId");
        Users user = new Users();
        user.setUserId(userId);

        // Set the user information in the entity
        entity.setUsers(user);
        // Lưu thông tin thời gian
		entity.setPostTime(formattedDate);
        // Ensure that 'users' is not null
        if (entity.getUsers() == null) {
            // You may want to handle this case appropriately, perhaps by redirecting to an error page
            return new ModelAndView("redirect:/error");
        }

        postsService.save(entity);
		return new ModelAndView("redirect:/home" ,model);

	}
	@GetMapping("/edit/{postId}")
	public ModelAndView edit(ModelMap model,
			@PathVariable("postId") int postId) {
		Optional<Posts> opt = postsService.findById(postId);
		
		PostsModel postsModel = new PostsModel();
		if(opt.isPresent()) {
			Posts entity = opt.get();
			BeanUtils.copyProperties(entity, postsModel); //copy từ entity sang Model
			postsModel.setEdit(true);
			model.addAttribute("posts", postsModel);
			return new ModelAndView("AddOrEdit",model);
		}
		
		return new ModelAndView("redirect:/home" ,model);
	}
	@GetMapping("/delete/{postId}")
	public ModelAndView delete(ModelMap model,
			@PathVariable("postId") int postId) {
		postsService.deleteById(postId);
		return new ModelAndView("redirect:/home" ,model); 
	}

	@GetMapping("/comments/{postId}")
	public ModelAndView showCommentsForPost(@PathVariable("postId") int postId, ModelMap model) {
	    Optional<Posts> post = postsService.findById(postId);

	    if(post.isPresent()) {
	        Posts specificPost = post.get();
	        List<Comments> commentsForPost = specificPost.getComments();
	        model.addAttribute("post", specificPost);
	        model.addAttribute("comments", commentsForPost);
	        return new ModelAndView("comment",model);
	    }
	    return new ModelAndView("comment",model);
	}
}
