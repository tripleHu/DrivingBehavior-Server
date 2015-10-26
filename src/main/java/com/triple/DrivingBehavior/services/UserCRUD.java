package com.triple.DrivingBehavior.services;

import java.util.List;
import com.triple.DrivingBehavior.domain.User;

public interface UserCRUD
{
	public User getById(long id);
	public void add(User user);
	public void editById(Long id,User newUser);
	public void editByName(String name,User newUser);
	public User getByName(String name);
	public List<User> getAll();
	public void deleteById(Long id);
	public void deleteByName(String name);
}