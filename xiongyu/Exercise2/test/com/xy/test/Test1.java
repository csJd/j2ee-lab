package com.xy.test;

import org.junit.Test;

import com.xy.dao.UserDao;
import com.xy.model.User;
import com.xy.utils.QueryResult;

public class Test1 {
	@Test
	public void test1(){
		UserDao userDao = new UserDao();
		QueryResult<User> result = userDao.listAll();
		System.out.println(result);
	}
	
	@Test
	public void test2(){
		UserDao userDao = new UserDao();
		User user = userDao.getUser(61);
		System.out.println(user);
	}

	@Test
	public void test3(){
		UserDao userDao = new UserDao();
		User user = new User("asasafaasdf", "xiongyu");
		user.setId(61);
		boolean b = userDao.editUser(user);
		System.out.println(b);
	}
	@Test
	public void test4(){
		UserDao userDao = new UserDao();
		boolean b = userDao.deleteUser(75);
		System.out.println(b);
	}
}
