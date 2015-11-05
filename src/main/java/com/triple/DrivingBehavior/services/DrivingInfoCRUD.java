package com.triple.DrivingBehavior.services;

import java.util.List;

import com.triple.DrivingBehavior.domain.DrivingInfo;
import com.triple.DrivingBehavior.domain.User;


public interface DrivingInfoCRUD 
{
public void add(DrivingInfo drivingInfo);
public void editById(Long id,DrivingInfo newDrivingInfo);
public  DrivingInfo getById(long id);
public List<DrivingInfo> getByUserId(long id);
public List<DrivingInfo> getByUserName(String Name);
public List<DrivingInfo> getAll();
public User getUser(String Name);
public void deleteById(Long id);
public void deleteByUserName(String name);
}
