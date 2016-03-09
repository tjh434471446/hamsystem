<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.uestc.hams.entity.*" %>
<%@ page import="com.uestc.hams.view.action.*" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'saveUI.jsp' starting page</title>
    
    <%
	String path = request.getContextPath();
%>
 <%@ include file="/WEB-INF/jsp/public/commons.jspf" %> 

<script type="text/javascript" src="<%=path %>/script/yang_js/jquery.js"></script>
   <script type="text/javascript" src="<%=path %>/script/yang_js/family_validate.js"></script>
   <script type="text/javascript" src= "<%=path %>/script/yang_js/json.js"></script>
  <script type="text/javascript" language="javascript">
  
  
  /*
   * 校验是否为空
   */
  function validate_required(field, altertxt){
  	
  	with(field){
  		if(value==null || value=="" || value== undefined){
  			alert(altertxt);
  			return false;
  		}
  		else{
  			return true;
  		}
  	}
  	
  }
  /*
   * 校验是否符合规范
   */
  function validate_phoneNo(field){
  	
  	with(field){
  		if(isNaN(value)){
  			alert("电话号码只能为数字");
  			
  			return false;
  		}
  		if(value.length()>11){
  			alert("电话号码长度不能超过11");
  			return false;
  		}
  		else{
  			return true;
  		}
  	}
  }



  
    var checkmin = true;
    function checkMedicalInsNo(field) {  
//   	  alert("校验开始"+document.getElementById("medicalInsNo").value);
  	  if(!checkIsNumber(field)){
  		
  		  document.getElementById("medicalInsNoFont").innerHTML = "只能为数字";
  		  checkmin = false;
  	  } 
  	  else{
  		document.getElementById("medicalInsNoFont").innerHTML ="";
  		  checkmin = true;
  	  }
    }
    
    var checkmn = true;
    function checkMedicalNo(field) {
  	  if(!checkIsNumber(field)){
  		
  		  document.getElementById("medicalNoFont").innerHTML = "只能为数字";
  		  checkmn = false;
  	  }
  	  else{
  		document.getElementById("medicalNoFont").innerHTML = "";
  		  checkmn = true;
  	  }
  	  
    }
    
    var checkphoneNo = true;
    function checkphone(field) {
  	  if(!checkIsNumber(field)){
  		 
  		  document.getElementById("phoneNoFont").innerHTML = "只能为数字";
  		  checkphoneNo = false;
  	  }
  	  else{
  		document.getElementById("phoneNoFont").innerHTML = "";
  		  checkphoneNo = true;
  	  }
  	  
    }
    
    var checkPc = true;
    function checkPostalCode(field){
  	  if(!checkIsNumber(field)){
  		
  		  document.getElementById("postalCodeFont").innerHTML = "只能为数字";
  		  checkPc = false;
  	  }
  	  else{
  		document.getElementById("postalCodeFont").innerHTML = "";
  		  checkPc = true;
  	  }
    }
    
    var checkcp =true;
    
    function checkcareerPopu(field){
    	if(!checkIsNumber(field)){
    		
    		document.getElementById("careerPopuFont").innerHTML = "只能为数字";
    		checkcp = false;
    	}
    	else{
    		document.getElementById("careerPopuFont").innerHTML = "";
    		checkcp = true;
    	}
    }
    
    var checkfp = true;
    function checkfamilyPopu(field){
    	if(!checkIsNumber(field)){
    		
    	document.getElementById("familyPopuFont").innerHTML = "只能为数字";
    	checkfp = false;
    	}
    	else{
    		document.getElementById("familyPopuFont").innerHTML = "";
    		checkfp = true;
    	}
    }
    
    var checkci = true;
    function checkchildrenInt(field){
    	if(!checkIsNumber(field)){
    		
    		document.getElementById("childrenIntFont").innerHTML = "只能为数字";
    		checkci = false;
    	}
    	else{
    		document.getElementById("childrenIntFont").innerHTML = "";
    		checkci = true;
    	}
    }
    
    var checkoa = true;
    function checkoccupiedAged(field){
    	if(!checkIsNumber(field)){
    		
    		document.getElementById("occupiedAgedFont").innerHTML = "只能为数字";
    		checkoa = false;
    	}
    	else{
    		document.getElementById("occupiedAgedFont").innerHTML = "";
    		checkoa = true;
    	}
    }
    
    function checkIsNumber(field){
  	  with(field){
  	  var num = value;
  	  
  	  if(isNaN(num)){
  		  return false;
  	  }
  	  }
  	  return true;
    }
    
    
    function validate_family_form(thisform){
      	
      	var phoneNo = document.getElementsByName("phoneNo");
      	var userId = document.getElementsByName("userId");
      	var address = document.getElementsByName("address");
      	
      	with(thisform){
      		
      		if(!(checkci && checkcp && checkfp && checkmin && checkmn && checkoa && checkPc && checkphoneNo)){
      			{return false;}
      		}


// 	if(!checkci ){
// 	{document.getElementsByName("childrenInt").focus() ;return false;}
// }
// 	else if(!checkcp){
// 	{document.getElementsByName("careerPopu").focus();return false;}
// }
// 	else if(!checkfp){
// 	{document.getElementsByName("familyPopu").focus();return false;}
// }
// 	else if(!checkmin){
// 	{document.getElementsByName("medicalInsNo").focus(); return false;}
// }
// 	else if(!checkmn){
// 	{document.getElementsByName("medicalNo").focus(); return false;}
// }
// 	else if(!checkoa){
// 	{document.getElementsByName("occupiedAged").focus(); return false;}
// }
// 	else if(!checkPc){
// 	{document.getElementsByName("postalCode").focus(); return false;}
// }
// 	else if(!checkphoneNo){
// 	{document.getElementsByName("phoneNo").focus(); return false;}
// }

      		if(validate_required(userId,"户主不能为空")==false){
      			{userId.focus();return false;}
      		}
      		if(validate_required(phoneNo, "联系电话不能为空")==false){
      			{phoneNo.focus();return false;}
      		}
      		
      		if(validate_required(address,"家庭住址不能为空")==false){
      			{address.focus();return false;}
      		}
      		
      		if(validate_phoneNo(phoneNo)==false){
      			{phoneNo.focus();return false;}
      		}
      		
      	}
      }

    

  
  function back(){
  
  var form=document.forms[0];
  form.action="family_list.action";
  form.submit();
  
  }
  
  function view(index)
  { 
var obj1 = document.getElementById('div1');	
var obj2 = document.getElementById('div2');	
var obj3 = document.getElementById('div3');
obj1.style.display='none';
obj2.style.display='none';
obj3.style.display='none';
var obj  = document.getElementById('div'+index);
   obj.style.display = 'block'; 
   
  }
  
  var curtab = null; 
  function do_onclick(tab){  
   if(curtab != null) curtab.style.backgroundColor = "white";   
    tab.style.backgroundColor = "grey";  
     curtab = tab; 
     
   }
  
  $(document).ready(function(){
	  
	  
	    $("#headId").blur(function(){
	    	
	    	var params = $("#headId").serialize();
	    	
	    	$.ajax({
	    		url:"json_isRaExist.action",
				type:"POST",
				data:params,
				dataType:"json",
				
				success:function(data){
					
					$("#rsMessage").html("");
// 					alert(data.code+"");
					if(data.code == 1){
						$("#rsMessage").append("<font color = 'green'>居民档案可用</font>");
					}else if(data.code == 2){
						$("#rsMessage").append("<font color='red'>居民已有家庭</font>");
						/* $("#headId").focus(); */
					}else {
						$("#rsMessage").append("<font color = 'red'>居民档案id不存在</font>");
					}
						
				}
	    		
	    	});
	    	
	    });
		
		
		$("#regRe").click(function(){
			//把表单的数据进行序列化
			var params = $("#addForm").serialize();
			//使用jQuery中的$.ajax({});Ajax方法
			$.ajax({
				url:"json_gainMember.action",
				type:"POST",
				data:params,
				dataType:"json",
				success:function(data){
					
					alert("success");
					//清空显示层中的数据
				$("#TableData").html("");
				//为显示层添加获取到的数据
				//获取对象的数据用data.userInfo.属性
				
// 					$("#message").append("<div><font color='red'>用户ID："+data.resident.id+"</font></div>")
// 					     .append("<div><font color='red'>用户名："+data.resident.name+"</font></div>")
// 					     .append("<div><font color='red'>密码："+data.resident.loginName+"</font></div>");
				$("#message").html("");
				
				
				$.each(data.memberList,function(i,value){
					
					$("#TableData").append("<tr><td>"+value.id+"</td>"+"<td>"+value.name+"</td>"
							+"<td>"+value.rsId+"</td>"+"<td>"+value.sex+"</td>"+
							"<td>"+value.age+"</td>"+"<td>"+value.phoneNumber+"</td>"
							+"<td>"+"   "+"</td></tr>");
					
// 					$("#message").append("<div><font color='red'>用户ID："+value.name+"</font></div>")
// 				     .append("<div><font color='red'>用户名："+value.loginName+"</font></div>");
				});
				
				}
			});
		});
		
		});
  
  


  
   
  
  </script>
  
  </head>

  <body>
 
  
  <div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/style/images/title_arrow.gif"/> 家庭信息
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<form name="bt2">
<input type="button" onClick="back()" name="b1" value="返回"/>
<input type="button" onClick="view('1')" id="bt1" value="基本信息" />
<input type="button" onClick="view('2')" id="bt2" value="家庭成员"/>
<input type="button" onClick="view('3')" id="bt3" value="家庭主要问题"/>
</form>


