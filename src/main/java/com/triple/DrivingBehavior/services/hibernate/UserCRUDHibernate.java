package com.triple.DrivingBehavior.services.hibernate;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.triple.DrivingBehavior.domain.User;
import com.triple.DrivingBehavior.services.UserCRUD;

@Service("UserCRUDHibernate")
public class UserCRUDHibernate implements UserCRUD
{
	private HibernateTemplate ht;
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		ht = new HibernateTemplate(sessionFactory);
	}
    //按ID获取User
	@Override
	public User getById(long id) {
		return ht.get(User.class, id);
	}
    //添加User
	@Override
	@Transactional
	public void add(User user) {
		ht.save(user);
	}

	@Override
	@Transactional
	public void editById(Long id, User newUser) {
		User user=this.getById(id);
		user.setUserName(newUser.getUserName());
		user.setCode(newUser.getCode());
		ht.update(user);
	}

	@Override
	@Transactional
	public void editByName(String name, User newUser) {
		User user=this.getByName(name);
		user.setUserName(newUser.getUserName());
		user.setCode(newUser.getCode());
		ht.update(user);
		
	}
	@SuppressWarnings("unchecked")
	@Override
	public User getByName(String name) {
		List<User> users = (List<User>) ht.find(
				"from User where username=?", name);
		if (users.size() > 0)
			return users.get(0);
		else
			return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getAll() {
		List<User> users = (List<User>) ht.find("from User");
		return users;
	}

	@Override
	@Transactional
	public void deleteById(Long id) {
		User user=this.getById(id);
		ht.delete(user);
	}

	@Override
	@Transactional
	public void deleteByName(String name) {
		User user=this.getByName(name);
		ht.delete(user);
	}
	
}