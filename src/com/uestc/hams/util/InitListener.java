package com.uestc.hams.util;

import java.util.Collection;
import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.uestc.hams.entity.Privilege;
import com.uestc.hams.service.PrivilegeService;


/**
 * 初始化
 * @author wujingnan
 *
 */
@Component
public class InitListener implements ServletContextListener{

	/*@Resource
	private PrivilegeService privilegeService; Spring 和struts需要整合，
	因为struts2的action才能注入信息*/

	public void contextDestroyed(ServletContextEvent sce) {

	}

	
	public void contextInitialized(ServletContextEvent sce) {

		//获取容器与service？？这里没法通过开事务得到
		ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext());
		PrivilegeService privilegeService = (PrivilegeService) ac.getBean("privilegeServiceImpl");//没有起名字默认第一个字母小写
		//准备数据 topPrivilegeList
		
		List<Privilege> topPrivilegeList = privilegeService.findTopList();
		sce.getServletContext().setAttribute("topPrivilegeList", topPrivilegeList);
		System.out.println("===================已准备数据");
		
		// 准备数据：allPrivilegeUrls
		Collection<String> allPrivilegeUrls = privilegeService.getAllPrivilegeUrls();
		sce.getServletContext().setAttribute("allPrivilegeUrls", allPrivilegeUrls);
		System.out.println("------------> 已准备数据allPrivilegeUrls <------------");
	}

}
