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
    .piebox{height:320px;padding:10px}
    .pie{box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);width:100%;height:100%;}
</style>
<body>
    <div class="layui-row ">
        <div class="piebox layui-col-xs4 ">
            <div class="pie" id="chart-allowance"></div>
        </div>
        <div class="piebox layui-col-xs4 ">
            <div class="pie" id="chart-safe"></div>
        </div>
        <div class="piebox layui-col-xs4 ">
            <div class="pie" id="chart-isoc"></div>
        </div>
    </div>

    <div class="layui-row marT-10">

      <%--  <div class="piebox layui-col-xs4">
            <div class="pie" id="chart-record"></div>
        </div>--%>

        <div class="piebox layui-col-xs12 ">
            <div class="pie" id="chart-total"></div>
        </div>


    </div>
<%@ include file="../system/index/foot.jsp" %>
<script type="text/javascript">
    var area_code=${pd.xzqh};
    $(function(){
        $(".piebox").each(function(){
            var h=$("body").height() /2-30;
            $(this).css("height",h)
        });

        var g_charts = [];
        $(window).on('resize', LLW.later(function(){
            $.each(g_charts, function(idx, chart){
                chart.resize();
            });
        }, 100));

        //总体统计(柱状图)
        function loadcharttotal( opt ){
            var charttotal = echarts.init($(opt.selector).get(0), 'walden');
            var option = {
                title: {
                    text: opt.title,
                    top: '10px',
                    left: '25px'
                },
                backgroundColor:"#fff",
                tooltip: {},
                legend: {
                    show: false,
                    data: ['人数']
                },
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
                        textStyle: {
                            color: '#000'
                        },
                        formatter: '{value} '+ opt.unit
                    }
                },
                series: [{
                    name: '人数',
                    type: 'bar',
                    barCategoryGap: '50%',
                    data: opt.data,
                    label: {
                        normal: {
                            show: true,
                            formatter:function(opt) {
                                if (opt.value == 0) {
                                    return ""
                                } else {
                                    return opt.value
                                }
                            }
                        }
                    },
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        },
                        normal:{
                            color:function(params){
                                return "rgb("+parseInt(Math.random()*100+150)+","+parseInt(Math.random()*100+150)+","+parseInt(Math.random()*100+150)+")"
                            }
                        }

                    }
                }]
            };

            // 使用刚指定的配置项和数据显示图表。
            charttotal.setOption(option);
            g_charts.push(charttotal);
            return charttotal;
        }

        //各类型统计(饼状图)
        function loadchartpie( opt ){
            var chart = echarts.init($(opt.selector).get(0), 'walden');
            var legend= []
            $.each(opt.data,function(){
                legend.push(this).name;
            })
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
                    data:legend,
                    textStyle:{
                        color:"#000"
                    }
                },
                series : [{
                    name: opt.title,
                    type: 'pie',
                    radius : '60%',
                    radius: "50%",
                    data: opt.data,
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        },
                        normal:{
                        	label:{
                        		formatter:' {d}%'
                        	}
                        }
                    }
                }]
            };

            // 使用刚指定的配置项和数据显示图表。
            chart.setOption(option);
            g_charts.push(chart);
            return chart;
        }

        loadcharttotal({
            selector: '#chart-total',
            title: '总体分析（老龄总人口数 人）',
            header: [],
            unit: '人',
            data: []
        });

        loadchartpie({
            selector: '#chart-allowance',
            title: '高龄津贴发放占比',
            unit: '人',
            data: [
                {value:0, name:'未发放'},
                {value:0, name:'已发放人数'}
            ]
        });
        loadchartpie({
            selector: '#chart-safe',
            title: '意外伤害保险购买占比',
            unit: '人',
            data: [
                {value:0, name:'未购买'},
                {value:0, name:'购买人数'}
            ]
        });
        loadchartpie({
            selector: '#chart-isoc',
            title: '老年协会参与占比',
            unit: '人',
            data: [
                {value:0, name:'未参与'},
                {value:0, name:'参与人数'}
            ]
        });

        $.post("<%=basePath%>fixedStatistics/oldManIndexReport",{areaCode:area_code}, function( res ){
            // console.log(res);
            if( 10000 === res.code && res.data ){
                var header, data, total;
                header = res.data.name.slice(1);
                data = res.data.value.slice(1);
                total = res.data.value[0];
                loadcharttotal({
                    selector: '#chart-total',
                    title: '总体分析（老龄总人口数 '+ total +'人）',
                    header: header,
                    unit: '人',
                    data: data
                });

                loadchartpie({
                    selector: '#chart-allowance',
                    title: '高龄津贴发放占比',
                    unit: '人',
                    data: [
                        {value:total-data[0], name:'未发放'},
                        {value:data[0], name:'已发放人数'}
                    ]
                });
                loadchartpie({
                    selector: '#chart-safe',
                    title: '意外伤害保险购买占比',
                    unit: '人',
                    data: [
                        {value:total-data[1], name:'未购买'},
                        {value:data[1], name:'购买人数'}
                    ]
                });
                loadchartpie({
                    selector: '#chart-isoc',
                    title: '老年协会参与占比',
                    unit: '人',
                    data: [
                        {value:total-data[2], name:'未参与'},
                        {value:data[2], name:'参与人数'}
                    ]
                });
               /* loadchartpie({
                    selector: '#chart-record',
                    title: '建立健康档案占比',
                    unit: '人',
                    data: [
                        {value:total-data[3], name:'未建'},
                        {value:data[3], name:'已建人数'}
                    ]
                });*/
            }
        });
    })

</script>
</body>
</html>