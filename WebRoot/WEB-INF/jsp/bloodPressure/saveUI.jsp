<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
	<title>记录血压</title>
   	<%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
   	<!-- 时间插件 -->
    <!-- <script language="javascript" src="${pageContext.request.contextPath}/script/date.js" charset="utf-8"></script> -->
    <!-- CuFon: Enables smooth pretty custom font rendering. 100% SEO friendly. To disable, remove this section -->
<!-- 	<script type="text/javascript" src="${pageContext.request.contextPath}/script/ct_js/js/jquery.js"></script> -->
<!-- 	<script type="text/javascript" src="${pageContext.request.contextPath}/script/ct_js/js/arial.js"></script> -->
<!-- 	<script type="text/javascript" src="${pageContext.request.contextPath}/script/ct_js/js/cuf_run.js"></script> -->
<!-- 	<script type="text/javascript" src="${pageContext.request.contextPath}/script/ct_js/js/radius.js"></script> -->
<!-- 	<script type="text/javascript" src="${pageContext.request.contextPath}/script/ct_js/js/wannianli.js"></script> -->
	<!-- CuFon ends -->
  <script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/script/ct_js/My97DatePicker/WdatePicker.js"></script>  
    <!--Js时间控件-->
<!-- 	<script src="${pageContext.request.contextPath}/script/ct_js/js/jscal2.js"></script> -->
<!-- 	<script src="${pageContext.request.contextPath}/script/ct_js/js/cn.js" charset="utf-8"></script> -->
<!-- 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/script/ct_js/css/jscal2.css" /> -->
<!-- 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/script/ct_js/css/border-radius.css" /> -->
<!-- 	<link rel="stylesheet" type="text/css" href=".${pageContext.request.contextPath}/script/ct_js/css/steel.css" /> -->
	<!--Js时间控件-->
</head>
<body>

<!-- 标题显示 -->
<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/style/images/title_arrow.gif"/> 记录血压
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<!--显示表单内容-->
<div id=MainArea>

    <s:form action="bloodPressure_%{id == null ? 'add' : 'edit'}">
    	<s:hidden name="id"></s:hidden>
        
        <div class="ItemBlock_Title1"><!-- 信息说明 --><div class="ItemBlock_Title1">
        	<img border="0" width="4" height="7" src="${pageContext.request.contextPath}/style/blue/images/item_point.gif" /> 记录血压 </div> 
        </div>
        
        <!-- 表单内容显示 -->
        	<!--隐藏健康档案id  -->
        <s:hidden name="residentArchive.id" value="%{#residentArchive.id}" />
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">
                    <tr><td>记录时间</td>
                       <td>		
							<input type="text" id="rt" name="rt" readOnly="readonly" onClick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})" > 
								
					   </td>
                    </tr>
                    <tr><td>收缩压</td>
                        <td><s:textfield name="ss" cssClass="InputStyle"/> </td>
                    </tr>
                     <tr><td>舒张压</td>
                        <td><s:textfield name="sz" cssClass="InputStyle"/> </td>
                    </tr>
					
                    <tr><td>备注</td>
                        <td><s:textarea name="remarks" cssClass="TextareaStyle"></s:textarea></td>
                    </tr>
                </table>
<!--                 <script type="text/javascript"> -->
               
<!-- 						   var cal = Calendar.setup({ -->
<!-- 							  onSelect: function(cal) { cal.hide() }, -->
<!-- 							  showTime: true, -->
<!-- 							  minuteStep: 1 -->
<!-- 						  }); -->
<!-- 						  cal.manageFields("recordTime", "recordTime", "%Y-%m-%d %H:%M"); -->
<!-- 						</script> -->
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
	
</div>

</body>
</html>
