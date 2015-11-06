package com.triple.DrivingBehavior.services.hibernate;

import java.util.Date;
import java.util.List;

import javax.persistence.criteria.From;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.triple.DrivingBehavior.domain.DrivingInfo;
import com.triple.DrivingBehavior.domain.User;
import com.triple.DrivingBehavior.services.DrivingInfoCRUD;

@Service("DrivingInfoCRUDHibernate")
public class DrivingInfoCRUDHibernate implements DrivingInfoCRUD{

	private HibernateTemplate ht;
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
	ht = new HibernateTemplate(sessionFactory);
	}
	@Override
	@Transactional
	public void add(DrivingInfo drivingInfo) {
			ht.save(drivingInfo);
	}

	@Override
	@Transactional
	public void editById(Long id, DrivingInfo newDrivingInfo) {
		DrivingInfo info=this.getById(id);
		info.setLatitude(newDrivingInfo.getLatitude());
		info.setLongitude(newDrivingInfo.getLongitude());
		info.setOrientation(newDrivingInfo.getOrientation());
		info.setTime(newDrivingInfo.getTime());
		info.setUser(newDrivingInfo.getUser());
		info.setVelocity(newDrivingInfo.getVelocity());
		ht.update(info);
	}

	@Override
	public DrivingInfo getById(long id) {
		return ht.get(DrivingInfo.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<DrivingInfo> getByUserId(long id) {
		List<DrivingInfo> info=(List<DrivingInfo>)ht.find("from DrivingInfo where user_id=?", id);
		if (info.size() > 0)
			return info;
		else
			return null;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<DrivingInfo> getByUserName(String Name) {
		List<User> users=(List<User>)ht.find("from User where username=?", Name);
		User user=users.get(0);
		List<DrivingInfo> info=(List<DrivingInfo>)ht.find("from DrivingInfo where user_id=?", user.getId());
		if (info.size() > 0)
			return info;
		else
			return null;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<DrivingInfo> getAll() {
		List<DrivingInfo> info=(List<DrivingInfo>)ht.find("from DrivingInfo");
		return info;
	}
	@SuppressWarnings("unchecked")
	@Override
	public User getUser(String name)
	{
		List<User> users = (List<User>)ht.find("from User where username=?", name);
		if (users.size() > 0)
			return users.get(0);
		else
			return null;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<DrivingInfo> getInfobyTime(Date StartTime,Date EndTime,String Name)
	{
		List<User> users=(List<User>)ht.find("from User where username=?", Name);
		User user=users.get(0);
		List<DrivingInfo> infos=(List<DrivingInfo>)ht.find("from DrivingInfo where time>? and time<? and user_id=?",StartTime,EndTime,user.getId());
		return infos;
	}
	@Override
	@Transactional
	public void deleteById(Long id) {
		DrivingInfo info=this.getById(id);
		ht.delete(info);
	}

	@Override
	@Transactional
	public void deleteByUserName(String name) {
		List<DrivingInfo> info=this.getByUserName(name);
		ht.deleteAll(info);
	}

}
