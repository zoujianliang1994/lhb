﻿
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>四川省60岁以上人口总量分析</title>
    <%@ include file="../system/index/headcss.jsp" %>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/source/public/css/report_edit_head.css">
    <style>
        .tableBox{background:#fff}
        .chartBox{height:320px;padding:10px;}
        .box,.piebox{box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);height:100%}
    </style>
</head>
<body>
<div class="tableBox " ms-controller="pieCharts">
    <div class="layui-row  padB-20" >
        <div  class="chartBox layui-col-xs5"  >
            <div class="piebox" id="piebox" >

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
<%@ include file="../system/index/foot.jsp" %>
<script>

    $(function(){
        //总体统计(柱状图)

        var nameData=["人口总数","60-64岁以上","65-69岁总人口数","70-79岁总人口数","80-89岁总人口数","90-99岁总人口数","100岁以上总人口数"]
        $.post("<%=basePath%>fixedStatistics/getSixtenReport",{id:"${id}"},function(data){
            console.log(data)
            if(data.code == 10000){
                data= data.data;
                loadcharttotal({
                    selector: 'barCharts',
                    title: data.title,
                    header: nameData,
                    unit: '人',
                    data:data.row
                })

                var pirArr=[];
                $.each(data.row,function(i){
                    if(i==0){
                        return true
                    }
                    pirArr.push({
                        value:data.row[i],
                        name:nameData[i-1]
                    })
                })
                console.log(pirArr)
                loadchartpie({
                    selector: $("#piebox"),
                    title: data.title+"比例分析图表",
                    unit: '人',
                    legend:nameData,
                    data: pirArr
                })
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

            $(window).on('resize',function(){
                myChart.resize();
            })
        }
        //各类型统计(饼状图)
        function loadchartpie( opt ){
            console.log(opt)
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
            $(window).on('resize',function(){
                myChart.resize();
            })
        }
    })

</script>
</body>

</html>