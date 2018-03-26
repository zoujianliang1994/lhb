<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>老龄人口迁入</title>
    <%@ include file="../system/index/headcss.jsp" %>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>static/source/public/css/list.css">
</head>
<body>
<div class="edit_menu">
    <form class="layui-form" id="editForm" lay-filter="editForm" method="post">
        <input type="hidden" value="${pd.xzqh_code}" name="XZQH_CODE"/>
        <input type="hidden" value="${pd.msg_id}" name="MSG_ID"/>

        <blockquote class="layui-elem-quote">填表信息</blockquote>
        <div class="layui-form-item">
            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">填表人：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.DJR }" name="DJR" id="DJR" readonly style="background-color: #f2f2f2"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">填表单位：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.DJDW }" name="DJDW" id="DJDW" readonly style="background-color: #f2f2f2"
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
                        <input type="text" value="${pd.DJ_DATE }" name="DJ_DATE" id="DJ_DATE" required lay-verify="required" readonly
                               style="background-color: #f2f2f2"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div id="divZt" class="layui-col-xs6 layui-col-sm6 layui-col-md6 disnone">
                    <label class="layui-form-label">迁入状态：</label>
                    <div class="layui-input-block">
                        <input type="text" value="<c:if test="${pd.ZT=='1'}">已迁入</c:if><c:if test="${pd.ZT=='2'}">迁出地待确认</c:if>" name="ZT" id="ZT"
                               readonly style="background-color: #f2f2f2" autocomplete="off" class="layui-input">
                    </div>
                </div>

            </div>
        </div>

        <blockquote class="layui-elem-quote">当事人信息</blockquote>
        <div class="layui-form-item">
            <div class="layui-row">
                <input type="hidden" id="PERSONAL_INFO_ID" name="PERSONAL_INFO_ID" value=""/>
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label"><i class="require">*</i>身份证号：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.DSR_IDCARD }" name="DSR_IDCARD" id="DSR_IDCARD"
                               autocomplete="off"
                               class="layui-input" placeholder="请输入当事人身份证号" onchange="getPersonInfo()" maxlength="18">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label"><i class="require">*</i>姓名：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.DSR_NAME }" name="DSR_NAME" id="DSR_NAME"
                               autocomplete="off"
                               class="layui-input" placeholder="请输入当事人姓名">
                    </div>
                </div>
            </div>

        </div>

        <div class="layui-form-item">
            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label"><i class="require">*</i>迁入地：</label>
                    <input type="hidden" value="" name="QRD_CODE" id="QRD_CODE"/>
                    <input type="hidden" value="" name="QRD_NAME" id="QRD_NAME">
                    <div class="layui-input-block sTree" id="sTree">
                    </div>
                </div>


                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">迁出地：</label>
                    <div class="layui-input-block">
                        <input type="hidden" value="${pd.QCD_CODE}" name="QCD_CODE" id="QCD_CODE"/>
                        <input type="text" value="${pd.QCD_NAME }" name="QCD_NAME" id="QCD_NAME" required lay-verify="required" readonly
                               style="background-color: #f2f2f2"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-row">
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="require">*</i>备注：</label>
                    <div class="layui-input-block">
                        <textarea name="BZ" id="BZ" placeholder="请输入备注" class="layui-textarea">${pd.BZ }</textarea>
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

                        <input type="text" value="${pd.DBR_NAME }" name="DBR_NAME" id="DBR_NAME" required lay-verify="required"
                               autocomplete="off"
                               class="layui-input" placeholder="请输入代办人姓名">
                    </div>
                </div>
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">身份证号：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.DBR_IDCARD }" name="DBR_IDCARD" id="DBR_IDCARD" required lay-verify="required"
                               autocomplete="off"
                               class="layui-input" maxlength="18" placeholder="请输入代办人身份证号" maxlength="18">
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-row">
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">联系方式：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.DBR_PHONE }" name="DBR_PHONE" id="DBR_PHONE" required lay-verify="required"
                               autocomplete="off"
                               class="layui-input" placeholder="请输入代办人联系方式">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">关系：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.DBR_GX }" name="DBR_GX" id="DBR_GX" required lay-verify="required"
                               autocomplete="off"
                               class="layui-input" placeholder="请输入代办人与当事人关系">
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

        var TYPE = '${pd.TYPE}';

        $("#sure").on("click", function () {

            if ($("#personal_info_id").val() == "") {
                layer.tips('迁出地不存在此人,请核实!', $("#DSR_IDCARD"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#DSR_IDCARD").focus();
                return false;
            }
            if ($("#QRD_CODE").val() == "") {
                layer.tips('请选择迁入地!', $("#sTree"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#sTree").focus();
                return false;
            }

            if ($("#QRD_CODE").val() == $("#QCD_CODE").val()) {
                layer.tips('迁入地不能和迁出地相同,请检查!', $("#DSR_IDCARD"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#DSR_IDCARD").focus();
                return false;
            }

            if ($("#DSR_IDCARD").val() == "") {
                layer.tips('身份证不能为空!', $("#DSR_IDCARD"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#DSR_IDCARD").focus();
                return false;
            }

            if ($("#DSR_NAME").val() == "") {
                layer.tips('当事人姓名不能为空!', $("#DSR_NAME"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#DSR_NAME").focus();
                return false;
            }

            if ($("#BZ").val() == "") {
                layer.tips('备注不能为空!', $("#BZ"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#BZ").focus();
                return false;
            }

            $.post('<%=basePath%>personalInto/save.do', $('#editForm').serialize(), function (data) {
                if ("success" == data.result) {
                    parent.layer.into.location.href = '<%=basePath%>personalInfo/listUsers.do?currentPage=1&xzqh_code=' + '${pd.xzqh_code}';
                    parent.layer.closeAll();
                } else {
                    layer.msg('系统异常,保存失败!', {icon: 5});
                }
            });
        });

        $("#cancel").on("click", function () {
            parent.layer.closeAll();
        });
        //获取行政区地址
        $.post("<%=basePath%>areaCode/listSubAreaCodeByParentId.do", {parentId: 0}, function (data) {
            var sTree = $.Stree({
                el: $("#sTree"),
                type:${pd.TYPE== 'VIEW'},
                isSingle: true,  //单选
                oldData: TYPE == 'VIEW' ? ["${pd.QRD_CODE}"] : [],
                title: TYPE == 'VIEW' ? "${pd.QRD_NAME}" : "",
                data: data,
                callback: function () {
                    if (this.arr == undefined || this.arr == "") {
                        return
                    }
                    if (this.arr[0].level != 4) {
                        this.$el.find(".lev" + this.arr[0].lev).children(".treeItem ").removeClass("active");
                        this.arr = [];
                        this.$el.find(".input").val("");
                        layer.tips('请选择社区或村', $("#sTree"), {
                            tips: [3, '#D16E6C'],
                            time: 4000
                        });
                    } else {
                        this.$el.find(".lev0").hide();
                    }

                    $("#QRD_CODE").val($.getString(this.arr, 'areaCode'));
                    $("#QRD_NAME").val($.getString(this.arr, 'title'));

                },
                switchCallback: function (obj) {
                    var id = obj.id;
                    if (obj.children == "") {
                        getAddress(id, sTree)
                    }

                }
            });
            if ('VIEW' == TYPE) {
                $.formToDiv(true);
                $("#btnDiv").hide();
                $("#divZt").removeClass('disnone');
            } else {
                $("#btnDiv").show();
            }
        });
        if ('VIEW' == TYPE) {
            $.formToDiv(true);
            $("#btnDiv").hide();
            $("#divZt").removeClass('disnone');
        } else {
            $("#btnDiv").show();
        }

    });

    $("#DSR_IDCARD").keydown(function (e) {
        var ev = e || window.event;
        if (13 === ev.keyCode) {
            getPersonInfo();
        }
    });


    //获取地址
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

    //根据身份证号获取人员信息
    function getPersonInfo() {
        var sfz = $.trim($("#DSR_IDCARD").val());
        $.ajax({
            type: "POST",
            url: '<%=basePath%>/personalInto/getPersonInfo',
            data: {sfz: sfz},
            dataType: 'json',
            cache: false,
            success: function (data) {
                var result = data.result;
                if ("yes" == result) {
                    $("#QCD_CODE").val(data.QCD_CODE);
                    $("#QCD_NAME").val(data.QCD_NAME);
                    $("#PERSONAL_INFO_ID").val(data.PERSONAL_INFO_ID);
                    $("#DSR_IDCARD").val(data.DSR_IDCARD);
                    $("#DSR_NAME").val(data.DSR_NAME);
                } else if ("noData" == result) {
                    layer.msg('未查询到有效的人员信息!', {icon: 5});
                } else {
                    cleaData();
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                cleaData();
            }
        });
    }

    function cleaData() {
        $("#QCD_CODE").val('');
        $("#QCD_NAME").val('');
        $("#PERSONAL_INFO_ID").val('');
        $("#DSR_IDCARD").val('');
        $("#DSR_NAME").val('');
        layer.msg('系统异常,查询失败!', {icon: 5});
    }
</script>
</body>
</html>