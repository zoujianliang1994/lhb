<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>空报表</title>
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
        </colgroup>
        <thead>
        <tr>
            <th>序号</th>
            <th>信息</th>
        </tr>
        </thead>
        <tbody>
        <tr class="main_info">
            <td colspan="100" class="center">没有相关数据</td>
        </tr>
        </tbody>
    </table>

    <div class="laypageBox">
        <div id="laypage" class="fr"></div>
    </div>
</div>

<%@ include file="../../system/index/foot.jsp" %>
<script type="text/javascript">

</script>
</body>
</html>