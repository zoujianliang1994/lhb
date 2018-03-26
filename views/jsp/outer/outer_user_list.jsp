<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>外部单位人员管理</title>
    <%@ include file="../system/index/headcss.jsp" %>
</head>
<body>
<div class="tableBox">
    <div class="operationBox">

        <form action="listUsers.do" method="post" name="Form" id="Form">

            <div class="searchBox fl">
                <input id="keywords" name="keywords" type="text" value="${pd.keywords}" placeholder="请输入姓名或账号" class="layui-input fl search">
                <div class="fl srarchBtn" onclick="gsearch()">
                    <i class="layui-icon">&#xe615;</i>
                </div>
            </div>
        </form>
	 <shiro:hasPermission name="outUnitPerson:add">
	  	<button class="layui-btn fl  marL-20 layui-btn-blue" id="add">新增</button>
	 </shiro:hasPermission>
       
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
            </colgroup>
            <thead>
            <tr>
                <th>序号</th>
                <th>姓名</th>
                <th>账号</th>
                <th>所在单位</th>
                <th>联系方式</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${not empty userList}">
                    <c:forEach items="${userList}" var="var" varStatus="vs">
                        <tr>
                            <td>${vs.index+1}</td>
                            <td>${var.NAME}</td>
                            <td>${var.USERNAME}</td>
                            <td>${var.SECTION_NAME}</td>
                            <td>${var.PHONE}</td>
                            <td style="text-align: center;">
                                 <a class="layui-btn layui-btn-mini layui-btn-normal" onclick="edit('${var.USER_ID}','1');">查看</a>
                                 <shiro:hasPermission name="outUnitPerson:edit">
                                	<a class="layui-btn layui-btn-mini edit" onclick="edit('${var.USER_ID}','2');">编辑</a>
                                 </shiro:hasPermission>
                                 <shiro:hasPermission name="outUnitPerson:del">
                               	 	<a class="layui-btn layui-btn-danger layui-btn-mini del" onclick="del('${var.USER_ID}');">删除</a>
                                </shiro:hasPermission>
                                </td>
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
    layui.use('laypage', function () {
        var laypage = layui.laypage;
        var layer = layui.layer;
        var form = layui.form;
        var editHtml = $("#editHtml").html();
        $("#editHtml").remove();

        //执行一个laypage实例
        laypage.render({
            elem: 'laypage',
            count: ${page.totalResult},
            curr: ${page.currentPage},
            layout: ['prev', 'page', 'next', 'count', 'skip'],
            jump: function (obj, first) {
            	console.log(obj);
                if (!first) {
                    window.location.href = "<%=basePath%>outer/user/listUsers.do?currentPage=" + obj.curr + '&keywords=' + '${keywords}&xzqh=${pd.xzqh}';
                }
            }
        });
    });

    $("#keywords").keydown(function (e) {
        var ev= e || window.event
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
            content: '<%=basePath%>outer/user/goAddU.do?currentPage=' + ${page.currentPage}+'&xzqh=${pd.xzqh}',
            area: ["800px", "550px"]
        });
    });

    function edit(USER_ID, TYPE) {
        var msg = TYPE == '1' ? '查看' : '编辑';
        var area= TYPE == '1' ?["800px", "430px"]:["800px", "550px"]
        parent.parent.layer.edit = window;
        parent.parent.layer.open({
            title: msg,
            type: 2,
            content: '<%=basePath%>outer/user/goEditU.do?USER_ID=' + USER_ID + '&currentPage=' + ${page.currentPage} +'&TYPE=' + TYPE+'&xzqh=${pd.xzqh}',
            area:area
        });
    }

    function del(USER_ID) {
        parent.parent.layer.confirm("是否删除此用户?", {
            btn: ['确定', '取消'],
            resize: false,
            title: "提示",
            maxWidth: 800
        }, function (index) {
            var url = "<%=basePath%>outer/user/deleteU.do?USER_ID=" + USER_ID;
            $.get(url, function (data) {
                if ("success" == data.result) {
                    window.location.href = "<%=basePath%>outer/user/listUsers.do?currentPage=${page.currentPage}"+"&xzqh=${pd.xzqh}";
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