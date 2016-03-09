<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
    <title>健康档案列表</title>
    <%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
</head>
<body>

<div id="Title_bar">
    <div id="Title_bar_Head"> 
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/style/images/title_arrow.gif"/> 居民个人健康档案管理
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<div id="MainArea">
	<!-- 其他功能超链接 -->
    <div id="TableTail">
        <div id="TableTail_inside">
            <s:a action="archive_addUI"><img src="${pageContext.request.contextPath}/style/images/createNew.png" /></s:a>
        </div>
    </div>
    
    <table cellspacing="0" cellpadding="0" class="TableStyle">
       
        <!-- 表头-->
        <thead>
            <tr align=center valign=middle id=TableTitle>
                <td width="80">档案ID</td>
                <td width="80">姓名</td>
                <td width="30">性别</td>
                <td  width="30">年龄</td>
                <td  width="100">慢性疾病</td>
                <td  width="100">现住址</td>
                <td  width="100">电话</td>
                <td  width="80">录入员</td>
                <td align=left>其他操作</td>
            </tr>
        </thead>
        
        <!--显示数据列表-->
        <tbody id="TableData" class="dataContainer" datakey="residentArchiveList">
        
        <s:iterator value="#residentArchiveList">
            <tr class="TableDetail1 template">
                <td align=center width="120">${rsArchiveId}&nbsp;</td>
                <td align=center>${name}&nbsp;</td>
                <td align=center>${gender}&nbsp;</td>
                
                <td align=center>${age}&nbsp;</td>
                <td align=center>
                <s:property value="%{diseaseType==1 ? '有' : '无'}"/>
                <s:if test="%{diseaseType==1}">
                <s:property value="%{diseaseString.indexOf('0')>=0 ? '高血压 ' : ''}"/> 
                <s:property value="%{diseaseString.indexOf('1')>=0 ? '糖尿病 ' : ''}"/> 
                <s:property value="%{diseaseString.indexOf('2')>=0? '冠心病 ' : ''}"/> 
                <s:property value="%{diseaseString.indexOf('3')>=0 ? '慢性阻塞性肺疾病 ' : ''}"/> 
                <s:property value="%{diseaseString.indexOf('4')>=0 ? '恶性肿瘤 ' : ''}"/> 
                <s:property value="%{diseaseString.indexOf('5')>=0? '重性精神疾病 ' : ''}"/>
                <s:property value="%{diseaseString.indexOf('6')>=0? '肝炎 ' : ''}"/> 
                <s:property value="%{diseaseString.indexOf('7')>=0 ? '其他法定传染病 ':''}"/>
                <s:property value="%{diseaseString.indexOf('8')>=0 ? '职业病 ':''}"/>
                <s:property value="%{diseaseString.indexOf('9')>=0 ? '其他 ':''}"/>
                </s:if>
                </td>
                
                <td align=center>${nowAdr}&nbsp;</td>
                <td align=center>${phoneNumber}&nbsp;</td>
                <td align=center>${recorder.name}&nbsp;</td>
                <td>
                	<s:a action="archive_editUI?id=%{id}">修改档案&nbsp;</s:a>
                	<s:a action="archive_delete?id=%{id}" onclick="return confirm('确定要删除吗？')">删除&nbsp;</s:a>
                	<s:a action="phyExam_archiveList?rsaId=%{id}">健康体检&nbsp;</s:a>
                </td>
            </tr>
        </s:iterator> 
            
        </tbody>
    </table>
    
    
</div>

</body>
</html>
