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
<script type="text/javascript" src="<%=basePath%>static/source/public/js/avalon.js"></script>
<style>
    .report_edit_head .h2 {
        padding: 9px 15px;
        font-size: 13px;
        color: #333
    }

    .layui-form-radio span, .layui-form-checkbox span {
        font-size: 13px;
    }

    .containerBox {
        border: 1px solid #ddd;
    }

    .containerBox .sure {
        position: relative;
        left: 50%;
        margin-left: -32px;
        margin-bottom: 10px;
    }

    .layui-form-label {
        text-align: left !important;
    }
</style>
<body>
<div class="tableBox report_edit_head">
    <div class="layui-collapse layui-form">
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">生成数据条件
                <button type="button" class="layui-btn layui-btn-blue fr sure" id="downloadReport" style="margin-top:2px">导出报表</button>
            </h2>
            <div class="layui-colla-content layui-show" style="overflow:hidden">
                <form id="form">
                    <div class="layui-row marT-10">
                        <div class="layui-col-xs11 layui-col-sm11 layui-col-md11 padB-20">
                            <label class="layui-form-label">区域：</label>
                            <div class="layui-input-block sTree" id="sTree">

                            </div>
                        </div>

                        <div class="layui-col-xs11 layui-col-sm11 layui-col-md11 padB-20">
                            <div class="layui-col-xs5 layui-col-sm5 layui-col-md5 ">

                                <label class="layui-form-label" style="width:90px">日期区间选择</label>


                                <div class="layui-input-block" style="margin-left:120px">
                                    <div class="layui-col-xs5 ">
                                        <input type="text" value="${pd.selDate}" name="selEndDate" id="selEndDate" required lay-verify="required"
                                               placeholder="开始日期"
                                               autocomplete="off"
                                               class="layui-input fl search"
                                               style="margin-left: -10px;"
                                        >
                                    </div>
                                    <div class="layui-col-xs1 " style="padding:10px">
                                        <hr class="hr"/>
                                    </div>
                                    <div class="layui-col-xs5 ">
                                        <input type="text" value="${pd.endDate}" name="endDate" id="endDate" required lay-verify="required"
                                               placeholder="结束日期"
                                               autocomplete="off"
                                               class="layui-input fl search">
                                    </div>

                                </div>

                            </div>

                            <button type="button" class="layui-btn layui-btn-blue marL-20 sure" id="sure">确定</button>

                        </div>
                    </div>
                    <div class="containerBox marT-10">
                        <h2 class="h2 marT-10">基础信息</h2>
                        <c:if test="${rylbwhere==true }">
                            <div class="layui-row ">
                                <label class="layui-form-label">人员类别：</label>
                                <div class="layui-input-block">
                                    <html:checkbox name="rylb" collection="personnel_categories"></html:checkbox>

                                </div>
                            </div>
                        </c:if>
                        <c:if test="${jzzkwhere==true }">
                            <div class="layui-row marT-10">
                                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                                    <label class="layui-form-label">居住状况：</label>
                                    <div class="layui-input-block">
                                        <input type="radio" name="jzzk" value="" checked title="不选择"/>
                                        <html:radio name="jzzk" collection="living_condition"></html:radio>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${ylfswhere==true }">
                            <div class="layui-row marT-10">
                                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                                    <label class="layui-form-label">养老方式：</label>
                                    <div class="layui-input-block">
                                        <input type="radio" name="ylfs" value="" checked title="不选择"/>
                                        <html:radio name="ylfs" collection="ylfs"></html:radio>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${cbqkwhere==true }">
                            <div class="layui-row marT-10">
                                <label class="layui-form-label">是否参保：</label>
                                <div class="layui-input-block">
                                    <input type="radio" name="sfcb" lay-filter="sfcb2" value="" checked title="不选择"/>
                                    <input type="radio" name="sfcb" lay-filter="sfcb1" value="1" title="是">
                                    <input type="radio" name="sfcb" lay-filter="sfcb2" value="2" title="否">
                                </div>
                            </div>

                            <div class="layui-row marT-10" style="display:none" id="cbqk">
                                <label class="layui-form-label">参保情况：</label>
                                <div class="layui-input-block">
                                    <html:checkbox name="cbqk" collection="insured_situation"></html:checkbox>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${ywshbxwhere==true }">
                            <div class="layui-row marT-10">
                                <label class="layui-form-label">意外保险：</label>
                                <div class="layui-input-block">
                                    <input type="radio" name="ywbx" value="" checked title="不选择"/>
                                    <input type="radio" name="ywbx" value="1" title="购买">
                                    <input type="radio" name="ywbx" value="2" title="未购买">
                                </div>
                            </div>
                        </c:if>

                        <h2 class="h2 marT-10">经济健康状况信息</h2>
                        <c:if test="${jjlywhere==true }">
                            <div class="layui-row">
                                <label class="layui-form-label">经济来源：</label>
                                <div class="layui-input-block">
                                    <input type="radio" name="jjly" value="" checked title="不选择"/>
                                    <html:radio name="jjly" collection="economic_source"></html:radio>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${jkzkwhere==true }">
                            <div class="layui-row marT-10">
                                <label class="layui-form-label">健康状况：</label>
                                <div class="layui-input-block">
                                    <input type="radio" name="jkzk" value="" checked title="不选择"/>
                                    <html:radio name="jkzk" collection="health_condition"></html:radio>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${shzlnlwhere==true }">
                            <div class="layui-row marT-10">
                                <label class="layui-form-label">自理能力：</label>
                                <div class="layui-input-block">
                                    <input type="radio" name="zlnl" value="" checked title="不选择"/>
                                    <html:radio name="zlnl" collection="self_care"></html:radio>
                                </div>
                            </div>
                        </c:if>

                        <h2 class="h2 marT-10">老年优待信息</h2>
                        <c:if test="${lndxwhere==true }">
                            <div class="layui-row">
                                <label class="layui-form-label">老年大学：</label>
                                <div class="layui-input-block">
                                    <input type="radio" name="lndx" value="" checked title="不选择"/>
                                    <input type="radio" name="lndx" value="1" title="参加">
                                    <input type="radio" name="lndx" value="2" title="未参加">
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${lnxhwhere==true }">
                            <div class="layui-row">
                                <label class="layui-form-label">老年协会：</label>
                                <div class="layui-input-block">
                                    <input type="radio" name="lnxh" value="" checked title="不选择"/>
                                    <input type="radio" name="lnxh" value="1" title="参加">
                                    <input type="radio" name="lnxh" value="2" title="未参加">
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${jkdawhere==true }">
                            <div class="layui-row">
                                <label class="layui-form-label">健康档案：</label>
                                <div class="layui-input-block">
                                    <input type="radio" name="jkda" value="" checked title="不选择"/>
                                    <input type="radio" name="jkda" value="1" title="建立">
                                    <input type="radio" name="jkda" value="2" title="未建立">
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${ylfwbtwhere==true }">
                            <div class="layui-row">
                                <label class="layui-form-label">养老服务补贴：</label>
                                <div class="layui-input-block">
                                    <input type="radio" name="ylfwbt" value="" checked title="不选择"/>
                                    <input type="radio" name="ylfwbt" value="1" title="享受">
                                    <input type="radio" name="ylfwbt" value="2" title="未享受">
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${hlbtwhere==true }">
                            <div class="layui-row">
                                <label class="layui-form-label">护理补贴：</label>
                                <div class="layui-input-block">
                                    <input type="radio" name="hlbt" value="" checked title="不选择"/>
                                    <input type="radio" name="hlbt" value="1" title="享受">
                                    <input type="radio" name="hlbt" value="2" title="未享受">
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${gljtwhere==true }">
                            <div class="layui-row">
                                <label class="layui-form-label">高龄津贴：</label>
                                <div class="layui-input-block">
                                    <input type="radio" name="gljt" value="" checked title="不选择"/>
                                    <input type="radio" name="gljt" value="1" title="享受">
                                    <input type="radio" name="gljt" value="2" title="未享受">
                                </div>
                            </div>
                        </c:if>


                    </div>
                </form>
            </div>
        </div>
    </div>
    <div style="width: 100%; height: 100%; display: none" id="PolylineCharts">

    </div>

    <table class="layui-table center ms-controller" id="table" ms-controller="table" style="margin-bottom:30px">
        <thead>
        <tr>
            <th>
                时间区间
            </th>
            <th ms-for="(index,item) in @list" :attr="{colspan:(item.children==0?1:item.children),rowspan:(item.children==0?2:1)}"
                :class="(item.active? 'active':'')">
                {{item.name}}
            </th>
            <%--<th ms-if="@tbody!=''" rowspan="2">--%>
                <%--操作--%>
            <%--</th>--%>
            <th rowspan="2">
                操作
            </th>
        </tr>
        <tr>
            <th ms-for="(index,item) in @list2" ms-click="active($event,index,2)">{{item.name}}
            </th>
        </tr>
        </thead>
        <tbody class="addtr">
        <%--<tr ms-for="(index,item) in tbody">--%>
            <%--<td ms-for="(index,jtem) in item">{{jtem}}</td>--%>
            <%--<td ms-if="@tbody!=''">--%>
                <%--<a class="layui-btn layui-btn-mini " ms-click="seeCharts(index)">查看图形</a>--%>
            <%--</td>--%>
        <%--</tr>--%>

        </tbody>
    </table>
