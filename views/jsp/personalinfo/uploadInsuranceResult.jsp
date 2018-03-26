<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>意外保险导入结果</title>
    <%@ include file="../system/index/headcss.jsp" %>
</head>
<body>
<div class="edit_menu">
    <blockquote class="layui-elem-quote">${msg}</blockquote>

    <div class="layui-tab">

        <ul class="layui-tab-title">
            <li class="layui-this">成功数据</li>
            <li>失败数据</li>
        </ul>

        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">

                <div class="layui-col-sm12">
                    <table class="layui-table center" id="tableSuc">
                        <colgroup>
                            <col width="70">
                            <col width="70">
                            <col width="70">
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
                            <th>姓名</th>
                            <th>身份证号</th>
                            <th>投保公司</th>
                            <th>保费金额</th>
                            <th>保险金额</th>
                            <th>生效日期</th>
                            <th>理赔日期</th>
                            <th>赔付金额</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${not empty sucPageData}">
                                <c:forEach items="${sucPageData}" var="var" varStatus="vs">
                                    <tr>
                                        <td>${vs.index+1}</td>
                                        <td>${var.xm}</td>
                                        <td>${var.sfz}</td>
                                        <td>${var.NAME}</td>
                                        <td>${var.BF_MONEY}</td>
                                        <td>${var.BX_MONEY}</td>
                                        <td>${var.BXSX_DATE}</td>
                                        <td>${var.PF_DATE}</td>
                                        <td>${var.PF_MONEY}</td>
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

            </div>
            <div class="layui-tab-item">


                <div class="layui-col-sm12 clth">
                    <table class="layui-table center" id="tableErr">

                        <colgroup>
                            <col width="70">
                            <col width="70">
                            <col>
                            <col>
                            <col>
                            <col>
                            <col>
                            <col>
                            <col>
                            <col width="200">
                        </colgroup>

                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>姓名</th>
                            <th>身份证号</th>
                            <th>投保公司</th>
                            <th>保费金额</th>
                            <th>保险金额</th>
                            <th>生效日期</th>
                            <th>理赔日期</th>
                            <th>赔付金额</th>
                            <th>错误原因</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${not empty errPageData}">
                                <c:forEach items="${errPageData}" var="var" varStatus="vs">
                                    <tr>
                                        <td>${vs.index+1}</td>
                                        <td>${var.xm}</td>
                                        <td>${var.sfz}</td>
                                        <td>${var.NAME}</td>
                                        <td>${var.BF_MONEY}</td>
                                        <td>${var.BX_MONEY}</td>
                                        <td>${var.BXSX_DATE}</td>
                                        <td>${var.PF_DATE}</td>
                                        <td>${var.PF_MONEY}</td>
                                        <td>${var.errMsg}</td>
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
                <button class="layui-btn fr layui-btn-primary  marT-10" id="dowload" style="margin-left: 16px;margin-bottom: 10px">导出</button>

            </div>
        </div>
    </div>
</div>

<%@ include file="../system/index/foot.jsp" %>
<script type="text/javascript">
    $(function () {
        setTimeout(function () {
            parent.layer.uploadInsu.location.href = '<%=basePath%>personalInfo/listUsers.do?currentPage=${basePd.currentPage}' + '&xzqh_code=' + '${basePd.xzqh_code}';
        }, 500);

        parent.layer.closeAll('loading');
        var h = parent.document.documentElement.clientHeight;
        var w = parent.document.documentElement.clientWidth;
        parent.layer.style(parent.idx, {
            width: "800px",
            height: "600px",
            left: (w - 800) / 2 + "px",
            top: (h - 600) / 2 + "px"
        })
    });

    //导出
    $("#dowload").on("click", function () {
        var version = '${version}';
        if (version != null && "" != version) {
            window.location.href = '<%=basePath%>personalInfo/exportInsurance.do?version=' + version;
        } else {
            layer.tips('没有错误数据,无法导出!', $("#dowload"), {
                tips: [3, '#D16E6C'],
                time: 4000
            });
        }
    });
</script>
</body>
</html>