package com.triple.DrivingBehavior.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.triple.DrivingBehavior.domain.User;

@Controller
public class TestController
{
	@RequestMapping(value="/demo/hello")
	public ModelAndView hello(String username)
	{
		ModelAndView mv=new ModelAndView();
		if(username==null||username.equals(""))
		{
			username="world";
		}
		mv.addObject("username",username);
		mv.setViewName("/demo/hello");
		return mv;
	}
	
	@RequestMapping(value="/demo/addUser.json")
	@ResponseBody
	public User addUser()
	{
		User user=new User();
		user.setUserName("a");
		user.setCode("123");
		return user;
	}
}