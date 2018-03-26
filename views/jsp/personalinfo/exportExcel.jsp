<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>老龄人口导出</title>
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

    <form id="uploadExcelForm" class="layui-form layui-form-pane" method="post" enctype="multipart/form-data">
        <div class="layui-upload-drag" id="exportAll" style="width:250px">
            <i class="layui-icon">&#xe601;</i>
            <p id="name">点击导出</p>
        </div>
    </form>

</div>

<%@ include file="../system/index/foot.jsp" %>

<script type="text/javascript">
    $(function () {
        var name = "";
        var src = '<%=basePath%>personalInfo/exportListPage.do?currentPage=${pd.currentPage}&xzqh_code=';
        var sTree = null;

        $("#exportAll").on("click", function () {
            if (sTree.arr == "") {
                return layer.msg("请选择需要导出的社区", {shift: 6, icon: 2});
            }
            parent.layer.load(1);
            window.location.href = src;
            setTimeout("parent.layer.closeAll('loading');", 20000);
        });

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
                        src = src + this.arr[0].areaCode;
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