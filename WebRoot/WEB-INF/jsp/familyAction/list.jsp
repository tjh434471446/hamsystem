<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'list.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/style/blue/pageCommon.css" />

<%@ include file="/WEB-INF/jsp/public/commons.jspf"%>


</head>


<script type="text/javascript" language="javascript">
	var tabId;
	function addUI() {
		var form = document.forms[0];
		form.action = "family_addUI.action";
		form.submit();

	}

	//   function familyDelete(){

	//   }

	function refresh() {
		var form = document.forms[0];
		form.action = "family_list.action";
		form.submit();
		var obj1 = document.getElementById('tab1');
		var obj2 = document.getElementById('tab2');
		obj1.style.display = 'block';
		obj2.style.display = 'none';

	}

	var curtab = null;
	function do_onclick(tab) {
		if (curtab != null)
			curtab.style.backgroundColor = "white";
		tab.style.backgroundColor = "grey";
		curtab = tab;

	}

	//       function noFamilyList(){
	//       var form=document.forms[0];
	//       form action="family_noFamilyList.action";
	//       form.submit();
	//       var obj1 = document.getElementById('tab1');	
	//       var obj2 = document.getElementById('tab2');
	//       obj1.style.display='none';
	//       obj2.style.display='block';

	//       }
</script>



<body>

	<div id="Title_bar">
		<div id="Title_bar_Head">
			<div id="Title_Head"></div>
			<div id="Title">
				<!--页面标题-->
				<img border="0" width="13" height="13"
					src="${pageContext.request.contextPath}/style/images/title_arrow.gif" />
				家庭管理
			</div>
			<div id="Title_End"></div>
		</div>
	</div>
	<form name="bt">
		<input type="button" onclick="addUI()" name="b1" value="新建" /> <input
			type="button" onclick="refresh()" name="b3" value="刷新" /> <input
			type="button" onclick="noFamilyList()" name="b4" value="未加入家庭列表" />
		<input type="button" onclick="exportExcel()" name="b5" value="导出Excel" />
	</form>



	<div id="MainArea">
		<div id="tab1" style="display: block;">
			<div id="TableTail">
				<div id="TableTail_inside"></div>
			</div>
			<table cellspacing="0" cellpadding="0" class="TableStyle">

				<!-- 表头-->
				<thead>
					<tr align=center valign=middle id=TableTitle>
						<td width="100">家庭编号</td>
						<td width="100">户主姓名</td>
						<td width="200">家庭住址</td>
						<td width="100">联系电话</td>
						<td width=100>邮政编码</td>
						<td width="200">医保卡号</td>
						<td width="200">医疗证号</td>
						<td width="150">乡镇名称</td>
						<td width="150">村委会名称</td>
						<td width="200">相关操作</td>
					</tr>
				</thead>

				<!--显示数据列表-->
				<tbody id="TableData" class="dataContainer" datakey="userList">

					<s:iterator value="#familyList" status="st">
						<tr align=center class="TableDetail1 template" id="#st.index"
							onclick="do_onclick(this)">

							<td>${id}</td>
							<td>${head.name}&nbsp;</td>
							<td>${address }</td>
							<td>${phoneNo }</td>
							<td>${postalCode}</td>
							<td>${medicalInsNo }</td>
							<td>${medicalNo }</td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
							<td><s:a action="family_info?id=%{id}">进入家庭档案</s:a></td>
						</tr>
					</s:iterator>

				</tbody>
			</table>

		</div>

		<!--  未加入家庭列表 -->
		<div id="tab2" style="display: none">
			<table cellspacing="0" cellpadding="0" class="TableStyle" border="1">

				<thead>
					<tr align=center valign=middle id=TableTitle>
						<td width="150">档案编号</td>
						<td width="100">姓名</td>
						<td width="100">年龄</td>
						<td width="100">性别</td>
						<td width=100>出生日期</td>
						<td width="200">现居住地址</td>
						<td width="200">电话</td>
						<td width="150">村别</td>
						<td width="150">疾病史</td>
						<td width="100">建档人</td>
						<td width="200">相关操作</td>
					</tr>
				</thead>

				<!-- 				显示数据列表 -->
				<tbody id="TableData" class="dataContainer" datakey="userList">

					<s:iterator value="#noFamilyResidentList" status="st">
						<tr class="TableDetail1 template" id="#st.index"
							onclick="do_onclick(this)">

							<td>${id}</td>
							<td>${name}&nbsp;</td>
							<td>${age}</td>
							<td>${sex}</td>
							<td>${rsBornDate}</td>
							<td>${nowAdr}</td>
							<td>${phoneNumber}</td>
							<td>&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
							<td>${paperRecorder.name}</td>
							<td><s:a action="family_info?id=%{id}">进入家庭档案</s:a></td>
						</tr>
					</s:iterator>

				</tbody>
			</table>

		</div>
	</div>

</body>
</html>
