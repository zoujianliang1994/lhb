<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>老龄人口导入</title>
    <%@ include file="../system/index/headcss.jsp" %>
</head>
<body>

<style>
    #uploadExcelForm {
        width: 250px;
        margin: 0px auto;
        position: relative;
        z-index: 1
    }

    html {
        overflow-x: hidden;
    }

    #test10 {
        margin-top: 30px
    }

    #excelFile {
        position: absolute;
        top: 30px;
        left: 0;
        width: 250px;
        height: 133px;
        filter: Alpha(opacity=0);
        opacity: 0;
        cursor: pointer;
    }

    .searchBox {
        margin: 0 auto;
        padding-top: 20px;
        font-size: 13px;
        height: 60px;
        width: 538px;
    }

    .red {
        color: #FF5722
    }
</style>
<div class="operationBox">
    <div class="searchBox ">
        <div class="sTree fl" id="sTree" style="width:500px">
        </div>
        <div class="fl srarchBtn">
            <i class="layui-icon">&#xe715;</i>
        </div>
    </div>

    <form id="uploadExcelForm"
          action="<%=basePath%>personalInfo/readExcel?currentPage=1&xzqh_code="
          class="layui-form layui-form-pane" method="post" enctype="multipart/form-data">
        <div class="layui-upload-drag" id="test10" style="width:250px">
            <i class="layui-icon"></i>
            <p id="name">点击上传</p>
        </div>
        <input type="file" name="excelFile" id="excelFile">

        <div class="layui-upload" style="margin-top: 20px;">
            <button type="button" id="uploadExcel" class="layui-btn" lay-submit lay-filter="uploadExcel">
                <i class="layui-icon">&#xe67c;</i>开始上传
            </button>

            <button type="button" class="layui-btn" id="dowlodExcel" onclick="window.location.href='<%=basePath%>/personalInfo/downExcel.do'">
                <i class="layui-icon">&#xe601;</i>下载模板
            </button>
        </div>
        <p class="red marT-20 center" style="font-size:16px">*ie浏览器请双击点击上传</p>
    </form>
</div>

<%@ include file="../system/index/foot.jsp" %>

<script type="text/javascript">
    $(function () {
        var name = "";
        var src = $("#uploadExcelForm").attr("action");
        var sTree = null;

        var m = 0;
        var isIE = /msie/i.test(navigator.userAgent) && !window.opera;

        $("#excelFile").change(function (e) {
            /* if($.browserType() != "IE8"){
             var fileSize= 0;
             fileSize= e.target.files[0].size;
             m= parseInt(fileSize/1024/1024);
             if(m>5){
             layer.msg("文件内容有异常<br/>请联系管理员", {shift: 6, icon: 2});
             return
             }
             }*/

            name = test(this.value, ".");
            $("#name").text(test(this.value, "\\"));
            if (name == 'xls' || name == 'xlsx' || name == "") {
                $("#test10").find("i").html("&#xe60a;")
            } else {
                layer.msg("请上传正确的.xls或者xlsx格式的文件", {shift: 6, icon: 2});
                $("#test10").find("i").html("&#xe67c;")
            }
        });

        $("#uploadExcel").on("click", function () {
            /*if(m>5){
             layer.msg("文件大小不能超过5M<br/>请分批导入或者联系管理员", {shift: 6, icon: 2});
             return
             }*/
            if (name == 'xls' || name == 'xlsx' && sTree.arr != "") {
                $("#uploadExcelForm").submit();
                parent.layer.load(1)
            } else if (name == "") {
                layer.msg("文件不能为空", {shift: 6, icon: 2})
            } else if (sTree.arr == "") {
                layer.msg("请选择区划", {shift: 6, icon: 2})
            } else {
                layer.msg("请上传正确的.xls或者xlsx格式的文件", {shift: 6, icon: 2})
            }
        });

        function test(file_name, symbol) {
            var result = file_name.split(symbol);
            return result[result.length - 1];
        }

        $.post("<%=basePath%>areaCode/listSubAreaCodeByParentId", {parentId: 0}, function (data) {
            sTree = $.Stree({
                el: $("#sTree"),
                isSingle: true,  //单选
                data: data,
                callback: function (obj) {
                    if (this.arr == undefined || this.arr == "") {
                        return
                    }
                    if (this.arr[0].level != 4) {
                        this.$el.find(".lev" + this.arr[0].lev).children(".treeItem ").removeClass("active");
                        this.arr = [];
                        this.$el.find(".input").val("");
                        layer.tips('请选择社区、村', $("#sTree"), {
                            tips: [3, '#D16E6C'],
                            time: 4000
                        });
                    } else {
                        $("#uploadExcelForm").attr("action", src + this.arr[0].areaCode);
                        this.$el.find(".lev0").hide();
                    }
                },
                switchCallback: function (obj) {
                    var id = obj.id;
                    if (obj.children == "") {
                        getAddress(id, sTree);
                    }
                }
            });
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
    });
</script>
</body>
</html>