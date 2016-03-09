<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="com.uestc.hams.entity.*" %>
<%@ page import="com.uestc.hams.view.action.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AjaxJson.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript" src="<%=path %>/script/yang_js/jquery.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
	
	$("#button").click(function(){
	alert(" button is clicked");
		$.getJSON("json_returnMessage.action",function(data){
// 			通过.操作符可以从data.message中获得Action中message的值
			alert("data is ready"+data);
			$("#message").html("<font color='red'>"+data.message+"</font>");
		});
	});
	
	
	
	$("#regRe").click(function(){
		//把表单的数据进行序列化
		var params = $("#addForm").serialize();
		//使用jQuery中的$.ajax({});Ajax方法
		$.ajax({
			url:"json_gainMember.action",
			type:"POST",
			data:params,
			dataType:"json",
			success:function(data){
				
				alert("success");
				//清空显示层中的数据
			$("#message").html("");
			//为显示层添加获取到的数据
			//获取对象的数据用data.userInfo.属性
			$("#message").append("<div><font color='red'>用户ID："+data.resident.name+"</font></div>")
					     .append("<div><font color='red'>用户名："+data.resident.loginName+"</font></div>");
			}
		});
	});
	
	});


	
	</script>

  </head>
  
  <body>
  <button id="button"  onclick="getMessage()">button</button>
  <div id="demo">this is a demo</div>
  <div>
 
         
    <form id="addForm">
    	用户ID：<input name="resident.id" type="text"/><br/>
    	<input id="regRe" type="button" value="注册"/>
    </form>
             <div id="message"></div>
        </div>
  </body>
</html>
