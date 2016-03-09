<%@page pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>健康体检表</title>
    <link rel="stylesheet" href="css/default.css" />
    <link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css" />
	<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen" />
    <script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="jscal2/css/jscal2.css" /> 
   <link rel="stylesheet" type="text/css" href="jscal2/css/border-radius.css" /> 
   <link rel="stylesheet" type="text/css" href="jscal2/css/gold/gold.css" /> 
   <script type="text/javascript" src="jscal2/jscal2.js"></script> 
   <script type="text/javascript" src="jscal2/lang/en.js"></script>
   <script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/script/ct_js/My97DatePicker/WdatePicker.js"></script>  
   <script src="js/health.js" type="text/javascript"></script>
   <script type="text/javascript">
		/*动态添加行*/
		function addHospitalRow(){
			var addTable = document.getElementById("hospitalTable");
			var hos_row_index = addTable.rows.length;
			alert(hos_row_index);	
			var hos_num = hos_row_index - 2;
			alert(hos_num);
 			
// 			document.getElementById("hos_row_index").value=hos_row_index;
// 			alert(document.getElementById("hos_row_index").value);
			//添加一行
			var newTr = addTable.insertRow(hos_row_index);
			var newTd0 = newTr.insertCell(0);
			var newTd1 = newTr.insertCell(1);
			var newTd2 = newTr.insertCell(2);
			var newTd3 = newTr.insertCell(3);
			var newTd4 = newTr.insertCell(4);
			//添加列
// 			newTd0.innerHTML = "<s:textfield name='hospiList["+hos_num+"].inHospital' readOnly='readonly' onClick='WdatePicker({skin:\"whyGreen\",dateFmt:\"yyyy-MM-dd\"})' />";
// 			newTd1.innerHTML = "<s:textfield name='hospiList["+hos_num+"].outHospital' readOnly='readonly' onClick='WdatePicker({skin:\"whyGreen\",dateFmt:\"yyyy-MM-dd\"})' />";
// 			newTd2.innerHTML = "<s:textfield name='hospiList["+hos_num+"].inHosReason' />";
// 			newTd3.innerHTML = "<s:textfield name='hospiList["+hos_num+"].hospitalName' />";
// 			newTd4.innerHTML = "<s:textfield name= 'hospiList["+hos_num+"].recordNumber'/>";

			newTd0.innerHTML = "<input type='text' name='hospiList["+hos_num+"].inHospital' readOnly='readonly' onClick='WdatePicker({skin:\"whyGreen\",dateFmt:\"yyyy-MM-dd\"})' />";
			newTd1.innerHTML = "<input type='text' name='hospiList["+hos_num+"].outHospital' readOnly='readonly' onClick='WdatePicker({skin:\"whyGreen\",dateFmt:\"yyyy-MM-dd\"})' />";
			newTd2.innerHTML = "<input type='text' name='hospiList["+hos_num+"].inHosReason' />";
			newTd3.innerHTML = "<input type='text' name='hospiList["+hos_num+"].hospitalName' />";
			newTd4.innerHTML = "<input type='text' name='hospiList["+hos_num+"].recordNumber'/>";
			
		}
		/*动态添加家庭病床史*/
		function addfamDisRow(){
			var addFamTable = document.getElementById("famDisTable");
			var fam_dis_row_index = addFamTable.rows.length;
			alert(fam_dis_row_index);	
			var fam_dis_num = fam_dis_row_index - 2;
			alert(fam_dis_num); 			
			//添加一行
			var newTr = addFamTable.insertRow(fam_dis_row_index);
			var newTd0 = newTr.insertCell(0);
			var newTd1 = newTr.insertCell(1);
			var newTd2 = newTr.insertCell(2);
			var newTd3 = newTr.insertCell(3);
			var newTd4 = newTr.insertCell(4);
			//添加列
			newTd0.innerHTML = "<input type='text' name='famDisList["+fam_dis_num+"].buildBedDate' readOnly='readonly' onClick='WdatePicker({skin:\"whyGreen\",dateFmt:\"yyyy-MM-dd\"})' />";
			newTd1.innerHTML = "<input type='text' name='famDisList["+fam_dis_num+"].removeBedDate' readOnly='readonly' onClick='WdatePicker({skin:\"whyGreen\",dateFmt:\"yyyy-MM-dd\"})' />";
			newTd2.innerHTML = "<input type='text' name='famDisList["+fam_dis_num+"].famDisReason' />";
			newTd3.innerHTML = "<input type='text' name='famDisList["+fam_dis_num+"].famHospitalName' />";
			newTd4.innerHTML = "<input type='text' name='famDisList["+fam_dis_num+"].famRecordNumber'/>";
			
		}
	
	   function addMedRow(){
			var addMedTable = document.getElementById("medTable");
			var med_row_index = addMedTable.rows.length;
			alert(med_row_index);	
			var med_num = med_row_index - 2;
			alert(med_num); 			
			//添加一行
			var newTr = addMedTable.insertRow(med_row_index);
			var newTd0 = newTr.insertCell(0);
			var newTd1 = newTr.insertCell(1);
			var newTd2 = newTr.insertCell(2);
			var newTd3 = newTr.insertCell(3);
			var newTd4 = newTr.insertCell(4);
			//添加列
			newTd0.innerHTML = "<input type='text' name='medList["+med_num+"].drugName'  />";
			newTd1.innerHTML = "<input type='text' name='medList["+med_num+"].useage'  />";
			newTd2.innerHTML = "<input type='text' name='medList["+med_num+"].dosage' />";
			newTd3.innerHTML = "<input type='text' name='medList["+med_num+"].takeMedTime' readOnly='readonly' onClick='WdatePicker({skin:\"whyGreen\",dateFmt:\"yyyy-MM-dd\"})' />";
			newTd4.innerHTML = "<select name='medList["+med_num+"].compliance'><option value=0>规律</option><option value=1>间断</option><option value=2>不服药</option></select>";
			
		}
	</script>
   
	
