<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  
  
  <body>
	<s:form action="role_edit?id=%{id}">
			角色名<s:textfield name="name" value="%{name}"></s:textfield><!-- 这里指对于struts标签默认都是ongl表达试,el表达作用域扩大 -->
			描述1 ${description}
			描述<s:textarea name="description"></s:textarea>
			<s:submit name="提交"></s:submit>
	</s:form>
  </body>
</html>
