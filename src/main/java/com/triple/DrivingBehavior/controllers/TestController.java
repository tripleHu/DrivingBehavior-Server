package com.triple.DrivingBehavior.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController
{
	@RequestMapping(value="/demo/hello")
	public ModelAndView hello(String name)
	{
		ModelAndView mv=new ModelAndView();
		if(name==null||name.equals(""))
		{
			name="world";
		}
		mv.addObject("name",name);
		mv.setViewName("/demo/hello");
		return mv;
	}
}