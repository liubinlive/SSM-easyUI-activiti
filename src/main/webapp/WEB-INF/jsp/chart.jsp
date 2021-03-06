<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../include/easyui_core.jsp"%>
</head>
<script type="text/javascript">
$(function () {
	$.ajax({
		url:path+'/charinfo.do',
		type:'post',
		dataType:'json',
		success:function(data){
			getinfo(data.naninfo,data.nvinfo);
		},
		error:function(){
			alert('请求失败!');
		}
	});
});
function getinfo(naninfo,nvinfo){
	  $('#container').highcharts({
		  chart: {  
	            renderTo: 'container',  
	            defaultSeriesType: 'areaspline', //图表类型 line, spline, area, areaspline, column, bar, pie , column，scatter  
	            inverted: false //左右显示，默认上下正向。假如设置为true，则横纵坐标调换位置  
	        },credits:{
	            enabled:false // 禁用版权信息
	        }
  
		  /* chart: {
	            type: 'column'
	        } */,
	        title: {
	            text: '2017每月入职人数'
	        },
	        subtitle: {
	            text: '数据来源: 数据库'
	        },
	        xAxis: {
	            categories: [
	                '一月',
	                '二月',
	                '三月',
	                '四月',
	                '五月',
	                '六月',
	                '七月',
	                '八月',
	                '九月',
	                '十月',
	                '十一月',
	                '十二月'
	            ],
	            crosshair: true
	        },
	        yAxis: {
	            min: 0,
	            title: {
	                text: '人数(个)'
	            }
	        },
	        tooltip: {
	            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
	            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
	            '<td style="padding:0"><b>{point.y:.1f} 个</b></td></tr>',
	            footerFormat: '</table>',
	            shared: true,
	            useHTML: true
	        },
	        plotOptions: {
	            column: {
	                pointPadding: 0.2,
	                borderWidth: 0
	            }
	        },
	        series: [{
	            name: '男生',
	            data: naninfo
	        }, {
	            name: '女生',
	            data: nvinfo
	        }]
	    });
}
</script>
<body>
<center>
<div id="container" style="max-width:800px;height:400px"></div>
</center>
</body>
</html>