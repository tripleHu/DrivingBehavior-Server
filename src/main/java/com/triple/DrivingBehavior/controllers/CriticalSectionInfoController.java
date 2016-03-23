package com.triple.DrivingBehavior.controllers;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.triple.DrivingBehavior.domain.CriticalSectionInfo;
import com.triple.DrivingBehavior.services.CriticalSectionInfoCRUD;

@Controller
public class CriticalSectionInfoController {
	@Autowired
	@Qualifier("CriticalSectionInfoCRUD")
	private CriticalSectionInfoCRUD criticalsectionInfoCRUD;
	
	@RequestMapping(value="/manage/addCriticalSectionInfo")
	public ModelAndView hello(String username)
	{
		ModelAndView mv=new ModelAndView();
		if(username==null||username.equals(""))
		{
			username="world";
		}
		mv.addObject("username",username);
		mv.setViewName("/manage/addCriticalSectionInfo");
		return mv;
	}
	@RequestMapping(value={"/manage/UpdateCriticalSectionInfo","manage/AddDrivingInfo"})
	public ModelAndView show()
	{
		ModelAndView mv=new ModelAndView();
		return mv;
	}
	@RequestMapping(value="/manage/addCriticalSectionInfo.json",method={RequestMethod.POST})
	@ResponseBody 
	public String addCriticalSectionInfo(String no,String busstation, int busstationno,double longitude,double latitude,
			boolean flag,boolean rushhour,float maxspeed,float minspeed,float max_acceleration,float min_acceleration)
	{
		System.out.println(no);
		System.out.println(busstation);
		System.out.println(busstationno);
		System.out.println(longitude);
		System.out.println(latitude);
		System.out.println(flag);
		System.out.println(rushhour);
		System.out.println(maxspeed);
		System.out.println(minspeed);
		System.out.println(max_acceleration);
		System.out.println(min_acceleration);
		CriticalSectionInfo info=new CriticalSectionInfo();
		info.setNo(no);
		info.setBusstation(busstation);
		info.setBusstationno(busstationno);
		info.setLatitude(latitude);
		info.setLongitude(longitude);
		info.setFlag(flag);
		info.setRushhour(rushhour);
		info.setMaxspeed(maxspeed);
		info.setMinspeed(minspeed);
		info.setMax_acceleration(max_acceleration);
		info.setMin_acceleration(min_acceleration);
	
		criticalsectionInfoCRUD.add(info);
		return "1";
	}
	@RequestMapping(value="/manage/UpdateCriticalSectionInfo.json",method={RequestMethod.POST})
	@ResponseBody 
	public String UpdateCriticalSectionInfo(String no,String busstation, int busstationno,double longitude,double latitude,
			boolean flag,boolean rushhour,float maxspeed,float minspeed,float max_acceleration,float min_acceleration,long id)
	{
		System.out.println(no);
		System.out.println(busstation);
		System.out.println(busstationno);
		System.out.println(longitude);
		System.out.println(latitude);
		System.out.println(flag);
		System.out.println(rushhour);
		System.out.println(maxspeed);
		System.out.println(minspeed);
		System.out.println(max_acceleration);
		System.out.println(min_acceleration);
		CriticalSectionInfo info=new CriticalSectionInfo();
		info.setNo(no);
		info.setBusstation(busstation);
		info.setBusstationno(busstationno);
		info.setLatitude(latitude);
		info.setLongitude(longitude);
		info.setFlag(flag);
		info.setRushhour(rushhour);
		info.setMaxspeed(maxspeed);
		info.setMinspeed(minspeed);
		info.setMax_acceleration(max_acceleration);
		info.setMin_acceleration(min_acceleration);
	
		criticalsectionInfoCRUD.editById(id,info);
		return "1";
	}
	@RequestMapping(value="/demo/getcriticalsectionInfoByNo.json")
	@ResponseBody 
	public List<CriticalSectionInfo> GetcriticalsectionInfoByNo(String no)
	{
		try {
			no=new String(no.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		System.out.println(no);
		List<CriticalSectionInfo> infos=criticalsectionInfoCRUD.getbyNo(no);
		return infos;
	}
	@RequestMapping(value="/manage/getcriticalsectionInfoByBus_Route.json")
	@ResponseBody 
	public List<CriticalSectionInfo> getcriticalsectionInfoByBus_Route(String no)
	{
		try {
			no=new String(no.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		System.out.println(no);
		List<CriticalSectionInfo> infos=criticalsectionInfoCRUD.getbyNo(no);
		return infos;
	}
	@RequestMapping(value="/manage/DeleteSelectedCriticalSectionInfo.json")
	@ResponseBody 
	public String DeleteSelectedCriticalSectionInfo(long id)
	{
		criticalsectionInfoCRUD.deleteById(id);
		return "1";
	}
}
