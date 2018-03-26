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
    <div class="operationBox">

        <form action="listUsers.do?xzqh=${pd.xzqh_code}" method="post" name="Form" id="Form">
            <input type="hidden" value="${pd.xzqh_code}" name="xzqh_code" id="xzqh_code"/>
            <div class="searchBox fl">
                <input id="keywords" name="keywords" type="text" value="${pd.keywords}" placeholder="请输入姓名、身份证号" class="layui-input fl search">
                <div class="fl srarchBtn" onclick="gsearch()">
                    <i class="layui-icon">&#xe615;</i>
                </div>
            </div>
        </form>
        <shiro:hasPermission name="old_people_add">
            <button class="layui-btn fl  marL-20 layui-btn-blue" id="add">人员新增</button>
        </shiro:hasPermission>
        <shiro:hasPermission name="old_people_iddr">
            <button class="layui-btn fl  marL-20 layui-btn-blue" id="addReadCard">读取身份证</button>
        </shiro:hasPermission>
        <shiro:hasPermission name="old_people_dr">
            <button class="layui-btn fl  marL-20 layui-btn-blue" id="upload">人员信息导入</button>
        </shiro:hasPermission>
        <shiro:hasPermission name="old_people_bx">
            <button class="layui-btn fl  marL-20 layui-btn-blue" id="uploadInsu">意外保险导入</button>
        </shiro:hasPermission>
        <button class="layui-btn fl  marL-20 layui-btn-blue" id="into">人员迁入</button>
        <shiro:hasPermission name="old_people_pldel">
            <button class="layui-btn fl  marL-20 layui-btn-blue" id="deleteAll">批量删除</button>
        </shiro:hasPermission>
        <shiro:hasPermission name="old_people_export">
            <button class="layui-btn fl  marL-20 layui-btn-blue" id="exportAll">人员导出</button>
        </shiro:hasPermission>
    </div>

    <!-- table -->
    <div class="layui-col-sm12 ">
        <table class="layui-table center" id="table ">
            <colgroup>
                <col>
                <col width="60">
                <col width="85">
                <col width="60">
                <col>
                <col>
                <col>
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>
                    <input type="checkbox" class="table-check" name="allCheck" id="allCheck" value="">
                </th>
                <th>序号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>身份证号</th>
                <th>户籍地址</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:choose>

                <c:when test="${not empty userList}">
                    <shiro:hasPermission name="old_people_select">
                        <c:forEach items="${userList}" var="var" varStatus="vs">
                            <tr>
                                <td>
                                    <input type="checkbox" class="table-check" name="item" value="${var.personal_info_id}">
                                </td>
                                <td>${vs.index+1}</td>
                                <td>${var.xm}</td>
                                <td><c:if test="${var.xb == 1 }">女</c:if>
                                    <c:if test="${var.xb == 2 }">男</c:if>
                                </td>
                                <td>${var.sfz}</td>
                                <td>${fn:substring(var.hjdz, 0,20)}</td>
                                <td style="text-align: center;">

                                    <a class="layui-btn layui-btn-mini layui-btn-normal" onclick="edit('${var.personal_info_id}','1');">查看</a>

                                    <shiro:hasPermission name="old_people_update">
                                        <a class="layui-btn layui-btn-mini edit" onclick="edit('${var.personal_info_id}','2');">编辑</a>
                                    </shiro:hasPermission>

                                    <shiro:hasPermission name="old_people_zx">
                                        <a class="layui-btn layui-btn-mini  layui-btn-warm" onclick="logout('${var.personal_info_id}');">注销</a>
                                    </shiro:hasPermission>

                                    <shiro:hasPermission name="old_people_del">
                                        <a class="layui-btn layui-btn-danger layui-btn-mini del" onclick="del('${var.personal_info_id}');">删除</a>
                                    </shiro:hasPermission>
                                </td>
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
            limit: 300,
            layout: ['prev', 'page', 'next', 'count', 'skip'],
            jump: function (obj, first) {
                if (!first) {
                    var keywords = encodeURI("${pd.keywords}");
                    window.location.href = "<%=basePath%>personalInfo/listUsers.do?currentPage=" + obj.curr + '&keywords=' + keywords + '&xzqh_code=' + '${pd.xzqh_code}';
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

    //新增
    $("#add").on("click", function () {
        parent.parent.layer.edit = window;
        parent.parent.layer.open({
            title: "人员新增",
            type: 2,
            content: '<%=basePath%>personalInfo/goAddU.do?currentPage=' + ${page.currentPage} +'&xzqh_code=' + '${pd.xzqh_code}',
            area: ["1000px", "560px"]
        });
    });

    //新增身份证导入
    $("#addReadCard").on("click", function () {
        parent.parent.layer.edit = window;
        parent.parent.layer.open({
            title: "读取身份证",
            type: 2,
            content: '<%=basePath%>views/jsp/personalinfo/personalinfo_readCard.html?currentPage=' + ${page.currentPage} +'&xzqh_code=' + '${pd.xzqh_code}',
            area: ["1000px", "560px"]
        });
    });

    //编辑/查看
    function edit(personal_info_id, TYPE) {
        var msg = TYPE == '1' ? '查看' : '编辑';
        parent.parent.layer.edit = window;
        parent.parent.layer.open({
            title: msg,
            type: 2,
            content: '<%=basePath%>personalInfo/goEditU.do?personal_info_id=' + personal_info_id + '&currentPage=' + ${page.currentPage} +'&TYPE=' + TYPE + '&xzqh_code=' + '${pd.xzqh_code}',
            area: ["1000px", "560px"]
        });
    }

    //注销
    function logout(personal_info_id) {
        parent.parent.layer.logout = window;
        parent.parent.layer.open({
            title: '注销',
            type: 2,
            content: '<%=basePath%>personalInfo/goLogout.do?personal_info_id=' + personal_info_id + '&currentPage=' + ${page.currentPage} +'&xzqh_code=' + '${pd.xzqh_code}',
            area: ["900px", "660px"]
        });
    }

    //迁入
    $("#into").on("click", function () {
        parent.parent.layer.into = window;
        parent.parent.layer.open({
            title: "人员迁入",
            type: 2,
            content: '<%=basePath%>personalInfo/goInto.do?currentPage=' + ${page.currentPage} +'&xzqh_code=' + '${pd.xzqh_code}',
            area: ["900px", "660px"]
        });
    });

    //人员信息导入
    $("#upload").on("click", function () {
        parent.parent.layer.upload = window;
        var idx = parent.parent.layer.open({
            title: "人员信息导入",
            type: 2,
            content: '<%=basePath%>personalInfo/goUploadExcel.do?currentPage=' + ${page.currentPage} +'&xzqh_code=' + '${pd.xzqh_code}',
            area: ["600px", "500px"]
        });
        parent.parent.idx = idx;
    });

    //意外保险导入
    $("#uploadInsu").on("click", function () {
        parent.parent.layer.uploadInsu = window;
        var idx = parent.parent.layer.open({
            title: "意外保险导入",
            type: 2,
            content: '<%=basePath%>personalInfo/goUploadExcel.do?currentPage=' + ${page.currentPage} +'&xzqh_code=' + '${pd.xzqh_code}' + '&type=1',
            area: ["600px", "500px"]
        });
        parent.parent.idx = idx;
    });

    //批量删除
    $("#deleteAll").on("click", function () {
        var $items = $('input:checkbox[name=item]:checked');
        var arr = [];
        $items.each(function () {
            arr.push($(this).val())
        })
        if (arr == "") {
            top.layer.closeAll()
            top.layer.msg("请勾选要删除数据！", {icon: 2})
            return
        }
        var len = arr.length;
        top.layer.confirm("是否删除当前选中的" + len + "条数据?", {
            btn: ['确定', '取消'],
            resize: false,
            title: "提示",
            maxWidth: 800
        }, function () {
            top.layer.load(2)
            $.post("<%=basePath%>personalInfo/deletePersonalById", {personal_info_ids: arr.join(",")}, function (data) {
                if (data.result == 'success') {
                    window.location.reload();
                } else {
                    top.layer.msg("删除失败", {icon: 2})
                }
                top.layer.closeAll()
            })
        })
    });

    //导出
    $("#exportAll").on("click", function () {
        parent.parent.layer.export = window;
        var idx = parent.parent.layer.open({
            title: "人员信息导出",
            type: 2,
            content: '<%=basePath%>personalInfo/goUploadExcel.do?type=2&currentPage=' + ${page.currentPage},
            area: ["600px", "500px"]
        });
        parent.parent.idx = idx;
    });

    //全选
    $("#allCheck").on("click", function () {
        var mark = $(this).attr("checked");
        var $items = $('input:checkbox[name=item]');
        if (mark == "checked") {
            $items.each(function () {
                $(this).attr("checked", true)
            })
        } else {
            $items.each(function () {
                $(this).attr("checked", false)
            })
        }
    })
    function del(personal_info_id) {
        parent.parent.layer.confirm("是否删除此用户?", {
            btn: ['确定', '取消'],
            resize: false,
            title: "提示",
            maxWidth: 800
        }, function (index) {
            var url = "<%=basePath%>personalInfo/deleteU.do?personal_info_id=" + personal_info_id;
            $.get(url, function (data) {
                if ("success" == data.result) {
                    window.location.href = '<%=basePath%>personalInfo/listUsers.do?currentPage=${page.currentPage}' + '&xzqh_code=' + '${pd.xzqh_code}';
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