<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
	<head>
		<title>档案信息</title>
		<%@ include file="/WEB-INF/jsp/public/commons.jspf"%>
		<script
			src="${pageContext.request.contextPath}/script/yunzhu_js/js/selfmessage.js"
			type="text/javascript"></script>
		<script language="javascript"
			src="${pageContext.request.contextPath}/script/date.js"
			charset="utf-8"></script>
		<script type="text/javascript">
		 function delRow(rowIndex){ 
			    $("#option"+rowIndex).remove();  
			};
		 function delTraumasRow(rowIndex){
					$("#optionTraumas"+rowIndex).remove();
				 }	
		 function delSugeryRow(rowIndex){
						$("#optionSugery"+rowIndex).remove();
					 }
		</script>
		<script type="text/javascript">
			var ckIdFlag=true;
			var id="${id}";
			function checkIdCardNo(idCardNo){
				
				if(id==null||id==""){
					if(!ckIdNo(idCardNo)){
						return;
						}
					//设置出生日期
					var birthday= idCardNo.substring(6,10) + "-" + idCardNo.substring(10,12) + "-" + idCardNo.substring(12,14);
					console.log(birthday);
					$(".rsBornDate").val(birthday);
					ckPostId();
					}
				
				}
			function ckPostId(){
				//验证是否身份证号已经被注册
				var rsid=$("input[name=rsId]").val();
				$.post(
						"archive_validateArchive.action",
						{"rsid":rsid},
						function(data){
							console.log("返回的数据位"+data);
							if(data==false||data=="false"){
								alert("该身份证号已经注册，请重新填写");
								ckIdFlag=false;
								//$("input[name=rsId]").focus();
								}else{
								ckIdFlag=true;
							}
						}
						);
				}
			//身份证信息验证
			function ckIdNo(idCardNo){
				console.log(idCardNo);
				if(idCardNo==""){
					$(".idCardNoMsg").text("身份证号不能为空");
					
					return false;
					}
				var reg=/^[1-9]\d{5}[0-1]\d{3}((0[1-9])|(1[0-2]))((0|1|2)[1-9]|(3[0|1]))\d{4}$/;
				if(!reg.test(idCardNo))	{
					$(".idCardNoMsg").text("身份证号格式错误");
					return false;
					}
				return true;
				}
			
			function checkLinkPhoneNum(phoneNum){
				var reg=/^1[3-8]\d{9}$/;
					
				if(!reg.test(phoneNum)){
					$(".phoneNum").val("电话号码格式错误")
					}
				}
			function validate(form){
				console.log("进入form验证");
				var rsid=$("input[name=rsId]").val();
				var name=$("input[name=name]").val();
				console.log(name);
				var f=true;
				if(id==null||id==""){
					f=ckIdNo(rsid);
					}
				
				if(!f||!ckIdFlag){
					alert("身份证信息不正确");
					return false;
					}
				if(name==null||name==""){
					console.log("进入补时");
					alert("姓名信息不正确");
					return false;
					}
				return true;
				}
		</script>
	</head>
	<body>

		<!-- 标题显示 -->
		<div id="Title_bar">
			<div id="Title_bar_Head">
				<div id="Title_Head"></div>
				<div id="Title">
					<!--页面标题-->
					<img border="0" width="13" height="13"
						src="${pageContext.request.contextPath}/style/images/title_arrow.gif" />
					档案信息
				</div>
				<div id="Title_End"></div>
			</div>
		</div>

		<!--显示表单内容-->
		<div id="all-form">

			<br>
			<s:form action="archive_%{id == null ? 'add' : 'edit'}" onsubmit="return validate(this)">
				<s:hidden id="test" name="id"></s:hidden>
				<s:hidden name="residentId"></s:hidden>
				<div class="ItemBlock_Title1">
					<!-- 信息说明 -->
					<div class="ItemBlock_Title1">
						<img border="0" width="4" height="7"
							src="${pageContext.request.contextPath}/style/blue/images/item_point.gif" />
						居民档案封面
					</div>
				</div>
				<br>
				<div>
					<span>
					姓名：${name}  &nbsp; &nbsp;</span><span>性别：${gender} &nbsp; &nbsp;</span><span>出生日期：${rsBornDate} 
						&nbsp; &nbsp;</span><span>年龄：${age } &nbsp; &nbsp;</span><span>责任医生：${doctor.name} 
						&nbsp; &nbsp;</span><span>疾病史：无 &nbsp;</span>
				</div>
				<br>
				<!-- 表单内容显示 -->
				<div class="ItemBlockBorder">
					<div class="ItemBlock">
						<table cellpadding="0" cellspacing="0" class="mainForm">
							<tr>
								<td>
									档案编号
								</td>
								<td>
									<s:textfield name="rsArchiveId" cssClass="InputStyle" readonly="true"
										cssStyle="width:160px" />
								<td style="color: red">
									姓名
								</td>
								<td>
									<s:textfield name="name" cssClass="InputStyle"
										cssStyle="width:160px" />
									*
								</td>
								<td rowspan="6" width="80">
									照片&nbsp;
								</td>
							</tr>
							<tr>
								<td>
									现住址
								</td>
								<td>
									<s:textfield name="nowAdr" cssClass="InputStyle"
										cssStyle="width:160px" />
									*
								</td>
								<td>
									联系电话
								</td>
								<td>
									<s:textfield name="phoneNumber" cssClass="InputStyle" onblur="checkPhoneNum(this.value)"
										cssStyle="width:160px" />
									*<span class="phoneNumMsg" style="color: red"></span>
								</td>
							</tr>
							<tr>
								<td>
									户籍地址
								</td>
								<td>
									<s:textfield name="addressId" cssClass="InputStyle"
										cssStyle="width:160px" />
									*
								</td>
								<td>
									乡镇街道名称
								</td>
								<td>
									<s:select name="streetDisId" list="#districtInsList"
										cssClass="SelectStyle" cssStyle="width:160px" listKey="id"
										listValue="name" headerKey="0" headerValue="请选择"></s:select>
									*
								</td>
							</tr>
							<tr>
								<td>
									建档单位
								</td>
								<td>
									<s:select name="archiveDisId" list="#districtInsList"
										cssClass="SelectStyle" cssStyle="width:160px" listKey="id"
										listValue="name" headerKey="0" headerValue="请选择建档单位"></s:select>
									*
								</td>
								<td>
									村居委会名称
								</td>
								<td>
									<s:textfield name="committee" cssClass="InputStyle"
										cssStyle="width:160px" />
									*
								</td>
								<%--<td>性别</td>
                        <td>
                        	
                        	%{}里面为ongl表达，#{}代表构建一个map-key提交的值，value显示值
							<s:radio name="gender" list="%{ #{'男':'男', '女':'女'} }"></s:radio>
							<s:radio name="gender" list="#{'男':'男', '女':'女'}"></s:radio> 不写%{}默认为ongl表达式
							<s:radio name="gender" list="{'男', '女'}"></s:radio> 是构建Lis，既当值又当value
                        	 
							<s:radio name="gender" list="{'男', '女'}"></s:radio>

						</td>--%>
							</tr>
							<tr>
								<td>
									建档人
								</td>
								<td>
									<s:textfield name="paperRecorder" cssClass="InputStyle"
										cssStyle="width:160px" />
									*
								</td>
								<td>
									建档日期
								</td>
								<td>
									<s:if test="%{achiveDate==null}">
										<input type="text" name="achiveDate" readOnly="readonly"
											onClick=setDay(this)>* 添加后将不可修改</s:if>
									<s:else>
										<s:date name="achiveDate" format="yyyy-MM-dd" />
									</s:else>
								</td>
							</tr>
							<tr>
								<td>
									责任医生
								</td>
								<td>
									<s:select name="doctorId" cssClass="SelectStyle"
										cssStyle="width:160px" list="#doctorList" listKey="id"
										listValue="name" headerKey="0" headerValue="请选择医生" />
								</td>
								<td style="color: red">
									录入员
								</td>
								<td>
									<s:select name="recorderId" cssClass="SelectStyle"
										cssStyle="width:160px" list="#recorderList" listKey="id"
										listValue="name" headerKey="0" headerValue="请选择记录员" />
								</td>
							</tr>
						</table>
					</div>
				</div>

				<div class="ItemBlock_Title1">
					<!-- 信息说明 -->
					<div class="ItemBlock_Title1">
						<img border="0" width="4" height="7"
							src="${pageContext.request.contextPath}/style/blue/images/item_point.gif" />
						居民个人信息
					</div>
				</div>

				<!-- 居民信息表 -->
				<div class="ItemBlockBorder">
					<div class="ItemBlock">
						<table cellpadding="0" cellspacing="0" class="mainForm">
							<tr>
								<td>
									性别
								</td>
								<td>
									<s:radio name="gender" list="{'男', '女'}"></s:radio>
								</td>
								<td style="color: red">
									身份证号
								</td>
								<td>
									<s:textfield name="rsId" id="idCardNo" cssClass="InputStyle"
										cssStyle="width:130px" readonly="%{id==null?false:true}" 
										onblur="checkIdCardNo(this.value)" />
									<span class="idCardNoMsg"></span>
								</td>
								<td style="color: red">
									出生日期
								</td>
								<td>
										<s:textfield name="rsBornDate" cssClass="rsBornDate" readonly="true">
											<s:param name="value"><s:date name="rsBornDate" format="yyyy-MM-dd" /></s:param>
										</s:textfield>
									 * 添加后将不可修改
								</td>
							</tr>

							<tr>
								<td>
									工作单位
								</td>
								<td>
									<s:textfield name="workAddr" cssClass="InputStyle"
										cssStyle="width:100px" />
								</td>
								<td>
									联系人姓名
								</td>
								<td>
									<s:textfield name="linkManName" cssClass="InputStyle"
										cssStyle="width:100px" />
								</td>
								<td>
									联系人电话
								</td>
								<td>
									<s:textfield name="linkManPhoneNum" cssClass="InputStyle" 
										cssStyle="width:130px" />
								</td>
							</tr>

							<tr>
								<td>
									常住类型
								</td>
								<td>
									<s:select name="livingType" cssClass="SelectStyle"
										cssStyle="width:100px" list="#{1:'户籍',2:'非户籍'}" listKey="key"
										listValue="value" headerKey="0" headerValue="户籍类型" />
									<!-- <div class="pdr"><select><option>户籍</option><option>非户籍</option></select></div> -->
								</td>
								<td>
									民族
								</td>
								<td>


									<div class="pdr">
										<s:select name="nationality" cssClass="mingzu"
											cssStyle="width:50px" list="#{0:'汉族',1:'少数民族'}" listKey="key"
											listValue="value"></s:select>
										<s:if test="%{id==null||nationalityString==null}">
											<s:textfield name="nationalityString"
												cssStyle="display: none" cssClass="tfew"></s:textfield>
										</s:if>
										<s:elseif test="%{nationalityString!=null}">
											<s:textfield name="nationalityString" cssClass="tfew"></s:textfield>
										</s:elseif>


										<!-- <input style="display: none" type="text" name="nationalityString" class="tfew" palceholder="民族名称" size="2px" > -->
									</div>
								</td>
								<td>
									文化程度
								</td>
								<td>
									<s:select name="educateType" cssClass="SelectStyle"
										cssStyle="width:70px" list="#{1:'文盲及半文盲',2:'小学',3:'初中',4:'高中',5:'本科',6:'研究生',7:'博士'}"
										listKey="key" listValue="value" headerKey="0"
										headerValue="请选择文化程度" />

								</td>
							</tr>

							<tr>
								<td>
									血型
								</td>
								<td>
									<div class="pdr">
										<s:select name="bloodType" cssClass="SelectStyle"
											cssStyle="width:70px" list="#{1:'A',2:'B',3:'AB',4:'O'}"
											listKey="key" listValue="value" headerKey="0"
											headerValue="不详" />
										<%--<select><option>A</option><option>B</option><option>O</option>
										<option>AB</option><option>不详</option>
								</select> --%>
									</div>
								</td>
								<td>
									RH阴性
								</td>
								<td>
									<div class="pdr">
										<s:select name="rhType" cssClass="SelectStyle"
											cssStyle="width:60px" list="#{1:'是',2:'否'}"
											listKey="key" listValue="value" headerKey="0"
											headerValue="不详" />
									</div>
								</td>
								<td>
									职业
								</td>
								<td>

									<%-- <select>
									<option>国家机关、党群组织、企业、事业单位负责人</option><option>专业技术人员</option>
									<option>办事人员和有关人员</option><option>商业、服务人员</option>
									<option>农、林、牧、渔、水利业生产人员</option><option>生产、运输设备操作人员及有关人员</option>
									<option>军人</option><option>不便分类的其他从业人员</option>
								</select>--%>
								</td>
							</tr>
							<tr>
								<td>
									婚姻状况
								</td>
								<td>
									<div class="pdr">
										<s:select name="workingType" cssClass="SelectStyle"
											cssStyle="width:160px"
											list="#{1:'未婚',2:'已婚',3:'丧偶',4:'未说明婚姻状况'}" listKey="key"
											listValue="value" headerKey="0" headerValue="婚姻状况" />

									</div>
								</td>
							</tr>
							<tr>
								<td>
									暴露史
								</td>
								<td>
									<s:radio cssClass="exhave" name="exposureType"
										list="#{0:'无',1:'有'}"></s:radio>
									<div class="expose" style="display: none">
										<s:checkboxlist name="exporeIds"
											list="#{1:'化学品',2:'射线',3:'毒物'}" listKey="key"
											listValue="value" theme="simple"></s:checkboxlist>
									</div>
									<script type="text/javascript">
										var conId = "${id}"
										if (conId != null && conId != "") {
											var expt = "${exposureType}";
											if (expt == "1")
												$(".expose").show();
										}
									</script>
								</td>
								<td>
									遗传病史
								</td>
								<td>
									<s:radio name="heredityType" cssClass="genetic"
										list="#{0:'无',1:'有'}"></s:radio>
									<div class="tgene" style="display: none">
										<s:textfield name="heredityString"></s:textfield>
									</div>
									<script type="text/javascript">
									var cId = "${id}";
									if (cId != null && cId != "") {
										var tGene = "${heredityType}";
										if (tGene == "1") {
											$(".tgene").show();
										}
									}
									</script>
								</td>
								<td>
									过敏史
								</td>
								<td>
									<s:radio name="drugAllergyType" cssClass="allergy"
										list="#{0:'无',1:'有'}"></s:radio>
									<div class="tallergy" style="display: none">
										<s:checkboxlist name="drugAllergyIds" theme="simple"
											list="#{1:'青霉素',2:'链霉素',3:'磺胺',4:'其他'}"></s:checkboxlist>
									</div>
									<script type="text/javascript">
									var coId = "${id}";
									if (coId != null && coId != "") {
										var drugAt = "${drugAllergyType}";
										if (drugAt == "1") {
											$(".tallergy").show();
										}
									}
									</script>
								</td>
							</tr>

							<!-- 手术输血外伤 -->

							<tr>
								<td colspan="4">
									<div class="pullbl">
										<label class="pdl">
											手术：
										</label>
										<s:radio name="surgeryType" cssClass="rblo"
											list="#{0:'无',1:'有'}"></s:radio>
										<span class="blo_1"> <span class="tblo"
											style="display: none;"><s:textfield
													name="surgeryString" cssClass=""></s:textfield>
												<input id="calendar-inputField3" size="15px" />&nbsp; <span
												class="pull-left"><button style="display: none;"
														type="button" class="addblo">
														添加
													</button>
											</span>
											<br /> <span class="surgeryList" style="display: none;">
													<s:iterator value="#surgeryPublicInsList">
														<s:textfield name="txSurgery" value="%{info}"></s:textfield>
													</s:iterator> </span>
										</span> </span>
										<script type="text/javascript">
										var coId = "${id}";
										if (coId != null && coId != "") {
											$(".surgeryList").show();
											var tpSugery = "${surgeryType}"
											if (tpSugery == "1") {
												$(".addblo").show();
												$(".tblo").show();
											}
										}
										</script>


									</div>
								</td>
							</tr>

							<tr>
								<td colspan="4">
									<div class="pullbl">
										<span class="blood_1"> <br /> <label class="pdl">
												输血：
											</label> <s:radio cssClass="rblood" name="bloodTransType"
												list="#{0:'无',1:'有'}"></s:radio> <span class="tblood"
											style="display: none;";>
											<s:textfield name="bloodTranString" cssClass="blo-reason"></s:textfield>
											
											<input id="calendar-inputField4" size="15px" /> <span
												class="pull-left"><button style="display: none;"
														type="button" class="addblood">
														添加
													</button>
											</span> <span class="bloodTranList" style="display: none"> <s:iterator
														value="#bloodPublicInsList">
														<s:textfield name="txBlood" value="%{info}"></s:textfield>
														<br />
													</s:iterator> </span>
										</span> </span>
										<script type="text/javascript">
										var cid = "${id}";
										if (cid != null && cid != "") {
											$(".bloodTranList").show();
											var tpBlood = "${bloodTransType}"
											if (tpBlood == "1") {
												$(".addblood").show();
												$(".tblood").show();
											}
										}
										</script>
									</div>
								</td>
							</tr>

							<tr>
								<td colspan="4">
									<div class="pullbl">
										<span class="bloo_1"> <br /> <label class="pdl">
												外伤：
											</label> <s:radio name="traumasType" cssClass="rbloo"
												list="#{0:'无',1:'有'}"></s:radio> <span class="tbloo"
											style="display: none;"> <s:textfield
													name="traumasString"></s:textfield> <input
													id="calendar-inputField3" size="15px" />&nbsp; </span> </span>
										<span class="pull-left"><button style="display: none;"
												type="button" class="addbloo">
												添加
											</button>
										</span>
										<span class="traumasTxList" style="display: none;"> <s:iterator
												value="#traumasPublicInsList">
												<br />
												<s:textfield name="txTraumas" value="%{info}"></s:textfield>
											</s:iterator> </span>


										<script type="text/javascript">
										var coid = "${id}"
											if (coid != null && coid != "") {
												$(".traumasTxList").show();
												var traT = "${traumasType}"
												if (traT == "1") {
													$(".addbloo").show();
													$(".tbloo").show();
												}
											}
										</script>
									</div>
								</td>
							</tr>

							<!-- 家族史 -->
							<tr>
								<td colspan="14" class="sick">
									疾病：&nbsp;&nbsp;&nbsp;
									<s:radio cssClass="sickRadio" name="diseaseType"
										list="#{0:'无',1:'有'}"></s:radio>
										
									<div class="sickList" style="display: none">
										<input type="checkbox" name="diseaseIds" value="0" <s:property value="%{0 in diseaseIds ? 'checked' : ''}"/>/> 高血压
										<input type="checkbox" name="diseaseIds" value="1" <s:property value="%{1 in diseaseIds ? 'checked' : ''}"/>> 糖尿病
										<input type="checkbox" name="diseaseIds" value="2" <s:property value="%{2 in diseaseIds ? 'checked' : ''}"/>> 
										冠心病
										<input type="checkbox" name="diseaseIds" value="3" <s:property value="%{3 in diseaseIds ? 'checked' : ''}"/>> 
										慢性阻塞性肺疾病
										<input type="checkbox" name="diseaseIds" class="ckcancer" value="4" <s:property value="%{4 in diseaseIds ? 'checked' : ''}"/>> 
										恶性肿瘤
										<s:textfield name="diseaseCancerString" cssStyle="display:none;" cssClass="tcancer"></s:textfield>
										<input type="checkbox" name="diseaseIds" value="5" <s:property value="%{5 in diseaseIds ? 'checked' : ''}"/>>
										重性精神疾病
										<input type="checkbox" name="diseaseIds" value="6" <s:property value="%{6 in diseaseIds ? 'checked' : ''}"/>> 
										
										肝炎
										<input type="checkbox" name="diseaseIds" value="7" <s:property value="%{7 in diseaseIds ? 'checked' : ''}"/>>
										其他法定传染病
										<input type="checkbox" class="ckoccupDis" name="diseaseIds" value="8" <s:property value="%{8 in diseaseIds ? 'checked' : ''}"/>>
										职业病
										<s:textfield name="diseaseOccupString" cssStyle="display:none;" cssClass="toccupDis"></s:textfield>
										<input type="checkbox" class="ckother" name="diseaseIds" value="9" <s:property value="%{9 in diseaseIds ? 'checked' : ''}"/>>
										其他
										<s:textfield name="diseaseOtherString" cssStyle="display:none;" cssClass="tother"></s:textfield>
										<script type="text/javascript">
											var id="${id}";
											if(id!=null&&id!=""){
												var type="${diseaseType}";
												if(type=="1"){
													$(".sickList").show();
													$("[name=diseaseIds]").each(function(i){
														if($(this).attr("checked")){
															var b=$(this).val();
															if($(this).attr("value")=="4"){
																$(".tcancer").show();
																}
															if($(this).attr("value")=="8"){
																$(".toccupDis").show();
																}
															if($(this).attr("value")=="9"){
																$(".tother").show();
																}
															}
														
														});
												}
											}
										</script>
									</div>
								</td>
							</tr>

							<tr>
								<td colspan="14" class="fsick">
									父亲：&nbsp;&nbsp;&nbsp;
									<s:radio cssClass="fsickRadio" name="faDiseaseType" list="#{0:'无',1:'有'}"></s:radio>
									<div class="fsickList" style="display: none">
										<input type="checkbox" name="faDiseaseIds" value="0" <s:property value="%{0 in faDiseaseIds ? 'checked' : ''}"/>/> 高血压
										<input type="checkbox" name="faDiseaseIds" value="1" <s:property value="%{1 in faDiseaseIds ? 'checked' : ''}"/>> 糖尿病
										<input type="checkbox" name="faDiseaseIds" value="2" <s:property value="%{2 in faDiseaseIds ? 'checked' : ''}"/>> 
										冠心病
										<input type="checkbox" name="faDiseaseIds" value="3" <s:property value="%{3 in faDiseaseIds ? 'checked' : ''}"/>> 
										慢性阻塞性肺疾病
										<input type="checkbox" name="faDiseaseIds"  class="fckcancer" value="4" <s:property value="%{4 in faDiseaseIds ? 'checked' : ''}"/>> 
										恶性肿瘤
										<s:textfield name="faDiseaseCancerString" cssStyle="display:none;" cssClass="ftcancer"></s:textfield>
										<input type="checkbox" name="faDiseaseIds" value="5" <s:property value="%{5 in faDiseaseIds ? 'checked' : ''}"/>>	
										重性精神疾病
										<input type="checkbox" name="faDiseaseIds" value="6" <s:property value="%{6 in faDiseaseIds ? 'checked' : ''}"/>> 
										肝炎
										<input type="checkbox" name="faDiseaseIds" value="7" <s:property value="%{7 in faDiseaseIds ? 'checked' : ''}"/>>
										其他法定传染病
										<input type="checkbox" name="faDiseaseIds" class="fckoccupDis"  value="8" <s:property value="%{8 in faDiseaseIds ? 'checked' : ''}"/>>
										职业病
										<s:textfield name="faDiseaseOccupString" cssStyle="display:none;" cssClass="ftoccupDis"></s:textfield>
										<input type="checkbox" name="faDiseaseIds"  class="fckother"  value="9" <s:property value="%{9 in faDiseaseIds ? 'checked' : ''}"/>>
										其他
										<s:textfield name="faDiseaseOtherString" cssStyle="display:none;" cssClass="ftother"></s:textfield>
										<script type="text/javascript">
											var id="${id}";
											if(id!=null&&id!=""){
												var type="${faDiseaseType}";
												if(type=="1"){
													$(".fsickList").show();
													$("[name=faDiseaseIds]").each(function(i){
														if($(this).attr("checked")){
															var b=$(this).val();
															if($(this).attr("value")=="4"){
																$(".ftcancer").show();
																}
															if($(this).attr("value")=="8"){
																$(".ftoccupDis").show();
																}
															if($(this).attr("value")=="9"){
																$(".ftother").show();
																}
															}
														
														});
												}
											}
										</script>
										
										</div>
								</td>
								
							</tr>

							<tr>
								<td colspan="14" class="msick">
									母亲：&nbsp;&nbsp;&nbsp;
									<s:radio cssClass="msickRadio" name="monDiseaseType" list="#{0:'无',1:'有'}"></s:radio>
									<div class="msickList" style="display: none;">
										<input type="checkbox" name="moDiseaseIds" value="0" <s:property value="%{0 in moDiseaseIds ? 'checked' : ''}"/>/> 高血压
										<input type="checkbox" name="moDiseaseIds" value="1" <s:property value="%{1 in moDiseaseIds ? 'checked' : ''}"/>> 糖尿病
										<input type="checkbox" name="moDiseaseIds" value="2" <s:property value="%{2 in moDiseaseIds ? 'checked' : ''}"/>> 
										冠心病
										<input type="checkbox" name="moDiseaseIds" value="3" <s:property value="%{3 in moDiseaseIds ? 'checked' : ''}"/>> 
										慢性阻塞性肺疾病
										<input type="checkbox" name="moDiseaseIds" class="mckcancer" value="4" <s:property value="%{4 in moDiseaseIds ? 'checked' : ''}"/>> 
										恶性肿瘤
										<s:textfield name="monDiseaseCancerString" cssStyle="display:none;" cssClass="mtcancer"></s:textfield>
										<input type="checkbox" name="moDiseaseIds" value="5" <s:property value="%{5 in moDiseaseIds ? 'checked' : ''}"/>>										 
										重性精神疾病
										<input type="checkbox" name="moDiseaseIds" value="6" <s:property value="%{6 in moDiseaseIds ? 'checked' : ''}"/>> 
										肝炎
										<input type="checkbox" name="moDiseaseIds" value="7" <s:property value="%{7 in moDiseaseIds ? 'checked' : ''}"/>>
										其他法定传染病
										<input type="checkbox" name="moDiseaseIds" class="mckoccupDis"  value="8" <s:property value="%{8 in moDiseaseIds ? 'checked' : ''}"/>>
										职业病
										<s:textfield name="monDiseaseOccupString" cssStyle="display:none;" cssClass="mtoccupDis"></s:textfield>
										<input type="checkbox" name="moDiseaseIds"  class="mckother"  value="9" <s:property value="%{9 in moDiseaseIds ? 'checked' : ''}"/>>
										其他
										<s:textfield name="monDiseaseOtherString" cssStyle="display:none;" cssClass="mtother"></s:textfield>
										<script type="text/javascript">
											var id="${id}";
											if(id!=null&&id!=""){
												var type="${monDiseaseType}";
												if(type=="1"){
													$(".msickList").show();
													$("[name=moDiseaseIds]").each(function(i){
														if($(this).attr("checked")){
															var b=$(this).val();
															if($(this).attr("value")=="4"){
																$(".mtcancer").show();
																}
															if($(this).attr("value")=="8"){
																$(".mtoccupDis").show();
																}
															if($(this).attr("value")=="9"){
																$(".mtother").show();
																}
															}
														
														});
												}
											}
										</script>
								</div>
								</td>
							</tr>

							<tr>
								<td colspan="14" class="sick">
									兄弟姐妹：&nbsp;
									<s:radio cssClass="brosickRadio" name="broDiseaseType"
										list="#{0:'无',1:'有'}"></s:radio>
									<div class="brosickList" style="display: none;">
										<input type="checkbox" name="broDiseaseIds" value="0" <s:property value="%{0 in broDiseaseIds ? 'checked' : ''}"/>/> 高血压
										<input type="checkbox" name="broDiseaseIds" value="1" <s:property value="%{1 in broDiseaseIds ? 'checked' : ''}"/>> 糖尿病
										<input type="checkbox" name="broDiseaseIds" value="2" <s:property value="%{2 in broDiseaseIds ? 'checked' : ''}"/>> 
										冠心病
										<input type="checkbox" name="broDiseaseIds" value="3" <s:property value="%{3 in broDiseaseIds ? 'checked' : ''}"/>> 
										慢性阻塞性肺疾病
										<input type="checkbox" name="broDiseaseIds" class="brockcancer" value="4" <s:property value="%{4 in broDiseaseIds ? 'checked' : ''}"/>> 
										恶性肿瘤
										<s:textfield name="broDiseaseCancerString" cssStyle="display:none;" cssClass="brotcancer"></s:textfield>
										<input type="checkbox" name="broDiseaseIds" value="5" <s:property value="%{5 in broDiseaseIds ? 'checked' : ''}"/>>										 
										重性精神疾病
										<input type="checkbox" name="broDiseaseIds" value="6" <s:property value="%{6 in broDiseaseIds ? 'checked' : ''}"/>> 
										
										肝炎
										<input type="checkbox" name="broDiseaseIds" value="7" <s:property value="%{7 in broDiseaseIds ? 'checked' : ''}"/>>
										其他法定传染病
										<input type="checkbox" class="brockoccupDis" name="broDiseaseIds" value="8" <s:property value="%{8 in broDiseaseIds ? 'checked' : ''}"/>>
										职业病
										<s:textfield name="broDiseaseOccupString" cssStyle="display:none;" cssClass="brotoccupDis"></s:textfield>
										<input type="checkbox" class="brockother" name="broDiseaseIds" value="9" <s:property value="%{9 in broDiseaseIds ? 'checked' : ''}"/>>
										其他
										<s:textfield name="broDiseaseOtherString" cssStyle="display:none;" cssClass="brotother"></s:textfield>
										<script type="text/javascript">
											var id="${id}";
											if(id!=null&&id!=""){
												var type="${broDiseaseType}";
												if(type=="1"){
													$(".brosickList").show();
													$("[name=broDiseaseIds]").each(function(i){
														if($(this).attr("checked")){
															if($(this).val()=="4"){
																$(".brotcancer").show();
																}
															if($(this).attr("value")=="8"){
																$(".brotoccupDis").show();
																}
															if($(this).attr("value")=="9"){
																$(".brotother").show();
																}
															}
														
														});
												}
											}
										</script>
									</div>

								</td>
							</tr>

							<tr>
								<td colspan="14" class="sick">
									子女：&nbsp;&nbsp;&nbsp;
									<s:radio cssClass="childsickRadio" name="childDiseaseType"
										list="#{0:'无',1:'有'}"></s:radio>
									<div class="childsickList" style="display: none;">
										<input type="checkbox" name="childDiseaseIds" value="0" <s:property value="%{0 in childDiseaseIds ? 'checked' : ''}"/>/> 高血压
										<input type="checkbox" name="childDiseaseIds" value="1" <s:property value="%{1 in childDiseaseIds ? 'checked' : ''}"/>> 糖尿病
										<input type="checkbox" name="childDiseaseIds" value="2" <s:property value="%{2 in childDiseaseIds ? 'checked' : ''}"/>> 
										冠心病
										<input type="checkbox" name="childDiseaseIds" value="3" <s:property value="%{3 in childDiseaseIds ? 'checked' : ''}"/>> 
										慢性阻塞性肺疾病
										<input type="checkbox" name="childDiseaseIds" class="childckcancer" value="4" <s:property value="%{4 in childDiseaseIds ? 'checked' : ''}"/>> 
										恶性肿瘤
										<s:textfield name="childDiseaseCancerString" cssStyle="display:none;" cssClass="childtcancer"></s:textfield>
										<input type="checkbox" name="childDiseaseIds" value="5" <s:property value="%{5 in childDiseaseIds ? 'checked' : ''}"/>>										
										重性精神疾病
										<input type="checkbox" name="childDiseaseIds" value="6" <s:property value="%{6 in childDiseaseIds ? 'checked' : ''}"/>> 
										肝炎
										<input type="checkbox" name="childDiseaseIds" value="7" <s:property value="%{7 in childDiseaseIds ? 'checked' : ''}"/>>
										其他法定传染病
										<input type="checkbox" class="childckoccupDis" name="childDiseaseIds" value="8" <s:property value="%{8 in childDiseaseIds ? 'checked' : ''}"/>>
										职业病
										<s:textfield name="childDiseaseOccupString" cssStyle="display:none;" cssClass="childtoccupDis"></s:textfield>
										<input type="checkbox" class="childckother" name="childDiseaseIds" value="9" <s:property value="%{9 in childDiseaseIds ? 'checked' : ''}"/>>
										其他
										<s:textfield name="childDiseaseOtherString" cssStyle="display:none;" cssClass="childtother"></s:textfield>
										<script type="text/javascript">
											var id="${id}";
											if(id!=null&&id!=""){
												var type="${childDiseaseType}";
												if(type=="1"){
													$(".childsickList").show();
													$("[name=childDiseaseIds]").each(function(i){
														if($(this).attr("checked")){
															if($(this).val()=="4"){
																$(".childtcancer").show();
																}
															if($(this).attr("value")=="8"){
																$(".childtoccupDis").show();
																}
															if($(this).attr("value")=="9"){
																$(".childtother").show();
																}
															}
														
														});
												}
											}})
										</script>
										
									</div>

								</td>
							</tr>
							<!-- 残疾状况 -->
							<tr>
								<td colspan="7" class="disabled">
									残疾情况：&nbsp;
									<s:radio name="disabledType" cssClass="disabledRatio" list="#{0:'无',1:'有'}"></s:radio>
									<div class="disabledList" style="display: none">
										<input type="checkbox" name="disabledIds" value="1" <s:property value="%{1 in disabledIds ? 'checked':''} "/>/>视力残疾
										<input type="checkbox" name="disabledIds" value="2" <s:property value="%{2 in disabledIds ? 'checked':''}"/>>听力残疾
										<input type="checkbox" name="disabledIds" value="3" <s:property value="%{3 in disabledIds ? 'checked':''}"/>>言语残疾
										<input type="checkbox" name="disabledIds" value="4" <s:property value="%{4 in disabledIds ? 'checked':''}"/>>肢体残疾
										<input type="checkbox" name="disabledIds" value="5" <s:property value="%{5 in disabledIds ? 'checked':''}"/>>智力残疾
										<input type="checkbox" name="disabledIds" value="6" class="disckother" <s:property value="%{2 in disabledIds ? 'checked':''}"/>>
										<s:checkbox name="disabledIds" fieldValue="6" cssClass="disckother"></s:checkbox>其他残疾
										<s:textfield name="disabledOhterString" cssStyle="display:none;" cssClass="distother"></s:textfield>
									</div>
								</td>
							</tr>

							<tr>
								<td>
									<div class="pdl">
										厨房排风设施：
									</div>
									<div class="pdr">
										<s:select name="kitchenEquiType" list="#{0:'无',1:'油烟机',2:'换气扇',3:'烟囱'}" theme="simple"></s:select>
									</div>
								</td>
								<td>
									<div class="pdl">
										燃料类型：
									</div>
									<div class="pdr">
										<s:select name="fuelType" list="#{0:'液化气',1:'煤',2:'天然气',3:'沼气',4:'柴火',5:'其他'}"></s:select>
									</div>
								</td>
								<td>
									<div class="pdl">
										饮水：
									</div>
									<div class="pdr">
										<s:select name="waterType" list="#{1:'自来水',2:'经过净化过滤的水',3:'井水',4:'河湖水',5:'塘水',6:'其他'}"></s:select>
									</div>
								</td>
								<td>
									<div class="pdl">
										厕所：
									</div>
									<div class="pdr">
										<s:select name="wcType" list="#{0:'卫生厕所',1:'一格或两格粪池式',2:'马桶',3:'露天粪坑',4:'简易棚厕',5:'其他'}"></s:select>
									</div>
								</td>
								<td>
									<div class="pdl">
										禽畜栏：
									</div>
									<div class="pdr">
										<s:select name="animalType" list="#{0:'单设',1:'室内',2:'室外',3:'沼气'}"></s:select>
									</div>
								</td>
							</tr>

						</table>
					</div>
				</div>

				<!-- 表单操作 -->
				<div id="InputDetailBar">
					<input type="image"
						src="${pageContext.request.contextPath}/style/images/save.png" />
					<a href="javascript:history.go(-1);"><img
							src="${pageContext.request.contextPath}/style/images/goBack.png" />
					</a>
				</div>
			</s:form>
		</div>
		

	</body>
</html>
