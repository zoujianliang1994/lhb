<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>数据分析情况</title>
	<%@ include file="../system/index/headcss.jsp" %>
</head>
<style>
	.chartBox{height:320px;padding:10px;}
	.box,.piebox{box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);height:100%}
</style>
<script type="text/javascript" src="<%=basePath%>static/source/public/js/avalon.js"></script>
<body style="background:#fff">
<div >
	<div class="tableBox ms-controller" ms-controller="pieCharts">
		<div class="layui-row  padB-20" ms-for="(inedx,item) in @list">
			<div  class="chartBox layui-col-xs4" ms-for="(inedx,jtem) in item" >
				<div class="piebox"  >

				</div>
			</div>
		</div>

		<div class="layui-row padB-20">
			<div class="chartBox">
				<div class="box "  id="barCharts">

				</div>
			</div>
		</div>
	</div>
</div>




<%@ include file="../system/index/foot.jsp" %>

<script type="text/javascript">

    avalon.ready(function(){
        var g_charts=[];
        var vm= avalon.define({
            $id: "pieCharts",
			length:2,
			list:[]

        })
        avalon.scan(document.body)

        //获取数据
        $.get("<%=basePath%>customReportStatis/reportPieOrColumn?"+'${reportWhere}',function(data){
			if(data.code==10000){
                var histogram= data.data.histogram;
                var pieResult= data.data.pieResult;
                getList(pieResult)
                randerPieChart(pieResult)
                loadcharttotal({
                    selector: 'barCharts',
                    title: histogram.title+"人口总体分析图表",
                    header: histogram.nameData,
                    unit: '人',
                    data:histogram.valueData
				})
			}else{
			    layer.msg(data.desc,{icon:2})
			}
        })


        //总体统计(柱状图)
        function loadcharttotal( opt ){
            var myChart = echarts.init(document.getElementById(opt.selector),'walden');
            var option = {
                title: {
                    text: opt.title,
                    top: '10px',
                    left: '25px'
                },
                backgroundColor:"#fff",
                toolbox: {
                    show:true,
                    right:"20px",
                    // y: 'bottom',
                    feature: {
                        saveAsImage: {
                            pixelRatio: 1
                        }
                    }
                },
                tooltip:{
                    formatter:function(opt){

						return opt.name+"<br/>"+opt.seriesName+":"+opt.data+"人"
					}
                },
                grid: {
                    left: '80px'
                },
                xAxis: {
                    data: opt.header,
                    axisTick: {
                        show: true,
                        alignWithLabel: true
                    },
                    axisLabel: {
                        interval: 0,
                        textStyle: {
                            color: '#000'
                        }
                    }
                },
                yAxis: {
                    axisLabel: {
                        formatter: '{value} '+ opt.unit,
                        textStyle: {
                            color: '#000'
                        }
                    }
                },
                series:  {
                    name:'人数',
                    type:'bar',
                    barWidth: '60%',
                    label: {
                        normal: {
                            show: true,
                            formatter:function(opt) {
                                if (opt.value == 0) {
                                    return ""
                                } else {
                                    return opt.value
                                }
                            },
                        }
                    },
                    itemStyle: {
                        normal:{
                            color:function(params){
                                return "rgb("+parseInt(Math.random()*100+150)+","+parseInt(Math.random()*100+150)+","+parseInt(Math.random()*100+150)+")"
                            }
                        }

                    },
                    data:opt.data
                }
            };
            myChart.setOption(option);
            g_charts.push(myChart)
        }
        //各类型统计(饼状图)
        function loadchartpie( opt ){
            var myChart = echarts.init(opt.selector[0],'walden');
            var option = {
                title: {
                    text: opt.title,
                    top: '10px',
                    left: '10px'
                },
                backgroundColor:"#fff",
                toolbox: {
                    show:true,
                    right:"20px",
                    // y: 'bottom',
                    feature: {
                        saveAsImage: {
                            pixelRatio: 1
                        }
                    }
                },
                tooltip : {
                    trigger: 'item',
                    formatter: '{a} <br/>{b} : {c} '+ opt.unit +'({d}%)'
                },
                legend: {
                    orient: 'vertical',
                    bottom:"10px",
                    x: 'right',
                    data:opt.legend,
                    textStyle:{
                        color:"#000"
                    }
                },
               /* graphic:{
					type:"text",
					left:"center",
					top:"center",
					style:{
						text:"awdawdawdaw1"
					}
				},*/
                series : [{
                    name: opt.title,
                    type: 'pie',
                    radius: "50%",
                    data: opt.data,
                    itemStyle: {
                        emphasis: {
                            show: true,
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        },
                        normal:{
                        	label:{
                        		formatter:'{d}%'
                        	}
                        }
                        
                    }
                }]
            };

            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
            g_charts.push(myChart)
        }
        //渲染饼图框

		var pirArr=[
			{title:"总人数男女占比",legend:["男","女"],data:[
                {value:9, name:'男'},
                {value:6, name:'女'}
			]},
            {title:"80-90岁男女占比",legend:["男","女"],data:[
                {value:0, name:'男'},
                {value:2, name:'女'}
            ]},
		]
        function getList(arr){
            var list=[];
			vm.length= arr.length;
            var length= vm.length;
            for(var i=0;i<length;i++){
                if(i%3 == 0){
                    list.push([])
                }
                var index= parseInt(i/3)
                list[index].push([])
            }
            vm.list= list;
		}
		function randerPieChart(pirArr){

            $(".piebox").each(function(index){
                var legend=[];
                $.each(pirArr[index].data,function(){
                    legend.push(this.name)
				})
                loadchartpie({
                    selector: $(this),
                    title: pirArr[index].title,
                    unit: '人',
                    legend:legend,
                    data: pirArr[index].data
                });
            })
		}
        $(window).on('resize', LLW.later(function(){
            $.each(g_charts, function(idx, chart){
                chart.resize();
            });
        }, 100));
    })



</script>
</body>
</html>