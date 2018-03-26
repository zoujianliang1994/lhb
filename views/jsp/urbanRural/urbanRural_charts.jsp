﻿
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>城乡老年人口比例分析</title>
    <%@ include file="../system/index/headcss.jsp" %>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/source/public/css/report_edit_head.css">
    <style>
        .tableBox {
            background: #fff
        }

        .chartBox {
            height: 320px;
            padding: 10px;
        }

        .box, .piebox {
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            height: 100%
        }
    </style>
</head>
<body>
<div class="tableBox " ms-controller="pieCharts">
    <div class="layui-row  padB-20">
        <div class="chartBox layui-col-xs5">
            <div class="piebox" id="piebox">

            </div>
        </div>
    </div>

    <div class="layui-row padB-20">
        <div class="chartBox">
            <div class="box " id="barCharts">

            </div>
        </div>
    </div>
</div>
<%@ include file="../system/index/foot.jsp" %>
<script>

    $(function () {
        //总体统计(柱状图)

        var nameData = ["户籍人口总数", "城市人口总数", "农村人口总数"];
        var pirArr = [];
        var data = [];
        var type = '${pd.type}';

        if ("3" == type) {
            pirArr = [{value: 500000, name: '户籍人口总数'}, {value: 300000, name: '城市人口总数'}, {value: 200000, name: '农村人口总数'}];
            data = [500000, 300000, 200000];
        } else if ("2" == type) {
            pirArr = [{value: 3000000, name: '户籍人口总数'}, {value: 1200000, name: '城市人口总数'}, {value: 1800000, name: '农村人口总数'}];
            data = [3000000, 1200000, 1800000];
        } else {
            pirArr = [{value: 100000, name: '户籍人口总数'}, {value: 60000, name: '城市人口总数'}, {value: 40000, name: '农村人口总数'}];
            data = [100000, 60000, 40000];
        }

        loadcharttotal({
            selector: 'barCharts',
            title: '城乡老年人口比例分析柱状图',
            header: nameData,
            unit: '人',
            data: data
        })

        loadchartpie({
            selector: $("#piebox"),
            title: '城乡老年人口比例分析饼图',
            unit: '人',
            legend: nameData,
            data: pirArr
        });


        //总体统计(柱状图)
        function loadcharttotal(opt) {
            var myChart = echarts.init(document.getElementById(opt.selector), 'walden');
            var option = {
                title: {
                    text: opt.title,
                    top: '10px',
                    left: '25px'
                },
                backgroundColor: "#fff",
                toolbox: {
                    show: true,
                    right: "20px",
                    feature: {
                        saveAsImage: {
                            pixelRatio: 1
                        }
                    }
                },
                tooltip: {
                    formatter: function (opt) {
                        return opt.name + "<br/>" + opt.seriesName + ":" + opt.data + "人"
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
                        formatter: '{value} ' + opt.unit,
                        textStyle: {
                            color: '#000'
                        }
                    }
                },
                series: {
                    name: '人数',
                    type: 'bar',
                    barWidth: '60%',
                    label: {
                        normal: {
                            show: true,
                            formatter: function (opt) {
                                if (opt.value == 0) {
                                    return ""
                                } else {
                                    return opt.value
                                }
                            },
                        }
                    },
                    itemStyle: {
                        normal: {
                            color: function (params) {
                                return "rgb(" + parseInt(Math.random() * 100 + 150) + "," + parseInt(Math.random() * 100 + 150) + "," + parseInt(Math.random() * 100 + 150) + ")"
                            }
                        }

                    },
                    data: opt.data
                }
            };
            myChart.setOption(option);

            $(window).on('resize', function () {
                myChart.resize();
            })
        }

        //各类型统计(饼状图)
        function loadchartpie(opt) {
            var myChart = echarts.init(opt.selector[0], 'walden');
            var option = {
                title: {
                    text: opt.title,
                    top: '10px',
                    left: '10px'
                },
                backgroundColor: "#fff",
                toolbox: {
                    show: true,
                    right: "20px",
                    // y: 'bottom',
                    feature: {
                        saveAsImage: {
                            pixelRatio: 1
                        }
                    }
                },
                tooltip: {
                    trigger: 'item',
                    formatter: '{a} <br/>{b} : {c} ' + opt.unit + '({d}%)'
                },
                legend: {
                    orient: 'vertical',
                    bottom: "10px",
                    x: 'right',
                    data: opt.legend,
                    textStyle: {
                        color: "#000"
                    }
                },
                series: [{
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
                        normal: {
                            label: {
                                formatter: '{d}%'
                            }
                        }

                    }
                }]
            };

            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
            $(window).on('resize', function () {
                myChart.resize();
            })
        }
    })

</script>
</body>

</html>