</head>

<body>
<!--信息表的头部-->
	<!-- 根据action的addUI方法传过来的健康档案对象显示相应的信息 -->
<div class="message-head">
<span>编号：<s:property value="#residentArchive.rsArchiveId"/></span><span>姓名：<s:property value="#residentArchive.name"/></span><span>性别：<s:property value="#residentArchive.gender"/></span><span>出生日期：<s:property value="#residentArchive.rsBornDate"/></span>
</div>
<div class="container">

<!--表格-->
<s:form id="addPhyExamForm" action="phyExam_edit" method="post" namespace="/">
<!-- 计数 -->
<%-- <s:hidden type="hidden" id="hos_row_index" name="hos_row_index" value="1"></s:hidden> --%>
<s:hidden id="id" name="id"/>
<s:hidden name="rsaId" id="rsaId"/>
<s:hidden name="residentArchive.id" value="%{#residentArchive.id}" />
<div class="examination">
<span class="respon">责任医生：
	<!-- action传过来的医生的集合doctors作为医生的下拉选项 -->
	<s:select name="doctor.id" list="doctors" listKey="id" listValue="name" id="doctor"></s:select>
</span>

<span class="writer">录入员：
	<!-- action传过来的录入员的集合recorders作为录入员的下拉选项 -->
	<s:select name="recorder.id" list="recorders" listKey="id" listValue="name" id="recorder"></s:select>
</span>

</div>

<table class="table health-table table-bordered">
<thead>
<tr>
  <td colspan="3" class="tbhead">健康体检表</td>
</tr>
</thead>
<tbody>
<tr>
  <td colspan="3" class="symptom">症状：
 <s:checkboxlist name="symptom" list="#{0:'无症状',1:'头痛',2:'头晕',3:'心悸',
4:'胸闷',5:'胸痛',6:'慢性咳嗽',7:'咳痰',8:'呼吸困难',9:'多饮',10:'多尿',11:'体重下降',12:'乏力',
13:'关节肿痛',14:'视力模糊',15:'手脚麻木',16:'尿急',17:'尿痛',18:'便秘',19:'腹泻',20:'恶心呕吐',21:'眼花',
22:'耳鸣',23:'乳房胀痛',24:'其他'}" listKey="key" listValue="value" value="%{symptom}" theme="simple">
 </s:checkboxlist>
 <s:hidden name="symptom1"/>
 <s:textfield name="symptom2"  cssClass="otherh"/><br /> 
  </td>
</tr>

<tr>
  <td><div class="pdl1">体温：</div><div class="pdr1"><s:textfield name="temper" />℃</div></td>
  <td><div class="pdl1">脉率：</div><div class="pdr1"><s:textfield name="pulseRate" />次/分钟</div></td>
  <td><div class="pdl1">呼吸频率：</div><div class="pdr1"><s:textfield name="breathe" />次/分钟</div></td>
</tr> 

