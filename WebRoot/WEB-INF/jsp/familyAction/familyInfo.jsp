<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import = "com.uestc.hams.entity.*" %>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'familyInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/script/yang_js/test.js"></script>
	
	

  </head>
  
  
  <body>
  
  <!--  test -->
<!--   <button id="demo" onclick="showTime()">button</button> -->
<!--   <p id="div"></p> -->
  
  
  <div id="Title_bar">
    <div id="Title_bar_Head"> 
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/style/images/title_arrow.gif"/> 家庭管理
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<div class="ItemBlock_Title1"><!-- 信息说明 --><div class="ItemBlock_Title1">
        	<img border="0" width="4" height="7" src="${pageContext.request.contextPath}/style/blue/images/item_point.gif" /> 家庭信息 </div> 
        </div>
        
         <div class="ItemBlockBorder"  >
            <div class="ItemBlock">
                <table cellpadding="3" cellspacing="3" class="mainForm"  width="6000px;"  >
                    <tr ><td width="100">家庭编号</td>
                        <td>
                        ${family.id}
                        </td>
                        <td width="100px">*户主</td>
                        <td>
                       ${family.head.name}</td>
                        <td width="100px">医保卡号 </td>
                        <td> ${family.medicalInsNo}</td>
                    </tr>
                    <tr><td width="100px">医疗证号</td>
                        <td>${family.medicalNo}
						</td>
						<td >联系电话</td>
						<td>${family.phoneNo}</td>
						<td>邮政编码</td>
						<td>${family.postalCode} </td>
                    </tr>
                    <tr>
                    <td>家庭住址 </td>
                    <td>${family.address} </td>
                    <td> 就业人数</td>
                    <td>${family.careerPopu} </td>
                    <td>家庭人数</td>
                    <td>${family.familyPopu } </td>
                    </tr>
                    <tr>
                    <td>经济状况</td>
                    <td>${family.financialSitu} </td>
                    <td> 未成年子女</td>
                    <td>${family.childrenPopu }</td>
                    <td>负担老人</td>
                    <td> ${family.occupiedAged}</td>
                    </tr>
                </table>
            </div>
        </div>
        
        <div class="ItemBlock_Title1"><!-- 信息说明 --><div class="ItemBlock_Title1">
        	<img border="0" width="4" height="7" src="${pageContext.request.contextPath}/style/blue/images/item_point.gif" /> 居住环境 </div> 
        </div>
        
         <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">
                    <tr>
       <td>房屋类型</td><td> </td>
       <td>居住面积（m2）</td><td>${family.lxw }  </td>
       <td>人均面积</td><td>${family.averageLxw } </td>
       </tr>
  <tr>
  <td>家庭位置</td><td >${family.familyLocation }</td>
  <td>治安状况</td><td>${family.security }</td>
  <td>离派出所</td><td>${family.toPolice } </td>
  
  </tr>
  <tr>
   <td>离医疗站(m)</td><td>${family.toHospital }</td>
   <td>离公路(m)</td><td>${family.toRoad } </td>
   <td>离商店(m)</td><td>${family.toShop } </td>
   </tr>
   
   <tr>
  <td>离学校(m)</td><td>${family.toSchool }</td>
  <td>通 &nbsp;&nbsp;&nbsp;风</td><td>${family.wentilate }</td>
  <td>湿&nbsp;&nbsp;&nbsp;度</td><td>${family.humidity } </td>
  </tr>
  
  <tr>
  <td>保 &nbsp;&nbsp;&nbsp;暖</td><td>${family.warmth }</td>
  <td>采&nbsp;&nbsp;&nbsp;光</td><td>${family.brightness }</td>
  <td>卫&nbsp;&nbsp;&nbsp;生</td><td>${family.sanitation }</td>
                </table>
            </div>
        </div>	
        
        <div class="ItemBlock_Title1"><!-- 信息说明 --><div class="ItemBlock_Title1">
        	<img border="0" width="4" height="7" src="${pageContext.request.contextPath}/style/blue/images/item_point.gif" /> 卫生设施 </div> 
     </div>
       
    <div class="ItemBlockBorder">
       <div class="ItemBlock">
           <table cellpadding="0" cellspacing="0" class="mainForm">
           <tr>
           <td>厨&nbsp;&nbsp;&nbsp;房</td><td>${family.kitchenMethod }</td>
           <td>使用燃料</td><td>${family.kitchenExhaust }</td> 
           <td>饮水来源</td><td>${family.dw }</td>
           </tr>
           <tr>
           <td>垃圾处理</td><td>${family.rubbishDispose }</td>
           <td>禽畜栏</td><td>${family.animalsField }</td> 
           <td>厕所类型</td><td>${family.toilet }</td>
           </tr> 
            
           </table>
        </div>
     </div> 
     
       <div class="ItemBlock_Title1"><!-- 信息说明 --><div class="ItemBlock_Title1">
        	<img border="0" width="4" height="7" src="${pageContext.request.contextPath}/style/blue/images/item_point.gif" /></div> 
     </div>
       
    <div class="ItemBlockBorder">
       <div class="ItemBlock">
           <table cellpadding="0" cellspacing="0" class="mainForm">
           <tr>
           <td>责任医生</td><td>${family.doctor.name }
                        	</td>
           <td>建档人</td><td>${family.register.name }</td> 
           <td>建档日期</td><td>${family.registerDate }   </td>
           </tr>
           </table>
        </div>
     </div> 
        <div class="ItemBlock_Title1"><!-- 信息说明 --><div class="ItemBlock_Title1">
        	<img border="0" width="4" height="7" src="${pageContext.request.contextPath}/style/blue/images/item_point.gif" />相关操作</div> 
        </div>
        
         <div class="ItemBlockBorder">
            <div class="ItemBlock">
            <div id="TableTail_inside">
            <s:a  action="family_delete?id=%{id}" onclick="return confirm('删除家庭需要先删除家庭成员，确定要删除吗？')">删除家庭</s:a>
                     <s:a action="family_editUI?id=%{id}">修改家庭基本信息</s:a> 
            <s:a action="family_memberAddUI?id=%{id}">添加成员</s:a>
            </div>
            </div>
            </div>
            
            
        

    注意： 删除家庭之前需要清空用户
    <hr>
    
    <div class="ItemBlock_Title1"><!-- 信息说明 --><div class="ItemBlock_Title1">
        	<img border="0" width="4" height="7" src="${pageContext.request.contextPath}/style/blue/images/item_point.gif" /> 家庭成员 </div> 
        </div>
    
    
     <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">
     <tr>
     <td width="100">用户编号</td>
     <td width="100">用户名</td>
     <td width="100">成员姓名</td>
     <th width="100">与户主关系</th>
     <th width="200">相关操作 </th>
     </tr> <s:iterator value="#family.member">
            <tr class="TableDetail1 template" id="tabtr" onclick="do_onclick(this)"
             >
                <td>${id}</td>
                <td>${name}&nbsp;</td>
                <td>${loginName}</td>
                <td>${relationShip}</td>
                <td>
                <s:a action="family_memberDelete?userId=%{id}&famId=%{family.id}"  onclick="return confirm('确定要删除吗？')">删除成员</s:a>
               ${id} &nbsp;${family.id} </td>
            </tr>
        </s:iterator>  </table>
        </div></div>
    
  </body>
</html>
