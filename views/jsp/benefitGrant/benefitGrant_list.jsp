<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>高龄津贴信息未列表</title>
    <%@ include file="../system/index/headcss.jsp" %>
</head>
<body>
<div class="tableBox">
    <div class="operationBox">

        <form action="listBenefit.do?xzqh=${pd.xzqh}" method="post" name="Form" id="Form">
            <div class="searchBox fl">
                <input id="keywords" name="keywords" type="text" value="${pd.keywords}" placeholder="请输入姓名、身份证号" class="layui-input fl search">
                <div class="fl srarchBtn" onclick="gsearch()">
                    <i class="layui-icon">&#xe615;</i>
                </div>
            </div>
        </form>
        <shiro:hasPermission name="jtwb_add">
            <button class="layui-btn fl  marL-20 layui-btn-blue" id="add">人员新增</button>
        </shiro:hasPermission>
        <!--
        <shiro:hasPermission name="jtwb_dr">
            <button class="layui-btn fl  marL-20 layui-btn-blue" id="inserExcel">信息导入</button>
        </shiro:hasPermission>
        -->
    </div>

    <!-- table -->
    <div class="layui-col-sm12">
        <table class="layui-table center" id="table ">
            <colgroup>
                <col width="60">
                <col width="200">
                <col>
                <col>
                <col>
                <col>
                <col>
                <col>
                <col width="150">
            </colgroup>
            <thead>
            <tr>
                <th>序号</th>
                <th>区域</th>
                <th>姓名</th>
                <th>身份证号</th>
                <th>年龄</th>
                <th>发放形式</th>
                <th>开户银行</th>
                <th>银行账户</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${not empty benefitGrantList}">
                    <shiro:hasPermission name="jtwb_select">
                        <c:forEach items="${benefitGrantList}" var="var" varStatus="vs">
                            <tr>
                                <td>${vs.index+1}</td>
                                <td>${var.area_name}</td>
                                <td>${var.a_xm}</td>
                                <td>${var.a_sfz}</td>
                                <td>${var.a_age}</td>
                                <td>
                                    <c:if test="${var.FF_TYPE != '' && var.FF_TYPE != null}">
                                        <html:selectedValue collection="FF_TYPE" defaultValue="${var.FF_TYPE}"></html:selectedValue>
                                    </c:if>
                                </td>
                                <td>${var.KHYH}</td>
                                <td>${var.YHZH}</td>
                                <td style="text-align: center;">

                                    <c:if test="${var.ID != '' && var.ID != null}">
                                        <a class="layui-btn layui-btn-mini layui-btn-normal"
                                           onclick="edit('${var.ID}','${var.a_personal_info_id}','1');">查看</a>
                                    </c:if>
                                    <shiro:hasPermission name="jtwb_sq">
                                        <a class="layui-btn layui-btn-mini edit" onclick="edit('${var.ID}','${var.a_personal_info_id}','2');">申请</a>
                                    </shiro:hasPermission>

                                    <shiro:hasPermission name="jtwb_del">
                                        <c:if test="${var.ID != '' && var.ID != null}">
                                            <a class="layui-btn layui-btn-danger layui-btn-mini del"
                                               onclick="del('${var.ID}','${var.a_personal_info_id}');">删除</a>
                                        </c:if>
                                    </shiro:hasPermission>
                                </td>
                            </tr>
                        </c:forEach>
                    </shiro:hasPermission>

                    <shiro:lacksPermission name="jtwb_select">
                        <tr>
                            <td class='center' style="width: 25px;">--</td>
                            <td class="center" colspan="8">您无权查看</td>
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
        <shiro:hasPermission name="jtwb_select">
            <div class="laypageBox">
                <div id="laypage" class="fr"></div>
            </div>
        </shiro:hasPermission>
    </div>
</div>
<%@ include file="../system/index/foot.jsp" %>
<script type="text/javascript">

    var form = layui.form;
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
                if (!first) {
                    window.location.href = "<%=basePath%>benefitGrant/listBenefit.do?currentPage=" + obj.curr + '&keywords=' + '${keywords}' + '&xzqh=' + '${pd.xzqh}';
                }
            }
        });
    });

    function gsearch() {
        $("#Form").submit();
    }

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
            title: "新增",
            type: 2,
            content: '<%=basePath%>personalInfo/goAddU.do?currentPage=' + ${page.currentPage} +'&xzqh=' + '${pd.xzqh}' + '&ywlx=benefit',
            area: ["1000px", "700px"]
        });
    });


    //编辑/查看
    function edit(ID, AID, TYPE) {
        var msg = TYPE == '1' ? '查看' : '编辑';
        parent.parent.layer.edit = window;
        parent.parent.layer.open({
            title: msg,
            type: 2,
            content: '<%=basePath%>benefitGrant/goEditU.do?ID=' + ID + '&PERSONAL_INFO_ID=' + AID + '&currentPage=' + ${page.currentPage} +'&TYPE=' + TYPE + '&xzqh=' + '${pd.xzqh}',
            area: ["1000px", "600px"]
        });
    }

    function del(ID, AID) {
        parent.parent.layer.confirm("是否删除此高龄津贴信息?", {
            btn: ['确定', '取消'],
            resize: false,
            title: "提示",
            maxWidth: 800
        }, function (index) {
            var url = "<%=basePath%>benefitGrant/deleteU.do?ID=" + ID + '&PERSONAL_INFO_ID=' + AID;
            $.get(url, function (data) {
                if ("success" == data.result) {
                    window.location.href = '<%=basePath%>benefitGrant/listBenefit.do?currentPage=${page.currentPage}' + '&xzqh=' + '${pd.xzqh}';
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