<tr>
  <td rowspan="2"><div class="pdl1">血压：左侧</div><div class="pdr1"><s:textfield name="leftBpss" />/<s:textfield name="leftBpsz" />mm/Hg</div><br /><br/>
  <div class="pdl1">右侧</div><div class="pdr1"><s:textfield name="rightBpss" />/<s:textfield name="rightBpsz" />mm/Hg</div></td>
  <td><div class="pdl1">身高：</div><div class="pdr1"><s:textfield name="height" />cm</div></td>
  <td><div class="pdl1">体重：</div><div class="pdr1"><s:textfield name="weight" />kg</div></td>
</tr>

<tr>
  <td><div class="pdl1">腰围：</div><div class="pdr1"><s:textfield name="waist" />cm</div></td>
  <td><div class="pdl1">体质指数(BMI)：</div><div class="pdr1"><s:textfield name="BMI" />Kg/m2</div></td>
</tr>

<tr>
  <td colspan="3" class="older">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
老年人健康状态：
  <s:radio name="elderHealth" list="#{0:'满意',1:'基本满意',2:'说不清楚',3:'不太满意',4:'不满意'}" value="%{elderHealth}"></s:radio>
  </td>
</tr>

<tr>
  <td colspan="3" class="older">老年人生活自理能力：
  <s:radio name="elderSelfHelp" list="#{0:'可自理(0~3分)',1:'轻度依赖(4~8分)',2:'中度依赖(9~18分)',3:'不能自理(≥19)'}" value="%{elderSelfHelp}"></s:radio>
  </td>
</tr>

<tr>
  <td colspan="3" class="older">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
老年人认知功能：
  <s:radio name="elderPerceive1" list="#{0:'初筛阴性',1:'初筛阳性'}" value="elderPerceive1" cssClass="disright"></s:radio>
  <span class="discover">简易智力状态检查，总分<s:textfield name="elderPerceive2" /></span>
  </td>
</tr>
    
<tr>
  <td colspan="3" class="older">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
老年人情感状态：
  <s:radio name="elderEmotion1" list="#{0:'初筛阴性',1:'初筛阳性'}" value="elderEmotion1" cssClass="disright1"></s:radio>
  <span class="discover1">老年人抑郁评分检查，总分<s:textfield name="elderEmotion2" /></span>
  </td>
</tr>

<tr>
  <td><div class="pdl1">锻炼频率：</div><div class="pdr1">
  <s:radio name="exerFre" list="#{0:'每天',1:'每周一次以上',2:'偶尔',3:'不锻炼'}" value="%{exerFre}"></s:radio>
	</div>
  </td>
  <td><div class="pdl1">每次锻炼时间：</div><div class="pdr1"><s:textfield name="exerTime" />分钟</div></td>
  <td><div class="pdl1">坚持锻炼时间：</div><div class="pdr1"><s:textfield name="insTime" />年</div></td>
</tr>

<tr>
  <td><div class="pdl1">锻炼方式：</div><div class="pdr1"><s:textfield name="exerWay" /></div></td>
  <td colspan="2"><div class="pdl1">饮食习惯：</div>
  <s:checkboxlist name="dietList" list="#{0:'荤素均衡',1:'荤食为主',2:'素食为主',3:'嗜盐',4:'嗜油',5:'嗜糖'}" 
  listKey="key" listValue="value" value="%{dietList}">
  </s:checkboxlist>
  </td>
</tr>

<tr>
  <td><div class="pdl1">吸烟情况：</div><div class="pdr1">
  <s:radio name="smoke" list="#{0:'从不吸烟',1:'已戒烟',2:'吸烟'}" value="%{smoke}"></s:radio>
  </div>
  </td>
  <td><div class="pdl1">日吸烟量：</div><div class="pdr1"><s:textfield name="smokeDay" />支</div></td>
  <td><div class="pdl1">开始吸烟年龄：</div><div class="pdr1"><s:textfield name="smokeStart" />岁</div></td>
</tr>

<tr>
  <td><div class="pdl1">戒烟年龄：</div><div class="pdr1"><s:textfield name="smokeEnd" />岁</div></td>
  <td><div class="pdl1">饮酒频率：</div><div class="pdr1">
  <s:radio name="drinkFre" list="#{0:'从不',1:'偶尔',2:'经常',3:'每天'}" value="%{drinkFre}"></s:radio>
  </div>
  </td>
  <td><div class="pdl1">日饮酒量：平均</div><div class="pdr1"><s:textfield name="drinkDay" />两</div></td>
</tr>

