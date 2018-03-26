<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>老年协会活动列表</title>
    <%@ include file="../system/index/headcss.jsp" %>
</head>
<body>
<div class="tableBox">

    <div class="operationBox">
        <form class="layui-form" action="listAssociation.do" method="post" name="Form" id="Form">

            <div class="searchBox fl ">
                <input type="hidden" name="area_code" id="area_code" value="${sysArea.area_code}"/>
                <input type="hidden" name="area_name" id="area_name" value="${sysArea.name}"/>
                <div class="sTree fl" id="sTree" style="width:200px">
                </div>
                <div class="fl srarchBtn">
                    <i class="layui-icon">&#xe715;</i>
                </div>
            </div>


            <div class="searchBox fl marL-20">
                <input type="hidden" name="year" id="year" value="${pd.year}"/>
                <input type="text" value="${pd.years}" name="years" id="years" required lay-verify="required" placeholder="年份"
                       autocomplete="off" class="layui-input fl search">
                <div class="fl srarchBtn">
                    <i class="layui-icon">&#xe637;</i>
                </div>
            </div>

            <div class="searchBox fl marL-20">
                <input type="hidden" name="nd" id="nd" value="${pd.nd}"/>
                <div class="layui-form-item ">
                    <select name="nds" lay-verify="required" lay-filter='select1'>
                        <option value="">请选择年度</option>
                        <option value="1" <c:if test="${pd.nd == '1'}">selected</c:if>>全年</option>
                        <option value="0" <c:if test="${pd.nd == '0'}">selected</c:if>>上半年</option>
                    </select>
                </div>
            </div>

        </form>

        <shiro:hasPermission name="hd_add">
            <button class="layui-btn fl  marL-20 layui-btn-blue" id="add">新增</button>
        </shiro:hasPermission>
    </div>

    <!-- table -->
    <div class="layui-col-sm12">
        <table class="layui-table center" id="table ">
            <colgroup>
                <col width="40">
                <col width="150">
                <col>
                <col width="70">
                <col>
                <col>
                <col>
                <col>
                <col>
                <col width="180">
            </colgroup>
            <thead>
            <tr>
                <th>序号</th>
                <th>区域</th>
                <th>年份</th>
                <th>年度</th>
                <th>参与运营管理养老机构协会数量</th>
                <th>参与居家养老服务协会数量</th>
                <th>承担政府购买服务协会数量</th>
                <th>协会开展老年文体活动总次数</th>
                <th>协会开展老年文体活动参与人数</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${not empty associationLifeList}">
                    <shiro:hasPermission name="hd_select">
                        <c:forEach items="${associationLifeList}" var="var" varStatus="vs">
                            <tr>
                                <td>${vs.index+1}</td>
                                <td>${var.NAME}</td>
                                <td>${var.YEAR}</td>
                                <c:if test="${var.ND == '1'}">
                                    <td>全年</td>
                                </c:if>
                                <c:if test="${var.ND == '0'}">
                                    <td>上半年</td>
                                </c:if>

                                <td>${var.YYGL_NUM}</td>
                                <td>${var.JJYL_NUM}</td>
                                <td>${var.ZFGM_NUM}</td>
                                <td>${var.LNWTZCS}</td>
                                <td>${var.LNWTCYS}</td>
                                <td style="text-align: center;">
                                    <a class="layui-btn layui-btn-mini layui-btn-normal" onclick="edit('${var.ID}','1');">查看</a>
                                    <shiro:hasPermission name="hd_update">
                                        <a class="layui-btn layui-btn-mini edit" onclick="edit('${var.ID}','2');">编辑</a>
                                    </shiro:hasPermission>
                                    <shiro:hasPermission name="hd_del">
                                        <a class="layui-btn layui-btn-danger layui-btn-mini del" onclick="del('${var.ID}');">删除</a>
                                    </shiro:hasPermission>
                                </td>
                            </tr>
                        </c:forEach>
                    </shiro:hasPermission>

                    <shiro:lacksPermission name="hd_select">
                        <tr>
                            <td class='center' style="width: 25px;">--</td>
                            <td class="center" colspan="9">您无权查看</td>
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
        <shiro:hasPermission name="hd_select">
            <div class="laypageBox">
                <div id="laypage" class="fr"></div>
            </div>
        </shiro:hasPermission>
    </div>
</div>
<%@ include file="../system/index/foot.jsp" %>
<script type="text/javascript">

    var first = true;
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
                    window.location.href = "<%=basePath%>associationLife/listAssociation.do?currentPage=" + obj.curr + '&keywords=' + '${keywords}' + '&xzqh_code=' + '${pd.xzqh_code}';
                }
            }
        });
    });


    layui.use('laydate', function () {
        var laydate = layui.laydate;
        laydate.render({
            elem: '#years',
            type: 'year',
            value: '${pd.year}',
            done: function (value) {
                $("#year").val(value);
                gsearch();
            }
        });
    });

    form.on('select(select1)', function (data) {
            $("#nd").val(data.value);
            gsearch();
        }
    );

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
            content: '<%=basePath%>associationLife/goAddU.do?currentPage=' + ${page.currentPage} +'&xzqh_code=' + '${pd.xzqh_code}',
            area: ["1000px", "600px"]
        });
    });

    //编辑/查看
    function edit(ID, TYPE) {
        var msg = TYPE == '1' ? '查看' : '编辑';
        parent.parent.layer.edit = window;
        parent.parent.layer.open({
            title: msg,
            type: 2,
            content: '<%=basePath%>associationLife/goEditU.do?ID=' + ID + '&currentPage=' + ${page.currentPage} +'&TYPE=' + TYPE,
            area: ["1000px", "600px"]
        });
    }

    function del(ID) {
        parent.parent.layer.confirm("是否删除此协会?", {
            btn: ['确定', '取消'],
            resize: false,
            title: "提示",
            maxWidth: 800
        }, function (index) {
            var url = "<%=basePath%>associationLife/deleteU.do?ID=" + ID;
            $.get(url, function (data) {
                if ("success" == data.result) {
                    window.location.href = '<%=basePath%>associationLife/listAssociation.do?currentPage=${page.currentPage}' + '&xzqh_code=' + '${pd.xzqh_code}';
                    parent.parent.layer.closeAll();
                } else {
                    layer.msg('系统异常,删除失败!', {icon: 5});
                }
            });
        });
    }

    //所在区域
    $.post("<%=basePath%>areaCode/listSubAreaCodeByParentId", {parentId: 0}, function (data) {
        var sTree = $.Stree({
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