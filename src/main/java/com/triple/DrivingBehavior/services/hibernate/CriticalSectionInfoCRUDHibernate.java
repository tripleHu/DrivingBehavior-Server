package com.triple.DrivingBehavior.services.hibernate;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.triple.DrivingBehavior.domain.CriticalSectionInfo;
import com.triple.DrivingBehavior.services.CriticalSectionInfoCRUD;

@Service("CriticalSectionInfoCRUD")
public class CriticalSectionInfoCRUDHibernate implements CriticalSectionInfoCRUD{
	private HibernateTemplate ht;
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
	ht = new HibernateTemplate(sessionFactory);
	}
	@Override
	@Transactional
	public void add(CriticalSectionInfo info) {
		ht.save(info);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<CriticalSectionInfo> getbyNo(String no) {
		List<CriticalSectionInfo> infos=(List<CriticalSectionInfo>)ht.find("from CriticalSectionInfo where no=?", no);
		if (infos.size() > 0)
			return infos;
		else
		return null;
	}

	@Override
	public void editById(Long id, CriticalSectionInfo newinfo) {
		CriticalSectionInfo info=this.getbyId(id);
		info.setBusstation(newinfo.getBusstation());
		info.setFlag(newinfo.getFlag());
		info.setLatitude(newinfo.getLatitude());
		info.setLongitude(newinfo.getLongitude());
		info.setMax_acceleration(newinfo.getMax_acceleration());
		info.setMaxspeed(newinfo.getMaxspeed());
		info.setMin_acceleration(newinfo.getMin_acceleration());
		info.setMinspeed(newinfo.getMinspeed());
		info.setNo(newinfo.getNo());
		info.setRushhour(newinfo.getRushhour());
		info.setBusstationno(newinfo.getBusstationno());
		ht.update(info);
	}

	@Override
	public void deleteById(Long id) {
		CriticalSectionInfo info=this.getbyId(id);
		ht.delete(info);
		
	}
	@Override
	public CriticalSectionInfo getbyId(Long id) {
		return ht.get(CriticalSectionInfo.class,id);
	}

}
