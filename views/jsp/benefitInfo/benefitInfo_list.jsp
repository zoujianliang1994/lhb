<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>高龄津贴标准管理列表</title>
    <%@ include file="../system/index/headcss.jsp" %>
</head>
<body>
<style>
    .label {
        display: block;
        padding: 9px 5px;
        text-align: left;
    }
</style>
<div class="tableBox">
    <div class="operationBox">

        <form class="layui-form" action="listBenefit.do?xzqh=${pd.xzqh_code}" method="post" name="Form" id="Form">

            <div class="searchBox fl marL-20">

                <input type="hidden" name="area_code" id="area_code" value="${sysArea.area_code}"/>
                <input type="hidden" name="area_name" id="area_name" value="${sysArea.name}"/>
                <label class="fl label">区域:</label>
                <div class="sTree fl" id="sTree" style="width:200px">
                </div>
                <div class="fl srarchBtn">
                    <i class="layui-icon">&#xe715;</i>
                </div>
            </div>
            <label class="fl label marL-20">状态:</label>
            <div class="searchBox fl ">
                <div class=" fl">
                    <html:select name="ZT" classs="layui-input-inline" style="lay-filter='select1'">
                        <html:options collection="ZT_TYPE" defaultValue="${pd.ZT}"></html:options>
                    </html:select>
                </div>

            </div>

            <label class="fl label marL-20">是否普惠:</label>
            <div class="searchBox fl ">
                <div class="layui-form-item fl">
                    <html:select name="IS_PH" classs="layui-input-inline" style="lay-filter='select2'">
                        <html:options collection="sf" defaultValue="${pd.IS_PH}"></html:options>
                    </html:select>
                </div>

            </div>

        </form>
        <shiro:hasPermission name="jt_add">
            <button class="layui-btn fl  marL-20 layui-btn-blue" id="add">新增</button>
        </shiro:hasPermission>
    </div>

    <!-- table -->
    <div class="layui-col-sm12">
        <table class="layui-table center" id="table">
            <colgroup>
                <col width="60">
                <col width="200">
                <col>
                <col>
                <col>
                <col>
                <col>
                <col width="200">
            </colgroup>
            <thead>
            <tr>
                <th>序号</th>
                <th>区域</th>
                <th>年龄区间</th>
                <th>标准金额(元/月)</th>
                <th>发放周期</th>
                <th>状态</th>
                <th>生效日期</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${not empty benefitInfoList}">
                    <shiro:hasPermission name="jt_select">
                        <c:forEach items="${benefitInfoList}" var="var" varStatus="vs">
                            <tr>
                                <td>${vs.index+1}</td>
                                <td>${var.AREA_NAME}</td>

                                <td>
                                    <html:selectedValue collection="AGE_TYPE" defaultValue="${var.AGE_RANGE}"></html:selectedValue>
                                </td>

                                <td>${var.BZ_MONEY}</td>

                                <td>
                                    <html:selectedValue collection="ZQ_TYPE" defaultValue="${var.ZQ}"></html:selectedValue>
                                </td>

                                <td>
                                    <html:selectedValue collection="ZT_TYPE" defaultValue="${var.ZT}"></html:selectedValue>
                                </td>

                                <td>${var.SX_DATE}</td>
                                <td style="text-align: center;">
                                    <a class="layui-btn layui-btn-mini layui-btn-normal" onclick="edit('${var.ID}','1');">查看</a>
                                    <c:if test="${var.ZT == '3'}">
                                        <shiro:hasPermission name="jt_update">
                                            <a class="layui-btn layui-btn-mini edit" onclick="edit('${var.ID}','2');">编辑</a>
                                        </shiro:hasPermission>
                                        <shiro:hasPermission name="jt_del">
                                            <a class="layui-btn layui-btn-danger layui-btn-mini del" onclick="del('${var.ID}');">删除</a>
                                        </shiro:hasPermission>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </shiro:hasPermission>

                    <shiro:lacksPermission name="jt_select">
                        <tr>
                            <td class='center' style="width: 25px;">--</td>
                            <td class="center" colspan="7">您无权查看</td>
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
        <shiro:hasPermission name="jt_select">
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
                    window.location.href = "<%=basePath%>benefitInfo/listBenefit.do?currentPage=" + obj.curr + '&keywords=' + '${keywords}' + '&xzqh_code=' + '${pd.xzqh_code}';
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

    form.on('select(select1)', function (data) {
            $("#ZT").val(data.value);
            gsearch();
        }
    );

    form.on('select(select2)', function (data) {
            $("#IS_PH").val(data.value);
            gsearch();
        }
    );

    //新增
    $("#add").on("click", function () {
        parent.parent.layer.edit = window;
        parent.parent.layer.open({
            title: "新增",
            type: 2,
            content: '<%=basePath%>benefitInfo/goAddU.do?currentPage=' + ${page.currentPage} +'&xzqh_code=' + '${pd.xzqh_code}',
            area: ["1000px", "500px"]
        });
    });

    //编辑/查看
    function edit(ID, TYPE) {
        var msg = TYPE == '1' ? '查看' : '编辑';
        parent.parent.layer.edit = window;
        parent.parent.layer.open({
            title: msg,
            type: 2,
            content: '<%=basePath%>benefitInfo/goEditU.do?ID=' + ID + '&currentPage=' + ${page.currentPage} +'&TYPE=' + TYPE + '&xzqh_code=' + '${pd.xzqh_code}',
            area: ["1000px", "500px"]
        });
    }

    function del(ID) {
        parent.parent.layer.confirm("是否删除此高龄津贴信息?", {
            btn: ['确定', '取消'],
            resize: false,
            title: "提示",
            maxWidth: 800
        }, function (index) {
            var url = "<%=basePath%>benefitInfo/deleteU.do?ID=" + ID;
            $.get(url, function (data) {
                if ("success" == data.result) {
                    window.location.href = '<%=basePath%>benefitInfo/listBenefit.do?currentPage=${page.currentPage}' + '&xzqh_code=' + '${pd.xzqh_code}';
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