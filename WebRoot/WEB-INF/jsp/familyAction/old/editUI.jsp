<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editUI.jsp' starting page</title>
    
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
  
  <div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/style/images/title_arrow.gif"/> 家庭档案
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<form name="bt2">
<input type="button" onClick="back()" name="b1" value="返回"/>
<input type="button" onClick="view('1')" id="bt1" value="基本信息" />
<input type="button" onClick="view('2')" id="bt2" value="家庭成员"/>
<input type="button" onClick="view('3')" id="bt3" value="家庭主要问题"/>
</form>
<div class="ItemBlock_Title1"><!-- 信息说明 --><div class="ItemBlock_Title1">
        	<img border="0" width="4" height="7" src="${pageContext.request.contextPath}/style/blue/images/item_point.gif" /> 编辑家庭档案 </div> 
        </div>
  <s:form action="family_edit?id=%{id}">
  <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">
                <tr><th>家庭编号</th><td>${id}</td></tr>
                <tr><th>户主姓名</th><td>${head.name}</td></tr>
   <tr><th>医保卡号</th><td><s:textfield name="medicalInsNo" cssClass="InputStyle"></s:textfield> </td></tr>
   <tr><th>医疗证号</th><td><s:textfield name="medicalNo" cssClass="InputStyle"></s:textfield> </td></tr>
   <tr><th>邮政编码</th><td><s:textfield name="postalCode" cssClass="InputStyle"></s:textfield> </td></tr>
   <tr><th>工作人数</th><td><s:textfield name="careerPopu" cssClass="InputStyle"></s:textfield> </td></tr>
   <tr><th>家庭住址</th><td><s:textfield name="address" cssClass="InputStyle"></s:textfield> </td></tr>
   <tr><td><s:submit value="提交"/></td></tr>
   </table>
   </div></div>
   </s:form>
  
  </body>
</html>
