<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.uestc.hams.entity.*" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showMember.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  
  

  <div>
  <table border="1">
  <tr><th width="200">用户编号</th>
  <th width="200">登录名</th>
  <th width="200">真实姓名</th>
  <th width="200">与户主关系</th>
  <th width="300">相关操作</th>
  </tr>
  <s:iterator value="#memberList" status="ml">
  <tr>
  <td>${id}</td>
  <td>${loginName}</td>
  <td>${name}</td>
  <td>${relationShip }</td>
  <td>
  <s:a action="family_deleteMember?id=%{id}&famId=%{familyId}"  onclick="return confirm('确定要删除吗？')">删除成员</s:a>
   ${id}
    ${familyId}
  </td>
  </tr>
  </s:iterator>
  </table>
  </div>
   <div id="TableTail">
        <div id="TableTail_inside">
            <s:a action="family_addMember?familyId=%{familyId }">添加成员</s:a>
           
        </div>
    </div>
  </body>
</html>