</div>

<form id="downLoad" action="<%=basePath%>customReportStatis/exportExcel.do" method="post">
    <input name="headId" value="${id}" type="hidden"/>
    <input name="arrData" id="tbodyData" type="hidden"/>
</form>
<%@ include file="../system/index/foot.jsp" %>

<script type="text/javascript">
    avalon.ready(function () {
        var form = layui.form;
        layui.use('laydate', function () {
            var laydate = layui.laydate;

            //执行一个laydate实例
            laydate.render({
                elem: '#selEndDate',
                type: 'year'
            });

            laydate.render({
                elem: '#endDate',
                type: 'year'
            });
        });

        form.on('radio(sfcb1)', function (data) {
            $("#cbqk").show();
        });
        form.on('radio(sfcb2)', function (data) {
            $("#cbqk").find("input").each(function () {
                console.log($(this).attr("checked"))
                if ($(this).attr("checked")) {
                    $(this).next().click()
                }
            })
            $("#cbqk").hide();
        });
        var sTree;
        /*	*/
        $.post("<%=basePath%>areaCode/listSubAreaCodeByParentId", {parentId: 0}, function (data) {
            sTree = $.Stree({
                el: $("#sTree"),
                data: data,
                callback: function () {

                },
                switchCallback: function (obj) {
                    var id = obj.id;
                    if (obj.children == "" && obj.level < 4) {
                        getAddress(id, sTree);
                    }
                }
            });
        }, "json");
        function getAddress(id, sTree) {
            $.post("<%=basePath%>areaCode/listSubAreaCodeByParentId", {parentId: id}, function (data) {
                //数据
                if (data[0].level == 4) {
                    $.each(data, function () {
                        this.hasNext = false;
                    })
                }
                sTree.findOne(id, function (obj) {
                    if (obj.children == "") {
                        obj.children = data;
                    }
                    sTree.rec(data, function (obj, index) {
                        sTree.operation(obj, index);
                    }, obj.lev)
                });
            })
        }

        $("#table").on("click",".see-charts",function () {
            layer.open({
                type: 1,
                skin: 'layui-layer-rim', //加上边框
                area: ['700px', '500px'], //宽高
                content: $("#PolylineCharts"),
                cancel: function(index, layero){
                        layer.close(index)
                    $("#PolylineCharts").hide()
                    return false;
                }
            });
            $("#PolylineCharts").show()
            loadPolyline()
        })

        function loadPolyline() {
            var myChart = echarts.init(document.getElementById("PolylineCharts"),'walden');
            option = {
                tooltip : {
                    trigger: 'axis'
                },
                legend: {
                    data : ['2018年','2019年','2020年','2021年','2022年']
                },
                toolbox: {
                    show : true,
                    feature : {
                        // mark : {show: true},
                        // dataView : {show: true, readOnly: false},
                        // magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                        // restore : {show: true},
                        saveAsImage : {show: true}
                    }
                },
                calculable : true,
                xAxis : [
                    {
                        type : 'category',
                        boundaryGap : false,
                        data : ['人口总数','60-70','70-80','80-90','90-100']
                    }
                ],
                yAxis : [
                    {
                        type : 'value'
                    }
                ],
                series : [
                    {
                        name:'2018年',
                        type:'line',
                        data:[1800, 132, 101, 134, 390]
                    },
                    {
                        name:'2019年',
                        type:'line',
                        data:[1200, 182, 191, 234, 290]
                    },
                    {
                        name:'2020年',
                        type:'line',
                        data:[1400, 232, 201, 154, 190]
                    },
                    {
                        name:'2021年',
                        type:'line',
                        data:[1600, 332, 301, 334, 390]
                    },
                    {
                        name:'2022年',
                        type:'line',
                        data:[1500, 932, 901, 934, 290 ]
                    }
                ]
            };
            myChart.setOption(option);
        }

        var vm = avalon.define({
            $id: "table",
            list: [],
            list2: [],
            tbody: [],
            cloneArr: function (arr, index) {
                var newArr = []
                $.each(arr, function (i) {
                    if (i < index) {
                        return true
                    }
                    newArr.push(arr[i])
                })
                return newArr
            },
            seeCharts: function (index) {
                var that = this;
                var res = $("#form").serialize();
                res += "&areaCode=" + $.getString(sTree.arr, 'areaCode');
                var areaCode = "";
                var name = this.tbody[index][0];
                sTree.rec(sTree.data, function (obj) {
                    if (obj.title == name) {
                        areaCode = obj.areaCode;
                        return false
                    }
                })
                res += "&areaName=" + areaCode;
                res += "&headId=" + '${id}';

                //  this.tbody[index].shift()
                var tbody = this.cloneArr(this.tbody[index], 1)
                console.log(tbody)
                tbody = tbody.join(",");
                tbody = tbody.replace(/%/g, "awm");
                res += "&rowData=" + tbody
                console.log(res)

                parent.showSuspensionBox('<%=basePath%>customReport/getHeadChatsView?' + res, "图形分析")
            }
        })
        avalon.scan(document.body)
        $.post("<%=basePath%>customReport/getHead", {id: '${id}'}, function (data) {
            if (data) {
                var data = JSON.parse(data)
                vm.list = data.parentList;
                vm.list2 = data.childrenList;
            }
        })
        $("#downloadReport").on("click", function (e) {
            e.stopPropagation()
            if ($("#tbodyData").val() == "") {
                layer.msg("请先选择筛选条件，生成报表", {icon: 2, shift: 6})
                return
            }
            $("#downLoad").submit();
            //window.location.href="<%=basePath%>customReportStatis/exportExcel.do?headId="+id+"&arrData="+encodeURI(encodeURI(arr));
        });

        $("#sure").on("click", function () {
            var data = $("#form").serialize() + "&areaCode=" + $.getString(sTree.arr, 'areaCode');
            // if (sTree.arr == "") {
            //     layer.msg("请选择区域！", {icon: 2, shift: 6})
            //     return
            // }
            var enddate=$("#endDate").val();
            var startdate=$("#selEndDate").val()
            if(startdate ==""){
                layer.msg("请选择开始日期！", {icon: 2, shift: 6})
                    return
            }
            if(enddate ==""){
                layer.msg("请选择开始日期！", {icon: 2, shift: 6})
                return
            }
            var differ=enddate-startdate+1;
            var trlength=$("thead tr").children("th").length-2;
            var html='';
            $(".addtr").empty();
            for(var i =0;i<differ;i++){
                html+='<tr>';
                html+='<td>'+(parseInt(startdate)+i)+'</td>'
                if(i==0){
                    for (var j=0;j<trlength;j++){
                        html+= '<td >'+10000+'</td>'
                    }
                    html+='<td rowspan='+differ+'><a class="layui-btn layui-btn-mini see-charts">查看图形</a></td></tr>'
                }else{
                    for (var j=0;j<trlength;j++){
                        html+= '<td >'+10000+'</td>'
                    }
                    html+='</tr>';
                }

            }
            console.log(html);
            $(".addtr").append(html);
            $(this).closest(".layui-colla-content").removeClass("layui-show");
            // layer.load(2)
            <%--$.get("<%=basePath%>populationAging/reportList?headId=" + '${id}' + "&" + data, function (data) {--%>

                <%--if (data.code == 10000) {--%>
                    <%--vm.tbody = data.data;--%>
                    <%--var arr = []--%>
                    <%--$.each(data.data, function (i) {--%>
                        <%--arr.push(this.join(","))--%>
                    <%--})--%>
                    <%--arr = arr.join("-")--%>
                    <%--$("#tbodyData").val(arr)--%>
                    <%--layer.closeAll("loading")--%>
                <%--} else {--%>
                    <%--layer.closeAll("loading")--%>
                    <%--layer.msg(data.msg, {icon: 2})--%>
                <%--}--%>
            <%--})--%>

        })

        function randomData(len) {
            var length = parseInt(20 * Math.random());
            var tbody = [];
            for (var i = 0; i < length; i++) {
                var arr = [];
                for (var j = 0; j < len; j++) {
                    arr.push(parseInt(2000 * Math.random()))
                }
                tbody.push(arr)
            }
            vm.tbody = tbody
        }
    })


</script>
</body>
</html>