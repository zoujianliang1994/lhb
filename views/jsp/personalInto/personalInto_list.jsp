<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>老龄人信息迁入列表</title>
    <%@ include file="../system/index/headcss.jsp" %>
</head>
<body>
<div class="tableBox">
    <div class="operationBox">

        <form action="listUsers.do" method="post" name="Form" id="Form">
            <input type="hidden" value="${pd.xzqh_code}" name="xzqh" id="xzqh"/>
            <div class="searchBox fl">
                <input id="keywords" name="keywords" type="text" value="${pd.keywords}" placeholder="请输入姓名、身份证号" class="layui-input fl search">
                <div class="fl srarchBtn" onclick="gsearch()">
                    <i class="layui-icon">&#xe615;</i>
                </div>
            </div>

            <div class="searchBox fl marL-20">
                <input type="hidden" name="area_code" id="area_code" value="${sysArea.area_code}"/>
                <input type="hidden" name="area_name" id="area_name" value="${sysArea.name}"/>
                <div class="sTree fl" id="sTree" style="width:200px">
                    请输入要搜索区域
                </div>
                <div class="fl srarchBtn">
                    <i class="layui-icon">&#xe715;</i>
                </div>
            </div>

            <div class="searchBox fl marL-20">
                <div class="layui-form-item ">
                    <input type="text" value="${pd.BEGIN_DATE }" name="BEGIN_DATE" id="BEGIN_DATE"
                           placeholder="请选择开始日期"
                           autocomplete="off"
                           class="layui-input">
                </div>
            </div>

            <div class="searchBox fl marL-20">
                <div class="layui-form-item ">
                    <input type="text" value="${pd.END_DATE }" name="END_DATE" id="END_DATE" placeholder="请选择结束日期"
                           autocomplete="off"
                           class="layui-input">
                </div>
            </div>

        </form>

    </div>

    <!-- table -->
    <div class="layui-col-sm12">
        <table class="layui-table" id="table">
            <colgroup>
                <col width="60">
                <col>
                <col>
                <col>
                <col>
                <col width="150">
            </colgroup>
            <thead>
            <tr>
                <th>序号</th>
                <th>姓名</th>
                <th>身份证号</th>
                <th>迁入地</th>
                <th>登记日期</th>
                <th>迁入详情</th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${not empty userList}">
                    <shiro:hasPermission name="old_people_qr_select">
                        <c:forEach items="${userList}" var="var" varStatus="vs">
                            <tr>
                                <td>${vs.index+1}</td>
                                <td>${var.DSR_NAME}</td>
                                <td>${var.DSR_IDCARD}</td>
                                <td>${var.QRD_NAME}</td>
                                <td>${var.DJ_DATE}</td>
                                <td style="text-align: center;">
                                    <a class="layui-btn layui-btn-mini layui-btn-normal" onclick="view('${var.ID}');">迁入详情</a>
                                </td>
                            </tr>
                        </c:forEach>

                    </shiro:hasPermission>

                    <shiro:lacksPermission name="old_people_qr_select">
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

        <shiro:hasPermission name="old_people_qr_select">
            <div class="laypageBox">
                <div id="laypage" class="fr"></div>
            </div>
        </shiro:hasPermission>
    </div>
</div>
<%@ include file="../system/index/foot.jsp" %>
<script type="text/javascript">
    var first = true;
    layui.use('laypage', function () {
        var laypage = layui.laypage;
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
                    window.location.href = "<%=basePath%>personalInto/listUsers.do?currentPage=" + obj.curr + '&keywords=' + '${keywords}' + '&xzqh=' + '${pd.xzqh_code}';
                }
            }
        });

        layui.use('laydate', function () {
            var laydate = layui.laydate;
            //执行一个laydate实例
            laydate.render({
                elem: '#BEGIN_DATE',
                done: function (value) {
                    gsearch();
                }
            });
            laydate.render({
                elem: '#END_DATE',
                done: function (value) {
                    gsearch();
                }
            });
        });
    });

    $("#keywords").keydown(function (e) {
        var ev = e || window.event;
        if (ev.keyCode == 13) {
            gsearch();
        }
    });

    //检索
    function gsearch() {
        $("#Form").submit();
    }

    function view(ID) {
        parent.parent.layer.edit = window;
        parent.parent.layer.open({
            title: '迁入详情',
            type: 2,
            content: '<%=basePath%>personalInto/view.do?ID=' + ID,
            area: ["750px", "650px"]
        });
    }
    //所在区域
    $.post("<%=basePath%>areaCode/listSubAreaCodeByParentId", {parentId: 0}, function (data) {
        var sTree = $.Stree({
            title: "${sysArea.name}",
            el: $("#sTree"),
            isSingle: true,  //单选
            data: data,
            callback: function () {
                $("#area_name").val($.getString(this.arr, "title"));
                $("#area_code").val($.getString(this.arr, "areaCode"));
                if (!first) {
                    gsearch();
                }
            },
            switchCallback: function (obj) {
                var id = obj.id;
                if (obj.children == "") {
                    getAddress(id, sTree);
                }
            }
        });
        first = false;
    }, "json");

    function getAddress(id, sTree) {
        $.post("<%=basePath%>areaCode/listSubAreaCodeByParentId", {parentId: id}, function (data) {
            //数据
            sTree.findOne(id, function (obj) {
                if (obj.children == "") {
                    obj.children = data;
                }

                sTree.rec(data, function (obj, index) {
                    sTree.operation(obj, index);
                }, obj.lev)
            });
            //默认选中
            sTree.cheakedOldData();
        })
    }
    function transmit(obj) {
        parent.layer.transmit = obj;
    }
</script>
</body>
</html>