<%@page import="javax.swing.text.Document"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String basePath = "${pageContext.request.contextPath}";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Highcharts Example</title>
	<script type="text/javascript" src="<%=basePath %>/script/yang_js/jquery.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script src="http://code.highcharts.com/highcharts.js"></script>
	<script src="http://code.highcharts.com/modules/exporting.js"></script>
	
</head>
<body>
<div id="container"></div>
</body>
<script type="text/javascript">
$(function(){
        var time = new Array();
    	var ss = new Array();
	    var sz = new Array();
	    alert("ddd");
        $.ajax({
                type:"POST",
                url:"<%=basePath%>/bloodPressure_!wave.action",
                dataType:"json",
                //data:{"id":id}, 
                async:false,
                success:function(jsonArray){     
                alert("eee");
                //alert(data[0]);
                var data = eval(jsonArray);
                //console.info(data);
                alert("aaa");
                alert(jsonArray);
                
                        //对数据进行加工处理，也可以按你自己的需求进行处理
                        if(data!=null && data.length != 0){
                        	alert("bbb");
                                for(var i=0;i<data.length;i++){
                                        time.push(data[i].time);
                                        //也可以在对数据的处理放在highchart 中进行处理。
                                        ss.push(parseFloat(data[i].ss));
                                        sz.push(parseFloat(data[i].sz));
                                }   
//                                 chart1.series[0].setData(time);
//                                 chart1.series[1].setData(ss);
//                                 chart1.series[2].setData(sz); 

						//alert(${jsonData});    
                        }                     
                },
                error:function(e){
                	alert("出错");
                }

        },'json');
        alert("ccc");
        console.info(time);
        console.info(ss);
        console.info(sz);
        //开始绘制图表
        var chart1 = new Highcharts.Chart({
               chart: {
                        renderTo: 'container',        //容器名，和body部分的div id要一致
                        type: 'spline'                                //图表类型，这里选择折线图
                },
                title: {
                        text: ''
                },
                xAxis: {
                        //此处即是上面声明在函数中的数组对象。
                        categories: time
                },
                yAxis: {
                        title: {
                                text: ''
                        },
                        tickInterval:3,
                        min:0.0,
                        plotLines: [{
                                value: 0,
                                width: 1,
                                color: '#808080'
                        }]
                        
                },
                tooltip: {
                        valueSuffix: ' Point'
                },
                legend: {
                        enabled:false
                },
                series: [{
                        name: '收缩压',
                        //声明在当前函数中的数组对象
                        data: ss
                },
                {
                        name: '舒张压',
                        //声明在当前函数中的数组对象
                        data: sz
                }]
// 		exporting: {
//             enabled: false
//         }
        });
});

</script>
</html>