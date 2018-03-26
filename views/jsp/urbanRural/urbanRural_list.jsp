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
</head>
<body>
<div class="tableBox">
    <div class="operationBox">
        <form class="layui-form" action="listInfo.do" method="post" name="Form" id="Form">

            <div class="searchBox fl">
                <input type="hidden" name="type" id="type" value="${pd.type}"/>
                <div class="layui-form-item ">
                    <select name="nds" lay-verify="required" lay-filter='select1'>
                        <option value="">请选择区域</option>
                        <option value="2" <c:if test="${pd.type == '2'}">selected</c:if>>四川省</option>
                        <option value="3" <c:if test="${pd.type == '3'}">selected</c:if>>成都市</option>
                    </select>
                </div>
            </div>

        </form>
    </div>

    <hr>
    <div style="text-align:center;">城乡老年人口比例分析表</div>

    <table class=" layui-table center" id="table">
        <colgroup>
            <col>
            <col width="150">
            <col>
            <col>
            <col>
            <col>
        </colgroup>
        <thead>

        <tr>
            <th rowspan="2">序号</th>
            <th rowspan="2">行政区划</th>
            <th rowspan="2">户籍人口总数</th>
            <th colspan="2">城市</th>
            <th colspan="2">乡村</th>
            <th rowspan="2">操作</th>
        </tr>
        <tr>
            <th>城市人口总数</th>
            <th>城市人口占比</th>

            <th>农村人口总数</th>
            <th>农村人口占比</th>
        </tr>

        </thead>
        <tbody id="tbody">
        <c:choose>
            <c:when test="${not empty list}">
                <c:forEach items="${list}" var="var" varStatus="vs">
                    <tr>
                        <td>${vs.index+1}</td>

                        <td>
                            <c:if test="${var.xz != '四川省' && var.xz != '成都市'}">
                                ${var.xz}
                            </c:if>
                            <c:if test="${var.xz == '四川省' || var.xz == '成都市'}">
                                <a style="color: #0C64B5;" class="address" data-id="${var.xz}" href="javascript:void(0);">${var.xz}</a>
                            </c:if>
                        </td>
                        <td>${var.hj}</td>
                        <td>${var.cs}</td>

                        <td>${var.cszb}</td>
                        <td>${var.nc}</td>
                        <td>${var.nczb}</td>
                        <td style="text-align: center;">
                            <a class="layui-btn layui-btn-mini layui-btn-normal" onclick="seeCharts('${var.xz}')">查看图形</a>
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

</div>

<%@ include file="../system/index/foot.jsp" %>
<script type="text/javascript">

    var form = layui.form;

    function gsearch() {
        $("#Form").submit();
    }
    form.on('select(select1)', function (data) {
            $("#type").val(data.value);
            gsearch();
        }
    );

    $("#tbody").on("click", ".address", function () {
        var title = $(this).text();
        var type = teturnType(title);
        parent.addTab("城乡老年人口比例分析表", "urbanRural/listInfo.do?type=" + type);
    });

    function seeCharts(name) {
        var type = teturnType(name);
        parent.showSuspensionBox("urbanRural/viewCharts?type=" + type, "图形分析")
    }

    function teturnType(name) {
        var type = "";
        if (name == "四川省") {
            type = "2";
        } else if (name == "成都市") {
            type = "3"
        } else {
            type = "1";
        }
        return type;
    }

</script>
</body>
</html>