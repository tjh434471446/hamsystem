<%@page import="javax.swing.text.Document"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String basePath = "${pageContext.request.contextPath}";
%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Highcharts Example</title>

		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
		<script src="http://code.highcharts.com/highcharts.js"></script>
		<script src="http://code.highcharts.com/modules/exporting.js"></script>
		<script type="text/javascript">
$(function () {
    var chart;
 	var strTime = "${strTime}";
    var strSS = "${strSS}";
    var strSZ = "${strSZ}";
    var graphWid = "${graphWid}";
    var ssList = "${ssList}";
    var szList = "${szList}";
    var timeList = "${timeList}";
    var timeArr = "${timeArr}";
    var ssArr = "${ssArr}";
    var szArr = "${sz}";
    var jsonData = "${jsonData}";
     alert(jsonData);
    alert(ssArr);
    alert(szArr);
    alert(graphWid); 
    $(document).ready(function() {
        chart = new Highcharts.Chart({
			chart: {
                renderTo: 'container',
				alignTicks: false
                //type: 'spline'
            },
            title: {
			   text: ''
            },
            subtitle: {
				text: ''
            },
			credits: {
				text: '',
				href: '<%=basePath%>/bloodPressure_!wave.action'
        	},
        xAxis: {         
			categories: timeArr,
			tickmarkPlacement: 'on'
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
				data: ssArr,
				color: Highcharts.getOptions().colors[1]        
        }, {
				name: '舒张压',
				type: 'spline',
                marker: {
                    symbol: 'circle'
                },
				
				data: szArr,
				color: Highcharts.getOptions().colors[2] 
        }],
		exporting: {
            enabled: false
        }
        });
    });
    
}); 
		</script>
		
		
	</head>
	<body>

<div id="container" style="min-width: eval(graphWid); height: 300px; margin: 0 auto">

</div>
	</body>
</html>
