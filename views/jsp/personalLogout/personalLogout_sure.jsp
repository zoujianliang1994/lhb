<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>老龄人口省内迁入确认</title>
    <%@ include file="../system/index/headcss.jsp" %>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>static/source/public/css/list.css">
</head>
<body>
<div class="edit_menu">
    <form class="layui-form" id="editForm" lay-filter="editForm" method="post">
        <input type="hidden" id="ID" name="ID" value="${pd.BUSINESS_ID}"/>
        <input type="hidden" id="BUSINESS_ID" name="BUSINESS_ID" value="${pd.BUSINESS_ID}"/>
        <input type="hidden" id="PERSONAL_INFO_ID" name="PERSONAL_INFO_ID" value="${pd.PERSONAL_INFO_ID}"/>
        <blockquote class="layui-elem-quote">填表信息</blockquote>
        <div class="layui-form-item">
            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">填表人：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.JBR }" name="JBR" id="JBR" readonly style="background-color: #f2f2f2"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">填表单位：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.JBDW }" name="JBDW" id="JBDW" readonly style="background-color: #f2f2f2"
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
                        <input type="text" value="${pd.BLRQ }" name="BLRQ" id="BLRQ" readonly style="background-color: #f2f2f2"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">注销类型：</label>
                    <div class="layui-input-block">
                        <input type="text" value="户口迁移" readonly style="background-color: #f2f2f2"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

            </div>
        </div>
        <div class="layui-form-item">

            <div class="layui-row">
                <div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
                    <label class="layui-form-label">迁移类型：</label>
                    <div class="layui-input-block">
                        <input type="text" value="省内" readonly style="background-color: #f2f2f2"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-form-item">

            <div class="layui-row">
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">迁出地：</label>
                    <input type="hidden" value="${pd.HKQCD_CODE}" name="HKQCD_CODE" id="HKQCD_CODE"/>


                    <div class="layui-input-block">
                        <input type="text" value="${pd.HKQCD }" name="HKQCD" id="HKQCD" readonly style="background-color: #f2f2f2"
                               autocomplete="off"
                               class="layui-input">
                    </div>

                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">迁入地：</label>
                    <input type="hidden" value="${pd.HKQRD_CODE}" name="HKQRD_CODE" id="HKQRD_CODE"/>

                    <div class="layui-input-block">
                        <input type="text" value="${pd.HKQRD }" name="HKQRD" id="HKQRD" readonly style="background-color: #f2f2f2"
                               autocomplete="off"
                               class="layui-input">

                    </div>
                </div>
            </div>
        </div>

        <blockquote class="layui-elem-quote">当事人信息</blockquote>
        <div class="layui-form-item">
            <div class="layui-row">
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">姓名：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.DSR_NAME }" name="DSR_NAME" id="DSR_NAME" readonly style="background-color: #f2f2f2"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">身份证号：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.DSR_IDCARD }" name="DSR_IDCARD" id="DSR_IDCARD" readonly style="background-color: #f2f2f2"
                               autocomplete="off"
                               class="layui-input">
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

                        <input type="text" value="${pd.DBR_NAME }" name="DBR_NAME" id="DBR_NAME" readonly style="background-color: #f2f2f2"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">身份证号：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.DBR_IDCARD }" name="DBR_IDCARD" id="DBR_IDCARD" readonly style="background-color: #f2f2f2"
                               autocomplete="off"
                               class="layui-input" maxlength="18">
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
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">关系：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.DBR_GX }" name="DBR_GX" id="DBR_GX" readonly style="background-color: #f2f2f2"
                               autocomplete="off"
                               class="layui-input">
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
            //console.log('<%=basePath%>personalpanel/list.do?currentPage=${pd.currentPage}');
            $.post('<%=basePath%>personalLogout/sureSn.do', $('#editForm').serialize(), function (data) {
                if ("success" == data.result) {
                    var $message_num = parent.$(".header .message_num");
                    if ($message_num[0] == "undefined") {
                        $message_num = $(".header .message_num");
                    }
                    var num = parseInt($message_num.text());
                    num = num - 1;
                    console.log(num)
                    if (num <= 0) {
                        $message_num.hide();
                    }
                    $message_num.text(num);
                    parent.layer.closeAll();
                    parent.layer.logout.location.href = '<%=basePath%>personalpanel/list.do?currentPage=${pd.currentPage}';
                } else {
                    layer.msg('系统异常,保存失败!', {icon: 5});
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