<tr>
  <td><div class="pdl1">是否戒酒：</div>
  <s:radio name="abstinence1" list="#{0:'未戒酒',1:'已戒酒'}" value="%{abstinence1}" cssClass="disright2"></s:radio><br />
  <span class="discover2">戒酒年龄：<s:textfield name="abstinence2" />岁
  </span>
  </td>
  <td><div class="pdl1">开始饮酒年龄:</div><div class="pdr1"><s:textfield name="abstinAge" />岁</div></td>
  <td>近一年内是否曾醉酒:
  <s:radio name="temulence" list="#{0:'是',1:'否'}" value="%{temulence}"></s:radio>
  </td>
</tr>

<tr>
  <td colspan="2"><div class="pdl1">饮酒种类:</div>
  <s:checkboxlist name="drinkTypeList" list="#{0:'白酒',1:'啤酒',2:'红酒',3:'黄酒',4:'其他'}" 
  listKey="key" listValue="value" value="%{drinkTypeList}">
  </s:checkboxlist>
  <span class="otcho"><s:textfield name="drinkType2" /></span>
  </td>
<td></td>
</tr>

<tr>
  <td><div class="pdl1">口唇：</div><div class="pdr1">
  <s:radio name="lip" list="#{0:'红润',1:'苍白',2:'发绀',3:'皲裂',4:'疱疹'}" value="%{lip}"></s:radio>
  </div>
  </td>
  <td><div class="pdl1">齿列：</div><div class="pdr1">
  <s:radio name="dentition" list="#{0:'正常',1:'缺齿',2:'龋齿',3:'义牙（假牙）'}" value="%{dentition}"></s:radio>
  </div>
  </td>
  <td><div class="pdl1">咽部：</div><div class="pdr1">
  <s:radio name="pharyngeal" list="#{0:'无充血',1:'充血',2:'淋巴滤泡增生'}" value="%{pharyngeal}"></s:radio>
  </div>
  </td>
</tr>

<tr>
  <td><div class="pdl1">视力：</div><div class="pdr1">
左眼<s:textfield name="leftVision" /><br /><br />
右眼<s:textfield name="rightVision" />
  </div>
  </td>
  <td><div class="pdl1">矫正视力：</div><div class="pdr1">
左眼<s:textfield name="leftCav" /><br /><br />
右眼<s:textfield name="rightCav" />
  </div>
  </td>
  <td>
  <div class="pdl1">听力：</div><div class="pdr1">
  <s:radio name="hearing" list="#{0:'听见',1:'听不清或无法听见'}" value="%{temulence}"></s:radio>
  </div>
  </td>
</tr>

<tr>
  <td>
  <div class="pdl1">运动能力：</div><div class="pdr1">
  <s:radio name="motorFunction" list="#{0:'可顺利完成',1:'无法独立完成其中任何一个动作'}" value="%{temulence}"></s:radio>
  </div>
  </td>
  <td>眼底：
  <s:radio name="eyebase1" list="#{0:'正常',1:'异常'}" value="%{eyebase1}" cssClass="ebottom"></s:radio>
  <s:textfield name="eyebase2" cssClass="eyeq" />
  </td>
  <td>巩膜：
  <s:radio name="sclera1" list="#{0:'正常',1:'黄染',2:'充血',3:'其他'}" value="%{sclera1}" cssClass="ebottom1"></s:radio>
  <s:textfield name="sclera2" cssClass="eyeq1" />
  </td>
</tr>

<tr>
  <td>皮肤：
  <s:radio name="skin1" list="#{0:'正常',1:'潮红',2:'苍白',3:'发绀',4:'黄染',5:'色素沉着',6:'其他'}" value="%{skin1}" cssClass="ebottom2"></s:radio>
  <s:textfield name="skin2" cssClass="eyeq2" />
  </td>
  <td>淋巴结：
  <s:radio name="lymph1" list="#{0:'未触及',1:'锁骨上',2:'腋窝',3:'其他'}" value="%{lymph1}" cssClass="ebottom3"></s:radio>
  <s:textfield name="lymph2" cssClass="eyeq3" />
  </td>
  <td><div class="pdl1">桶状胸：</div><div class="pdr1">
  <s:radio name="barrelChest" list="#{0:'是',1:'否'}" value="%{barrelChest}"></s:radio>
  </div>
  </td>
</tr>