<div id="div2" style="display: none;">

 <div class="ItemBlock_Title1"><!-- 信息说明 --><div class="ItemBlock_Title1">
        	<img border="0" width="4" height="7" src="${pageContext.request.contextPath}/style/blue/images/item_point.gif" />新增成员</div> 
        </div>

 <div class="ItemBlockBorder">
       <div class="ItemBlock">
       <p>成员编号以后将由身份证号代替</p>
    
        
    <form id="addForm">
    	用户ID：<input name="resident.id" type="text"/><br/>
    	<input id="regRe" type="button" value="新增"/>
    </form>
    
    <div id="message"></div>
             
        </div>
     </div> 
     <div class="ItemBlock_Title1"><!-- 信息说明 --><div class="ItemBlock_Title1">
        	<img border="0" width="4" height="7" src="${pageContext.request.contextPath}/style/blue/images/item_point.gif" />即将添加的成员列表</div> 
        </div>
        
      <div class="ItemBlockBorder">
       <div class="ItemBlock">
       
            <table cellspacing="0" cellpadding="0" class="TableStyle" border="1">
       
        <!-- 表头-->
        <thead>
            <tr align=center valign=middle id=TableTitle>
                <td width="200">用户档案编号</td>
                <td width="100">用户姓名</td>
                <td width="200">身份证号</td>
                <td width="100">性别</td>
                <td width="100">年龄</td>
                <td width="100">联系电话</td>
                <td width="200">相关操作</td>
            </tr>
        </thead>
        
        <!--显示数据列表-->
        <tbody id="TableData" class="dataContainer" >
        
        
