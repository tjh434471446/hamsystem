<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
    <title>健康体检</title>
    <%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
<!--    -->
<!--    <script language="javascript" type="text/javascript">-->
<!--    	function toPage(page,rasId){-->
<!--    		//document.getElementById("currPage").value = page;-->
<!--    		//document.getElementById("rsaId").value = rsaId;-->
<!--    		window.location.href = "phyExam_${'archiveList'}.action?page="+page+"&rsaId="+(Long)rsaId;-->
<!--    	}-->
<!--    -->
<!--    </script>-->
</head>
<body>

	<div id="Title_bar">
	    <div id="Title_bar_Head"> 
	        <div id="Title_Head"></div>
	        <div id="Title"><!--页面标题-->
	            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/style/images/title_arrow.gif"/> 健康体检
	        </div>
	        <div id="Title_End"></div>
	    </div>
	</div>

<div id="MainArea">
	<!-- 其他功能超链接 -->
    <div id="TableTail">
        <div id="TableTail_inside">
            <s:a action="phyExam_addUI?rsaId=%{rsaId}"><img src="${pageContext.request.contextPath}/style/images/createNew.png" /></s:a>
        </div>
        <!-- 隐藏字段，保存当前页数数据 -->
        <div><s:hidden name="page" id="currPage"/></div>
        <div><s:hidden name="rsaId" id="rsaId"/></div>
    </div>
    <!-- 数据区域，用表格展示数据 -->
    <div id="data">
	    <table id="dataList" cellspacing="0" cellpadding="0" class="TableStyle">
	       
	        <!-- 表头-->
	        <thead>
	            <tr align=center valign=middle id=TableTitle>
	                <td width="250">档案编号</td>
	                <td width="150">姓名</td>
	                <td width="60">性别</td>
	                <td width="60">年龄</td>
	                <td>出生日期</td>
	                <td>电话</td>
	                <td>体检日期</td>
	                <td>责任医生</td>
	                <td>录入员</td>
	                <td>操作</td>
	              
	            </tr>
	        </thead>
	        
	        <!--显示数据列表-->
	        <tbody id="TableData" class="dataContainer" >
	           <s:iterator value="phyExams" >
	              <tr class="TableDetail1 template">
	                  <td align="center"><s:property value="residentArchive.rsArchiveId"/></td>
	                  <td align="center"><s:property value="residentArchive.name"/></td>
	                  <td align="center"><s:property value="residentArchive.gender"/></td>
	                  <td align="center"><s:property value="15"/></td>	                            
	                 <!--出生日期，应该用Date  <td>
	                  	<s:date name="residentArchive.rsBornDate" format="yyyy-MM-dd"/>
	                  </td>
	                   -->
	                  <td align="center"><s:property value="residentArchive.rsBornDate"/></td>	
	                 <td align="center"><s:property value="residentArchive.phoneNumber"/></td>
	                 <td align="center">
	                  	<s:date name="examDate" format="yyyy-MM-dd"/>
	                  </td>
	                 
	                 <td align="center"><s:property value="doctor.name" /></td>
	                 <td align="center"><s:property value="recorder.name"/></td>
	                  <td align="center">                                
	                  	<s:a action="phyExam_editUI?id=%{id}&rsaId=%{rsaId}">修改</s:a>
	                  	<s:a action="phyExam_delete?id=%{id}" onclick="return confirm('确定要删除吗？')">删除</s:a>                          	
	                  </td>
	              </tr>
	           </s:iterator>  
	        </tbody>
	    </table>
		</div >
	   <!-- 分页 -->
	   <div id="pages">
	   	<s:if test="page==1">
	   		<a href="#">上一页</a>
	   	</s:if>
	   	<s:else>
	   		<s:a action="phyExam_archiveList?page=%{page-1}&rsaId=%{rsaId}">上一页</s:a>
	   		<!--<a href="javascript:toPage(<s:property value='page-1'/>,<s:property value='rsaId'/>)">上一页</a>
	   	--></s:else>
	   
	   <s:iterator begin="1" end="totalPages" var="p">
	   		<s:a action="phyExam_archiveList?page=%{p}&rsaId=%{rsaId}"><s:property value="#p"/></s:a>
	   		<!--<a href="javascript:toPage(<s:property value='#p'/>,<s:property value='rsaId'/>)"><s:property value="#p"/></a>
	   --></s:iterator>
	   
	   <s:if test="page==totalPages">
	   		<a href="#">下一页</a>
	   </s:if>
	   <s:else>
	   	<s:a action="phyExam_archiveList?page=%{page+1}&rsaId=%{rsaId}">下一页</s:a>
	   		<!--<a href="javascript:toPage(<s:property value='page+1'/>,<s:property value='rsaId'/>)">下一页</a>
	   --></s:else>
	   </div>
</div>

</body>
<div style =”color:red” >
    < s:fielderror />
</div >
</html>
