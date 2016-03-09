<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<html>
<head>
    <title>机构信息列表</title>
    <%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
</head>
<body>
 
<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/style/images/title_arrow.gif"/> 机构管理
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<div id="MainArea">
    <table cellspacing="0" cellpadding="0" class="TableStyle">
       
        <!-- 表头-->
        <thead>
            <tr align=center valign=middle id=TableTitle>
            	<td  align="center" style="width: 200px">机构名称</td>
				<td  align="center" style="width: 200px">上级机构名称</td>
				<td  align="center" style="width: 200px">职能说明</td>
				<td >相关操作</td>
            </tr>
        </thead>

		<!--显示数据列表-->
        <tbody id="TableData" class="dataContainer" datakey="districtInsList">
        
        <s:iterator value="#districtInsList">
			<tr class="TableDetail1 template">
				<td align="center"><s:a action="districtIns_list?parentId=%{id}">${name}</s:a>&nbsp;</td>
				<td align="center">${parent.name}&nbsp;</td>
				<td align="center">${description}&nbsp;</td>
				<td align="center">
					<s:a action="districtIns_delete?id=%{id}&parentId=%{parent.id}" onclick="return window.confirm('这将删除所有的下级部门，您确定要删除吗？')">删除</s:a>
					<s:a action="districtIns_editUI?id=%{id}">修改</s:a>
					&nbsp
				</td>
			</tr>
		</s:iterator>	
			
        </tbody>
    </table>
    
    <!-- 其他功能超链接 -->
    <div id="TableTail">
        <div id="TableTail_inside">
            <s:a action="districtIns_addUI?parentId=%{parentId}"><img src="${pageContext.request.contextPath}/style/images/createNew.png" /></s:a>
            <s:a action="districtIns_list?parentId=%{#parent.parent.id}"><img src="${pageContext.request.contextPath}/style/blue/images/button/ReturnToPrevLevel.png" /></s:a>
        </div>
    </div>
</div>

<!--说明-->	
<div id="Description"> 
	说明：<br />
	1，列表页面只显示一层的（同级的）机构数据，默认显示最顶级的机构列表。<br />
	2，点击机构名称，可以查看此机构相应的下级机构列表。<br />
	3，删除机构时，同时删除此机构的所有下级机构。
</div>

</body>
</html>
