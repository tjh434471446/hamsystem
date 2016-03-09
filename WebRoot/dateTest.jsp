<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<body>
	<select name="first" id="first" onchange="change(this.value)">
		<option value="1" selected="selected">中国</option>
		<option value="2">美国</option>
		<option value="3">日本</option>
	</select>
	<div id="output"></div>
	<script type="text/javascript">
	//定义XMLHttpRequest对象
	var xmlrequest;
	//完成XMLHttpRequest对象的初始化
	function createXMLHttpRequest(){
		if(window.XMLHttpRequest){
				//DOM2游览器
			xmlrequest= new XMLHttpRequest();
			}else if (window.ActiveXobject) {
				//IE游览器
				try {
					xmlrequest=new ActiveXobject("Msxm12.XMLHTTP")
				} catch (e) {
					try {
						xmlrequest=new ActiveXobject("Microsoft.XMLHttp")
					} catch (e) {
						// TODO: handle exception
					}
				}
			}
		}
	
	function change(id){
		//初始化XMLHttpRequest对象
		createXMLHttpRequest();
		//设置请求响应的url
		var url="second.jsp?id="+id;
		//打开与服务器响应地址的连接
		xmlrequest.open("POST",url,true);
		//设置请求头
		xmlrequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		//设置处理响应的会掉函数
		xmlrequest.onreadystatechange=processResponse;
		xmlrequest.send(null);
		
	}
	function processResponse(){
		if(xmlrequest.readystate==4){
			if (xmlrequest.status==200) {
				var headers=xmlrequest.getAllResponseHeader();
				alert("响应头类型"+typeof headers+"\n"+headers);
				document.getElementById("output").innerHTML=headers;
				
				}else{
					window.alert("请求异常");
					}
			}
		}
	
	</script>
</body>


</html>