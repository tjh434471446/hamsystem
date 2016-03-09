<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
    <title></title>    	
	<%@ include file="/WEB-INF/jsp/public/commons.jspf" %>	
  </head>
   
  <body>
  <div id="Title_bar">
    <div id="Title_bar_Head"> 
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/style/images/title_arrow.gif"/> 留言详细信息
        </div>
        <div id="Title_End"></div>
    </div>
  </div>
  <div id="MainArea">
    <div id="TableTail">
        <div id="TableTail_inside">
            <form name="lb">            	
            	<input type="button" name="goback" value="返回" onclick="location.href='javascript:history.go(-1);'"/>
            </form>
        </div>               
    </div>
    <div>
          <table>
            <tr>
              <td><font size="5" ><strong>${messageText.title}</strong></font></td>
            </tr>
        	<tr>
              <td>发件人：${messageText.sender.name}</td>
            </tr>
            <tr>
              <td>收件人：${messageText.receiver.name}</td>
            </tr>
            <tr>
              <td>时&nbsp;间：<s:date name="#messageText.time" format="yyyy-MM-dd HH:mm:ss"/></td>
            </tr>
          </table>         
        </div>
           <hr/>
        <div>
          <table>
            <tr>
              <td><font size="4">${messageText.content}</font></td>
            </tr>  
          </table>
        </div>
  </div>

  </body>
</html>
