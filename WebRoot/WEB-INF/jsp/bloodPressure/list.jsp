<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
    <title>上传历史</title>
    <%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
</head>
<body>

<div id="Title_bar">
    <div id="Title_bar_Head"> 
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/style/images/title_arrow.gif"/> 上传历史
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<div id="MainArea">
 <!-- 其他功能超链接 -->
    <div id="TableTail">
        <div id="TableTail_inside">
        	<s:form name="xy">
        	  <s:if test="roleFlag==0">
        	    <input type="button" name="createNew" value="新建" onclick="location.href='bloodPressure_addUI.action'"/>
        	     <input type="button" name="wave" value="显示血压波形" onclick="location.href='bloodPressure_waveUI.action'"/>
        	    </s:if>        	          	  
        	  <input type="button" name="goback" value="返回" onclick="location.href='javascript:history.go(-1);'"/>
        	</s:form>         
        </div>        
    </div>   
    <table cellspacing="0" cellpadding="0" class="TableStyle">
       
        <!-- 表头-->
        <thead>
            <tr align=center valign=middle id=TableTitle>
                <td width="100">高压</td>
                <td width="100">低压</td>
                <td width="100">记录时间</td>
                <td>备注</td>
                <td>相关操作</td>
            </tr>
        </thead>
        
        <!--显示数据列表-->
        <tbody id="TableData" class="dataContainer" datakey="bloodPressureList">
        
        <s:iterator value="#bloodPressureList">
            <tr class="TableDetail1 template">
                <td align="center">${ss}&nbsp;</td>
                <td align="center">${sz}&nbsp;</td>
                <td><s:date name="recordTime" format="yyyy-MM-dd HH:mm" /></td>
               
                <td align="center">${remarks}&nbsp;</td>
                <td align="center">
	               <s:a action="bloodPressure_editUI?id=%{id}">修改</s:a>
		           <s:a action="bloodPressure_delete?id=%{id}" onclick="return confirm('确定要删除吗？')">删除</s:a>                      
                </td>
            </tr>
        </s:iterator> 
            
        </tbody>
    </table>
    
   
</div>

</body>
</html>
