<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String basePath = "${pageContext.request.contextPath}";
%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Highcharts Example</title>
		<script type="text/javascript" src="${pageContext.request.contextPath}/script/ct_js/js/jquery-1.9.1.min.js"></script>
		<!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script> -->
		<!--highstock可以生成滚动条，highchart不行  -->
		<script type="text/javascript" src="http://code.highcharts.com/stock/highstock.js"></script>
		<!--  <script src="http://code.highcharts.com/highcharts.js"></script>  -->
		<script src="http://code.highcharts.com/modules/exporting.js"></script>
		<script type="text/javascript">
$(function () {
    $(document).ready(function() {
    	var time_start = "${time_start}";
    	var time_end = "${time_end}";
    	var rsaId = "${rsaId}";
    	var time = new Array();
    	var ss = new Array();
	    var sz = new Array();
	    //alert("ddd");
        $.ajax({
                type:"POST",
                //发送请求的URL
                url:"bloodPressure_!wave.action",
                //发送两个参数给action
                data:{"time_start":time_start,"time_end":time_end,"rsaId":rsaId},
                //返回数据类型为json
                dataType:"json",
                //同步
                async:false,
                success:function(showJsonArray){     
                //alert("eee");
                var data = eval(showJsonArray);
                //alert("aaa");
                //alert(data);
                
                        //对数据进行加工处理，也可以按你自己的需求进行处理
//                         if(data!=null && data.length != 0){
//                         	alert("bbb");
//                                 for(var i=0;i<data.length;i++){
//                                         time.push(data[i].time);
 //                                       也可以在对数据的处理放在highchart 中进行处理。
//                                         ss.push(parseFloat(data[i].ss));
//                                         sz.push(parseFloat(data[i].sz));
//                                 }   
//                         }  
                   		  if(data!=null){
                   		  	time = data[0];
                   		  	ss = data[1];
                   		  	sz = data[2];
                   		  }
                },
                error:function(e){
                	alert("出错");
                }

        },'json');
        
        var chart = new Highcharts.Chart({
			chart: {
                renderTo: 'container',
				alignTicks: false,
                type: 'spline'
            },
            title: {
			   text: ''
            },
            subtitle: {
				text: ''
            },
			credits: {
				text: '',
				href: "bloodPressure_!wave.action"
        	},
        xAxis: {         
			categories: time,
			tickmarkPlacement: 'on',
			min:0,
			max:6
        },
		/*legend: {
            enabled: false
        },*/
		legend: {
            align: 'left',
            verticalAlign: 'top',
            x: 0,
            y: 0,
            floating: true
        },
        //设置滚动条
        scrollbar: {
        enabled: true
    	},
    	
		yAxis: [{
			min: 0,
			max: 250,	
			tickInterval: 50,
			labels: {
				enabled: false
			},
			title:{
				text: ''
			},
			gridLineWidth: 0,plotLines: [{   //一条延伸到整个绘图区的线，标志着轴中一个特定值。
                    color: '#ffc000',
                    dashStyle: 'Dash', //Dash,Dot,Solid,默认Solid
                    width: 1,
                    value: 140,  //y轴显示位置
                    zIndex: 0,
					label: {
						text: '140',
						align: 'left',
						x: 0,
						style: {
							color: '#ffc000',
							fontWeight: 'bold'
						}
                    }   
                },{   //一条延伸到整个绘图区的线，标志着轴中一个特定值。
                    color: '#ffc000',
                    dashStyle: 'Dash', //Dash,Dot,Solid,默认Solid
                    width: 1,
                    value: 90,  //y轴显示位置
                    zIndex: 0,
					label: {
						text: '90',
						align: 'left',
						x: 0,
						style: {
							color: '#ffc000',
							fontWeight: 'bold'
						}
                    }  
                },{   //一条延伸到整个绘图区的线，标志着轴中一个特定值。
                    color: '#00c4ee',
                    dashStyle: 'Dash', //Dash,Dot,Solid,默认Solid
                    width: 1,
                    value: 60,  //y轴显示位置
                    zIndex: 0,
					label: {
						text: '60',
						align: 'left',
						x: 0,
						style: {
							color: '#00c4ee',
							fontWeight: 'bold'
						}
                    }  
                }]
		},
		{
			min: 0,
			max: 200,
			tickInterval: 50,
            opposite: true,
			labels: {
				enabled: false
			},
            title: {
                text: ''
            },
			gridLineWidth: 0
		}],
        tooltip: {
			crosshairs: true,
			shared: true
		},
        plotOptions: {
			spline: {
				marker: {
					radius: 4,
					lineColor: '#666666',
					lineWidth: 1
				}
			}
		},

        series: [{
				name: '收缩压',
				type: 'spline',
                marker: {
                    symbol: 'circle'
                },				
				data: ss,
				color: Highcharts.getOptions().colors[1]        
        }, {
				name: '舒张压',
				type: 'spline',
                marker: {
                    symbol: 'circle'
                },
				
				data: sz,
				color: Highcharts.getOptions().colors[2] 
        }],
		exporting: {
            enabled: true
        }
        });
    });
    
}); 
		</script>
		
		
	</head>
	<body>

<div id="container" style="height: 300px; margin: 0 auto">
</div>
	</body>
</html>
