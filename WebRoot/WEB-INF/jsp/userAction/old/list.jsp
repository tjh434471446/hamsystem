<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  
  
  <body>
  
  	<s:iterator value="users">
  		${id}	
  		${name}
  		${loginName} 
		<s:a action="user_delete?id=%{id}">删除</s:a>
  	</s:iterator>
  	<s:a action="user_addUI">添加</s:a>
  </body>
</html>
