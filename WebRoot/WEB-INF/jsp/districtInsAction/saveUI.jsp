<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
	<title>机构信息设置</title>
	<%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
</head>
<body>

<!-- 标题显示 --> 
<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/style/images/title_arrow.gif"/> 机构信息
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<!--显示表单内容-->
<div id=MainArea>

    <s:form action="districtIns_%{id == null ? 'add' : 'edit'}">
        <s:hidden name="id"></s:hidden>
        
        <div class="ItemBlock_Title1"><!-- 信息说明<DIV CLASS="ItemBlock_Title1">
        	<IMG BORDER="0" WIDTH="4" HEIGHT="7" SRC="${pageContext.request.contextPath}/style/blue/images/item_point.gif" /> 部门信息 </DIV>  -->
        </div>
        
        <!-- 表单内容显示 -->
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">
                    <tr><td width="100">上级机构</td>
                        <td>
                        	<s:select name="parentId" cssClass="SelectStyle"
                        		list="#districtInsList" listKey="id" listValue="name"
                        		headerKey="" headerValue="==请选择机构=="
                        	/>
                        </td>
                    </tr>
                    <tr><td>机构名称</td>
                        <td><s:textfield  name="name" cssClass="InputStyle"/> *</td>
                    </tr>
                    <tr><td>机构代码</td>
                        <td><s:textfield  name="districtId" cssClass="InputStyle"/> *</td>
                    </tr>
                    <tr><td>职能说明</td>
                        <td><s:textarea name="description" cssClass="TextareaStyle"></s:textarea></td>
                    </tr>
                </table>
            </div>
        </div>
        
        <!-- 表单操作 -->
        <div id="InputDetailBar">
            <input type="image" src="${pageContext.request.contextPath}/style/images/save.png"/>
            <a href="javascript:history.go(-1);"><img src="${pageContext.request.contextPath}/style/images/goBack.png"/></a>
        </div>
    </s:form>
</div>

<div class="Description">
	说明：<br />
	1，上级机构的列表是有层次结构的（树形）。<br/>
	2，如果是修改：上级机构列表中不能显示当前修改的部门及其子下机构。因为不能选择自已或自已的子机构作为上级机构。<br />
</div>

</body>
</html>
