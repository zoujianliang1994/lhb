<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <!-- jsp文件头和头部 -->
    <script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>static/source/public/css/list.css">
    <%@ include file="../index/headcss.jsp" %>

</head>
<body>

<div style="padding: 20px;">
    <div class="sTreeBox" style="width: 100%">
        <div id="sTree" class="sTree"></div>
    </div>
    <div class="btnbox">
        <button id="sure" class="layui-btn layui-btn-primary layui-btn-small">确认</button>
        <button id="cancel" class="layui-btn layui-btn-primary layui-btn-small">取消</button>
    </div>
</div>
<%@ include file="../index/foot.jsp" %>
<script type="text/javascript">

    $(document).ready(function () {
        var type = '${pd.TYPE}';
        var sTree;
       
    	
        if ("1" == type) {
        	var idArr= $.toArr(parent.layer.transmit.$("#SECTION_ID").val());
            sTree = $.Stree({
            	oldData:idArr,
                el: $("#sTree"),
                isSingle: true,  //单选
                data:${zTreeNodes}
            });
        } else {
        	 var idArr= $.toArr(parent.layer.transmit.$("#ROLE_ID").val());
            sTree = $.Stree({
            	oldData:idArr,
                el: $("#sTree"),
                data:${zTreeNodes}
            });
        }
        $("#sure").on("click", function () {
            var id = $.getString(sTree.arr, "id");
            var name = $.getString(sTree.arr, "title");
            if ("1" == type) {
                parent.layer.transmit.$("#SECTION_ID").val(id);
                parent.layer.transmit.$("#SECTION_NAME").val(name);
            } else {
                parent.layer.transmit.$("#ROLE_ID").val(id + ",");
                parent.layer.transmit.$("#ROLENAME").val(name + ",");
            }
            parent.layer.close(parent.layer.index);
        });

        $("#cancel").on("click", function () {
            parent.layer.close(parent.layer.index);
        })
    });
    //myFrame.window.
</script>
</body>
</html>