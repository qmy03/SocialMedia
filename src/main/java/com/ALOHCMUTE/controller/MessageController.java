package com.ALOHCMUTE.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

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

import com.ALOHCMUTE.entity.Messages;
import com.ALOHCMUTE.entity.Users;
import com.ALOHCMUTE.model.MessageModel;
import com.ALOHCMUTE.model.PostsModel;
import com.ALOHCMUTE.service.IMessageService;
import com.ALOHCMUTE.service.IUserService;

@Controller
public class MessageController {

	@Autowired
	IMessageService messageService;

	@Autowired
	IUserService userService;

	@RequestMapping("/message")
	public String getReceivers(ModelMap model) {
	    List<Users> usersList = userService.findAll();
		model.addAttribute("usersList", usersList);
	    return "message";
	}

	@GetMapping
    public String getReceivers(@RequestParam("userId") int userId, ModelMap model, HttpSession session) {
        List<Users> usersList = userService.findAll();
        model.addAttribute("usersList", usersList);

        // Store userId in the session
        session.setAttribute("userId", userId);

        return "message";
    }

	@GetMapping("/message/receiverId={receiverId}")
    public ModelAndView getMessageByReceiverId(@PathVariable int receiverId, ModelMap model,
    											HttpSession session) {
		MessageModel messageModel = new MessageModel();
		// Retrieve userId from the session
        int userId = (int) session.getAttribute("userId");

		List<Messages> receiverMessage = messageService.findUserById(receiverId, userId);
        Users receiver = userService.findUserById(receiverId);
        List<Users> usersList = userService.findAll();

        model.addAttribute("message", messageModel);
        model.addAttribute("userId", userId);
        model.addAttribute("receiverId", receiverId);
		model.addAttribute("usersList", usersList);
		model.addAttribute("receiver", receiver);
        model.addAttribute("receiverMessage", receiverMessage);
        return new ModelAndView("chatWithReceiver",model);
    }

	// Tìm kiếm user
	@PostMapping("/message/findUserName={userName}")
    public ModelAndView getUsers(@RequestParam("userName") String userName, ModelMap model) {
        List<Users> usersList = userService.findUserByUserName(userName);

        model.addAttribute("usersList", usersList);
        return new ModelAndView("message",model);
    }

	@PostMapping("/sendMessage")
	public ModelAndView sendMessage(ModelMap model,
			@Valid @ModelAttribute("messages") MessageModel messageModel,
			BindingResult result) {

		if(result.hasErrors()) {
			return new ModelAndView("chatWithReceiver");
		}

		if(!messageModel.getContent().isBlank()){
			Messages entity = new Messages();
			long currentTimestamp = System.currentTimeMillis();
			Date currentDate = new Date(currentTimestamp);
			SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
			String formattedDate = dateFormat.format(currentDate);
			Date parsedDate = null;
			try {
				parsedDate = dateFormat.parse(formattedDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}

			//copy từ Model sang entity
			BeanUtils.copyProperties(messageModel, entity);
			// Lưu thông tin thời gian
			entity.setCreateTime(parsedDate);
			messageService.save(entity);
		}

		return new ModelAndView("redirect:/message/receiverId=" + messageModel.getReceiverId(), model);
	}
}
