<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
 	<SCRIPT type="text/javascript"> 
 	</SCRIPT>
 <script language="javascript" src="${pageContext.request.contextPath}/script/date.js" charset="utf-8"></script>
 
 </head>
  
  <body>
  <!-- 
		<s:form action="user_add">
			姓名<s:textfield name="user.name"></s:textfield>
			登录名<s:textarea name="user.loginName"></s:textarea>
			<s:submit>提交</s:submit>
		</s:form> -->
		(1)只选择日期 <input type="text" name="date" readOnly onClick="setDay(this);"><br/> 
(2)选择日期和小时 <input type="text" name="dateh" readOnly onClick="setDayH(this);"><br/> 
(3)选择日期和小时及分钟 <input type="text" name="datehm" readOnly onClick="setDayHM(this);"> 
<p> 
金额汇总</p> 
   <br/>
  </body>
</html>
