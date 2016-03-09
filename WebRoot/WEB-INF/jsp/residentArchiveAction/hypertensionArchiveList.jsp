<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
    <title>高血压档案</title>
    <%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
    <script type="text/javascript">
    	var i="i am a string";
    	console.log('变量：',i); 
    </script>
</head>
<body>

<div id="Title_bar">
    <div id="Title_bar_Head"> 
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/style/images/title_arrow.gif"/> 高血压档案
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<div id="MainArea">
    <table cellspacing="0" cellpadding="0" class="TableStyle">
       
        <!-- 表头-->
        <thead>
            <tr align=center valign=middle id=TableTitle>
                <td width="100">档案编号</td>
                <td width="100">姓名</td>
                <td width="30">性别</td>
                <td width="100">住址</td>
                <td width="100">电话</td>
                 <td width="200">身份证号</td>
                 <td width="100">建档人</td>
                 <td width="100">建档日期</td>
                <td>相关操作</td>
            </tr>
        </thead>
        
        <!--显示数据列表-->
        <tbody id="TableData" class="dataContainer" datakey="userList">
        
        <s:iterator value="#hypertensionArchiveList">
            <tr class="TableDetail1 template">
                <td>${rsArchiveId}&nbsp;</td>
                <td>${name}&nbsp;</td>
                <td>${gender}&nbsp;</td>
                <td>${addressId} &nbsp; </td>
                <td>${telephone} &nbsp; </td>
                <td>${rsId} &nbsp; </td>
                <td>${recorder.name} &nbsp; </td>
                <td>${achiveDate}&nbsp;</td>
                <td>
                	&nbsp;
                </td>
            </tr>
        </s:iterator> 
            
        </tbody>
    </table>
    
    <!-- 其他功能超链接 -->
    <div id="TableTail">
        <div id="TableTail_inside">
        </div>
    </div>
</div>

</body>
</html>
