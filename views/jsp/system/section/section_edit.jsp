<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>部门编辑</title>
    <%@ include file="../index/headcss.jsp" %>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>static/source/public/css/list.css">
</head>
<body>
<div class="edit_menu">
    <%--修改--%>

        <form action="${msg}.do" class="layui-form" id="editForm" lay-filter="editForm" method="post">
            <input type="hidden" name="SECTION_ID" id="SECTION_ID" value="${pd.SECTION_ID}"/>
            <input type="hidden" name="XZJB" id="XZJB" value="${pd.XZJB}"/>
            <input type="hidden" name="TBR" id="TBR" value="${pd.TBR}"/>
            <input type="hidden" name="TBDW" id="TBDW" value="${pd.TBDW}"/>
            <input type="hidden" name="TBRQ" id="TBRQ" value="${pd.TBRQ}"/>
            <input type="hidden" name="DYJDDW" id="DYJDDW" value="${pd.DYJDDW}"/>
            <input type="hidden" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS}"/>
            <input type="hidden" name="SZQY_CODE" id="SZQY_CODE" value="${pd.SZQY_CODE}"/>
            <input type="hidden" name="SZQY" id="SZQY" value="${pd.SZQY}"/>
			 <input type="hidden" name="TYPE" id="TYPE" value="1"/>
            <div class="layui-form-item">

                <div class="layui-row">

                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">所在机构：</label>
                        <input type="hidden" value="${pd.DEPARTMENT_ID}" name="DEPARTMENT_ID" id="DEPARTMENT_ID"/>
                        <input type="hidden" value="${pd.DEPARTMENT_NAME}" name="DEPARTMENT_NAME" id="DEPARTMENT_NAME"/>
                        <div class="layui-input-block sTree" id="sTree">

                        </div>
                    </div>

                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">名称：</label>
                        <div class="layui-input-block">
                            <input type="text" value="${pd.NAME }" name="NAME" id="NAME" required lay-verify="required" placeholder="请输入内设机构名称"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
            </div>

            <div class="layui-form-item">

                <div class="layui-row">

                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">级别：</label>
                        <div class="layui-input-block">

                            <html:select name="LEVEL" classs="layui-input-inline" >
                                <html:options collection="Institutional_level" defaultValue="${pd.LEVEL}"></html:options>
                            </html:select>

                        </div>
                    </div>
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">负责人：</label>
                        <div class="layui-input-block">
                            <input type="text" value="${pd.FZR }" name="FZR" id="FZR" required lay-verify="required" placeholder="请输入内设机构负责人"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>

                </div>
            </div>

            <div class="layui-form-item">

                <div class="layui-row">
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">联系电话：</label>
                        <div class="layui-input-block">
                            <input type="text" value="${pd.TEL }" name="TEL" id="TEL" required lay-verify="required" placeholder="请输入联系电话"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">人数：</label>
                        <div class="layui-input-block">
                            <input type="text" value="${pd.RS }" name="RS" id="RS" required lay-verify="required" placeholder="请输入人数"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>

                </div>
            </div>

            <div class="layui-form-item">

                <div class="layui-row">

                    <div class="layui-form-item">
                        <label class="layui-form-label">职能描述：</label>
                        <div class="layui-input-block">
                            <textarea name="ZNMS" id="ZNMS" placeholder="${pd.ZNMS == null ? '请输入职能描述':pd.ZNMS}" class="layui-textarea"></textarea>
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
<%@ include file="../index/foot.jsp" %>
<script>
    $(function () {
        $.formToDiv(${pd.TYPE == '1'})
        var TYPE = '${pd.TYPE}';
        if (1 == TYPE) {
            $("#btnDiv").hide();
            $("input,select,radio,textarea").attr("disabled", "disabled").css("background-color", "#f2f2f2");
            $("input").removeAttr("placeholder", "");
        } else {
            $("#btnDiv").show();
        }

        $("#sure").on("click", function () {

            if ($("#DEPARTMENT_NAME").val() == "") {
                layer.tips('所在机构不能为空', $("#sTree"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#sTree").focus();
                return false;
            }

            if ($("#NAME").val() == "") {
                layer.tips('内设机构名称不能为空', $("#NAME"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#NAME").focus();
                return false;
            }
            var DEPARTMENT_ID = '${pd.DEPARTMENT_ID}';
            parent.layer.load(1);
            $.post('${msg}.do', $('#editForm').serialize(), function (data) {
                if ("success" == data.result) {
                    parent.layer.edit.location.href = "<%=basePath%>section/list.do?currentPage=${pd.currentPage}&DEPARTMENT_ID=" + DEPARTMENT_ID;
                    parent.layer.closeAll();
                } else {
                    layer.msg('系统异常,保存失败!', {icon: 5});
                }
                parent.layer.closeAll('loading');
            });
        });
        $("#cancel").on("click", function () {
            parent.layer.closeAll();
        });
        var sTree;
        $.post("<%=basePath%>section/getSectionDepartment.do?areaCode=${pd.areaCode}",function(data){
             sTree = $.Stree({
                title:"${pd.DEPARTMENT_NAME}",
                type:${pd.TYPE == '1'},
                el: $("#sTree"),
                oldData:['${pd.DEPARTMENT_ID}'],
                isSingle: true,  //单选
                data:eval(data.zTreeNodes),
                callback:function(){
                    $("#DEPARTMENT_NAME").val($.getString(this.arr,"title"))
                    $("#DEPARTMENT_ID").val($.getString(this.arr,"id"))
                    $("#SZQY").val($.getString(this.arr,"SZQY"))
                    $("#SZQY_CODE").val($.getString(this.arr,"SZQY_CODE"))
                },
                switchCallback: function (obj) {
                    console.log(obj)
                    var index = obj.id;
                    if(obj.children == ""){
                        getMap(index, sTree)
                    }
                }
            });
        })
        function getMap(index,tree){
            $.post("<%=basePath%>section/listDepartmentByPid",{pid:index},function(data){
                data= eval(data)
                console.log(data);
                //数据
                sTree.findOne(index, function (obj) {
                    if (obj.children == "") {
                        obj.children = data;
                    }

                    sTree.rec(data, function (obj, index) {
                        sTree.operation(obj, index);
                    }, obj.lev)
                })
                //默认选中

                sTree.cheakedOldData()
                //展示

            })
        }

      /*  $("#DEPARTMENT_NAME").on("click", function () {
            parent.layer.transmit = window;
            var id=$("#DEPARTMENT_ID").val();
            parent.parent.parent.layer.open({
                title: "所在机构",
                type: 2,
                content: '<%=basePath%>section/getSectionDepartment.do',
                area: ["650px", "550px"]
            });
        });*/
    });


</script>
</body>
</html>