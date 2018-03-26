<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>老年协会活动编辑</title>
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
        <input type="hidden" value="${pd.AREA_CODE}" name="AREA_CODE" id="AREA_CODE"/>
        <blockquote class="layui-elem-quote">老年协会活动情况统计表</blockquote>
        <div class="layui-form-item">
            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">填表人：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.TBR }" name="TBR" id="TBR" readonly style="background-color: #f2f2f2"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">填表单位：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.TBDW }" name="TBDW" id="TBDW" readonly style="background-color: #f2f2f2"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">填表日期：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.TB_DATE }" name="TB_DATE" id="TB_DATE" readonly style="background-color: #f2f2f2"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label"><i class="require">*</i>年份：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.YEAR }" name="YEAR" id="YEAR" required lay-verify="required" placeholder="请输入年份"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

            </div>
        </div>
        <div class="layui-form-item">

            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label"><i class="require">*</i>年度：</label>
                    <div class="layui-input-block">
                        <select name="ND" lay-verify="required">
                            <option value="0" <c:if test="${pd.ND == '0'}">selected</c:if>>上半年</option>
                            <option value="1" <c:if test="${pd.ND == '1'}">selected</c:if>>全年</option>
                        </select>
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">参与运营管理养老机构协会数量：</label>
                    <div class="layui-input-block">
                        <input type="number" value="${pd.YYGL_NUM }" name="YYGL_NUM" id="YYGL_NUM" required lay-verify="required"
                               placeholder="请输入参与运营管理养老机构协会数量"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

            </div>
        </div>


        <div class="layui-form-item">

            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">参与居家养老服务协会数量：</label>
                    <div class="layui-input-block">
                        <input type="number" value="${pd.JJYL_NUM }" name="JJYL_NUM" id="JJYL_NUM" required lay-verify="required"
                               placeholder="请输入参与居家养老服务协会数量"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">承担政府购买服务协会数量：</label>
                    <div class="layui-input-block">
                        <input type="number" value="${pd.ZFGM_NUM }" name="ZFGM_NUM" id="ZFGM_NUM" required lay-verify="required"
                               placeholder="请输入承担政府购买服务协会数量"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

            </div>
        </div>

        <div class="layui-form-item">

            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">协会开展老年文体活动总次数：</label>
                    <div class="layui-input-block">
                        <input type="number" value="${pd.LNWTZCS }" maxlength="10" name="LNWTZCS" id="LNWTZCS" required lay-verify="required"
                               placeholder="请输入协会开展老年文体活动总次数"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">协会开展老年文体活动参与人数：</label>
                    <div class="layui-input-block">
                        <input type="number" value="${pd.LNWTCYS }" maxlength="10" name="LNWTCYS" id="LNWTCYS" required lay-verify="required"
                               placeholder="请输入协会开展老年文体活动参与人数"
                               autocomplete="off"
                               class="layui-input">
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
            laydate.render({
                elem: '#TB_DATE'
            });

            laydate.render({
                elem: '#YEAR',
                type: 'year'
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

            if ($("#YEAR").val() == "") {
                layer.tips('年份不能为空!', $("#YEAR"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#YEAR").focus();
                return false;
            }

            parent.layer.load(1);
            $.post('${msg}.do', $('#editForm').serialize(), function (data) {
                if ("success" == data.result) {
                    parent.layer.edit.location.href = '<%=basePath%>associationLife/listAssociation.do?currentPage=${pd.currentPage}' + '&xzqh_code=' + '${pd.xzqh_code}';
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

    });
</script>
</body>
</html>