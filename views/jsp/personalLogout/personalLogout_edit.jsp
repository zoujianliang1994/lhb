<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>老龄人口注销</title>
    <%@ include file="../system/index/headcss.jsp" %>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>static/source/public/css/list.css">
</head>
<body>
<div class="edit_menu">
    <form class="layui-form" id="editForm" lay-filter="editForm" method="post">
        <input type="hidden" value="${pd.personal_info_id}" id="PERSONAL_INFO_ID" name="PERSONAL_INFO_ID"/>
        <input type="hidden" value="${pd.xzqh_code}" id="XZQH_CODE" name="XZQH_CODE"/>
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
                        <input type="text" value="${pd.BLRQ }" name="BLRQ" id="BLRQ" required lay-verify="required"
                               placeholder="请输入填表日期"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label"><i class="require">*</i>注销类型：</label>
                    <div class="layui-input-block">
                        <select name="ZX_TYPE" lay-verify="required" lay-filter='select1' id="zxlx">
                            <option value="">请选择注销类型</option>
                            <option value="1"
                                    <c:if test="${pd.ZX_TYPE == '1'}">selected</c:if> >死亡
                            </option>
                            <option value="2" <c:if test="${pd.ZX_TYPE == '2'}">selected</c:if>>户口迁移</option>
                        </select>
                    </div>
                </div>

            </div>
        </div>
        <div class="layui-form-item" id="DIV1" hidden="true">

            <div class="layui-row">
                <div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
                    <label class="layui-form-label">迁移类型：</label>
                    <div class="layui-input-block">

                        <html:select name="QY_TYPE" classs="layui-input-inline" style=" lay-filter='select2'" id="qylx">
                            <html:options collection="migrate_type " defaultValue="${pd.QY_TYPE}"></html:options>
                        </html:select>

                    </div>
                </div>
            </div>
        </div>

        <div class="layui-form-item" id="DIV2" hidden="true">

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

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6" id="DIV3" hidden="true">
                    <label class="layui-form-label"><i class="require">*</i>迁入地：</label>
                    <input type="hidden" value="${pd.HKQRD_CODE}" name="HKQRD_CODE" id="HKQRD_CODE"/>
                    <input type="hidden" value="${pd.HKQRD}" name="HKQRD" id="HKQRD">
                    <div class="layui-input-block sTree" id="sTree1"></div>

                </div>
            </div>
        </div>

        <blockquote class="layui-elem-quote">当事人信息</blockquote>
        <div class="layui-form-item">
            <div class="layui-row">
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label"><i class="require">*</i>姓名：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.DSR_NAME }" name="DSR_NAME" id="DSR_NAME" readonly style="background-color: #f2f2f2"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label"><i class="require">*</i>身份证号：</label>
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
                               class="layui-input" maxlength="18" placeholder="请输入代办人身份证号">
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
        if ('VIEW' == TYPE) {
            $.formToDiv(true);
            $("#btnDiv").hide();
            var ZX_TYPE = '${pd.ZX_TYPE}';
            var QY_TYPE = '${pd.QY_TYPE}';
            if (ZX_TYPE == '2') {
                $("#DIV1").show();
                $("#DIV2").show();
                if (QY_TYPE == '2') {
                    $("#DIV3").hide();
                } else {
                    $("#DIV3").show();
                }
            }
        } else {
            $("#btnDiv").show();
        }

        var form = layui.form;
        layui.use('laydate', function () {
            var laydate = layui.laydate;

            //执行一个laydate实例
            laydate.render({
                elem: '#BLRQ' //指定元素
            });
        });

        //下拉框选择事件
        form.on('select(select1)', function (data) {
                var ZX_TYPE = data.value;
                if ("2" == ZX_TYPE) {
                    $("#DIV1").show();
                    $("#DIV2").show();
                    $("#DIV3").show();
                } else {
                    $("#DIV1").hide();
                    $("#DIV2").hide();
                    $('#HKQRD').val('');
                }
            }
        );

        form.on('select(select2)', function (data) {
                var QY_TYPE = data.value;
                if ("1" == QY_TYPE) {
                    $("#DIV3").show();
                    $('#HKQRD').val('');
                } else {
                    $("#DIV3").hide();
                }
            }
        );

        $("#sure").on("click", function () {
            var zxlx = $("#zxlx").val();
            if ("1" != zxlx && "2" != zxlx) {
                layer.msg('请选择注销类型!', {icon: 5});
                return false;
            }

            if ("2" == zxlx) {
                var HKQCD_CODE = $("#HKQCD_CODE").val();
                var qylx = $("#qylx").val();
                if ("1" == qylx) {
                    var HKQRD_CODE = $("#HKQRD_CODE").val();
                    if (HKQRD_CODE == '') {
                        layer.tips('迁入地不能为空!', $("#sTree1"), {
                            tips: [3, '#D16E6C'],
                            time: 4000
                        });
                        $("#sTree1").focus();
                        return false;
                    }

                    if (HKQCD_CODE == HKQRD_CODE) {
                        layer.tips('迁出地和迁入地行政区划一致,请重新选择!', $("#sTree1"), {
                            tips: [3, '#D16E6C'],
                            time: 4000
                        });
                        $("#sTree1").focus();
                        return false;
                    }
                }
            }

            var card = $("#DBR_IDCARD").val();
            if (card) {
                if (!isCardNo(card) || !checkProvince(card) || !checkBirthday(card) || !checkParity(card)) {
                    layer.tips('请输入正确的身份证号码', $("#DBR_IDCARD"), {
                        tips: [3, '#D16E6C'],
                        time: 4000
                    });
                    $("#DBR_IDCARD").focus();
                    return false;
                }
            }

            parent.layer.load(2);
            $.post('<%=basePath%>personalLogout/save.do', $('#editForm').serialize(), function (data) {
                if ("success" == data.result) {
                    parent.layer.logout.location.href = '<%=basePath%>personalInfo/listUsers.do?currentPage=${pd.currentPage}' + '&xzqh_code=' + '${pd.xzqh_code_parent}';
                    parent.layer.closeAll();
                } else {
                    layer.msg('系统异常,保存失败!', {icon: 5});
                }
            });
        });

        $("#cancel").on("click", function () {
            parent.layer.closeAll();
        });


        //获取迁入地行政区地址
        $.post("<%=basePath%>areaCode/listSubAreaCodeByParentId.do", {parentId: 0, type: 0}, function (data) {
            var sTree = $.Stree({
                el: $("#sTree1"),
                title: "${pd.HKQRD}",
                type:${pd.TYPE== 'VIEW'},
                isSingle: true,  //单选
                data: data,
                callback: function () {
                    if (this.arr == undefined || this.arr == "") {
                        return;
                    }
                    if (this.arr[0].level != 4) {
                        this.$el.find(".lev" + this.arr[0].lev).children(".treeItem ").removeClass("active");
                        this.arr = [];
                        this.$el.find(".input").val("");
                        layer.tips('请选择社区或村', $("#sTree1"), {
                            tips: [3, '#D16E6C'],
                            time: 4000
                        });
                    } else {
                        $("#HKQRD_CODE").val($.getString(this.arr, 'areaCode'));
                        $("#HKQRD").val($.getString(this.arr, 'title'));
                        this.$el.find(".lev0").hide();
                    }
                },
                switchCallback: function (obj) {
                    var id = obj.id;
                    if (obj.children == "") {
                        getAddress(id, sTree)
                    }

                }
            });
        })
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
</script>
</body>
</html>