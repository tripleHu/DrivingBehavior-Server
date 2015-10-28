package com.triple.DrivingBehavior.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.triple.DrivingBehavior.domain.User;
import com.triple.DrivingBehavior.services.UserCRUD;

@Controller
public class UserController 
{
	@Autowired
	@Qualifier("UserCRUDHibernate")
	private UserCRUD userCRUD;
	@RequestMapping(value="/user/reg")
	public ModelAndView Register()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/user/register");
		return mv;
	}
	@RequestMapping(value="/user/reg.do")
	public ModelAndView doRegister(String username,String code)
	{
		ModelAndView mv=new ModelAndView();
		if(isValid(username,code,mv))
		{
			User user=new User();
			user.setUserName(username);
			user.setCode(code);
			userCRUD.add(user);
			mv.addObject("username", username);
			mv.setViewName("redirect:/demo/hello");
		}
		else 
		{
			mv.addObject("code", code);
			mv.addObject("username",username);
			mv.setViewName("/user/register");
		}
		return mv;
	}
	@RequestMapping(value="user/login")
	public ModelAndView login()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/user/login");
		return mv;
	}
	@RequestMapping(value="user/login.do")
	public ModelAndView dologin(String username,String code)
	{
		ModelAndView mv=new ModelAndView();
		if(isValidforlogin(username,code,mv))
		{
			mv.addObject("username", username);
			mv.setViewName("redirect:/demo/hello");
		}
		else 
		{
			mv.addObject("code", code);
			mv.addObject("username",username);
			mv.setViewName("/user/login");
		}
		return mv;
	}
	private boolean isValid(String UserName, String code, ModelAndView mv) 
	{
		boolean valid=true;
		//检查code不能为空，且长度不能大于10字节
		if(code==null||code.equals(""))
		{
			mv.addObject("codeError", "code不能为空");
			valid=false;
		}
		else
		{
			if(code.getBytes().length>10)
			{
				mv.addObject("codeError", "code的长度不能大于10字节");
				valid=false;
			}
		}
		//检查name不能为空，且长度不能大于100字节
		if(UserName==null||UserName.equals(""))
		{
			mv.addObject("UserNameError", "UserName不能为空");
			valid=false;
		}
		else
		{
			if(UserName.getBytes().length>100)
			{
				mv.addObject("nameError", "name的长度不能大于100字节");
				valid=false;
			}
		}
		if(valid)
		{
			//检查不能存在相同的name
			if(userCRUD.getByName(UserName)!=null)
			{
				mv.addObject("nameError", "name重复");
				valid=false;
			}
		}
		return valid;
	}
	private boolean isValidforlogin(String UserName, String code, ModelAndView mv) 
	{
		boolean valid=true;
		//检查UserName不能为空，且长度不能大于100字节
				if(UserName==null||UserName.equals(""))
				{
					mv.addObject("UserNameError", "UserName不能为空");
					valid=false;
				}
				else
				{
					if(UserName.getBytes().length>100)
					{
						mv.addObject("nameError", "name的长度不能大于100字节");
						valid=false;
					}
				}
		//检查code不能为空，且长度不能大于10字节
				if(code==null||code.equals(""))
				{
					mv.addObject("codeError", "code不能为空");
					valid=false;
				}
				else
				{
					if(code.getBytes().length>10)
					{
						mv.addObject("codeError", "code的长度不能大于10字节");
						valid=false;
					}
				}
				if(valid)
				{
					//检查Username和code必须一致
					if(userCRUD.getByName(UserName)==null)
					{
						mv.addObject("nameError", "UserName不存在");
						valid=false;
					}
					if(userCRUD.getByName(UserName)!=null&&!userCRUD.getByName(UserName).getCode().equals(code))
					{
						mv.addObject("codeError", "code不正确");
						valid=false;
					}
				}
		return valid;
	}
}

