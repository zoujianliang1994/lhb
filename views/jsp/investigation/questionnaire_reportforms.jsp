<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>统计</title>
    <%@ include file="../system/index/headcss.jsp" %>
</head>
<body>
<div class="tableBox">
    <p class="ask-name">问卷名称</p>
    <blockquote class="layui-elem-quote">问卷完成情况统计</blockquote>
    <!-- table -->
    <div class="ask-table">
        <table class="layui-table center" id="ask-table">

            <thead>
            <tr>
                <th>接收单位</th>
                <th>数量</th>

                <th>完成数量</th>
                <th>未完成数量</th>
            </tr>
            </thead>
            <tbody>
                <tr>
                    <td>成都市老龄办</td>
                    <td>1000</td>
                    <td>900</td>
                    <td>100</td>
                </tr>
                <tr>
                    <td>绵阳市老龄办</td>
                    <td>800</td>
                    <td>700</td>
                    <td>100</td>
                </tr>
                <tr>
                    <td>德阳市老龄办</td>
                    <td>600</td>
                    <td>550</td>
                    <td>50</td>
                </tr>
                <tr>
                    <td>乐山市老龄办</td>
                    <td>860</td>
                    <td>730</td>
                    <td>130</td>
                </tr>
            <%--<c:choose>--%>
                <%--<c:when test="${not empty varList}">--%>
                    <%--<shiro:hasPermission name="system:department:select">--%>
                        <%--<c:forEach items="${varList}" var="var" varStatus="vs">--%>
                            <%--<tr>--%>
                                <%--<td>${var.WBDW_SZQY}</td>--%>

                                <%--<td>${var.NAME}</td>--%>

                                <%--<td>${var.ADDRESS}</td>--%>
                                <%--<td>${var.ADDRESS}</td>--%>

                            <%--</tr>--%>
                        <%--</c:forEach>--%>
                    <%--</shiro:hasPermission>--%>
                    <%--<shiro:lacksPermission name="outUnit:select">--%>
                        <%--<tr>--%>
                            <%--<td colspan="100" class="center">您无权查看</td>--%>
                        <%--</tr>--%>
                    <%--</shiro:lacksPermission>--%>
                <%--</c:when>--%>
                <%--<c:otherwise>--%>
                    <%--<tr class="main_info">--%>
                        <%--<td colspan="100" class="center">没有相关数据</td>--%>
                    <%--</tr>--%>
                <%--</c:otherwise>--%>
            <%--</c:choose>--%>
            </tbody>
        </table>

    </div>


    <blockquote class="layui-elem-quote">题目选项统计</blockquote>
    <div class="operationBox layui-form">
        <form action="list.do?xzqh=${pd.xzqh_code}" method="post" name="Form" id="Form">
            <div class="fl" style="height: 39px;line-height: 39px;color: #333;padding-right: 10px;">
                （多选）统计维度选择
            </div>
            <div class="searchBox fl ">

                <input type="hidden" name="selAreaCode" id="selAreaCode" value="${pd.selAreaCode}"/>
                <input type="hidden" name="selAreaName" id="selAreaName" value="${pd.selAreaName}"/>
                <div class="sTree fl" id="sTree"  style="width:200px">

                </div>
                <div class="fl srarchBtn">
                    <i class="layui-icon">&#xe715;</i>
                </div>
            </div>



        </form>


    </div>
    <!-- table -->
    <div class="statistics-table">
        <table class="layui-table center" id="statistics-table">

            <thead>
            <tr>
                <th>选项</th>
                <th>小计</th>

                <th>比例</th>
            </tr>
            </thead>
            <tbody>
                <tr>
                    <td>A选项</td>
                    <td>200</td>
                    <td>20%</td>
                </tr>
                <tr>
                    <td>B选项</td>
                    <td>500</td>
                    <td>50%</td>
                </tr>
                <tr>
                    <td>C选项</td>
                    <td>100</td>
                    <td>10%</td>
                </tr>
                <tr>
                    <td>D选项</td>
                    <td>100</td>
                    <td>10%</td>
                </tr>
                <tr>
                    <td>E选项</td>
                    <td>100</td>
                    <td>10%</td>
                </tr>
            <%--<c:choose>--%>
                <%--<c:when test="${not empty varList}">--%>
                    <%--<shiro:hasPermission name="system:department:select">--%>
                        <%--<c:forEach items="${varList}" var="var" varStatus="vs">--%>
                            <%--<tr>--%>
                                <%--<td>${vs.index+1}</td>--%>
                                <%--<td>${var.WBDW_SZQY}</td>--%>

                                <%--<td>${var.NAME}</td>--%>

                                <%--<td>${var.ADDRESS}</td>--%>
                                <%--<td>${var.ADDRESS}</td>--%>

                            <%--</tr>--%>
                        <%--</c:forEach>--%>
                    <%--</shiro:hasPermission>--%>
                    <%--<shiro:lacksPermission name="outUnit:select">--%>
                        <%--<tr>--%>
                            <%--<td colspan="100" class="center">您无权查看</td>--%>
                        <%--</tr>--%>
                    <%--</shiro:lacksPermission>--%>
                <%--</c:when>--%>
                <%--<c:otherwise>--%>
                    <%--<tr class="main_info">--%>
                        <%--<td colspan="100" class="center">没有相关数据</td>--%>
                    <%--</tr>--%>
                <%--</c:otherwise>--%>
            <%--</c:choose>--%>
            </tbody>
        </table>


    </div>
    <%--charts 饼图--%>
    <div  style="width: 360px;height: 320px; float: left;padding-left: 40px">
        <div id="piebox" class="piebox" style="height: 100%;width: 100%;">

        </div>
    </div>
