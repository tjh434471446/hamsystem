<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
	<title>血压波形</title>
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

<script type="text/javascript">
	function time_search()
	{
		 var rsaId = "${rsaId}";
		 document.getElementById("form_search").setAttribute("action","bloodPressure_!showWave.action?rsaId="+rsaId); //FORM提交到这个页面
		 document.getElementById("form_search").submit();
		
	}
</script>

<!-- 标题显示 -->
<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/style/images/title_arrow.gif"/> 血压波形
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<!--显示表单内容-->
<div id=MainArea>

    <s:form id="form_search" name="form_search" method="post" target="xueyaGraph"  onsubmit="return false">    	
        
        <div class="ItemBlock_Title1"><!-- 信息说明 --><div class="ItemBlock_Title1">
        	<img border="0" width="4" height="7" src="${pageContext.request.contextPath}/style/blue/images/item_point.gif" /> 血压波形 </div> 
        </div>
       <!--隐藏健康档案id  -->
        <s:hidden name="residentArchive.id" value="%{#residentArchive.id}" />
        
      <div class="content_bloodpre">
		<p>
			<img src="${pageContext.request.contextPath}/style/images/gallery_3.jpg" />
			开始日期：<input id="time_start" name="time_start" type="text" onClick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
			结束日期：<input id="time_end" name="time_end" type="text" onClick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
			<input id="search" name="search" type="button" value="查询"  onclick="time_search()"/>
		</p>
		
		<p>
			<div style="background:#FFFFFF">
				<img src="${pageContext.request.contextPath}/style/images/xueyaleft1.jpg"/>
				<iframe name="xueyaGraph" src="${pageContext.request.contextPath}/bloodPressure_!showWave.action?rsaId=${rsaId}" width="600" height="350" frameborder="0" scrolling="auto"></iframe>
				<img src="${pageContext.request.contextPath}/style/images/xueyaright1.jpg"/>
			</div>
		</p>
		</div>
       
		
       
        
    </s:form>
</div>

<div class="Description">
	说明：<br />
	
</div>

</body>
</html>
