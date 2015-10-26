package com.triple.DrivingBehavior.services.hibernate;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.triple.DrivingBehavior.domain.User;
import com.triple.DrivingBehavior.services.UserCRUD;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})  
public class UserCRUDHibernateTest
{
	@Autowired
	@Qualifier("UserCRUDHibernate")
	private UserCRUD userCRUD;
	@Before
	public void setUp() throws Exception {
		//删除所有的数据
		deleteAll();
    }
	private void deleteAll() {
		List<User> users=userCRUD.getAll();
		for(User u:users)
		{
			userCRUD.deleteById(u.getId());
		}
	}
	@After
    public void tearDown() throws Exception {
		deleteAll();
    }
	@Test
	public void testGetById() {
		User c=new User();
		c.setCode("1");
		c.setUserName("1");
		userCRUD.add(c);
		c=userCRUD.getById(c.getId());
		assertEquals("1",c.getUserName());
		assertEquals("1",c.getCode());
	}
	@Test
	public void testGetByName() {
		User c=new User();
		c.setCode("1");
		c.setUserName("1");
		userCRUD.add(c);
		c=userCRUD.getByName(c.getUserName());
		assertEquals("1",c.getUserName());
		assertEquals("1",c.getCode());
	}
	@Test
	public void testAdd() {
		User c=new User();
		c.setCode("1");
		c.setUserName("1");
		userCRUD.add(c);
		c=userCRUD.getById(c.getId());
		assertEquals("1",c.getUserName());
		assertEquals("1",c.getCode());
		c=new User();
		c.setCode("1");
		c.setUserName("1");
		try{
			userCRUD.add(c);
			fail("不能执行到此处");
		}catch(Exception e)
		{
			
		}
	}
	@Test
	public void testEditById() {
		User c=new User();
		c.setCode("1");
		c.setUserName("1");
		userCRUD.add(c);
		c=userCRUD.getById(c.getId());
		c.setUserName("2");
		userCRUD.editById(c.getId(), c);
		c=userCRUD.getById(c.getId());
		assertEquals("2",c.getUserName());
	}
	@Test
	public void testEditByName() {
		User c=new User();
		c.setCode("1");
		c.setUserName("1");
		userCRUD.add(c);
		c=userCRUD.getByName(c.getUserName());
		c.setCode("2");
		userCRUD.editByName(c.getUserName(), c);
		c=userCRUD.getByName(c.getUserName());
		assertEquals("2",c.getCode());
	}
	@Test
	public void testGetAll() {
		User c1=new User();
		c1.setCode("1");
		c1.setUserName("1");
		userCRUD.add(c1);
		User c2=new User();
		c2.setCode("2");
		c2.setUserName("2");
		userCRUD.add(c2);
		List<User> users=userCRUD.getAll();
		assertEquals("1",users.get(0).getUserName());
		assertEquals("2",users.get(1).getUserName());
	}
	@Test
	public void testDeleteById() {
		User c1=new User();
		c1.setCode("1");
		c1.setUserName("1");
		userCRUD.add(c1);
		userCRUD.deleteById(c1.getId());
		User c2=userCRUD.getById(c1.getId());
		assertEquals(null,c2);
	}
	@Test
	public void testDeleteByName() {
		User c1=new User();
		c1.setCode("1");
		c1.setUserName("1");
		userCRUD.add(c1);
		userCRUD.deleteByName(c1.getUserName());
		User c2=userCRUD.getById(c1.getId());
		assertEquals(null,c2);
	}
}