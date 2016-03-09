package com.uestc.hams.test;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SpringTest {

	private ApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");
	
	/**
	 * 测试Spring未整合前
	 * @throws Exception
	 */
	@Test
	public void testBean() throws Exception {
		TestAction ta=(TestAction) ac.getBean("TestAction");//在TestAction上加上注解@controller
		System.out.println(ta);
	}
	
	@Test// 测试 SessionFactory 的配置
	public void testSessionFactory(){
		SessionFactory sessionFactory = (SessionFactory) ac.getBean("sessionFactory");
		System.out.println(sessionFactory);
	}
}
