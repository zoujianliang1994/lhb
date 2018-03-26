﻿
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>老龄人口管理</title>
    <%@ include file="../system/index/headcss.jsp" %>
</head>
<body>
<div class="tableBox">
    <P class="center marT10" style="margin:0 0 20px 0;color:#FF5722">批量迁移数据，测试阶段请大家暂勿使用</P>
    <div class="operationBox">

        <form action="goUserList.do?xzqh=${pd.xzqh_code}" method="post" name="Form" id="Form">
            <input type="hidden" value="${pd.xzqh_code}" name="xzqh_code" id="xzqh_code"/>
            <div class="searchBox fl">
                <input id="keywords" name="keywords" type="text" value="${pd.keywords}" placeholder="请输入户籍地址、常住地址" class="layui-input fl search">
                <div class="fl srarchBtn" onclick="gsearch()">
                    <i class="layui-icon">&#xe615;</i>
                </div>
            </div>
        </form>


        <div class="searchBox fl marL-20">
            <span class="fl" style="line-height:40px">迁入区域：</span>
            <div class="sTree fl" id="sTree" style="width:200px">

            </div>
            <div class="fl srarchBtn">
                <i class="layui-icon">&#xe715;</i>
            </div>
        </div>
		<shiro:hasPermission name="system:moveoldpeople:update">
	        <div class="searchBox fl marL-20">
	            <button class="layui-btn fl  marL-20 layui-btn-blue" id="move">迁移</button>
	        </div>
		</shiro:hasPermission>

        <div class="searchBox fr marL-20">
            <span class="fl" style="line-height:40px">查看当前区域人数：</span>
            <div class="sTree fl" id="sTree2" style="width:200px">

            </div>
            <div class="fl srarchBtn">
                <i class="layui-icon">&#xe715;</i>
            </div>
        </div>
    </div>

    <!-- table -->
    <div class="layui-col-sm12">
        <table class="layui-table center" id="table ">
            <colgroup>
                <col width="60">
                <col width="85">
                <col width="60">
                <col>
                <col>
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>序号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>身份证号</th>
                <th>户籍地址</th>
                <th>常住地址</th>
                <th>行政区划</th>
                <th>行政区划code</th>
            </tr>
            </thead>
            <tbody>
            <c:choose>

                <c:when test="${not empty userList}">
                    <shiro:hasPermission name="old_people_select">
                        <c:forEach items="${userList}" var="var" varStatus="vs">
                            <tr>
                                <td>${vs.index+1}</td>
                                <td>${var.xm}</td>
                                <td><c:if test="${var.xb == 1 }">女</c:if>
                                    <c:if test="${var.xb == 2 }">男</c:if>
                                </td>
                                <td class="pid" data-pid="${var.personal_append_id}">${var.sfz}</td>
                                <td>${var.hjdz}</td>
                                <td >${var.czdz}</td>
                                <td>${var.xzqh}</td>
                                <td >${var.xzqh_code}</td>

                            </tr>
                        </c:forEach>
                    </shiro:hasPermission>

                    <shiro:lacksPermission name="old_people_select">
                        <tr>
                            <td class='center' style="width: 25px;">--</td>
                            <td class="center" colspan="5">您无权查看</td>
                        </tr>
                    </shiro:lacksPermission>
                </c:when>

                <c:otherwise>
                    <tr class="main_info">
                        <td colspan="100" class="center">没有相关数据</td>
                    </tr>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>


        <shiro:hasPermission name="old_people_select">
            <div class="laypageBox">
                <div id="laypage" class="fr"></div>
            </div>
        </shiro:hasPermission>

    </div>
</div>
<%@ include file="../system/index/foot.jsp" %>
<script type="text/javascript">


    $(function(){
        var area= "";

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
                limit:500,
                curr: ${page.currentPage},
                layout: ['prev', 'page', 'next','count', 'skip'],
                jump: function (obj, first) {
                    if (!first) {
                        var keywords= encodeURI("${pd.keywords}");
                        window.location.href = "<%=basePath%>nopublic/goUserList.do?currentPage=" + obj.curr + '&keywords=' + keywords + '&xzqh_code=' + '${pd.xzqh_code}';
                    }
                }
            });
        });

        $("#keywords").keydown(function (e) {
            var ev = e || window.event;
            if (13 === ev.keyCode) {
                gsearch();
            }
        });

        //检索
        function gsearch() {
            $("#Form").submit();
        }
        $.post("<%=basePath%>areaCode/listSubAreaCodeByParentId", {parentId: 0}, function (data) {
            var sTree = $.Stree({
                el: $("#sTree"),
                data: data,
                isSingle: true,  //单选
                callback: function (obj) {
                    console.log(obj)
                    area= obj.areaCode;
                },
                switchCallback: function (obj) {
                    var id = obj.id;
                    if (obj.children == "") {
                        var options={
                            url:"<%=basePath%>areaCode/listSubAreaCodeByParentId",
                            opt:{parentId: id},
                            id:id
                        }
                        this.addData(options)
                    }
                }
            });

        })

        $.post("<%=basePath%>areaCode/listSubAreaCodeByParentId", {parentId: 0}, function (data) {
            var sTree = $.Stree({
                el: $("#sTree2"),
                data: data,
                isSingle: true,  //单选
                callback: function (obj) {
                    console.log(obj)
                    window.location.href= "<%=basePath%>nopublic/goUserListByAreacode?areacode="+obj.areaCode;
                },
                switchCallback: function (obj) {
                    var id = obj.id;
                    if (obj.children == "") {
                        var options={
                            url:"<%=basePath%>areaCode/listSubAreaCodeByParentId",
                            opt:{parentId: id},
                            id:id
                        }
                        this.addData(options)
                    }
                }
            });

        })

        $("#move").on("click",function(){
            if(area == ""){
                top.layer.msg("请选择区划",{
                    icon:2,
                    shift:6
                })
                return
            }
            var pids= [];
            $(".pid").each(function(){
                pids.push($(this).data("pid"))
            })
            var len= pids.length;
            pids= pids.join(",");
            top.layer.confirm("区划："+$("#sTree input").val()+"<br/>数据："+len, {
                    btn: ["确定", "取消"],
                },function(){
                    top.layer.load(2);
                    $.post("<%=basePath%>nopublic/moveUserToNewArea",{newAreaCode:area,pids:pids},function(data){
                        top.layer.closeAll();
                        if(data.code == 10000){
                            window.location.reload();
                        }

                    })

                })
        })
    })

</script>
</body>
</html>