<!--         <s:iterator id="memberList" value="#memberList" status="pml"> -->
<!--             <tr class="TableDetail1 template" id="#pml.index" onclick="do_onclick(this)"  -->
<!--              > -->
             
<!--                 <td>${id}</td> -->
<!--                 <td>${name}&nbsp;</td> -->
<!--                 <td>${rsId}</td> -->
<!--                  <td>${sex }</td> -->
<!--                  <td>${age}</td> -->
<!--                 <td>${phoneNumber}</td> -->
<!--                 <td>&nbsp;&nbsp;</td> -->
<!--             </tr> -->
<!--         </s:iterator>  -->
            
        </tbody>
    </table>
        </div>
     </div>   

</div>

<s:form action="family_%{ id == null ? 'add' : 'edit'}" onsubmit="return validate_family_form(this)">
<!--显示表单内容-->
<div id="div1" style="display: block;">
<div id=MainArea>

    
    	<s:hidden id="id" name="id" value="%{id}"></s:hidden> 
        
        <div class="ItemBlock_Title1"><!-- 信息说明 --><div class="ItemBlock_Title1">
        	<img border="0" width="4" height="7" src="${pageContext.request.contextPath}/style/blue/images/item_point.gif" />家庭基本信息</div> 
        </div>
        
        <!-- 表单内容显示 -->
        <div class="ItemBlockBorder" style="border-bottom-width: 0px">
            <div class="ItemBlock"  >
                <table cellpadding="0" cellspacing="0" class="mainForm"  width="6000px;" >
                    <tr ><td width="100px">家庭编号</td>
                        <td>
                        系统生成
                        </td>
                        <td width="100px"><font color="red">*</font>户主</td>
                        <td>
                        <s:textfield name="userId" id="headId" /><font id="rsMessage"></font></td>
                        <td width="100px">医保卡号 </td>
                        <td> <s:textfield name="medicalInsNo" id="medicalInsNo" onblur="checkMedicalInsNo(this);" /><font id="medicalInsNoFont" color="red"></font></td>
                    </tr>
                    <tr><td width="100px">医疗证号</td>
                        <td><s:textfield name="medicalNo" id="medicalNo" onblur="checkMedicalNo(this)"/> <font id="medicalNoFont" color="red"></font>
						</td>
						<td ><font color="red">*</font>联系电话</td>
						<td><s:textfield name="phoneNo" id="phoneNo" onblur="checkphone(this)" /><font id="phoneNoFont" color="red"></font> </td>
						<td>邮政编码</td>
						<td><s:textfield name="postalCode" onblur="checkPostalCode(this)" /><font id="postalCodeFont" color = "red"></font> </td>
                    </tr>
                    <tr>
                    <td><font color="red">*</font>家庭住址 </td>
                    <td><s:textfield name="address"/> </td>
                    <td> 就业人数</td>
                    <td><s:textfield name="careerPopu" onblur="checkcareerPopu(this)"/><font id="careerPopuFont" color="red"></font> </td>
                    <td>家庭人数</td>
                    <td><s:textfield name="familyPopu" onblur="checkfamilyPopu(this)" /><font id="familyPopuFont" color="red"  ></font> </td>
                    </tr>
                    <tr>
                    <td>经济状况</td>
                    <td><s:select name="financialSitu" list="{'好','较好','一般','贫困'}"  headerKey="null" headerValue="===请选择==="  />  </td>
                    <td> 未成年子女</td>
                    <td><s:textfield name="childrenInt" onblur="checkchildrenInt(this)" /><font id="childrenIntFont" color="red"></font> </td>
                    <td>负担老人</td>
                    <td><s:textfield name="occupiedAged" onblur="checkoccupiedAged(this)" /><font id="occupiedAgedFont" color="red" ></font>  </td>
                    </tr>
                </table>
            </div>
        </div>
        
		<div class="ItemBlock_Title1"><!-- 信息说明 --><div class="ItemBlock_Title1">
        	<img border="0" width="4" height="7" src="${pageContext.request.contextPath}/style/blue/images/item_point.gif" /> 居住环境 </div> 
        </div>
        
        <!-- 表单内容显示 -->
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">
                    <tr>
       <td>房屋类型</td><td><s:select name="housePro" list="{'砖瓦平房','砖瓦楼房','土屋','茅屋','木屋' }"  headerKey="null" headerValue="===请选择===" /> </td>
       <td>居住面积（m2）</td><td><s:textfield name="lxw"></s:textfield>   </td>
       <td>人均面积</td><td><s:textfield name="averageLxw"></s:textfield>  </td>
       </tr>
  <tr>
  <td>家庭位置</td><td ><s:select name="familyLocation" list="{'集居','孤居' }"  headerKey="null" headerValue="===请选择===" /> </td>
  <td>治安状况</td><td><s:select name="security" list="{'好','一般','差' }"  headerKey="null" headerValue="===请选择==="  /> </td>
  <td>离派出所</td><td><s:textfield name="toPolice"/> </td>
  
  </tr>
  <tr>
   <td>离医疗站(m)</td><td><s:textfield  name="toHospital" /> </td>
   <td>离公路(m)</td><td><s:textfield name="toRoad"/> </td>
   <td>离商店(m)</td><td><s:textfield name="toShop"/> </td>
   </tr>
   
   <tr>
  <td>离学校(m)</td><td><s:textfield name="toSchool"  ></s:textfield></td>
  <td>通 &nbsp;&nbsp;&nbsp;风</td><td><s:select list="{'好','一般','差' }" headerKey="null" headerValue="===请选择===" name="wentilate"   /> </td>
  <td>湿&nbsp;&nbsp;&nbsp;度</td><td><s:select list="{'潮湿','干燥','一般' }" headerKey="null" headerValue="===请选择==="  name="humidity"    /> </td>
  </tr>
  
  <tr>
  <td>保 &nbsp;&nbsp;&nbsp;暖</td><td><s:select list="{'好','一般','差' }" headerKey="null" headerValue="===请选择===" name="warmth"   /></td>
  <td>采&nbsp;&nbsp;&nbsp;光</td><td><s:select list="{'好','一般','差' }" headerKey="null" headerValue="===请选择===" name="brightness"   /></td>
  <td>卫&nbsp;&nbsp;&nbsp;生</td><td><s:select list="{'清洁','一般','较脏','差' }" headerKey="null" headerValue="===请选择===" name="sanitation"   /></td>
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
           <td>厨&nbsp;&nbsp;&nbsp;房</td><td><s:select list="{'合用','独用','无' }" headerKey="null" headerValue="===请选择===" name="kitchenMethod"   /></td>
           <td>使用燃料</td><td><s:select list="{'液化气','煤','天然气','沼气','柴火','其他' }" name="kitchenExhaust" headerKey="null" headerValue="===请选择==="  /></td> 
           <td>饮水来源</td><td><s:select list="{'自来水','经净化的水','井水','河湖水','塘水','纯水或桶装水','其他' }" headerKey="null" headerValue="===请选择===" name="dw"    /></td>
           </tr>
           <tr>
           <td>垃圾处理</td><td><s:select list="{'自行处理','垃圾箱','其他' }" headerKey="null" headerValue="===请选择===" name="rubbishDispose"  /></td>
           <td>禽畜栏</td><td><s:select list="{'单设','室内','室外' }" headerKey="null" headerValue="===请选择==="  name="animalsField"   /></td> 
           <td>厕所类型</td><td><s:select list="{'家用卫生厕所：三格式粪池式','家用卫生厕所；双翁漏斗式','家用卫生厕所；三联沼气池式','家用卫生厕所:粪尿分集式','家用卫生厕所；完整下水道水冲式'
           ,'家用卫生厕所：双坑交替式','非卫生厕所：一格或两格粪池式','非卫生厕所：马桶','非卫生厕所：露天粪坑','非卫生厕所：简易棚厕' }"
           name="toilet"   headerKey="null" headerValue="===请选择===" /></td>
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
           <td>责任医生</td><td><s:select name="doctorId" cssClass="SelectStyle"
                        		list="#doctorList" listKey="id" listValue="name"  
                        		value="%{doctor.name}"
                        		headerKey="" headerValue="===请选择===="
                        	/>
                        	</td>
           <td>建档人</td><td><s:textfield  value="%{user.name}"  readonly="true" /></td> 
           <td>建档日期</td><td><s:date name="#registerDate" format="yyyy-MM-dd" />   </td>
           </tr>
           </table>
        </div>
     </div> 
       
		
       
</div>


</div>



<div id="div3" style="display: none;">

 
</div>



 <!-- 表单操作 -->
 <div class="ItemBlock_Title1"><!-- 信息说明 --><div class="ItemBlock_Title1">
        </div>
        </div>
 <div class="ItemBlockBorder">
            <div class="ItemBlock">
            <center>
        <s:submit value="保存"  ></s:submit>
  <s:reset value="清空"></s:reset>
  </center> </div></div>
    </s:form>

 

  
  </body>
</html>
