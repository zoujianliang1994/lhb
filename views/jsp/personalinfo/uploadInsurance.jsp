<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>老龄人口保险信息导入</title>
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
        filter:Alpha(opacity=0);
        opacity:0;
        cursor: pointer;
    }
    .red{
        color:#FF5722
    }
</style>
<div class="operationBox">

    <form id="uploadExcelForm" action="<%=basePath%>personalInfo/uploadInsurance?currentPage=${pd.currentPage}&xzqh_code=${pd.xzqh_code}"
          class="layui-form layui-form-pane" method="post"
          enctype="multipart/form-data">
        <div class="layui-upload-drag" id="test10" style="width:250px">
            <i class="layui-icon"></i>
            <p id="name">点击上传</p>
        </div>
        <input type="file" name="excelFile" id="excelFile">

        <div class="layui-upload" style="margin-top: 20px;">
            <button type="button" id="uploadExcel" class="layui-btn" lay-submit lay-filter="uploadExcel">
                <i class="layui-icon">&#xe67c;</i>开始上传
            </button>

            <button type="button" class="layui-btn" id="dowlodExcel" onclick="window.location.href='<%=basePath%>/personalInfo/downExcel.do?TYPE=1'">
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


        $("#excelFile").change(function () {
            name = test(this.value, ".");
            $("#name").text(test(this.value, "\\"));
            if (name == 'xls' || name == 'xlsx' || name == "") {

            } else {
                layer.msg("请上传正确的.xls或者xlsx格式的文件", {shift: 6, icon: 2})
            }
        });

        $("#uploadExcel").on("click", function () {
            if (name == 'xls' || name == 'xlsx') {
                $("#uploadExcelForm").submit();
                parent.layer.load(1);
            } else if (name == "") {
                layer.msg("文件不能为空", {shift: 6, icon: 2})
            } else {
                layer.msg("请上传正确的.xls或者xlsx格式的文件", {shift: 6, icon: 2})
            }

        });

        function test(file_name, symbol) {
            var result = file_name.split(symbol);
            return result[result.length - 1];
        }

    });
</script>
</body>
</html>