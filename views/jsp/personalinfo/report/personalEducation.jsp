<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>性别统计报表</title>
    <%@ include file="../../system/index/headcss.jsp" %>
</head>
<body>

<!-- table -->
<div class="tableBox">
    <table class="layui-table center" id="table">
        <colgroup>
            <col width="60">
            <col>
            <col>
            <col>
            <col>
            <col>
            <col>
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>序号</th>
            <th>机构名称</th>
            <th>总人数</th>
            <th>高中及以下</th>
            <th>专科</th>
            <th>本科</th>
            <th>硕士研究生</th>
            <th>博士研究生</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${not empty userList}">
                <c:forEach items="${userList}" var="var" varStatus="vs">
                    <tr>
                        <td>${vs.index+1}</td>
                        <td>${var.NAME}</td>
                        <td>${var.allCount}</td>
                        <td>${var.highSchool}</td>
                        <td>${var.specialty}</td>
                        <td>${var.undergraduate}</td>
                        <td>${var.master}</td>
                        <td>${var.doctor}</td>
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

<%@ include file="../../system/index/foot.jsp" %>
<script type="text/javascript">
    layui.use('laypage', function () {
        var laypage = layui.laypage;
        var layer = layui.layer;
        var form = layui.form;
        var editHtml = $("#editHtml").html();
        $("#editHtml").remove();

        //执行一个laypage实例
        laypage.render({
            elem: 'laypage',
            count: ${page.totalResult},
            curr: ${page.currentPage},
            layout: ['prev', 'page', 'next', 'count', 'skip'],
            jump: function (obj, first) {
                if (!first) {
                    window.location.href = "<%=basePath%>report/listInfo.do?currentPage=" + obj.curr + '&keywords=' + '${keywords}' + '&xzqh_code=' + '${pd.xzqh_code}' + '&TYPE=1';
                }
            }
        });
    });
</script>
</body>
</html>