<tr>
  <td>
  <div class="pdl1">呼吸音：</div><div class="pdr1">
  <s:radio name="breathSound1" list="#{0:'正常',1:'异常'}" value="%{breathSound1}" cssClass="sou"></s:radio>
  <s:textfield name="breathSound2" cssClass="bsou" />
  </div>
  </td>
  <td>罗音：
  <s:radio name="rale1" list="#{0:'无',1:'干罗音',2:'湿罗音',3:'其他'}" value="%{rale1}" cssClass="ebottom4"></s:radio>
  <s:textfield name="rale2" cssClass="eyeq4" />
  </td>
  <td>
  <div class="pdl1">心脏：心率</div><div class="pdr1">
  <s:textfield name="heartRate" />次/分钟
  </div>
  </td>
</tr>

<tr>
  <td><div class="pdl1">心律：</div><div class="pdr1">
  <s:radio name="heartRhythm" list="#{0:'齐',1:'不齐',2:'绝对不齐'}" value="%{heartRhythm}" ></s:radio>
  </div>
  </td>
  <td>
  <div class="pdl1">杂音：</div><div class="pdr1">
  <s:radio name="murmur1" list="#{0:'无',1:'有'}" value="%{murmur1}" cssClass="bads"></s:radio>
  <s:textfield name="murmur2" cssClass="bbads" />
  </div>
  </td>
  <td>
  <div class="pdl1">压痛：</div><div class="pdr1">
  <s:radio name="tendness1" list="#{0:'无',1:'有'}" value="%{tendness1}" cssClass="bads1"></s:radio>
  <s:textfield name="tendness2" cssClass="bbads1" />
  </div>
  </td>
</tr>

<tr>
  <td>
  <div class="pdl1">包块：</div><div class="pdr1">
  <s:radio name="mass1" list="#{0:'无',1:'有'}" value="%{mass1}" cssClass="bads2"></s:radio>
  <s:textfield name="mass2" cssClass="bbads2" />
  </div>
  </td>
  <td>
  <div class="pdl1">肝大：</div><div class="pdr1">
  <s:radio name="hepato1" list="#{0:'无',1:'有'}" value="%{hepato1}" cssClass="bads3"></s:radio>
  <s:textfield name="hepato2" cssClass="bbads3" />
  </div>
  </td>
  <td>
  <div class="pdl1">脾大：</div><div class="pdr1">
  <s:radio name="splenauxe1" list="#{0:'无',1:'有'}" value="%{splenauxe1}" cssClass="bads4"></s:radio>
  <s:textfield name="splenauxe2" cssClass="bbads4" />
  </div>
  </td>
</tr>

<tr>
  <td>
  <div class="pdl1">移动性浊音：</div><div class="pdr1">
  <s:radio name="shiftDull1" list="#{0:'无',1:'有'}" value="%{shiftDull1}" cssClass="bads5"></s:radio>
  <s:textfield name="shiftDull2" cssClass="bbads5" />
  </div>
  </td>
  <td><div class="pdl1">下肢水肿：</div><div class="pdr1">
  <s:radio name="legEdema" list="#{0:'无',1:'单侧',2:'双侧不对称',3:'双侧对称'}" value="%{legEdema}" ></s:radio>
  </div>
  </td>
  <td><div class="pdl1">足背动脉搏动：</div><div class="pdr1">
  <s:radio name="footPulse" list="#{0:'未触及',1:'触及双侧对称',2:'触及左侧弱或消失',3:'触及右侧弱或消失'}" value="%{footPulse}" ></s:radio>
  </div>
  </td>
</tr>

<tr>
  <td colspan="2">
  <div class="pdl1">肛门指诊：</div>
  <s:radio name="dre1" list="#{0:'未及异常',1:'触痛',2:'包块',3:'前列腺异常',4:'其他'}" value="%{dre1}" cssClass="bads6"></s:radio>
  <s:textfield name="dre2" cssClass="bbads6" />
  </td>
  <td><div class="pdl1">宫颈：</div><div class="pdr1">
  <s:radio name="cervix1" list="#{0:'未见异常',1:'异常'}" value="%{cervix1}" cssClass="bads8"></s:radio>
  <s:textfield name="cervix2" cssClass="bbads8 farhide" />
  </div>
  </td>
</tr>

<tr>
  <td colspan="2">
  <div class="pdl1">乳腺：</div>
  <s:checkboxlist name="breastList" list="#{0:'未见异常',1:'乳房切除',2:'异常泌乳',3:'乳腺包块',4:'其他'}" 
  listKey="key" listValue="value" value="%{breastList}" cssClass="bads7">
  </s:checkboxlist>
  <s:textfield name="breast2" cssClass="bbads7 farhide"/>
  </td>
  <td><div class="pdl1">宫体：</div><div class="pdr1">
  <s:radio name="corpus1" list="#{0:'未见异常',1:'异常'}" value="%{corpus1}" cssClass="bads9"></s:radio>
  <s:textfield name="corpus2" cssClass="bbads9 farhide" />
  </div>
  </td>
