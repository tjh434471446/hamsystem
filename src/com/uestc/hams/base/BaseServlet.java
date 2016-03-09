package com.uestc.hams.base;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class BaseServlet extends HttpServlet {
	//获取web应用中的spring容器
	private ApplicationContext applicationContext;
	@Override
	public void init(ServletConfig config) throws ServletException {
		
		super.init(config);
		applicationContext=WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		System.out.println(applicationContext);
	}
	
	public ApplicationContext getApplicationContext() {
		return applicationContext;
	}
	
	
}
