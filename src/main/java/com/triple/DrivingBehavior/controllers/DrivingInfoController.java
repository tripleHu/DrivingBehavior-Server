package com.triple.DrivingBehavior.controllers;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.triple.DrivingBehavior.domain.DrivingInfo;
import com.triple.DrivingBehavior.services.DrivingInfoCRUD;

@Controller
public class DrivingInfoController 
{
@Autowired
@Qualifier("DrivingInfoCRUDHibernate")
private DrivingInfoCRUD drivingInfoCRUD;
@RequestMapping(value="/demo/recordLocation.json",method={RequestMethod.POST})
@ResponseBody 
public String recordLocation( double longitude,double latitude,float velocity,float orientation,String username)
{
	System.out.println(orientation);
	System.out.println(velocity);
	DrivingInfo info=new DrivingInfo();
	info.setLatitude(latitude);
	info.setLongitude(longitude);
	info.setVelocity(velocity);
	info.setOrientation(orientation);
	info.setTime(new Date());
	info.setUser(drivingInfoCRUD.getUser(username));
	drivingInfoCRUD.add(info);
	return "1";
}
@RequestMapping(value="/demo/getDrivingInfoByTime.json")
@ResponseBody 
public List<DrivingInfo> getDrivingInfoByTime(long starttime,long endtime,String username)
{
	Date ST=new Date(starttime);
	Date ET=new Date(endtime);
	Date nowDate=new Date();
	System.out.println(ST);
	System.out.println(ET);
	System.out.println(nowDate);
	List<DrivingInfo>infos=drivingInfoCRUD.getInfobyTime(ST, ET, username);
	System.out.println(infos.size());
	return infos;
}
}