</tr>

<tr>
  <td><div class="pdl1">妇科：</div><div class="pdr1">外阴
  <s:radio name="vulva1" list="#{0:'未见异常',1:'异常'}" value="%{vulva1}" cssClass="bads10"></s:radio>
  <s:textfield name="vulva2" cssClass="bbads10 farhide" />
  <br/><br/>
阴道
  <s:radio name="vagina1" list="#{0:'未见异常',1:'异常'}" value="%{vagina1}" cssClass="bads11"></s:radio>
  <s:textfield name="vagina2" cssClass="bbads11 farhide" />
  </div>
  </td>
  <td><div class="pdl1">附件：</div><div class="pdr1">
  <s:radio name="annex1" list="#{0:'未见异常',1:'异常'}" value="%{annex1}" cssClass="bads12"></s:radio>
  <s:textfield name="annex2" cssClass="bbads12 farhide" />
  </div>
  </td>
  <td><div class="pdl1">其他：</div><div class="pdr1">
  <s:textfield name="phyExamElse" />
  </div>
  </td>
</tr>

<tr>
  <td colspan="3">
  <div class="pdl1">血常规：</div>
血红蛋白<s:textfield name="hgb" />g/L
白细胞<s:textfield name="leu" />×109/L
血小板<s:textfield name="plt" />×109/L
其他<s:textfield name="cbcElse" />
  </td>
</tr>

<tr>
  <td colspan="3">
  <div class="pdl1">尿常规：</div>
尿蛋白<s:textfield name="pro" />
尿糖<s:textfield name="uglu" />
尿酮体<s:textfield name="ket" />
尿潜血<s:textfield name="bld" />
其他<s:textfield name="urineElse" />
  </td>
</tr>

<tr>
  <td colspan="2"><div class="pdl1">空腹血糖：</div>
  <s:textfield name="fbg1" />mmol/L 或<s:textfield name="fbg2" />mg/dL
  </td>
  <td><div class="pdl1">心电图：</div><div class="pdr1">
  <s:radio name="ecg1" list="#{0:'正常',1:'异常'}" value="%{ecg1}" cssClass="bads13"></s:radio>
  <s:textfield name="ecg2" cssClass="bbads13 farhide" />
  </div>
  </td>
</tr>

<tr>
  <td><div class="pdl1">尿微量白蛋白：</div><div class="pdr1">
  <s:textfield name="mau" />mg/dL
  </div>
  </td>
  <td><div class="pdl1">大便潜血：</div><div class="pdr1">
  <s:radio name="bloodStool" list="#{0:'阴性',1:'阳性'}" value="%{bloodStool}" ></s:radio>
  </div>
  </td>
  <td><div class="pdl1">糖化血红蛋白：</div><div class="pdr1">
  <s:textfield name="ghb" />%
  </div>
  </td>
</tr>

<tr>
  <td><div class="pdl1">乙型肝炎表面抗原：</div><div class="pdr1">
  <s:radio name="hbsag" list="#{0:'阴性',1:'阳性'}" value="%{hbsag}" ></s:radio>
  </div></td>
  <td><div class="pdl1">胸部X线片：</div><div class="pdr1">
  <s:radio name="xray1" list="#{0:'正常',1:'异常'}" value="%{xray1}" cssClass="bads14"></s:radio>
  <s:textfield name="xray2" cssClass="bbads14 farhide" />
  </div></td>
  <td><div class="pdl1">B超：</div><div class="pdr1">
  <s:radio name="bultra1" list="#{0:'正常',1:'异常'}" value="%{bultra1}" cssClass="bads15"></s:radio>
  <s:textfield name="bultra2" cssClass="bbads15 farhide" />
</div></td>
</tr>

<tr>
  <td colspan="3"><div class="pdl1">宫颈涂片：</div><div class="pdr1">
  <s:radio name="smear1" list="#{0:'正常',1:'异常'}" value="%{smear1}" cssClass="bads15"></s:radio>
  <s:textfield name="smear2" cssClass="bbads15 farhide" />
  </div></td>
</tr>

<tr>
  <td colspan="3">
  <div class="pdl1">肝功能：</div>
