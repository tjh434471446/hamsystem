<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<script type="text/javascript">
  	function addNewPersonRow(){
  		 var bodyObj=document.getElementById("fm2_table_body");  
  		 bodyObj.style.display = '';
  		    if(bodyObj==null)   
  		    {  
  		        alert("Body of Table not Exist!");  
  		        return;  
  		    }  
  		    var rowCount = bodyObj.rows.length;  
  		    var newRow = bodyObj.insertRow(rowCount++);    
  		    var firstCell = newRow.insertCell(0);
  		    var secondCell = newRow.insertCell(1);
  		    //the 6 row codes after this row are format setting, you need not care about them
  		    firstCell.className = "bgc_tt short";  //this is a css
  		    secondCell.className = "bgc_tt short";
  		    firstCell.colSpan = "2";
  		    secondCell.colSpan = "2";
  		    firstCell.style.textAlign = "center";
  		    secondCell.style.textAlign = "center";
  		    firstCell.innerHTML = "<input type='text' name='username'/>";
  		    secondCell.innerHTML="<input type='button' class='button_ty' value='删除' onclick='removeNewPersonRow(this)'/>" ;
  		 }
  	function removeNewPersonRow(inputobj){  
  	    if(inputobj==null) return;  
  	    var parentTD = inputobj.parentNode;  //parentNode是父标签的意思，如果你的TD里用了很多div控制格式，要多调用几次parentNode
  	    var parentTR = parentTD.parentNode;  
  	    var parentTBODY = parentTR.parentNode;  
  	    parentTBODY.removeChild(parentTR);  
  	}
  	</script>
  
  </head>
  
  <body>
  <table id="fm2_table" class="fix_table" border="2">
 <tr>
  <td class="long" colspan="2">
   <h2 align="center">
    新员工
   </h2>
  </td>
  <td class="long" colspan="2">
   <h2 align="center">
    操作
   </h2>
  </td>
 </tr>
 <tbody id="fm2_table_body">
 </tbody>
 <tr>
  <td colspan="4" align="center">
   <input type="button" value="增加新员工" class="button_ty" onclick="addNewPersonRow()" />
  </td>
 </tr>
</table>
  </body>
</html>
