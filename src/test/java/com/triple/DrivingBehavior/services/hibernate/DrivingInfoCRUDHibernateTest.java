package com.triple.DrivingBehavior.services.hibernate;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.triple.DrivingBehavior.domain.DrivingInfo;
import com.triple.DrivingBehavior.domain.User;
import com.triple.DrivingBehavior.services.DrivingInfoCRUD;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})  
public class DrivingInfoCRUDHibernateTest 
{
	@Autowired
	@Qualifier("DrivingInfoCRUDHibernate")
	private DrivingInfoCRUD infoCRUD;
	@Before
	public void setUp() throws Exception {
		//删除所有的数据
		deleteAll();
    }
	private void deleteAll() {
		List<DrivingInfo> info=infoCRUD.getAll();
		for(DrivingInfo i:info)
		{
			infoCRUD.deleteById(i.getId());
		}
	}
	@After
    public void tearDown() throws Exception {
		deleteAll();
    }
	@Test
	public void testAdd()
	{
		DrivingInfo info=new DrivingInfo();
		info.setLatitude(109.333);
		info.setLongitude(29.03542);
		info.setOrientation((float) 30.22);
		info.setTime(new Date());
		info.setVelocity((float) 50.0);
		info.setUser(infoCRUD.getUser("1"));
		infoCRUD.add(info);
		
		info=infoCRUD.getById(info.getId());
		if(109.333!=info.getLatitude()||29.03542!=info.getLongitude())
		{
			fail("测试失败");
		}
	}
	@Test
	public void testEditById()
	{
		DrivingInfo info=new DrivingInfo();
		info.setLatitude(109.333);
		info.setLongitude(29.03542);
		info.setOrientation((float) 30.22);
		info.setTime(new Date());
		info.setVelocity((float) 50.0);
		info.setUser(infoCRUD.getUser("1"));
		infoCRUD.add(info);
		
		long id=info.getId();
		info.setLatitude(209.333);
		infoCRUD.editById(id, info);
		info=infoCRUD.getById(id);
		if(209.333!=info.getLatitude())
		{
			fail("测试失败");
		}
	}
	@Test
	public void testgetById()
	{
		DrivingInfo info=new DrivingInfo();
		info.setLatitude(109.333);
		info.setLongitude(29.03542);
		info.setOrientation((float) 30.22);
		info.setTime(new Date());
		info.setVelocity((float) 50.0);
		info.setUser(infoCRUD.getUser("1"));
		infoCRUD.add(info);
		long id=info.getId();
		info=infoCRUD.getById(id);
		if(109.333!=info.getLatitude())
		{
			fail("测试失败");
		}
	}
	@Test
	public void testgetByUserId()
	{
		DrivingInfo info=new DrivingInfo();
		info.setLatitude(109.333);
		info.setLongitude(29.03542);
		info.setOrientation((float) 30.22);
		info.setTime(new Date());
		info.setVelocity((float) 50.0);
		info.setUser(infoCRUD.getUser("1"));
		infoCRUD.add(info);
		
		info=new DrivingInfo();
		info.setLatitude(111.333);
		info.setLongitude(30.03542);
		info.setOrientation((float) 30.22);
		info.setTime(new Date());
		info.setVelocity((float) 50.0);
		info.setUser(infoCRUD.getUser("1"));
		infoCRUD.add(info);
		
		List<DrivingInfo> infos=infoCRUD.getByUserId(info.getUser().getId());
		if(109.333!=infos.get(0).getLatitude()||111.333!=infos.get(1).getLatitude())
		{
			fail("测试失败");
		}
	}
	@Test
	public void testgetByUserName()
	{
		DrivingInfo info=new DrivingInfo();
		info.setLatitude(109.333);
		info.setLongitude(29.03542);
		info.setOrientation((float) 30.22);
		info.setTime(new Date());
		info.setVelocity((float) 50.0);
		info.setUser(infoCRUD.getUser("1"));
		infoCRUD.add(info);
		
		info=new DrivingInfo();
		info.setLatitude(111.333);
		info.setLongitude(30.03542);
		info.setOrientation((float) 30.22);
		info.setTime(new Date());
		info.setVelocity((float) 50.0);
		info.setUser(infoCRUD.getUser("1"));
		infoCRUD.add(info);
		String name=info.getUser().getUserName();
		List<DrivingInfo> infos=infoCRUD.getByUserName(name);
		if(109.333!=infos.get(0).getLatitude()||111.333!=infos.get(1).getLatitude())
		{
			fail("测试失败");
		}
	}
	@Test
	public void testgetAll()
	{
		DrivingInfo info=new DrivingInfo();
		info.setLatitude(109.333);
		info.setLongitude(29.03542);
		info.setOrientation((float) 30.22);
		info.setTime(new Date());
		info.setVelocity((float) 50.0);
		info.setUser(infoCRUD.getUser("1"));
		infoCRUD.add(info);
		
		info=new DrivingInfo();
		info.setLatitude(111.333);
		info.setLongitude(30.03542);
		info.setOrientation((float) 30.22);
		info.setTime(new Date());
		info.setVelocity((float) 50.0);
		info.setUser(infoCRUD.getUser("1"));
		infoCRUD.add(info);
		
		List<DrivingInfo> infos=infoCRUD.getAll();
		if(109.333!=infos.get(0).getLatitude()||111.333!=infos.get(1).getLatitude())
		{
			fail("测试失败");
		}
	}
	@Test
	public void testgetUser()
	{
		User u=infoCRUD.getUser("1");
		if(u==null)
		{
			fail("测试失败");
		}
	}
	@Test
	public void testdeleteById()
	{
		DrivingInfo info=new DrivingInfo();
		info.setLatitude(109.333);
		info.setLongitude(29.03542);
		info.setOrientation((float) 30.22);
		info.setTime(new Date());
		info.setVelocity((float) 50.0);
		info.setUser(infoCRUD.getUser("1"));
		infoCRUD.add(info);
		long id=info.getId();
		infoCRUD.deleteById(id);
		
		DrivingInfo c2=infoCRUD.getById(info.getId());
		assertEquals(null,c2);
	}
	@Test
	public void testdeleteByUserName()
	{
		DrivingInfo info=new DrivingInfo();
		info.setLatitude(109.333);
		info.setLongitude(29.03542);
		info.setOrientation((float) 30.22);
		info.setTime(new Date());
		info.setVelocity((float) 50.0);
		info.setUser(infoCRUD.getUser("1"));
		infoCRUD.add(info);
		
		DrivingInfo info1=new DrivingInfo();
		info1.setLatitude(111.333);
		info1.setLongitude(30.03542);
		info1.setOrientation((float) 30.22);
		info1.setTime(new Date());
		info1.setVelocity((float) 50.0);
		info1.setUser(infoCRUD.getUser("1"));
		infoCRUD.add(info);
		
		infoCRUD.deleteByUserName("1");
		DrivingInfo c1=infoCRUD.getById(info.getId());
		DrivingInfo c2=infoCRUD.getById(info1.getId());
		assertEquals(null,c1);
		assertEquals(null,c2);
	}
	@Test
	public void testgetInfobyTime()
	{
		//DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//Date starttime = dateFormat.parse("2010-09-13 22:36:01");
		Calendar c = new GregorianCalendar(2015,11,6,18,40,0); 
		Date starttime=c.getTime();
		c= new GregorianCalendar(2015,11,6,19,30,0); 
		Date endtime=c.getTime();
		System.out.println(starttime+"----"+endtime);
	}
}