血清谷丙转氨酶<s:textfield name="sgpt" />U/L
血清谷草转氨酶<s:textfield name="sgot" />U/L
白蛋白<s:textfield name="alb" />g/L
总胆红素<s:textfield name="tbil" />μmol/L<br/><br/>
  <div class="hong">结合胆红素<s:textfield name="dbil" />μmol/L</div>
  </td>
</tr>
<tr>
  <td colspan="3">
  <div class="pdl1">肾功能：</div>
血清肌酐<s:textfield name="scr" />μmol/L
血尿素氮<s:textfield name="bun" />mmol/L
血钾浓度<s:textfield name="potassium" />mmol/L
血钠浓度<s:textfield name="sodium" />mmol/L
  </td>
</tr>
<tr>
  <td colspan="3">
  <div class="pdl1">血   脂：</div>
总胆固醇<s:textfield name="chol" />mmol/L
甘油三酯<s:textfield name="trig" />mmol/L
血清低密度脂蛋白胆固醇<s:textfield name="ldlc" />mmol/L<br></br>
  <div class="hong">血清高密度脂蛋白胆固醇<s:textfield name="hdlc" />mmol/L</div>
  </td>
</tr>

<tr>
  <td><div class="pdl1">其他：</div><div class="pdr1">
  <s:textfield name="auxiExamElse" />
  </div></td>
  <td><div class="pdl1">平和质：</div><div class="pdr1">
  <s:radio name="mildPhy" list="#{0:'是',1:'基本是'}" value="%{mildPhy}" ></s:radio>
  </div></td>
  <td><div class="pdl1">气虚质：</div><div class="pdr1">
  <s:radio name="faintPhy" list="#{0:'是',1:'倾向是'}" value="%{faintPhy}" ></s:radio>
  </div></td>
</tr>

<tr>
  <td><div class="pdl1">阳虚质：</div><div class="pdr1">
  <s:radio name="yangPhy" list="#{0:'是',1:'倾向是'}" value="%{yangPhy}" ></s:radio>
  </div></td>
  <td><div class="pdl1">阴虚质：</div><div class="pdr1">
  <s:radio name="yinPhy" list="#{0:'是',1:'倾向是'}" value="%{yinPhy}" ></s:radio>
  </div></td>
  <td><div class="pdl1">痰湿质：</div><div class="pdr1">
  <s:radio name="tanPhy" list="#{0:'是',1:'倾向是'}" value="%{tanPhy}" ></s:radio>
  </div></td>
</tr>

<tr>
  <td><div class="pdl1">湿热质：</div><div class="pdr1">
  <s:radio name="muggyPhy" list="#{0:'是',1:'倾向是'}" value="%{muggyPhy}" ></s:radio>
  </div></td>
  <td><div class="pdl1">血瘀质：</div><div class="pdr1">
  <s:radio name="xueyuPhy" list="#{0:'是',1:'倾向是'}" value="%{xueyuPhy}" ></s:radio>
  </div></td>
  <td><div class="pdl1">气郁质：</div><div class="pdr1">
  <s:radio name="qiyuPhy" list="#{0:'是',1:'倾向是'}" value="%{qiyuPhy}" ></s:radio>
  </div></td>
</tr>

<tr>
  <td><div class="pdl1">特秉质：</div><div class="pdr1">
  <s:radio name="tebingPhy" list="#{0:'是',1:'倾向是'}" value="%{tebingPhy}" ></s:radio>
  </div></td>
  <td></td>
  <td></td>
</tr>

<tr>
<td colspan="3" class="">
<div class="pdl1">脑血管疾病：</div>
  <s:checkboxlist name="cerebroDisList" list="#{0:'未发现',1:'缺血性卒中',2:'脑出血',3:'短暂性脑缺血',4:'蛛网膜下腔出血',5:'其他'}" 
  listKey="key" listValue="value" value="%{cerebroDisList}" >
  </s:checkboxlist>
  <s:textfield name="cerebroDis2" cssClass="otnao farhide"/>
</td>
</tr>
<tr>
<td colspan="3" class="">
<div class="pdl1">肾脏疾病：</div>
 <s:checkboxlist name="kidneyDisList" list="#{0:'未发现',1:'糖尿病肾病',2:'肾功能衰竭',3:'急性肾炎',4:'慢性肾炎',5:'其他'}" 
  listKey="key" listValue="value" value="%{kidneyDisList}" >
  </s:checkboxlist>
  <s:textfield name="kidneyDis2" cssClass="otnao1 farhide"/>
