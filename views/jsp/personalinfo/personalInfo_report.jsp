<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>数据分析情况</title>
	<meta http-equiv="X-UA-Compatible" content="IE=11">
	<%@ include file="../system/index/headcss.jsp" %>
</head>
<link rel="stylesheet" type="text/css" href="<%=basePath%>static/source/public/css/report_edit_head.css">
<script type="text/javascript" src="<%=basePath%>static/source/public/js/avalon.js"></script>
<body style="background:#fff">
<div class="tableBox report_edit_head ms-controller" ms-controller="report_edit_head" >

	<div class="operationBox">
		<div class="searchBox fl">
			<input name="keywords" type="text" ms-duplex="@name"   placeholder="请创建表单名称" class="layui-input fl search">
			<div class="fl srarchBtn" >
				<i class="layui-icon">&#xe63c;</i>
			</div>
		</div>

		<button type="button" class="layui-btn fl layui-btn-blue marL-20" ms-click="save">生成</button>
	</div>

	<h2 class="marT-20 h2 ">字段选择&nbsp;&nbsp;<span class="redspan">(*选择字段名之后才会加入图表中)</span></h2>
	<div class="containerBox marT-10">
		<div class="layui-row" style="line-height:30px">
			<div class="layui-col-xs1"  style="padding: 10px;">
				<span class="red">字段名:</span>
			</div>
			<ul class="layui-col-xs11">
				<li class="li-item"  ms-for="(index,item) in @typeList" ms-click="add($event,index,@typeList)" :class="(item.active?'active2':'')">{{item.name}}</li>
			</ul>
		</div>

	</div>

</div>




<%@ include file="../system/index/foot.jsp" %>

<script type="text/javascript">
    avalon.ready(function(){

		avalon.define({
			$id:"report_edit_head",
            name:"",
			typeList:[]
		})

        avalon.scan(document.body)
    })

</script>
</body>
</html>