<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>高龄津贴标准管理编辑</title>
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

        <div class="layui-form-item">
            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">所在区域：</label>

                    <div class="layui-input-block">

                        <input type="hidden" value="${pd.AREA_CODE}" name="AREA_CODE" id="AREA_CODE"/>
                        <input type="text" value="${pd.AREA_NAME }" name="AREA_NAME" id="AREA_NAME" required lay-verify="required"
                               autocomplete="off"
                               class="layui-input" readonly="readonly" style="background-color:#f2f2f2 ">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">是否普惠：</label>
                    <div class="layui-input-block">
                        <html:select name="IS_PH" classs="layui-input-inline">
                            <html:options collection="sf" defaultValue="${pd.IS_PH}"></html:options>
                        </html:select>
                    </div>
                </div>

            </div>
        </div>

        <blockquote class="layui-elem-quote">高龄津贴标准设置</blockquote>

        <div class="layui-form-item">
            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label"><i class="require">*</i>年龄区间(周岁)：</label>
                    <div class="layui-input-block">
                        <html:select name="AGE_RANGE" classs="layui-input-inline">
                            <html:options collection="AGE_TYPE" defaultValue="${pd.AGE_RANGE}"></html:options>
                        </html:select>
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label"><i class="require">*</i>标准金额(元/月)：</label>
                    <div class="layui-input-block">
                        <input type="number" value="${pd.BZ_MONEY }" name="BZ_MONEY" id="BZ_MONEY" maxlength="10" required lay-verify="required"
                               placeholder="请输入标准金额"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

            </div>
        </div>

        <div class="layui-form-item">

            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label"><i class="require">*</i>发放周期：</label>
                    <div class="layui-input-block">
                        <html:select name="ZQ" classs="layui-input-inline">
                            <html:options collection="ZQ_TYPE" defaultValue="${pd.ZQ}"></html:options>
                        </html:select>
                    </div>
                </div>

            </div>
        </div>

        <div class="layui-form-item">

            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label"><i class="require">*</i>建立日期：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.JL_DATE }" name="JL_DATE" id="JL_DATE" required lay-verify="required" placeholder="请输入建立日期"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label"><i class="require">*</i>生效日期：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.SX_DATE }" name="SX_DATE" id="SX_DATE" required lay-verify="required" placeholder="请输入生效日期"
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
            //执行一个laydate实例
            laydate.render({
                elem: '#SX_DATE'
            });
            laydate.render({
                elem: '#JL_DATE'
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

            if ($("#BZ_MONEY").val() == "" || isNaN($("#BZ_MONEY").val()) || $("#BZ_MONEY").val() < 20) {
                layer.tips('请输入大于20的有效标准金额', $("#BZ_MONEY"), {
                    tips: [4, '#D16E6C'],
                    time: 4000
                });
                $("#BZ_MONEY").focus();
                return false;
            }

            var JL_DATE = $("#JL_DATE").val();
            if (JL_DATE == "") {
                layer.tips('请选择建立日期', $("#JL_DATE"), {
                    tips: [4, '#D16E6C'],
                    time: 4000
                });
                $("#JL_DATE").focus();
                return false;
            }

            var SX_DATE = $("#SX_DATE").val();
            if (SX_DATE == "") {
                layer.tips('请选择生效日期', $("#SX_DATE"), {
                    tips: [4, '#D16E6C'],
                    time: 4000
                });
                $("#SX_DATE").focus();
                return false;
            }

            if (SX_DATE < JL_DATE) {
                layer.tips('生效日期不能早于建立日期', $("#SX_DATE"), {
                    tips: [4, '#D16E6C'],
                    time: 4000
                });
                return false;
            }
            parent.layer.load(1);
            $.post('${msg}.do', $('#editForm').serialize(), function (data) {
                if ("success" == data.result) {
                    parent.layer.edit.location.href = '<%=basePath%>benefitInfo/listBenefit.do?currentPage=${pd.currentPage}' + '&xzqh_code=' + '${pd.xzqh_code}';
                    parent.layer.closeAll();
                } else if ("fail" == data.result) {
                    layer.msg('当前年龄区间已存在见习数据!', {icon: 5});
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