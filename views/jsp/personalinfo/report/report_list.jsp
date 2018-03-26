<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>报表管理</title>
    <%@ include file="../../system/index/headcss.jsp" %>
</head>
<body>
<div class="tableBox">
    <div class="operationBox">
        <form class="layui-form" action="list.do?xzqh=${pd.xzqh}&type=1" method="post" name="Form" lay-filter="editForm" id="Form">
            <input type="hidden" value="${pd.xzqh}" name="xzqh" id="xzqh"/>
            <div class="layui-form-item ">
                <div class="layui-col-xs3 layui-col-sm3 layui-col-md3">
                    <select name="TYPE" lay-verify="required" lay-filter='select1'>
                        <option value="">请选择报表</option>
                        <shiro:hasPermission name="report:person:select">
                            <option value="0">人员编制报表</option>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="report:schedul:select">
                            <option value="1">学历构成报表</option>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="report:sex:select">
                            <option value="2">性别统计报表</option>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="report:age:select">
                            <option value="3">年龄统计报表</option>
                        </shiro:hasPermission>
                    </select>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- table -->
<div class="layui-col-sm12">

    <iframe border="0" frameborder="no" name="listFrame" id="listFrame"
            src="<%=basePath%>report/listInfo.do?currentPage=1&xzqh_code=${pd.xzqh}"
            style="margin: 0 auto; width: 100%; height: 550px;border:0"></iframe>

</div>
<%@ include file="../../system/index/foot.jsp" %>
<script type="text/javascript">
    $(function () {
        var form = layui.form;
        form.on('select(select1)', function (data) {
                var TYPE = data.value;
                document.getElementById('listFrame').src = "<%=basePath%>report/listInfo.do?TYPE=" + TYPE + '&xzqh_code=' +${pd.xzqh};
            }
        );
    });
</script>
</body>
</html>