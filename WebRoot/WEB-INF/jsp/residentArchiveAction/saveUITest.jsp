<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
	<title>档案信息</title>
   	<%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
   	<script src="${pageContext.request.contextPath}/script/yunzhu_js/js/selfmessage.js" type="text/javascript" ></script>
   	 <SCRIPT type="text/javascript">
 	//任意点击时关闭该控件 
 	</SCRIPT>
 <script language="javascript" src="${pageContext.request.contextPath}/script/date.js" charset="utf-8"></script>
 
</head>
<body>

<!-- 标题显示 -->
<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/style/images/title_arrow.gif"/> 档案信息
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<!--显示表单内容-->
<div id=MainArea>

    <br><s:form action="archive_%{id == null ? 'add' : 'edit'}">
    	<s:hidden name="id">id</s:hidden>
        <div class="ItemBlock_Title1"><!-- 信息说明 --><div class="ItemBlock_Title1">
        	<img border="0" width="4" height="7" src="${pageContext.request.contextPath}/style/blue/images/item_point.gif" /> 居民档案封面 </div> 
        </div>
        <br>
        <div><span>姓名：吴静南 &nbsp; &nbsp;</span><span>性别：女 &nbsp; &nbsp;</span><span>出生日期：19900305 &nbsp; &nbsp;</span><span>年龄：24 &nbsp; &nbsp;</span><span>责任医生：zs &nbsp; &nbsp;</span><span>疾病史：无 &nbsp;</span></div><br>
        <!-- 表单内容显示 -->
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">
                    <tr>
                    	<td>档案编号</td>
                        <td >
                        <%-- <s:select name="districtInsId" cssClass="SelectStyle"
                        		list="#districtInsList" listKey="id" listValue="name"
                        		headerKey="" headerValue="==请选择机构=="
                        	/> --%>
                        	<s:label name="rsArchiveId" cssStyle="width:160px"></s:label> *自动生成
                        	
                        </td>
                        <td>姓名</td>
                        <td><s:textfield name="name" cssClass="InputStyle" cssStyle="width:160px"/> *</td>
                        <td rowspan="6" width="80">照片&nbsp; </td>
                    </tr>
                    <tr>
                    	<td >现住址</td>
                        <td ><s:textfield name="nowAdr" cssClass="InputStyle" cssStyle="width:160px"/> *
						</td>
						<td >联系电话</td>
                        <td ><s:textfield name="phoneNumber" cssClass="InputStyle" cssStyle="width:160px"/> *
						</td>
                    </tr>
                    <tr>
                    	<td>户籍地址</td>
                        <td ><s:textfield name="addressId" cssClass="InputStyle" cssStyle="width:160px"/> *</td>
                        <td >乡镇街道名称</td>
                        <td>
                        	<s:select name="streetDisId" list="#districtInsList" cssClass="SelectStyle" cssStyle="width:160px"
                        	listKey="id" listValue="name" headerKey="0" headerValue="请选择"
                        	></s:select>
                        *</td>
                    </tr>
					<tr>
						<td>建档单位</td>
                        <td>
                        	<s:select name="archiveDisId" list="#districtInsList" cssClass="SelectStyle" cssStyle="width:160px"
                        	listKey="id" listValue="name" headerKey="0" headerValue="请选择建档单位"
                        	></s:select>
                        *</td>
                        <td>村居委会名称</td>
                        <td><s:textfield name="committee" cssClass="InputStyle" cssStyle="width:160px"/> *</td>
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
						<td>建档人</td>
                        <td><s:textfield name="paperRecorder" cssClass="InputStyle" cssStyle="width:160px"/> *</td>
                        <td>建档日期</td>
                        <td><s:if test="%{achiveDate==null}"><input type="text" name="achiveDate" readOnly onClick="setDay(this);">* 添加后将不可修改</s:if>
                        	<s:else><s:date name="achiveDate" format="yyyy-MM-dd"/></s:else> </td>
                    </tr>
                    <tr>
                    	<td>责任医生</td>
                        <td> <s:select name="doctorId" cssClass="SelectStyle" cssStyle="width:160px"
                        		list="#doctorList" listKey="id" listValue="name"
                        		headerKey="0" headerValue="请选择医生"
                        	/></td>
                        <td>录入员</td>
                        <td><s:select name="recorderId" cssClass="SelectStyle" cssStyle="width:160px"
                        		list="#recorderList" listKey="id" listValue="name"
                        		headerKey="0" headerValue="请选择记录员"
                        	/></td>
                    </tr>
                </table>
            </div>
        </div>
        
		<div class="ItemBlock_Title1"><!-- 信息说明 --><div class="ItemBlock_Title1">
        	<img border="0" width="4" height="7" src="${pageContext.request.contextPath}/style/blue/images/item_point.gif" /> 居民个人信息 </div> 
        </div>
        
        <!-- 居民信息表 -->
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">
                    <tr>
						<td>性别</td>
                        <td>
                        	<%--<s:select name="roleIds" cssClass="SelectStyle"
                        		multiple="true" size="10" 
                        		list="#roleList" listKey="id" listValue="name"
                        	/>--%>
							<s:radio name="gender" list="{'男', '女'}"></s:radio>
                        </td>
                        <td>身份证号</td>
                        <td><s:textfield name="rsId" cssClass="InputStyle" cssStyle="width:130px"/></td>
                        <td>出生日期</td>
                        <td>
                        	<s:if test="%{rsBornDate==null}"><input type="text" name="rsBornDate" readOnly onClick="setDay(this);"> * 添加后将不可修改</s:if>
                        	<s:else><s:date name="rsBornDate" format="yyyy-MM-dd"/></s:else>
                        </td>
                    </tr>
                    
                    <tr>
                    	<td>工作单位</td>
                        <td><s:textfield name="workAddr" cssClass="InputStyle" cssStyle="width:100px"/> </td>
                        <td>联系人姓名</td>
                        <td><s:textfield name="linkManName" cssClass="InputStyle" cssStyle="width:100px"/> </td>
                        <td>联系人电话</td>
                        <td><s:textfield name="loginName" cssClass="InputStyle" cssStyle="width:130px"/></td>
                    </tr>
                    
                    <tr>
                    	<td>常住类型</td>
                        <td>
                        <s:select name="livingType" cssClass="SelectStyle" ssStyle="width:100px"
                        		 list="#{1:'户籍',2:'非户籍'}" listKey="key" listValue="value"
                        		headerKey="0" headerValue="户籍类型"
                        	/>
                        <!-- <div class="pdr"><select><option>户籍</option><option>非户籍</option></select></div> -->
                        </td>
                        <td>民族</td>
                        <td>
                        	<div class="pdr">
                        	<select class="mz" name="nationality">
                        		<option class="few" value="0">汉族</option>
                        		<option class="few" value="1">少数民族</option>
                        	</select>
								<input style="display: none" type="text" name="nationalityString" class="tfew" palceholder="民族名称" size="2px" ></div>
						</td>
                        <td>文化程度</td>
                        <td>
                        	<s:select name="educateType" cssClass="SelectStyle" cssStyle="width:70px"
                        	list="#{1:'文盲及半文盲',2:'小学',3:'初中'}" listKey="key" listValue="value" headerKey="0" headerValue="请选择文化程度"
                        	/>
                        	
                        	<!--  <div class="pdr">
									<select><option>文盲及半文盲</option><option>小学</option><option>初中</option><option>高中/技校/中专</option>
											<option>大学专科及以上</option><option>不详</option>
									</select>
							</div>-->
						</td>
                    </tr>
                    
                    <tr>
                    	<td>血型</td>
                        <td>
                        	<div class="pdr">
                        		<s:select name="bloodType" cssClass="SelectStyle" cssStyle="width:70px"
                        		list="#{1:'A',2:'B',3:'AB'}" listKey="key" listValue="value" headerKey="0" headerValue="选择血型"
                        		/>
								<%--<select><option>A</option><option>B</option><option>O</option>
										<option>AB</option><option>不详</option>
								</select> --%></div>
						</td>
                        <td>RH阴性</td>
                        <td>
                        	<div class="pdr">
                        	<s:select name="rhType" cssClass="SelectStyle" cssStyle="width:60px"
                        		list="#{1:'是',2:'否',3:'不详'}" listKey="key" listValue="value" headerKey="0" headerValue="RH阴性"
                        		/>
							</div>
						</td>
                        <td>职业</td>
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
                    	<td>婚姻状况</td>
                        <td>
                        	<div class="pdr">
                        	<s:select name="workingType" cssClass="SelectStyle" cssStyle="width:160px"
                        		list="#{1:'未婚',2:'已婚',3:'丧偶',4:'未说明婚姻状况'}" listKey="key" listValue="value" headerKey="0" headerValue="婚姻状况"
                        		/>
								
							</div>
						</td>
                    </tr>
                      <tr>
                    	<td>暴露史</td>
                        <td>
                        	<input type="radio" name="radio2" class="exhave" value="0">无
							<input type="radio" name="radio2" class="exhave" value="1" >有
							<div class="expose" style="display:none;">
								<input type="checkbox" name="">化学品<input type="checkbox" name="">毒物
								<input type="checkbox" name="">射线</div>
						</td>
                        <td>遗传病史</td>
                        <td>
							<input type="radio" name="radio3" class="genetic" value="0">无
							<input type="radio" name="radio3" class="genetic" value="1">有
							<div class="pdr">
								<input type="text" name="" class="tgene" placeholder="请输入遗传病" style="display: none"/>
							</div></td>
                        <td>过敏史</td>
						<td>
							<input type="radio" name="radio1" class="allergy" value="0">无
							<input type="radio" name="radio1" class="allergy" value="1">有
							<div class="tallergy" style="display: none">
								<input type="checkbox" name="">青霉素<input type="checkbox" name="">磺胺
								<input type="checkbox" name="">链霉素<input type="checkbox" name="">其他
							</div>
						</td>
                   	 </tr>
                    
                    <!-- 手术输血外伤 -->
                    
                    <tr>
     					<td colspan="4">
							<div class="pullbl">
								<label class="pdl">手术：</label>
								<input type="radio" name="rad_1" value="0" class="rblo">无&nbsp;&nbsp;
								<input type="radio" name="rad_1" value="1" class="rblo">有
								<span  class="blo_1">
									<br/>
									<span  class="tblo" style="display:none;"><input type="text" name="" class="" placeholder="请输入手术名称" size="15px"><input id="calendar-inputField3" size="15px"/>&nbsp;</span> 
								</span>
								<span class="pull-left"><button type="button" class="addblo">添加</button></span><br/>
							</div>
						</td>
  					</tr>
  					
  					<tr>
     					<td colspan="4">
							<div class="pullbl">
								<span  class="blood_1">
									<br/>
									<label class="pdl">输血：</label>
									<input type="radio" name="radio_1" value="0" class="rblood">无&nbsp;&nbsp;
									<input type="radio" name="radio_1" value="1" class="rblood">有
								 	<span  class="tblood" style="display:none;";><input type="text" name="" class="" placeholder="请输入输血的原因" size="15px"><input id="calendar-inputField4" size="15px"/></span> 
								</span>
								<span class="pull-left"><button type="button" class="addblood">添加</button></span>
							</div>
						</td>
  					</tr>
  					
  					 <tr>
     					<td colspan="9">
							<div class="pullbl">
								<span  class="bloo_1">
									<br/>
									<label class="pdl">外伤：</label>
									<input type="radio" name="radi_1" value="0" class="rbloo">无&nbsp;&nbsp;
									<input type="radio" name="radi_1" value="1" class="rbloo">有
									 <span  class="tbloo" style="display:none;"><input type="text" name="" class="" placeholder="请输入手术名称" size="15px"><input id="calendar-inputField3" size="15px"/>&nbsp;</span> 
								</span>
								<span class="pull-left"><button type="button" class="addbloo">添加</button></span>
							</div>
						</td>
  					</tr>
  					
  					<!-- 家族史 -->
  					<tr>
       					<td colspan="14" class="sick">疾病：&nbsp;&nbsp;&nbsp;
	 						<span><input type="checkbox">无</span>
	 						<span><input type="checkbox">高血压</span>
	  						<span><input type="checkbox">糖尿病</span>
	 						<span><input type="checkbox">冠心病</span>
							<span><input type="checkbox">慢性阻塞性肺疾病</span>
	   						<span><input type="checkbox"  class="badc">恶性肿瘤<span  class="badcan"><input type="text" name="" placeholder="请填写肿瘤类型" size="15px"></span></span> 
							<span><input type="checkbox">脑卒中</span>
							<span><input type="checkbox">重性精神疾病</span>
							<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox">结核病</span>
							<span><input type="checkbox">肝炎</span>
	 						<span><input type="checkbox">其他法定传染病</span>
							<span><input type="checkbox" class="pros">职业病
							<span  class="prosick"><input type="text" name="" class="" placeholder="请填写职业病类型" size="15px"></span></span> 
	  						<span><input type="checkbox" class="ots">其他
							<span  class="otsick"><input type="text" name="" class="" placeholder="请填写其他疾病" size="15px"></span></span> 
							
						</td>
					</tr>
  					
  					<tr>
       					<td colspan="14" class="sick">父亲：&nbsp;&nbsp;&nbsp;
	 						<span><input type="checkbox">无</span>
	 						<span><input type="checkbox">高血压</span>
	  						<span><input type="checkbox">糖尿病</span>
	 						<span><input type="checkbox">冠心病</span>
							<span><input type="checkbox">慢性阻塞性肺疾病</span>
	   						<span><input type="checkbox"  class="badc1">恶性肿瘤<span  class="badcan"><input type="text" name="" placeholder="请填写肿瘤类型" size="15px"></span></span> 
							<span><input type="checkbox">脑卒中</span>
							<span><input type="checkbox">重性精神疾病</span>
							<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox">结核病</span>
							<span><input type="checkbox">肝炎</span>
	 						<span><input type="checkbox">其他法定传染病</span>
							<span><input type="checkbox" class="pros1">职业病
							<span  class="prosick"><input type="text" name="" class="" placeholder="请填写职业病类型" size="15px"></span></span> 
	  						<span><input type="checkbox" class="ots1">其他
							<span  class="otsick"><input type="text" name="" class="" placeholder="请填写其他疾病" size="15px"></span></span> 
							
						</td>
					</tr>
  					
  					<tr>
       					<td colspan="14" class="sick">母亲：&nbsp;&nbsp;&nbsp;
	 						<span><input type="checkbox">无</span>
	 						<span><input type="checkbox">高血压</span>
	  						<span><input type="checkbox">糖尿病</span>
	 						<span><input type="checkbox">冠心病</span>
							<span><input type="checkbox">慢性阻塞性肺疾病</span>
	   						<span><input type="checkbox"  class="badc2">恶性肿瘤<span  class="badcan"><input type="text" name="" placeholder="请填写肿瘤类型" size="15px"></span></span> 
							<span><input type="checkbox">脑卒中</span>
							<span><input type="checkbox">重性精神疾病</span>
							<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox">结核病</span>
							<span><input type="checkbox">肝炎</span>
	 						<span><input type="checkbox">其他法定传染病</span>
							<span><input type="checkbox" class="pros2">职业病
							<span  class="prosick"><input type="text" name="" class="" placeholder="请填写职业病类型" size="15px"></span></span> 
	  						<span><input type="checkbox" class="ots2">其他
							<span  class="otsick"><input type="text" name="" class="" placeholder="请填写其他疾病" size="15px"></span></span> 
							
						</td>
					</tr>
  					
  					<tr>
       					<td colspan="14" class="sick">兄弟姐妹：&nbsp;
	 						<span><input type="checkbox">无</span>
	 						<span><input type="checkbox">高血压</span>
	  						<span><input type="checkbox">糖尿病</span>
	 						<span><input type="checkbox">冠心病</span>
							<span><input type="checkbox">慢性阻塞性肺疾病</span>
	   						<span><input type="checkbox"  class="badc3">恶性肿瘤<span  class="badcan"><input type="text" name="" placeholder="请填写肿瘤类型" size="15px"></span></span> 
							<span><input type="checkbox">脑卒中</span>
							<span><input type="checkbox">重性精神疾病</span>
							<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox">结核病</span>
							<span><input type="checkbox">肝炎</span>
	 						<span><input type="checkbox">其他法定传染病</span>
							<span><input type="checkbox" class="pros3">职业病
							<span  class="prosick"><input type="text" name="" class="" placeholder="请填写职业病类型" size="15px"></span></span> 
	  						<span><input type="checkbox" class="ots3">其他
							<span  class="otsick"><input type="text" name="" class="" placeholder="请填写其他疾病" size="15px"></span></span> 
							
						</td>
					</tr>
  					
  					<tr>
       					<td colspan="14" class="sick">子女：&nbsp;&nbsp;&nbsp;
	 						<span><input type="checkbox">无</span>
	 						<span><input type="checkbox">高血压</span>
	  						<span><input type="checkbox">糖尿病</span>
	 						<span><input type="checkbox">冠心病</span>
							<span><input type="checkbox">慢性阻塞性肺疾病</span>
	   						<span><input type="checkbox"  class="badc4">恶性肿瘤<span  class="badcan"><input type="text" name="" placeholder="请填写肿瘤类型" size="15px"></span></span> 
							<span><input type="checkbox">脑卒中</span>
							<span><input type="checkbox">重性精神疾病</span>
							<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox">结核病</span>
							<span><input type="checkbox">肝炎</span>
	 						<span><input type="checkbox">其他法定传染病</span>
							<span><input type="checkbox" class="pros4">职业病
							<span  class="prosick"><input type="text" name="" class="" placeholder="请填写职业病类型" size="15px"></span></span> 
	  						<span><input type="checkbox" class="ots4">其他
							<span  class="otsick"><input type="text" name="" class="" placeholder="请填写其他疾病" size="15px"></span></span> 
							
						</td>
					</tr>
					<!-- 残疾状况 -->
					<tr>
						<td colspan="7" class="disabled">残疾情况：&nbsp;
	   						<span><input type="checkbox">无残疾</span>
							<span><input type="checkbox">视力残疾</span>
							<span><input type="checkbox">听力残疾</span>
							<span><input type="checkbox">言语残疾</span>
							<span><input type="checkbox">肢体残疾</span>
							<span><input type="checkbox">智力残疾</span>	
							<span><input type="checkbox" class="otdis">其他残疾<input type="text" name="" class="otdisabled" placeholder="请填写其他残疾类型"></span>
						</td>
					</tr>
					
					<tr> 
						<td>
							<div class="pdl">厨房排风设施：</div>
							<div class="pdr">
										<select><option>无</option><option>油烟机</option><option>换气扇</option><option>烟囱</option>
										</select>
							</div>
						</td>
						<td>
							<div class="pdl">燃料类型：</div>
							<div class="pdr">
								<select><option>液化气</option><option>煤</option><option>天然气</option>
								<option>沼气</option><option>柴火</option><option>其他</option></select>
							</div>
						</td>
       					<td>
       						<div class="pdl">饮水：</div>
       						<div class="pdr">
								<select><option>自来水</option><option>经净化过滤的水</option>
										<option>井水</option><option>河湖水</option>
										<option>塘水</option><option>其他</option>
								</select>
							</div>
						</td>
						<td>
							<div class="pdl">厕所：</div>
							<div class="pdr">
								<select><option>卫生厕所</option>
										<option>一格或两格粪池式</option>
										<option>马桶</option>
										<option>露天粪坑</option>
										<option>简易棚厕</option>
								</select>
							</div>
						</td>
						<td>
							<div class="pdl">禽畜栏：</div>
							<div class="pdr">
								<select>
									<option>单设</option>
									<option>室内</option>
									<option>室外</option>
							</select>
							</div>
						</td>
					</tr>
    				
                </table>
            </div>
        </div>		
		
        <!-- 表单操作 -->
        <div id="InputDetailBar">
            <input type="image" src="${pageContext.request.contextPath}/style/images/save.png" onclick="return confirm('请确定填好档案单位等信息吗？')"/>
            <a href="javascript:history.go(-1);"><img src="${pageContext.request.contextPath}/style/images/goBack.png"/></a>
        </div>
    </s:form>
</div>

<div class="Description">
	说明：<br />
	1，用户的登录名要唯一，在填写时要同时检测是否可用。<br />
	2，新建用户后，密码被初始化为"1234"。<br />
	3，密码在数据库中存储的是MD5摘要（不是存储明文密码）。<br />
	4，用户登录系统后可以使用“个人设置→修改密码”功能修改密码。<br />
	5，新建用户后，会自动指定默认的头像。用户可以使用“个人设置→个人信息”功能修改自已的头像<br />
	6，修改用户信息时，登录名不可修改。
</div>

</body>
</html>
