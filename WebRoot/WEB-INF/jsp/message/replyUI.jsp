<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>留言</title>
   	<%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
</head>
<body>

<!-- 标题显示 -->
<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/style/images/title_arrow.gif"/> 回复留言
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<!--显示表单内容-->
<div id=MainArea>

    <s:form action="messageText_add" >    	
        
        <div class="ItemBlock_Title1"><!-- 信息说明 --><div class="ItemBlock_Title1">
        	<img border="0" width="4" height="7" src="${pageContext.request.contextPath}/style/blue/images/item_point.gif" /> 请留言 </div> 
        </div>
        
        <!-- 表单内容显示 -->      
         <!-- 隐藏信息状态，状态0为未查看，1为已查看 -->
         <s:hidden name="state" value="0" />
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">
                    <tr><td>收件人</td>
                       <td>	
                         <s:hidden name="receiverId" value="%{#messageText.receiver.id}"/>                        
                         <s:property value="#messageText.receiver.name" />						
					   </td>
                    </tr>
                    <tr><td>主题</td>
                        <td>		
						 <s:textfield name="title" readonly="true" >
						 	<s:param name="value">${messageText.title}</s:param>
						 </s:textfield>						
					   </td>
                    </tr>                   					
                    <tr><td>内容</td>
                        <td><s:textarea name="content" cssClass="TextareaStyle"></s:textarea></td>
                    </tr>
                </table>             
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
