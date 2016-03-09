package com.uestc.hams.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.uestc.hams.base.BaseServlet;

@WebServlet(urlPatterns="/android/login.jsp")
public class LoginServlet extends BaseServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user=request.getParameter("user");
		String pass=request.getParameter("password");
		System.out.println("user"+user);
		System.out.println("password"+pass);
		int userId=1;
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("userId", userId);
		response.getWriter().println(jsonObject.toString());
	}

}
