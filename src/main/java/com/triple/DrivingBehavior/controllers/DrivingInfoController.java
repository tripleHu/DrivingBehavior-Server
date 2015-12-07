package com.triple.DrivingBehavior.controllers;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
public String recordLocation( double longitude,double latitude,float velocity,float orientation,float acceleration,String username)
{
	System.out.println(orientation);
	System.out.println(velocity);
	DrivingInfo info=new DrivingInfo();
	info.setLatitude(latitude);
	info.setLongitude(longitude);
	info.setVelocity(velocity);
	info.setOrientation(orientation);
	info.setAcceleration(acceleration);
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
@RequestMapping(value="/demo/getMyInfo.json")
@ResponseBody 
public Map<String,Double> getDistanceAndAvgSpeed(String name)
{
	List<DrivingInfo>infos=drivingInfoCRUD.getByUserName(name);
	Map<String,Double> map=new HashMap<String,Double>();
	double distance=0;
	double speed=0;
	if(infos==null)
	{
		return null;
	}
	if(infos.size()>0)
	{
	for(int i=0;i<infos.size()-1;i++)
	{
		distance+=GetDistance(infos.get(i).getLongitude() , infos.get(i).getLatitude(), infos.get(i+1).getLongitude() , infos.get(i+1).getLatitude());
	}
	for(int i=0;i<infos.size();i++)
	{
		speed+=infos.get(i).getVelocity();
	}
	speed=speed/infos.size();
	map.put("distance", distance);
	map.put("avgspeed", speed);
	return map;
	}
	else {
		return null;
	}
}
private static double EARTH_RADIUS = 6378137;
private static double rad(double d)
{
   return d * Math.PI / 180.0;
}
public static double GetDistance(double lng1, double lat1, double lng2, double lat2)
 {
        double radLat1 = rad(lat1);
        double radLat2 = rad(lat2);
        double a = radLat1 - radLat2;
        double b = rad(lng1) - rad(lng2);
        double s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a/2),2) + 
         Math.cos(radLat1)*Math.cos(radLat2)*Math.pow(Math.sin(b/2),2)));
        s = s * EARTH_RADIUS;
        s = Math.round(s * 10000) / 10000;
        return s;
}
}
