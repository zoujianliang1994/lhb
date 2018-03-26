<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>高龄津贴信息编辑</title>
    <%@ include file="../system/index/headcss.jsp" %>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/source/public/css/list.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/source/public/plugin/css/viewer.min.css">
</head>
<style>
    .layui-form-label {
        width: 120px
    }

    .layui-input-block {
        margin-left: 150px;
    }

    .imgfile {
        position: absolute;
        opacity: 0;
        width: 100%;
        height: 100%;
        top: 0px;
        left: 0;
        filter: Alpha(opacity=0);
    }

    .img-block {
        height: 160px;
    }

    .img {
        width: 100%;
        height: 100%
    }

    .layui-upload-drag {
        background-size: cover;
    }

</style>
<body>
<div class="edit_menu">
    <p id="titleName" class="red  center" style="font-size:16px;color:#FF5722" hidden="true">*ie浏览器请双击点击上传</p>
    <form action="${msg}.do" class="layui-form marT-20" enctype="multipart/form-data" name="form1" id="form1">
        <input type="hidden" value="${pd.ID}" name="ID" id="ID"/>
        <input type="hidden" value="${pd.PERSONAL_INFO_ID}" name="PERSONAL_INFO_ID" id="PERSONAL_INFO_ID"/>
        <input type="hidden" value="${pd.area_code}" name="area_code" id="area_code"/>
        <div class="layui-form-item">
            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">填表人：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.TBR }" name="TBR" id="TBR"
                               autocomplete="off"
                               class="layui-input" readonly="readonly" style="background-color:#f2f2f2 ">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">填表单位：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.TBDW }" name="TBDW" id="TBDW"
                               autocomplete="off"
                               class="layui-input" readonly="readonly" style="background-color:#f2f2f2 ">
                    </div>
                </div>

            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">填表日期：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.TB_DATE }" name="TB_DATE" id="TB_DATE"
                               autocomplete="off"
                               class="layui-input" readonly="readonly" style="background-color:#f2f2f2">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">姓名：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.a_xm }" name="XM" id="XM"
                               autocomplete="off"
                               class="layui-input" readonly="readonly" style="background-color:#f2f2f2 ">
                    </div>
                </div>

            </div>
        </div>

        <div class="layui-form-item">

            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">身份证号：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.a_sfz }" name="SFZ" id="SFZ" maxlength="18"
                               autocomplete="off"
                               class="layui-input" readonly="readonly" style="background-color:#f2f2f2 ">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">年龄：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.a_age }" name="AGE" id="AGE"
                               autocomplete="off"
                               class="layui-input" readonly="readonly" style="background-color:#f2f2f2 ">
                    </div>
                </div>

            </div>
        </div>

        <div class="layui-form-item">

            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label"><i class="require">*</i>发放形式：</label>
                    <div class="layui-input-block">
                        <html:select name="FF_TYPE" classs="layui-input-inline" id="ffxs" style="lay-filter='select1'">
                            <html:options collection="FF_TYPE" defaultValue="${pd.FF_TYPE}"></html:options>
                        </html:select>
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label"><i class="require">*</i>发放日期：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.FF_DATE }" name="FF_DATE" id="FF_DATE" required lay-verify="required" placeholder="请输入发放日期"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

            </div>
        </div>


        <div class="layui-form-item" id="BankDiv">

            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">开户银行：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.KHYH }" name="KHYH" id="KHYH" required lay-verify="required" placeholder="请输入开户银行"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">银行账户：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.YHZH }" name="YHZH" id="YHZH" required lay-verify="required" placeholder="请输入银行账户"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">免冠二寸照：</label>

                    <c:if test="${pd.TYPE != '1'}">
                        <div class="layui-input-block imgBox1">
                        </div>
                    </c:if>
                    <c:if test="${pd.TYPE == '1'}">
                        <div class="layui-input-block img-block">
                            <input readonly="readonly" type="hidden" name="PHOTO_URL" id="PHOTO_URL" value="${pd.PHOTO_URL}"/>
                            <c:if test="${pd.PHOTO_URL != null && pd.PHOTO_URL != ''}">
                                <img class="img" src="<%=basePath %>uploadFiles/file/${pd.PHOTO_URL}"/>
                            </c:if>
                        </div>
                    </c:if>
                </div>


                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">户口簿：</label>
                    <c:if test="${pd.TYPE != '1'}">
                        <div class="layui-input-block imgBox2">
                        </div>
                    </c:if>
                    <c:if test="${pd.TYPE == '1'}">
                        <div class="layui-input-block img-block">
                            <input readonly="readonly" type="hidden" name="HK_URL" id="HK_URL" value="${pd.HK_URL}"/>
                            <c:if test="${pd.HK_URL != null && pd.HK_URL != ''}">
                                <img class="img" src="<%=basePath %>uploadFiles/file/${pd.HK_URL}" width="100px" height="150px"/>
                            </c:if>
                        </div>
                    </c:if>
                </div>


            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-row">
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">身份证正面：</label>
                    <c:if test="${pd.TYPE != '1'}">
                        <div class="layui-input-block imgBox3">
                        </div>
                    </c:if>

                    <c:if test="${pd.TYPE == '1'}">
                        <div class="layui-input-block img-block">
                            <input readonly="readonly" type="hidden" name="IDCARD_URL" id="IDCARD_URL" value="${pd.IDCARD_URL}"/>
                            <c:if test="${pd.IDCARD_URL != null && pd.IDCARD_URL != ''}">
                                <img class="img" src="<%=basePath %>uploadFiles/file/${pd.IDCARD_URL}" width="100px" height="150px"/>
                            </c:if>
                        </div>
                    </c:if>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">身份证反面：</label>
                    <c:if test="${pd.TYPE != '1'}">
                        <div class="layui-input-block imgBox4">
                        </div>
                    </c:if>

                    <c:if test="${pd.TYPE == '1'}">
                        <div class="layui-input-block img-block">
                            <input readonly="readonly" type="hidden" name="IDCARD_FM_URL" id="IDCARD_FM_URL" value="${pd.IDCARD_FM_URL}"/>
                            <c:if test="${pd.IDCARD_FM_URL != null && pd.IDCARD_FM_URL != ''}">
                                <img class="img" src="<%=basePath %>uploadFiles/file/${pd.IDCARD_FM_URL}" width="100px" height="150px"/>
                            </c:if>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">高龄津贴审核表：</label>
                    <c:if test="${pd.TYPE != '1'}">
                        <div class="layui-input-block imgBox5">
                        </div>
                    </c:if>
                    <c:if test="${pd.TYPE == '1'}">
                        <div class="layui-input-block img-block">
                            <input readonly="readonly" type="hidden" name="GLSHB_URL" id="GLSHB_URL" value="${pd.GLSHB_URL}"/>
                            <c:if test="${pd.GLSHB_URL != null && pd.GLSHB_URL != ''}">
                                <img class="img" src="<%=basePath %>uploadFiles/file/${pd.GLSHB_URL}" width="100px" height="150px"/>
                            </c:if>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-row">
                <div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
                    <label class="layui-form-label">备注:</label>
                    <div class="layui-input-block">
                        <textarea name="BZ" id="BZ" style="height: 100px;width: 803px;">${pd.BZ}</textarea>
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
<script src="<%=basePath%>static/source/public/plugin/js/treeView.js"></script>
<script>
    $(function () {

        var form = layui.form;
        layui.use('laydate', function () {
            var laydate = layui.laydate;
            laydate.render({
                elem: '#FF_DATE'
            });
        });

        //查看
        $.formToDiv(${pd.TYPE== '1'});

        var img1 = new ImgBox({
            el: $('.imgBox1'),
            name: "file1",
            tip: "点击上传免冠二寸照"
        });

        var img2 = new ImgBox({
            el: $('.imgBox2'),
            name: "file2",
            tip: "点击上传户口簿"
        });

        var img3 = new ImgBox({
            el: $('.imgBox3'),
            name: "file3",
            tip: "点击上传身份证正面"
        });

        var img4 = new ImgBox({
            el: $('.imgBox4'),
            name: "file4",
            tip: "点击上传身份证反面"
        });

        var img5 = new ImgBox({
            el: $('.imgBox5'),
            name: "file5",
            tip: "点击上传高龄津贴审核表"
        });

        var TYPE = '${pd.TYPE}';
        if (1 == TYPE) {
            var ff_type = '${pd.FF_TYPE}';
            if ('1' != ff_type) {
                $("#BankDiv").hide();
            }
            $("#btnDiv").hide();
            $("input,select,radio,textarea").attr("disabled", "disabled").css("background-color", "#f2f2f2");
            $("input").removeAttr("placeholder", "");
        } else {
            $("#btnDiv").show();
            $("#titleName").show();
        }

        //提交
        $("#sure").on("click", function () {

            var FF_DATE = $("#FF_DATE").val();
            if (FF_DATE == "") {
                layer.tips('请选择发放日期', $("#FF_DATE"), {
                    tips: [4, '#D16E6C'],
                    time: 4000
                });
                $("#FF_DATE").focus();
                return false;
            }

            parent.layer.load(2);
            $("#form1").ajaxSubmit({
                type: 'post',
                dataType: "html",
                success: function (data) {
                    var jso = JSON.parse(data);
                    if ("success" == jso.result) {
                        parent.layer.edit.location.href = '<%=basePath%>benefitGrant/listBenefit.do?currentPage=${pd.currentPage}' + '&xzqh=' + '${pd.xzqh}';
                        parent.layer.closeAll();
                    } else if ("fail" == jso.result) {
                        layer.msg('保存失败,请检查人员所在地区是否存在有效高龄津贴标准!', {icon: 5});
                    } else {
                        layer.msg('系统异常,保存失败!', {icon: 5});
                    }
                    parent.layer.closeAll("loading");
                }
            });
        });

        $("#cancel").on("click", function () {
            parent.layer.closeAll();
        });

        form.on('select(select1)', function (data) {
                if ('2' == data.value) {
                    $("#BankDiv").hide();
                    $("#KHYH").val('');
                    $("#YHZH").val('');
                } else {
                    $("#BankDiv").show();
                }
            }
        );
    });

    function ImgBox(options) {
        this.init(options)
    }

    ImgBox.prototype = {
        w: "326px",
        h: "151px",
        init: function (options) {
            this.$el = options.el;
            this.rander(options);
            //this.triggerInput();
            this.fileChange();
        },
        rander: function (options) {
            var str = '<div class="layui-upload-drag"  style="width:326px">' +
                '<i class="layui-icon"></i>' +
                '<p class="name">' + options.tip + '</p>' +
                '</div>' +
                '<input type="file" class="imgfile" name=' + options.name + ' >';
            this.$el.html(str)
        },
        test: function (file_name, symbol) {
            var result = file_name.split(symbol);
            return result[result.length - 1];
        },
        triggerInput: function () {
            this.$el.find(".layui-upload-drag").click(function () {
                $(this).next().click();
            })
        },
        fileChange: function () {
            var $this = this;
            var $name = this.$el.find(".name");
            this.$el.find(".imgfile").change(function (e) {
                var $target = $(e.target);
                var $imgbox = $target.prev();
                var $icon = $imgbox.find(".layui-icon");
                name = $this.test(this.value, ".");
                if (name == 'jpg' || name == 'png' || name == "jpeg") {
                    $name.text($this.test(this.value, "\\"));
                    if (e.target.files) {
                        $icon.css("opacity", 0);
                        var file = e.target.files[0];
                        if (window.FileReader) {
                            var fr = new FileReader();
                            fr.onloadend = function (data) {
                                $imgbox.css({"background": "url(" + data.target.result + ")", "background-size": $this.w + " " + $this.h});
                            };
                            fr.readAsDataURL(file);
                        }
                    } else {
                        layer.msg("图片信息可以上传成功<br/>但ie10以下不支持预览功能<br/>若想预览图片请升级ie11或者谷歌浏览器", {shift: 6, icon: 2})
                    }
                } else {
                    layer.msg("请上传正确的图片文件", {shift: 6, icon: 2});
                    $name.text("请上传正确的图片文件");
                    $imgbox.css({"background": "#fff",});
                    $icon.css("opacity", 1);
                }
            })
        }
    }
</script>
</body>
</html>