</td>
</tr>
<tr>
<td colspan="3" class="">
<div class="pdl1">心脏疾病：</div>
<s:checkboxlist name="heartDisList" list="#{0:'未发现',1:'心肌梗死',2:'心绞痛',3:'冠状动脉血运重建',4:'充血性心力',5:'心前区疼痛',6:'其他'}" 
  listKey="key" listValue="value" value="%{heartDisList}" >
  </s:checkboxlist>
  <s:textfield name="heartDis2" cssClass="otnao2 farhide"/>
</td>
</tr>
<tr>
<td colspan="3" class="">
<div class="pdl1">血管疾病：</div>
<s:checkboxlist name="vesselDisList" list="#{0:'未发现',1:'夹层动脉瘤',2:'动脉闭塞性疾病',3:'其他'}" 
  listKey="key" listValue="value" value="%{vesselDisList}" >
  </s:checkboxlist>
  <s:textfield name="vesselDis2" cssClass="otnao5 farhide"/>
</td>
</tr>
<tr>
<td colspan="3" class="">
<div class="pdl1">眼部疾病：</div>
<s:checkboxlist name="eyeDisList" list="#{0:'未发现',1:'视网膜出血或渗出',2:'视乳头水肿',3:'白内障',4:'其他'}" 
  listKey="key" listValue="value" value="%{eyeDisList}" >
  </s:checkboxlist>
  <s:textfield name="eyeDis2" cssClass="otnao4 farhide"/>
</td>
</tr>
<tr>
<td>
<div class="pdl1">神经系统疾病：</div><div class="pdr1">
<s:radio name="nervSysDis1" list="#{0:'未发现',1:'有'}" value="%{nervSysDis1}" cssClass="bbads14"></s:radio>
  <s:textfield name="nervSysDis2" cssClass="bbads14" />
</div>
</td>
<td>
<div class="pdl1">其他系统疾病：</div><div class="pdr1">
<s:radio name="elseSysDis1" list="#{0:'未发现',1:'有'}" value="%{elseSysDis1}" cssClass="bads15"></s:radio>
  <s:textfield name="elseSysDis2" cssClass="bbads15 farhide" />
</div>
</td>
<td></td>
</tr>

</tbody>
</table>

<table id="hospitalTable">	
<tr>
<td colspan="5" class="tbhead">住院史</td></tr>
<tr class="head-td" >
<td>入院日期</td>
<td>出院日期</td>
<td>原 因</td>
<td>医疗机构名称</td>
<td>病案号</td>
</tr>
<s:iterator value="hospiList">
  <tr>
	<td><s:textfield name="inHospital"/></td>
	<td><s:textfield name="outHospital"/></td>
	<td><s:textfield name="inHosReason"/></td>
	<td><s:textfield name="hospitalName"/></td>
	<td><s:textfield name="recordNumber"/></td>
  </tr>
</s:iterator>
</table>

<div>
<input type="button" onclick="addHospitalRow()" value="添加" />
</div>

<table id="famDisTable">	
<tr>
<td colspan="5" class="tbhead">住院史</td></tr>
<tr class="head-td" >
<td>建床日期</td>
<td>撤床日期</td>
<td>原 因</td>
<td>医疗机构名称</td>
<td>病案号</td>
</tr>
<s:iterator value="famDisList">
  <tr>
	<td><s:textfield name="buildBedDate"/></td>
	<td><s:textfield name="removeBedDate"/></td>
	<td><s:textfield name="famDisReason"/></td>
	<td><s:textfield name="famHospitalName"/></td>
	<td><s:textfield name="famRecordNumber"/></td>
  </tr>
</s:iterator>
</table>
<div>
<input type="button" onclick="addfamDisRow()" value="添加" />
</div>

<table id="medTable">	
<tr>
<td colspan="5" class="tbhead">主要用药情况</td></tr>
<tr class="head-td" >
<td>药物名称</td>
<td>用法</td>
<td>用量</td>
<td>用药时间</td>
<td>服药依从性</td>
</tr>
<s:iterator value="medList">
  <tr>
	<td><s:textfield name="drugName"/></td>
	<td><s:textfield name="useage"/></td>
	<td><s:textfield name="dosage"/></td>
	<td><s:textfield name="takeMedTime" onClick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
	<td><s:select name="compliance" list="#{0:'规律',1:'间断',2:'不服药'}" value="%{compliance}"/></td>
  </tr>
</s:iterator>
</table>
<div>
<input type="button" onclick="addMedRow()" value="添加" />
</div>


<s:submit value="保存"/>
</s:form>

</div>
</body>
</html>