</div>

<%@ include file="../system/index/foot.jsp" %>
<script type="text/javascript">
    $(function(){
        var nameData=["A选项","B选项","C选项","D选项","E选项"];
        var pirArr=[
            {value:200,name:"A选项"},
            {value:500,name:"B选项"},
            {value:100,name:"C选项"},
            {value:100,name:"D选项"},
            {value:100,name:"E选项"},
        ]
        loadchartpie({
            selector: $("#piebox"),
            title: "题目选项统计",
            unit: '个',
            legend:nameData,
            data: pirArr
        })
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
            $(window).on('resize',function(){
                myChart.resize();
            })
        }

    })
    layui.use('laypage', function () {
        var laypage = layui.laypage;
        var layer = layui.layer;
        var form = layui.form;
        var editHtml = $("#editHtml").html();
        $("#editHtml").remove();

    });

    $("#keywords").keydown(function (e) {
        var ev= e || window.event;
        if (ev.keyCode == "13") {
            gsearch();
        }
    });

    //检索
    function gsearch() {
        $("#Form").submit();
    }


    //下一级/返回
    function refreshIfream(SECTION_ID) {
        window.location.href = "<%=basePath%>outer/list.do?SECTION_ID=" + SECTION_ID;
    }

    var first= true;
    var sTree = $.Stree({
        title:"${pd.selAreaName}",
        el: $("#sTree"),
        isSingle: true,  //单选
        data:[],
        callback:function(){

            if(!first){
                $("#selAreaName").val($.getString(this.arr,"title"))
                $("#selAreaCode").val($.getString(this.arr,"areaCode"))
                gsearch()
            }
        },
        switchCallback: function (obj) {
            var id = obj.id;
            if(obj.children == ""){
                console.log(id)
                getAddress(id, sTree)
            }
        }
    });
    first= false;
    //所在区域
    $.post("<%=basePath%>areaCode/listSubAreaCodeByParentId",{parentId:0},function(data){
        sTree.refresh(data)
    },"json")
    function getAddress(id, sTree) {
        $.post("<%=basePath%>areaCode/listSubAreaCodeByParentId", {parentId: id}, function (data) {
            //数据

            sTree.findOne(id, function (obj) {
                if (obj.children == "") {
                    obj.children = data;
                }

                sTree.rec(data, function (obj, index) {
                    sTree.operation(obj, index);
                }, obj.lev)
            })
            //默认选中

            sTree.cheakedOldData()
            //展示

        })
    }





</script>
</body>
</html>
