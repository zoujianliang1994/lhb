<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>消息</title>
    <%@ include file="../index/headcss.jsp" %>
</head>
<body>
<div class="tableBox">
	<div class="operationBox">
	   <form action="list.do" class="layui-form" method="post" name="Form" id="Form">
            <div class="searchBox fl marL-20">
                <div class="layui-form-item">
                    <select name="STATUS" lay-verify="required" lay-filter='select1'>
                        <option value="0" <c:if test="${pd.STATUS == '0'}">selected</c:if>>未处理</option>
                        <option value="1" <c:if test="${pd.STATUS == '1'}">selected</c:if>>已处理</option>
                    </select>
                </div>
            </div>
	    </form> 
	</div>
	
	<!-- table -->
	<div class="layui-col-sm12">
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
	            <th>状态</th>
				<th>标题</th>
				<th>推送日期</th>
				<th>操作</th>
	        </tr>
	        </thead>
	        <tbody>
	        <c:choose>
	            <c:when test="${not empty list}">
	                    <c:forEach items="${list}" var="var" varStatus="vs">
	                        <tr>
	                            <td>${vs.index+1}</td>
	                             <td>
	                             	<c:if test="${var.STATUS == '0'}">未处理</c:if>
	                                <c:if test="${var.STATUS == '1'}">已处理</c:if>
	                             </td>
	                             <td>${var.TITLE}</td>
	                            <td>${var.CREATE_TIME}</td>
	                            <td style="text-align: center;">
	                           		 <c:if test="${var.STATUS == '0'}"><a class="layui-btn layui-btn-mini edit" onclick="edit('${var.URL}');">处理</a></c:if>
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

<%@ include file="../index/foot.jsp" %>
<script type="text/javascript">
	var first = true;
	var laypage = layui.laypage;
	var layer = layui.layer;
	var form = layui.form;
	

    layui.use('laypage', function () {
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
                    window.location.href = "<%=basePath%>personalpanel/list.do?currentPage=" + obj.curr + '&id=' + '${id}' + '&keywords=' + '${keywords}';
                }
            }
        });
    });

    $("#keywords").keydown(function (e) {
        var ev= e || window.event;
        if (ev.keyCode == "13") {
            gsearch();
        }
    });

    //检索
    function gsearch() {
        $("#Form").submit();
    }

    function edit(url) {
    	parent.layer.logout= window;
        parent.layer.open({
            title: "消息处理",
            type: 2,
            content: '<%=basePath%>'+url+'&currentPage=${page.totalResult}',
            area: ["800px", "550px"]
        });
    }

    form.on('select(select1)', function (data) {
        gsearch();
    });
</script>
</body>
</html>