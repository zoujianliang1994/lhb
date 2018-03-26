﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>高龄津贴报表管理</title>
    <%@ include file="../system/index/headcss.jsp" %>
</head>
<body>
<div class="tableBox">
    <div class="operationBox">
        <form class="layui-form" action="listInfo.do" method="post" name="Form" id="Form">

            <div class="searchBox fl ">
                <input type="hidden" name="area_code" id="area_code" value="${sysArea.area_code}"/>
                <input type="hidden" name="area_name" id="area_name" value="${sysArea.name}"/>
                <div class="sTree fl" id="sTree" style="width:200px">
                    请输入要搜索区域
                </div>
                <div class="fl srarchBtn">
                    <i class="layui-icon">&#xe715;</i>
                </div>
            </div>

            <div class="searchBox fl marL-20">
                <input type="hidden" name="year" id="year" value="${pd.year}"/>
                <input type="text" value="${pd.years}" name="years" id="years" required lay-verify="required" placeholder="年份"
                       autocomplete="off" class="layui-input fl search">
                <div class="fl srarchBtn">
                    <i class="layui-icon">&#xe637;</i>
                </div>
            </div>

            <div class="searchBox fl marL-20">
                <input type="hidden" name="nd" id="nd" value="${pd.nd}"/>
                <div class="layui-form-item ">
                    <select name="nds" lay-verify="required" lay-filter='select1'>
                        <option value="">全年</option>
                        <option value="0" <c:if test="${pd.nd == '0'}">selected</c:if>>上半年</option>
                    </select>
                </div>
            </div>

            <button type="button" class="layui-btn fl layui-btn-primary marL-20" id="dowExcel">导出</button>

        </form>
    </div>

    <hr>
    <div style="text-align:center;"><span style="color: #FF3333;">${sysArea.name}</span>高龄津贴发放明细统计表</div>

    <table class=" layui-table center" id="table">
        <colgroup>
            <col width="150">
            <col>
            <col>
            <col>
            <col>
        </colgroup>
        <thead>

        <tr>
            <th rowspan="2">
                <c:if test="${pd.level == '1'}">
                    市州
                </c:if>
                <c:if test="${pd.level == '2'}">
                    区(县)
                </c:if>
                <c:if test="${pd.level == '3'}">
                    镇/乡/街道
                </c:if>
                <c:if test="${pd.level == '4'}">
                    社区
                </c:if>
            </th>
            <th colspan="<c:if test="${pd.level == '2'}">4</c:if><c:if test="${pd.level != '2'}">3</c:if>">80-89周岁</th>
            <th colspan="<c:if test="${pd.level == '2'}">4</c:if><c:if test="${pd.level != '2'}">3</c:if>">90-99周岁</th>
            <th colspan="<c:if test="${pd.level == '2'}">4</c:if><c:if test="${pd.level != '2'}">3</c:if>">100周岁以上</th>
            <th rowspan="2">
                发放总金额
            </th>
        </tr>
        <tr>

            <c:if test="${pd.level == '2'}">
                <th>津贴标准</th>
            </c:if>
            <th>总人数</th>
            <th>享受津贴人数</th>
            <th>总金额</th>

            <c:if test="${pd.level == '2'}">
                <th>津贴标准</th>
            </c:if>
            <th>总人数</th>
            <th>享受津贴人数</th>
            <th>总金额</th>

            <c:if test="${pd.level == '2'}">
                <th>津贴标准</th>
            </c:if>
            <th>总人数</th>
            <th>享受津贴人数</th>
            <th>总金额</th>
        </tr>

        </thead>
        <tbody id="tbody">
        <c:choose>
            <c:when test="${not empty list}">
                <c:forEach items="${list}" var="var" varStatus="vs">
                    <tr>
                        <td>
                            <c:if test="${pd.level != '4' && pd.level != '1' || var.area_code == ''}">
                                ${var.name }
                            </c:if>

                            <c:if test="${pd.level == '1' && var.area_code != ''}">
                                <a style="color: #0C64B5;" class="address" data-id="${var.area_code }" href="javascript:void(0);">${var.name }</a>
                            </c:if>
                        </td>

                        <c:if test="${pd.level == '2'}">
                            <td>${var.money_80}</td>
                        </c:if>

                        <td>${var.age_80}</td>
                        <td>${var.jt_80}</td>
                        <td>${var.je_80}</td>

                        <c:if test="${pd.level == '2'}">
                            <td>${var.money_90}</td>
                        </c:if>
                        <td>${var.age_90}</td>
                        <td>${var.jt_90}</td>
                        <td>${var.je_90}</td>

                        <c:if test="${pd.level == '2'}">
                            <td>${var.money_100}</td>
                        </c:if>
                        <td>${var.age_100}</td>
                        <td>${var.jt_100}</td>
                        <td>${var.je_100}</td>
                        <td>${var.je_80+var.je_90+var.je_100}</td>
                    </tr>
                </c:forEach>

            </c:when>
            <c:otherwise>
                <tr class="main_info">
                    <td colspan="100" class="center">没有相关数据</td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>

</div>

<%@ include file="../system/index/foot.jsp" %>
<script type="text/javascript">
    var first = true;
    var form = layui.form;
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        laydate.render({
            elem: '#years',
            type: 'year',
            value: '${pd.year}',
            done: function (value) {
                $("#year").val(value);
                gsearch();
            }
        });

        //导出
        $("#dowExcel").on("click", function () {
            var version = '${version}';
            if (version != null && "" != version) {
                window.location.href = '<%=basePath%>benefitReport/dowExcel.do?version=' + version + '&level=${pd.level}';
            } else {
                layer.tips('没有数据,无法导出!', $("#dowExcel"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
            }
        });
    });

    $("#tbody").on("click", ".address", function () {
        var id = $(this).data("id");
        var title = $(this).text();
        parent.addTab(title + "高龄津贴发放明细统计表", "benefitReport/listInfo.do?area_code=" + id + "&year=" + '${pd.year}' + "&nd=" + '${pd.nd}');
    });

    function gsearch() {
        $("#Form").submit();
    }
    form.on('select(select1)', function (data) {
            $("#nd").val(data.value);
            gsearch();
        }
    );

    //所在区域
    $.post("<%=basePath%>areaCode/listSubAreaCodeByParentId", {parentId: 0}, function (data) {
        $.each(data, function (i, n) {
            if (data[i].level == '1') {
                data[i].hasNext = false;
            }
        });
        var sTree = $.Stree({
            title: "${sysArea.name}",
            el: $("#sTree"),
            isSingle: true,  //单选
            data: data,
            callback: function () {
                $("#area_name").val($.getString(this.arr, "title"));
                $("#area_code").val($.getString(this.arr, "areaCode"));
                if (!first) {
                    gsearch();
                }
            },
            switchCallback: function (obj) {
                var id = obj.id;
                if (obj.children == "") {
                    getAddress(id, sTree);
                }
            }
        });
        first = false;
    }, "json");

    function getAddress(id, sTree) {
        $.post("<%=basePath%>areaCode/listSubAreaCodeByParentId", {parentId: id}, function (data) {
            $.each(data, function (i, n) {
                if (data[i].level == '1') {
                    data[i].hasNext = false;
                }
            });
            //数据
            sTree.findOne(id, function (obj) {
                if (obj.children == "") {
                    obj.children = data;
                }

                sTree.rec(data, function (obj, index) {
                    sTree.operation(obj, index);
                }, obj.lev)
            });
            //默认选中
            sTree.cheakedOldData();
        })
    }
    function transmit(obj) {
        parent.layer.transmit = obj;
    }
</script>
</body>
</html>