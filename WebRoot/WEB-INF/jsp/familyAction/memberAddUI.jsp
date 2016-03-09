<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.uestc.hams.entity.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<!-- <! DOCTYPE HTML> -->
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addMember.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<%@ include file="/WEB-INF/jsp/public/commons.jspf" %>

  </head>
  
  <body>
  <div>
  <table>
  <tr><td>家庭编号：</td><td>${famId }</td></tr>
  <tr><td>户主姓名：</td><td>${user.name }</td></tr>
  <tr><td>医保卡号：</td><td>${family.medicalInsNo }</td></tr>
  </table></div>

  
  <h3>家庭编号：${id}</h3>
  
  <s:form action="family_memberAdd?id=%{id}"   >
   &nbsp;&nbsp;&nbsp; 用户名：<s:textfield name="loginName" label="用户名" ></s:textfield><br>
  &nbsp;&nbsp;身份证号：<s:textfield name="name" label="身份证号"></s:textfield><br>
<%-- 密码：<s:textfield name="password" label="密码"></s:textfield><br> --%>
与户主关系：<s:select name="relationShip" label="与户主的关系" list="{'son','wife','daughter','head','other'}"></s:select> 
  <br> &nbsp;&nbsp;&nbsp;&nbsp; <s:submit value="提交"></s:submit> 

<!-- <form action="family_memberAdd?id=%{id}"> -->
<!--     用户名： <input type="number" name="loginName"  required="required"/><br> -->
<!--     真实姓名：<input type="number"  name="name" required="required"/><br> -->
<!--     密码： <input type="password" name="password" required="required"/><br> -->
<!--     与户主关系：<input name="relationShip" type="" list="{'son','daughter','head','other'}"/><br> -->
<!--     <input type="submit" value="提交"/> -->

<!-- </form> -->
  
  </s:form> 
  </body>
</html>
