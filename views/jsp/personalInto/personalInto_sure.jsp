<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>老龄人口迁入确认</title>
    <%@ include file="../system/index/headcss.jsp" %>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>static/source/public/css/list.css">
</head>
<body>
<div class="edit_menu">
    <form class="layui-form" id="editForm" lay-filter="editForm" method="post">
        <input type="hidden" value="${pd.ID}" id="ID" name="ID"/>
        <input type="hidden" value="${pd.ID}" id="BUSINESS_ID" name="BUSINESS_ID"/>

        <blockquote class="layui-elem-quote">填表信息</blockquote>
        <div class="layui-form-item">
            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">填表人：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.DJR }" name="DJR" id="DJR" readonly style="background-color: #f2f2f2" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">填表单位：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.DJDW }" name="DJDW" id="DJDW" readonly style="background-color: #f2f2f2" autocomplete="off"
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
                        <input type="text" value="${pd.DJ_DATE }" name="DJ_DATE" id="DJ_DATE" readonly style="background-color: #f2f2f2"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>

            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-row">
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">迁入地：</label>
                    <div class="layui-input-block">
                        <input type="hidden" value="${pd.QRD_CODE}" name="QRD_CODE" id="QRD_CODE"/>
                        <input type="text" value="${pd.QRD_NAME }" name="QRD_NAME" id="QRD_NAME" readonly style="background-color: #f2f2f2"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>


                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">迁出地：</label>
                    <div class="layui-input-block">
                        <input type="hidden" value="${pd.QCD_CODE}" name="QCD_CODE" id="QCD_CODE"/>
                        <input type="text" value="${pd.QCD_NAME }" name="QCD_NAME" id="QCD_NAME" readonly style="background-color: #f2f2f2"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
        </div>

        <blockquote class="layui-elem-quote">当事人信息</blockquote>
        <div class="layui-form-item">
            <div class="layui-row">
                <input type="hidden" id="PERSONAL_INFO_ID" name="PERSONAL_INFO_ID" value="${pd.PERSONAL_INFO_ID}"/>
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">身份证号：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.DSR_IDCARD }" name="DSR_IDCARD" id="DSR_IDCARD" autocomplete="off" class="layui-input" readonly
                               style="background-color: #f2f2f2">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">姓名：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.DSR_NAME }" name="DSR_NAME" id="DSR_NAME" autocomplete="off" class="layui-input" readonly
                               style="background-color: #f2f2f2">
                    </div>
                </div>
            </div>

        </div>

        <div class="layui-form-item">
            <div class="layui-row">
                <div class="layui-form-item">
                    <label class="layui-form-label">备注：</label>
                    <div class="layui-input-block">
                        <textarea name="BZ" id="BZ" readonly style="background-color: #f2f2f2" class="layui-textarea">${pd.BZ }</textarea>
                    </div>
                </div>
            </div>
        </div>


        <blockquote class="layui-elem-quote">代办人信息</blockquote>
        <div class="layui-form-item">
            <div class="layui-row">
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">姓名：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.DBR_NAME }" name="DBR_NAME" id="DBR_NAME" autocomplete="off" class="layui-input" readonly
                               style="background-color: #f2f2f2">
                    </div>
                </div>
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">身份证号：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.DBR_IDCARD }" name="DBR_IDCARD" id="DBR_IDCARD" readonly style="background-color: #f2f2f2"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-row">
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">联系方式：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.DBR_PHONE }" name="DBR_PHONE" id="DBR_PHONE" readonly style="background-color: #f2f2f2"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">关系：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.DBR_GX }" name="DBR_GX" id="DBR_GX" readonly style="background-color: #f2f2f2"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>

            </div>
        </div>


    </form>

    <div class="btnbox">
        <button id="sure" class="layui-btn layui-btn-primary layui-btn-small">确认</button>
        <button id="cancel" class="layui-btn layui-btn-primary layui-btn-small">取消</button>
    </div>
</div>
<%@ include file="../system/index/foot.jsp" %>
<script>
    $(function () {
        $("#sure").on("click", function () {
            $.post('<%=basePath%>personalInto/sure.do', $('#editForm').serialize(), function (data) {
                if ("success" == data.result) {
                    parent.layer.closeAll();
                } else {
                    layer.msg('系统异常,操作失败!', {icon: 5});
                }
            });
        });

        $("#cancel").on("click", function () {
            parent.layer.closeAll();
        });

    });
</script>
</body>
</html>