﻿
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>报表头列表</title>
    <%@ include file="../system/index/headcss.jsp" %>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/source/public/css/report_edit_head.css">
</head>
<body>
<div class="tableBox">
    <div class="operationBox">

        <form action="headList" method="post" name="Form" id="Form">
            <div class="searchBox fl">
                <input id="keywords" name="keywords" type="text" value="${pd.keywords}" placeholder="报表头或创建人名称" class="layui-input fl search">
                <div class="fl srarchBtn" onclick="gsearch()">
                    <i class="layui-icon">&#xe615;</i>
                </div>
            </div>
        </form>

        <button type="button" class="layui-btn fl layui-btn-blue marL-20" onclick="edit('')">新增</button>
    </div>

    <!-- table -->
    <div class="layui-col-sm12">
        <table class="layui-table center" id="table ">
            <colgroup>
                <col width="60">
                <col width="200">
                <col>
                <col>
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>序号</th>
                <th>名称</th>
                <th>创建人</th>
                <th>创建时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${not empty headLists}">
                    <c:forEach items="${headLists}" var="var" varStatus="vs">
                        <tr>
                            <td>${vs.index+1}</td>
                            <td>${var.HName}</td>
                            <td>${var.NAME}</td>
                            <td>${var.create_time}</td>
                            <td style="text-align: center;">
                                <a class="layui-btn layui-btn-mini layui-btn-primary" onclick="edit('${var.id}','${var.HName}');">编辑表头</a>
                                <a class="layui-btn layui-btn-mini" onclick="analysis('${var.id}','${var.HName}')">图形分析</a>
                                <a class="layui-btn layui-btn-danger layui-btn-mini del" onclick="del('${var.id}');">删除</a>
                            </td>
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

        <div class="laypageBox">
            <div id="laypage" class="fr"></div>
        </div>
    </div>
</div>
<%@ include file="../system/index/foot.jsp" %>
<script type="text/javascript">

    layui.use('laypage', function () {
        var laypage = layui.laypage;
        var layer = layui.layer;
        var form = layui.form;

        //执行一个laypage实例
        laypage.render({
            elem: 'laypage',
            count: ${page.totalResult},
            curr: ${page.currentPage},
            layout: ['prev', 'page', 'next', 'count', 'skip'],
            jump: function (obj, first) {
                if (!first) {
                    window.location.href = "<%=basePath%>populationAging/listInfo.do?currentPage=" + obj.curr + '&keywords=' + '${keywords}' + '&xzqh_code=' + '${pd.xzqh_code}';
                }
            }
        });
    });

    $("#keywords").keydown(function (e) {
        var ev = e || window.event;
        if (13 === ev.keyCode) {
            gsearch();
        }
    });

    //检索
    function gsearch() {
        $("#Form").submit();
    }

    function edit(id, name) {
        var title = id == "" ? "新增自定义表头" : "编辑自定义表头"
        name = name == undefined ? "" : name;
        console.log('${var.HName}');
        parent.showSuspensionBox("populationAging/headView?id=" + id, title);
        parent.layer.transmit = window;
    }

    function analysis(id, title) {
        parent.addTab(title + "图形分析", "populationAging/getHeadDataView?id=" + id)
    }

    function del(id) {
        parent.parent.layer.confirm("是否删除此表头?", {
            btn: ['确定', '取消'],
            resize: false,
            title: "提示",
            maxWidth: 800
        }, function (index) {
            var url = "<%=basePath%>populationAging/deleteRH.do?id=" + id;
            $.get(url, function (data) {
                if (data) {
                    window.location.href = '<%=basePath%>populationAging/listInfo.do?currentPage=${page.currentPage}';
                    parent.parent.layer.closeAll();
                } else {
                    layer.msg('系统异常,删除失败!', {icon: 5});
                }
            });
        });
    }
</script>
</body>
</html>