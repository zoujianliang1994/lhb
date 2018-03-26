<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>老年人意外保险优待统计表管理</title>
    <%@ include file="../system/index/headcss.jsp" %>
</head>
<body>
<div class="tableBox">
  <div class="operationBox">
  	 <c:if test="${not empty list}">
  	 	<button type="button" class="layui-btn fl layui-btn-primary marL-20" id="dowExcel">导出</button>
  	 </c:if>
  </div>
    <div style="text-align:center;"><span style="color: #FF3333;">${sysArea.name}</span>老年人意外保险统计表</div>

    <table class=" layui-table center" id="table">
        <colgroup>
            <col width="150">
            <col width="150">
            <col width="150">
            <col width="150">
            <col width="150">
            <col >
            <col width="150">
        </colgroup>
        <thead>
        <tr>
            <th>保险公司名称</th>
            <th>投保年份</th>
            <th>投保人数</th>
            <th>购买方式</th>
            <th>理赔人次</th>
            <th>赔付总金额</th>
            <th>保费总金额</th>
        </tr>
        </thead>
        <tbody id="tbody"> 
        <c:choose>
            <c:when test="${not empty list}">
                <c:forEach items="${list}" var="var" varStatus="vs">
                    <tr>
                        <td> ${var.name}</td>
                        <td>${var.tbnf}</td>
                        <td>${var.tb_num}</td>
                        <td>
                        	<c:if test="${pd.gmfs == '1'}">自己或配偶购买</c:if>
                        	<c:if test="${pd.gmfs == '2'}">子女购买</c:if>
                        	<c:if test="${pd.gmfs == '3'}">单位购买</c:if>
                        	<c:if test="${pd.gmfs == '4'}">赠与</c:if>
                        	<c:if test="${pd.gmfs == '5'}">其他</c:if>
                        </td>
                        <td>${var.lp_num}</td>
                        <td>${var.pfzje_num}</td>
                        <td>${var.bfzje_num}</td>
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
//导出
$("#dowExcel").on("click", function () {
    var version = '${version}';
    if (version != null && "" != version) {
        window.location.href = '<%=basePath%>insuranceReport/dowExcelDetail.do?version=' + version + '&level=${pd.level}';
    } else {
        layer.tips('没有数据,无法导出!', $("#dowExcel"), {
            tips: [3, '#D16E6C'],
            time: 4000
        });
    }
});
</script>
</body>
</html>