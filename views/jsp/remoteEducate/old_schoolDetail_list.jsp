<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>老年大学</title>
    <%@ include file="../system/index/headcss.jsp" %>
</head>
<body>
<div class="tableBox">
	<div class="operationBox">
	       <form class="layui-form" action="goReportViewDetail.do" method="post" name="Form" id="Form">
	        <input type="hidden" name="id" id="id" value="${pd.id}"/>
	        <input type="hidden" name="startDate" id="startDate" value="${pd.startDate}"/>
	        <input type="hidden" name="endDate" id="endDate" value="${pd.endDate}"/>
	        <input type="hidden" name="szqy_code" id="szqy_code" value="${pd.szqy_code}"/>
	        <input type="hidden" name="jxxz" id="jxxz" value="${pd.jxxz}"/>
	        <%--  <div class="searchBox fl marL-20">
                <div class="layui-form-item ">
                    <select name="nds" lay-verify="required" lay-filter='select1'>
                        <option value="1" <c:if test="${pd.jxxz == '1'}">selected</c:if>>行政事业单位</option>
                        <option value="2" <c:if test="${pd.jxxz == '2'}">selected</c:if>>其他</option>
                    </select>
                </div>
            </div> --%>
	        <div class="searchBox fl">
	            <input id="keywords" name="keywords" type="text" value="${keywords}" placeholder="请输入学校名称" class="layui-input fl search">
	            <div class="fl srarchBtn" onclick="gsearch()">
	                <i class="layui-icon">&#xe615;</i>
	            </div>
	        </div>
	        <button type="button" class="layui-btn fl layui-btn-primary marL-20" id="dowExcel">导出</button>
	    </form>
	    
	</div>
	
	<!-- table -->
	<div class="layui-col-sm12">
	    <table class="layui-table center" id="table">
	       <colgroup>
            <col width="150">
            <col width="150">
            <col width="150">
            <col width="150">
            <col width="150">
        </colgroup>
        <thead>
         <tr>
			<th rowspan="2">学校名称</th>
			<th rowspan="2">机构性质</th>
			 <c:if test="${pd.jxxz == '1'}">
                  <th colspan="2">行政单位信息</th>
             </c:if>
             <c:if test="${pd.jxxz == '2'}">
                  <th colspan="2">事业单位信息</th>
             </c:if>
              <c:if test="${pd.jxxz == '3'}">
                  <th>社会团体信息</th>
             </c:if>
              <c:if test="${pd.jxxz == '4'}">
                  <th>民办非企业单位信息</th>
             </c:if>
              <c:if test="${pd.jxxz == '5'}">
                  <th>企业信息</th>
             </c:if>
			<th rowspan="2">学员总数</th>
		</tr>
		<tr>
			<c:if test="${pd.jxxz == '1'||pd.jxxz == '2'}">
				<th>人员编制总数</th>
				<th>机构级别</th>
 			</c:if>
 			<c:if test="${pd.jxxz == '3'||pd.jxxz == '4'||pd.jxxz == '5'}">
 				<th>是否到民政部门登记</th>
 			</c:if>
		</tr>
        </thead>
	        <tbody>
	        <c:choose>
	            <c:when test="${not empty listSchool}">
	                    <c:forEach items="${listSchool}" var="var" varStatus="vs">
	                        <tr>
	                             <td>${var.name}</td>
	                              <td>
	                            	 <c:if test="${var.jxxz == '1'}">行政单位</c:if>
	                                 <c:if test="${var.jxxz == '2'}">事业单位</c:if>
	                                 <c:if test="${var.jxxz == '3'}">社会团体</c:if>
	                                 <c:if test="${var.jxxz == '4'}">民办非企业单位</c:if>
	                                 <c:if test="${var.jxxz == '5'}">企业</c:if>
	                            </td>
	                            <c:if test="${pd.jxxz == '1'||pd.jxxz == '2'}">
		                            <td>${var.rybzzs}</td>
		                            <td>
		                            	 <c:if test="${var.jgjb == '1'}">副厅级</c:if>
		                                 <c:if test="${var.jgjb == '2'}">正处级</c:if>
		                                 <c:if test="${var.jgjb == '3'}">副处级</c:if>
		                                 <c:if test="${var.jgjb == '4'}">正科级</c:if>
		                                 <c:if test="${var.jgjb == '5'}">副科级</c:if>
		                            </td>
	                            </c:if>
	                            <c:if test="${pd.jxxz == '3'||pd.jxxz == '4'||pd.jxxz == '5'}">
		                             <td>
		                            	 <c:if test="${var.sfmzbmtb == '1'}">是</c:if>
		                                 <c:if test="${var.sfmzbmtb == '2'}">否</c:if>
		                            </td>
	                            </c:if>
	                            <td>${var.xyzs}</td>
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

	var form = layui.form;
	 //导出
    $("#dowExcel").on("click", function () {
        var version = '${version}';
        if (version != null && "" != version) {
            window.location.href = '<%=basePath%>oldSchool/dowExcel.do?version=' + version + '&level=${pd.level}&jxxz=${pd.jxxz}';
        } else {
            layer.tips('没有数据,无法导出!', $("#dowExcel"), {
                tips: [3, '#D16E6C'],
                time: 4000
            });
        }
    });
    $("#keywords").keydown(function (e) {
        var ev= e || window.event;
        if (ev.keyCode == "13") {
            gsearch();
        }
    });
   /*  form.on('select(select1)', function (data) {
        $("#jxxz").val(data.value);
        gsearch();
    }); */
	
    //检索
    function gsearch() {
        $("#Form").submit();
    }

</script>
</body>
</html>