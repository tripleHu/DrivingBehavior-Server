package com.triple.DrivingBehavior.services.hibernate;

import java.util.Date;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.triple.DrivingBehavior.domain.BadBehavior;
import com.triple.DrivingBehavior.domain.User;
import com.triple.DrivingBehavior.services.BadBehaviorCRUD;

@Service("BadBehaviorCRUDHibernate")
public class BadBehaviorCRUDHibernate implements BadBehaviorCRUD {
	private HibernateTemplate ht;
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
	ht = new HibernateTemplate(sessionFactory);
	}
	@Override
	@Transactional
	public void add(BadBehavior badbehavior)
	{
		ht.save(badbehavior);
	}
	@SuppressWarnings("unchecked")
	@Override
	public User getUser(String UserName)
	{
		List<User> users = (List<User>)ht.find("from User where username=?", UserName);
		if (users.size() > 0)
			return users.get(0);
		else
			return null;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<BadBehavior> getByUserName(String username)
	{
		List<User> users=(List<User>)ht.find("from User where username=?", username);
		User user=users.get(0);
		List<BadBehavior> info=(List<BadBehavior>)ht.find("from BadBehavior where user_id=?", user.getId());
		if (info.size() > 0)
			return info;
		else
			return null;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<BadBehavior> getInfobyTime(Date StartTime,Date EndTime,String Name)
	{
		List<User> users=(List<User>)ht.find("from User where username=?", Name);
		User user=users.get(0);
		List<BadBehavior> info=(List<BadBehavior>)ht.find("from BadBehavior where time>? and time<? and user_id=?",StartTime,EndTime,user.getId());
		return info;
	}
}
