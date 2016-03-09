<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
	<title>医患互动</title>
     <%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
</head>
<body> 

<!-- 标题显示 -->
<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/style/images/title_arrow.gif"/> 医患互动
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<!-- 其他功能超链接 -->
    <div id="TableTail">
		<div id="TableTail_inside">
			::::
			<s:if test='%{roleFlag=="0"}'><s:a action="messageText_residentAddUI">请 您 留 言 </s:a></s:if>
			<s:else><s:a action="messageText_doctorAddUI">请 您 留 言 </s:a></s:else>
			 :::::::<s:a action="messageText_receiveList?roleFlag=%{roleFlag}">收 到 留 言 </s:a>
			 :::::::<s:a action="messageText_sendList">已 发 送 </s:a>
        </div>
        
    </div>

</body>
</html>

