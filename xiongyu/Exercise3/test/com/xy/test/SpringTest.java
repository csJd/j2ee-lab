package com.xy.test;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xy.service.UserServiceInter;

public class SpringTest {
    ApplicationContext ac = null;
	
    @Before
	public void init(){
    	ac = new ClassPathXmlApplicationContext(new String[]{"spring.xml","spring-hibernate.xml"});
	}
    
    @Test
    public void test(){
    	UserServiceInter userProxy = (UserServiceInter) ac.getBean("userProxy");
    	System.out.println(userProxy);
    }
}
