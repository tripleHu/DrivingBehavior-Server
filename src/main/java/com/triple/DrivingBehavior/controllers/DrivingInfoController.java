package com.triple.DrivingBehavior.controllers;

import java.util.Date;

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
}
