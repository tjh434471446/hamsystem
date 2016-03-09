<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
    <title>发送列表</title>
    <%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
</head>
<body>

<div id="Title_bar">
    <div id="Title_bar_Head"> 
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/style/images/title_arrow.gif"/> 发送的留言
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<div id="MainArea">
	<!-- 其他功能超链接 -->
    <%-- <div id="TableTail">
        <div id="TableTail_inside">
            <s:a action=""><img src="${pageContext.request.contextPath}/style/images/createNew.png" /></s:a>
        </div>
    </div> --%>
    
    <table cellspacing="0" cellpadding="0" class="TableStyle">       
        <!-- 表头-->
        <thead>
            <tr align=center valign=middle id=TableTitle>
            	<td width="20" ><img src="${pageContext.request.contextPath}/style/images/message.png"></td>
                <td width="40">收件人</td>
                <td width="580">主题</td>
                <td >时间</td>                
            </tr>
        </thead>
        
        <!--显示数据列表-->
        <tbody id="TableData" class="dataContainer" datakey="sendMessageList">
        
        <s:iterator value="#sendMessageList">
            <tr class="TableDetail1 template" onclick="location.href='messageText_sendDetailInfo.action?id=${id}'" style="cursor:pointer" >
            	<td align=center><img src="${pageContext.request.contextPath}/style/images/messageRead.png"></td>					
                <td align=center width="120">${receiver.name}</td>
                <td align=center>${title}</td>
                <td align=center><s:date name="time" format="yyyy-MM-dd HH:mm:ss"/></td>            
            </tr>
        </s:iterator> 
            
        </tbody>
    </table>
    
    
</div>

</body>
</html>
