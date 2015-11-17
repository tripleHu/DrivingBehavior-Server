package com.triple.DrivingBehavior.services;

import java.util.Date;
import java.util.List;

import com.triple.DrivingBehavior.domain.BadBehavior;
import com.triple.DrivingBehavior.domain.User;

public interface BadBehaviorCRUD {
public void add(BadBehavior badbehavior);
public User getUser(String UserName);
public List<BadBehavior> getByUserName(String username);
public List<BadBehavior> getInfobyTime(Date StartTime,Date EndTime,String Name);
}
