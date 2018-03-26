<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>老年协会编辑</title>
    <%@ include file="../system/index/headcss.jsp" %>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/source/public/css/list.css">
</head>
<style>
    .layui-form-label {
        width: 120px
    }

    .layui-input-block {
        margin-left: 150px;
    }
</style>
<body>
<div class="edit_menu">

    <form action="${msg}.do" class="layui-form" id="editForm" lay-filter="editForm" method="post">
        <input type="hidden" value="${pd.ID}" name="ID" id="ID"/>

        <blockquote class="layui-elem-quote">老年协会信息表</blockquote>
        <div class="layui-form-item">
            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label"><i class="require">*</i>协会名称：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.NAME }" name="NAME" id="NAME" required lay-verify="required" placeholder="请输入协会名称"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label"><i class="require">*</i>所在区域：</label>
                    <input type="hidden" value="${pd.AREA_CODE}" name="AREA_CODE" id="SZQY_CODE"/>
                    <input type="hidden" value="${pd.AREA_NAME}" name="AREA_NAME" id="SZQY">
                    <div class="layui-input-block sTree" id="sTree">
                    </div>
                </div>

            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">协会负责人：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.FZR }" name="FZR" id="FZR" required lay-verify="required" placeholder="请输入协会负责人"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">协会主管单位：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.ZGDW }" name="ZGDW" id="ZGDW" required lay-verify="required" placeholder="请输入协会主管单位"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

            </div>
        </div>
        <div class="layui-form-item">

            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">联系方式：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.LXFS }" name="LXFS" id="LXFS" required lay-verify="required" placeholder="请输入协会联系方式"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">协会人数：</label>
                    <div class="layui-input-block">
                        <input type="number" value="${pd.RS }" name="RS" id="RS" lay-verify="required" placeholder="请输入协会人数"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

            </div>
        </div>


        <div class="layui-form-item">

            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">成立时间：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.CL_DATE }" name="CL_DATE" id="CL_DATE" required lay-verify="required" placeholder="请输入协会成立时间"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">换届周期：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.LDHJ_TYPE }" name="LDHJ_TYPE" id="LDHJ_TYPE" required lay-verify="required"
                               placeholder="请输入领导换届周期"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

            </div>
        </div>

        <div class="layui-form-item">

            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">注册情况：</label>
                    <div class="layui-input-block">
                        <html:select name="ZCQK" classs="layui-input-inline">
                            <html:options collection="ZCQK_TYPE" defaultValue="${pd.ZCQK}"></html:options>
                        </html:select>
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">是否建立党支部：</label>
                    <div class="layui-input-block">
                        <select name="SFJL_DZ" lay-verify="required">
                            <option value="0" <c:if test="${pd.SFJL_DZ == '0'}">selected</c:if>>是</option>
                            <option value="1" <c:if test="${pd.SFJL_DZ == '1'}">selected</c:if>>否</option>
                        </select>
                    </div>
                </div>

            </div>
        </div>


    </form>

    <div class="btnbox" id="btnDiv" hidden="true">
        <button id="sure" class="layui-btn layui-btn-primary layui-btn-small">保存</button>
        <button id="cancel" class="layui-btn layui-btn-primary layui-btn-small">取消</button>
    </div>


</div>
<%@ include file="../system/index/foot.jsp" %>
<script>
    $(function () {
        var form = layui.form;

        layui.use('laydate', function () {
            var laydate = layui.laydate;
            //执行一个laydate实例
            laydate.render({
                elem: '#CL_DATE'
            });
        });

        //查看
        $.formToDiv(${pd.TYPE== '1'});

        var TYPE = '${pd.TYPE}';
        if (1 == TYPE) {
            $("#btnDiv").hide();
            $("input,select,radio,textarea").attr("disabled", "disabled").css("background-color", "#f2f2f2");
            $("input").removeAttr("placeholder", "");
        } else {
            $("#btnDiv").show();
        }

        //提交
        $("#sure").on("click", function () {

            if ($("#NAME").val() == "") {
                layer.tips('协会名称不能为空', $("#NAME"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#NAME").focus();
                return false;
            }

            if ($("#SZQY_CODE").val() == "") {
                layer.tips('行政区划不能为空', $("#sTree"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#sTree").focus();
                return false;
            }

            parent.layer.load(1);
            $.post('${msg}.do', $('#editForm').serialize(), function (data) {
                if ("success" == data.result) {
                    parent.layer.edit.location.href = '<%=basePath%>associationInfo/listAssociation.do?currentPage=${pd.currentPage}' + '&xzqh_code=' + '${pd.xzqh_code}';
                    parent.layer.closeAll();
                } else {
                    layer.msg('系统异常,保存失败!', {icon: 5});
                }
                parent.layer.closeAll("loading");
            });
        });

        $("#cancel").on("click", function () {
            parent.layer.closeAll();
        });

        //获取行政区地址
        $.post("<%=basePath%>areaCode/listSubAreaCodeByParentId.do", {parentId: 0}, function (data) {
            var sTree = $.Stree({
                el: $("#sTree"),
                oldData: ["${pd.AREA_code}"],
                type:${pd.TYPE== '1'},
                title: "${pd.AREA_NAME}",
                isSingle: true,  //单选
                data: data,
                callback: function () {
                    $("#SZQY_CODE").val($.getString(this.arr, 'areaCode'));
                    $("#SZQY").val($.getString(this.arr, 'title'));
                },
                switchCallback: function (obj) {
                    var id = obj.id;
                    if (obj.children == "") {
                        getAddress(id, sTree)
                    }
                }
            });
        });

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
                sTree.cheakedOldData()
                //展示
            })
        }
    });
</script>
</body>
</html>