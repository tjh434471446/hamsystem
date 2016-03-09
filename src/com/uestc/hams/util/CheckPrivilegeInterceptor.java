package com.uestc.hams.util;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.uestc.hams.entity.User;

public class CheckPrivilegeInterceptor extends AbstractInterceptor {
/*
	//销毁
	public void destroy() {

	}
	//初始化
	public void init() {}*/

	//每一次拦截
	public String intercept(ActionInvocation invocation) throws Exception {
		/*System.out.println("======之前");
		String result=invocation.invoke();//放行
		System.out.println("=====之后");//之后都有拦截器（modeldrvien等）最后进入action
		return result;*/
		//如果未登陆，转到登陆页面(因为是在struts2的环境下所以可以使用ActionContext，在登陆时就put了)
		  User user=(User) ActionContext.getContext().getSession().get("user");
		  String namespace=invocation.getProxy().getNamespace();
		  String privUrl=namespace+invocation.getProxy().getActionName();//getProxy得到action的代理
		// 如果未登录
			if (user == null) {
				if (privUrl.startsWith("/user_login")) { // "/user_loginUI", "/user_login"
					// 如果是去登录，就放行
					return invocation.invoke();
				} else {
					// 如果不是去登录，就转到登录页面
					return "loginUI";
				}
			}
			// 如果已登 录，就判断权限
			else {
				if (user.hasPrivilegeByUrl(privUrl)) {
					// 如果有权限，就放行
					return invocation.invoke();
				} else {
					// 如果没有权限，就转到提示页面
					return "noPrivilegeError";
				}
			}
		  
		
	}

}
