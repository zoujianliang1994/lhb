<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>统计报表</title>
    <%@ include file="../system/index/headcss.jsp" %>
</head>
<body>
<div class="tableBox">
    <div class="operationBox layui-form">
        <form action="list.do?xzqh=${pd.xzqh_code}" method="post" name="Form" id="Form">

            <div class="searchBox fl ">
                <input type="hidden" name="selAreaCode" id="selAreaCode" value="${pd.selAreaCode}"/>
                <input type="hidden" name="selAreaName" id="selAreaName" value="${pd.selAreaName}"/>
                <div class="sTree fl" id="sTree"  style="width:200px">

                </div>
                <div class="fl srarchBtn">
                    <i class="layui-icon">&#xe715;</i>
                </div>
            </div>


            <div class="searchBox fl marL-20">
                <input type="hidden" name="DEPARTMENT_ID" id="DEPARTMENT_ID" value="${pd.DEPARTMENT_ID}"/>
                <input id="keywords" name="keywords" type="text" value="${keywords}" placeholder="请选择年份" class="layui-input fl search">
                <div class="fl srarchBtn" onclick="gsearch()">
                    <i class="layui-icon">&#xe615;</i>
                </div>
            </div>

        </form>


    </div>

    <!-- table -->
    <div class="layui-col-sm12">
        <table class="layui-table center" id="table">

            <thead>
            <tr>

                <th>行政区域</th>
                <th>办理抚养、赡养案件总数</th>

                <th>办理抚养、赡养案件总数</th>
                <th>办理抚养、赡养案件总数</th>
            </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        四川省本级
                    </td>
                    <td>
                        10000
                    </td>
                    <td>
                        6000
                    </td>
                    <td>
                        4000
                    </td>
                </tr>
                <tr>
                    <td>
                        成都市
                    </td>
                    <td>
                        10000
                    </td>
                    <td>
                        6000
                    </td>
                    <td>
                        4000
                    </td>
                </tr>
                <tr>
                    <td>
                        德阳市
                    </td>
                    <td>
                        10000
                    </td>
                    <td>
                        6000
                    </td>
                    <td>
                        4000
                    </td>
                </tr>
            <%--<c:choose>--%>
                <%--<c:when test="${not empty varList}">--%>
                    <%--<shiro:hasPermission name="system:department:select">--%>
                        <%--<c:forEach items="${varList}" var="var" varStatus="vs">--%>
                            <%--<tr>--%>
                                <%--<td>${vs.index+1}</td>--%>
                                <%--<td>${var.WBDW_SZQY}</td>--%>

                                <%--<td>${var.NAME}</td>--%>

                                <%--<td>${var.ADDRESS}</td>--%>
                                <%--<td>${var.ADDRESS}</td>--%>

                            <%--</tr>--%>
                        <%--</c:forEach>--%>
                    <%--</shiro:hasPermission>--%>
                    <%--<shiro:lacksPermission name="outUnit:select">--%>
                        <%--<tr>--%>
                            <%--<td colspan="100" class="center">您无权查看</td>--%>
                        <%--</tr>--%>
                    <%--</shiro:lacksPermission>--%>
                <%--</c:when>--%>
                <%--<c:otherwise>--%>
                    <%--<tr class="main_info">--%>
                        <%--<td colspan="100" class="center">没有相关数据</td>--%>
                    <%--</tr>--%>
                <%--</c:otherwise>--%>
            <%--</c:choose>--%>
            </tbody>
        </table>


    </div>
</div>

<%@ include file="../system/index/foot.jsp" %>
<script type="text/javascript">

    layui.use('laypage', function () {
        var layer = layui.layer;
        var form = layui.form;
        var editHtml = $("#editHtml").html();
        $("#editHtml").remove();

    });

    $("#keywords").keydown(function (e) {
        var ev= e || window.event;
        if (ev.keyCode == "13") {
            gsearch();
        }
    });

    //检索
    function gsearch() {
        $("#Form").submit();
    }


    //下一级/返回
    function refreshIfream(SECTION_ID) {
        window.location.href = "<%=basePath%>outer/list.do?SECTION_ID=" + SECTION_ID;
    }

    var first= true;
    var sTree = $.Stree({
        title:"${pd.selAreaName}",
        el: $("#sTree"),
        isSingle: true,  //单选
        data:[],
        callback:function(){

            if(!first){
                $("#selAreaName").val($.getString(this.arr,"title"))
                $("#selAreaCode").val($.getString(this.arr,"areaCode"))
                gsearch()
            }
        },
        switchCallback: function (obj) {
            var id = obj.id;
            if(obj.children == ""){
                console.log(id)
                getAddress(id, sTree)
            }
        }
    });
    first= false;
    //所在区域
    $.post("<%=basePath%>areaCode/listSubAreaCodeByParentId",{parentId:0},function(data){
        sTree.refresh(data)
    },"json")
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
            })
            //默认选中

            sTree.cheakedOldData()
            //展示

        })
    }

</script>
</body>
</html>
