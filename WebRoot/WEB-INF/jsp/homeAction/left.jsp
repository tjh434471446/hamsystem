<%@ page language="java" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>导航菜单</title>
		<%@ include file="/WEB-INF/jsp/public/commons.jspf"%>
		<link type="text/css" rel="stylesheet" href="style/blue/menu.css" />
		<script type="text/javascript">
			
			function menuClick( menu ){
				$(menu).next().toggle();
			}
		
		</script>
	</head>

	<body style="margin: 0">
		<div id="Menu">

			<ul id="MenuUl">
			
				<%-- 显示一级菜单 --%>
				<!-- 写了监听器s:iterator value="#topPrivilegeList 不需要每次都查数据库，缓存起来，application为最大作用域-->
				<s:iterator value="#application.topPrivilegeList">
				<!-- 是否有权限  map里本来就加载了session,当前栈顶属性中的name-->
					<s:if test="#session.user.hasPrivilegeByName(name)">
					<li class="level1">
						<div onClick="menuClick(this);" class="level1Style">
							<!-- 图标 -->
							<img src="style/images/MenuIcon/${id}.gif" class="Icon" />
							${name}
						</div>
						<ul style="" class="MenuLevel2" id="aa">
							<%-- 显示二级菜单 --%>
							<s:iterator value="children">
								<s:if test="#session.user.hasPrivilegeByName(name)">
								<li class="level2">
									<div class="level2Style">
										<img src="style/images/MenuIcon/menu_arrow_single.gif" />
										<!-- 是否改成从文件中获取的方式权限超链接 -->
										<a target="right" href="${pageContext.request.contextPath}${url}.action"> ${name}</a>
									</div>
								</li>
								</s:if>
							</s:iterator>
						</ul> 
					</li>
					</s:if>
				</s:iterator>
				
			</ul>

		</div>
	</body>
</html>