package com.triple.DrivingBehavior.controllers;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.triple.DrivingBehavior.domain.BadBehavior;
import com.triple.DrivingBehavior.services.BadBehaviorCRUD;

@Controller
public class BadBehaviorController {
@Autowired
@Qualifier("BadBehaviorCRUDHibernate")
private BadBehaviorCRUD badbehaviorCRUD;
@RequestMapping(value="/demo/savebadbehaviorinfo.json",method={RequestMethod.POST})
@ResponseBody 
public String SaveBadBehaviorInfo(double longitude,double latitude,float velocity,float acceleration,String reason,String username)
{
	BadBehavior info=new BadBehavior();
	info.setLatitude(latitude);
	info.setLongitude(longitude);
	info.setVelocity(velocity);
	info.setAcceleration(acceleration);
	info.setReason(reason);
	info.setTime(new Date());
	info.setUser(badbehaviorCRUD.getUser(username));
	badbehaviorCRUD.add(info);
	return "sucessed";
}
@RequestMapping(value="/demo/getBadBehaviorByTime.json")
@ResponseBody 
public List<BadBehavior> getBadBehaviorByTime(long starttime,long endtime,String username)
{
	Date ST=new Date(starttime);
	Date ET=new Date(endtime);
	//System.out.println(ST+"5555555");
	List<BadBehavior> info=badbehaviorCRUD.getInfobyTime(ST, ET, username);
	return info;
}
@RequestMapping(value="/demo/getAllBadBehaviorTimes.json")
@ResponseBody 
public int getAllBadBehaviorTimes(String username)
{
	if(badbehaviorCRUD.getByUserName(username)!=null)
	{
	return badbehaviorCRUD.getByUserName(username).size();
	}
	else
	{
		return 0;
	}
}
@RequestMapping(value="/manage/addBadBehavior")
public ModelAndView hello(String username)
{
	ModelAndView mv=new ModelAndView();
	if(username==null||username.equals(""))
	{
		username="world";
	}
	mv.addObject("username",username);
	mv.setViewName("/manage/addBadBehavior");
	return mv;
}
@RequestMapping(value="/manage/addbadbehavior.json",method={RequestMethod.POST})
@ResponseBody 
public Map<String,String> AddBadBehavior(long time,double longitude,double latitude,float velocity,float acceleration,String reason,String username)
{
	Date Time=new Date(time);
	Map<String,String> map=new HashMap<String,String>();
	System.out.println(Time);
	BadBehavior info=new BadBehavior();
	info.setLatitude(latitude);
	info.setLongitude(longitude);
	info.setVelocity(velocity);
	info.setAcceleration(acceleration);
	info.setReason(reason);
	info.setTime(Time);
	info.setUser(badbehaviorCRUD.getUser(username));
	
	badbehaviorCRUD.add(info);
	map.put("status", "OK");
	return map;
}
}
