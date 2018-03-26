<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>老年工作管理</title>
    <%@ include file="../system/index/headcss.jsp" %>
</head>
<body>
<div class="tableBox">
	<div class="operationBox">
	     <form action="list.do?xzqh=${pd.xzqh_code}" method="post" name="Form" id="Form" class="layui-form">
	     	<div class="searchBox fl">
	              <input type="text" name="name" class="layui-input fl  search" id="name" value="${pd.name}" placeholder="文件名称"/>
	              <div class="fl srarchBtn" onclick="gsearch()">
						<i class="layui-icon">&#xe615;</i>
				  </div>
	     	</div>
	     	<div class="searchBox fl marL-20">
                <input type="hidden" name="nd" id="nd" value="${pd.nd}"/>
                <div class="layui-form-item ">
                    <select name="nds" lay-verify="required" lay-filter='select1'>
                        <option value="">请选择文件类型</option>
                        <option value="1">政策</option>
                        <option value="2" <c:if test="${pd.nd == '1'}">selected</c:if>>法规</option>
                    </select>
                </div>
            </div>
            <div class="searchBox fl marL-20">
                <input type="hidden" name="nd" id="nd" value="${pd.nd}"/>
                <div class="layui-form-item ">
                    <select name="nds" lay-verify="required" lay-filter='select1'>
                        <option value="">请选择文件状态</option>
                        <option value="1">草稿</option>
                        <option value="2" <c:if test="${pd.nd == '1'}">selected</c:if>>发布</option>
                    </select>
                </div>
            </div>
	    </form> 
	  	 	<button class="layui-btn fl  marL-20 layui-btn-blue" id="add">上传文件</button>
	    
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
				<col>
	        </colgroup>
	        <thead>
	        <tr>
	            <th>序号</th>
				<th>文件名称</th>
				<th>文件类型</th>
				<th>上传人</th>
				<th>上传日期</th>
				<th>状态</th>
				<th>操作</th>
	        </tr>
	        </thead>
	        <tbody>
	        <c:choose>
	            <c:when test="${not empty varList}">
	                    <c:forEach items="${varList}" var="var" varStatus="vs">
	                        <tr>
	                            <td>${vs.index+1}</td>
	                            <td>${var.name}</td>
	                            <td>${var.fileType}</td>
	                            <td>${var.author}</td>
	                            <td>${var.publishDate}</td>
	                            <td>${var.status}</td>
	                            <td style="text-align: center;">
	                            	   <a class="layui-btn layui-btn-mini layui-btn-normal" onclick="edit('${var.id}','1');">查看</a>
                                   	   <a class="layui-btn layui-btn-mini edit" onclick="edit('${var.id}','2');">编辑</a>
                                   	   <a class="layui-btn layui-btn-danger layui-btn-mini del" onclick="del('${var.id}');">删除</a></td>
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
	var laypage = layui.laypage;
	var layer = layui.layer;
	var form = layui.form;
	var first = true;
	layui.use('laydate', function () {
        var laydate = layui.laydate;
        laydate.render({
            elem: '#finishDate',
            type: 'date',
            value: '${pd.finishDate}',
            done: function (value) {
                $("#finishDate").val(value);
                gsearch();
            }
        });
    });
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
                    window.location.href = "<%=basePath%>workFile/list.do?currentPage=" + obj.curr + '&id=' + '${id}' + '&keywords=' + '${keywords}';
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

    //新增
    $("#add").on("click", function () {
    	  parent.parent.layer.edit = window;
          parent.parent.layer.open({
              title: "新增",
              type: 2,
              content: '<%=basePath%>workFile/goAdd.do?id=' + '${id}' + '&currentPage=' + ${page.currentPage},
              area: ["800px", "460px"]
          });
    });

    function edit(id, optype) {
        var msg = optype == '1' ? '查看' : '编辑';
        parent.parent.layer.edit = window;
        parent.parent.layer.open({
            title: msg,
            type: 2,
            content: '<%=basePath%>workFile/goEdit.do?id=' + id + '&currentPage=' + ${page.currentPage} +'&TYPE=' + optype,
            area: ["800px", "560px"]
        });
    }

    function del(id) {
        parent.parent.layer.confirm("是否删除此数据?", {
            btn: ['确定', '取消'],
            resize: false,
            title: "提示",
            maxWidth: 800
        }, function (index) {
            var url = "<%=basePath%>workFile/delete.do?id=" + id;
            $.get(url, function (data) {
                if ("success" == data.result) {
                    window.location.href = '<%=basePath%>workFile/list.do?currentPage=${page.currentPage}' + '&id=' + '${id}';
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