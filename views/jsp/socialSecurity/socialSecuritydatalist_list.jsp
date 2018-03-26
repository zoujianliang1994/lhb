<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>数据提报</title>
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
                <input id="keywords" name="keywords" type="text" value="${keywords}" placeholder="请输入单位名称" class="layui-input fl search">
                <div class="fl srarchBtn" onclick="gsearch()">
                    <i class="layui-icon">&#xe615;</i>
                </div>
            </div>


        </form>
        <shiro:hasPermission name="outUnit:add">
            <button class="layui-btn fl  marL-20 layui-btn-blue" id="add">新增</button>
        </shiro:hasPermission>

    </div>

    <!-- table -->
    <div class="layui-col-sm12">
        <table class="layui-table center" id="table">
            <colgroup>
                <col width="60">
                <col>
                <col>
                <col>
                <col>
                <col>
                <col width="170">
            </colgroup>
            <thead>
            <tr>
                <th>序号</th>
                <th>单位名称</th>
                <th>提交处室</th>
                <th>提交人</th>

                <th>提交日期</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td>成都市本级</td>
                <td>社保处</td>
                <td>老邹</td>
                <td>2018-2-14</td>
                <td style="text-align: center;">
                    <a class="layui-btn layui-btn-mini layui-btn-normal" onclick="edit('${var.SECTION_ID}','1');">查看</a>
                    <a class="layui-btn layui-btn-mini edit" onclick="edit('${var.SECTION_ID}','2');">修改</a>
                    <a class="layui-btn layui-btn-danger layui-btn-mini del" onclick="del('${var.SECTION_ID}');">删除</a></td>
                </td>

            </tr>
            <tr>
                <td>2</td>
                <td>成都市本级</td>
                <td>社保处</td>
                <td>老邹</td>
                <td>2017-8-19</td>
                <td style="text-align: center;">
                    <a class="layui-btn layui-btn-mini layui-btn-normal" onclick="edit('${var.SECTION_ID}','1');">查看</a>
                    <a class="layui-btn layui-btn-mini edit" onclick="edit('${var.SECTION_ID}','2');">修改</a>
                    <a class="layui-btn layui-btn-danger layui-btn-mini del" onclick="del('${var.SECTION_ID}');">删除</a></td>
                </td>
            </tr>
            <%--<c:choose>--%>
                <%--<c:when test="${not empty varList}">--%>
                    <%--<shiro:hasPermission name="system:department:select">--%>
                        <%--<c:forEach items="${varList}" var="var" varStatus="vs">--%>
                            <%--<tr>--%>
                                <%--<td>${vs.index+1}</td>--%>
                                <%--<td>--%>
                                        <%--${var.NAME}--%>
                                <%--</td>--%>
                                <%--<td>--%>
                                        <%--${var.NAME}--%>
                                <%--</td>--%>

                                <%--<td>${var.ADDRESS}</td>--%>
                                <%--<td>${var.TEL}</td>--%>
                                <%--<td style="text-align: center;">--%>
                                    <%--<shiro:hasPermission name="outUnit:select">--%>
                                        <%--<a class="layui-btn layui-btn-mini layui-btn-normal" onclick="edit('${var.SECTION_ID}','1');">查看</a>--%>
                                    <%--</shiro:hasPermission>--%>
                                    <%--<shiro:hasPermission name="outUnit:edit">--%>
                                        <%--<a class="layui-btn layui-btn-mini edit" onclick="edit('${var.SECTION_ID}','2');">修改</a>--%>
                                    <%--</shiro:hasPermission>--%>
                                    <%--<shiro:hasPermission name="outUnit:del">--%>
                                    <%--<a class="layui-btn layui-btn-danger layui-btn-mini del" onclick="del('${var.SECTION_ID}');">删除</a></td>--%>
                                <%--</shiro:hasPermission>--%>
                                <%--</td>--%>
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

        <div class="laypageBox">
            <div id="laypage" class="fr"></div>
        </div>
    </div>
</div>

<%@ include file="../system/index/foot.jsp" %>
<script type="text/javascript">

    layui.use('laypage', function () {
        var laypage = layui.laypage;
        var layer = layui.layer;
        var form = layui.form;
        var editHtml = $("#editHtml").html();
        $("#editHtml").remove();

        //执行一个laypage实例
        laypage.render({
            elem: 'laypage',
            count: ${page.totalResult},
            curr: ${page.currentPage},
            layout: ['prev', 'page', 'next', 'count', 'skip'],
            jump: function (obj, first) {
                if (!first) {
                    window.location.href = "<%=basePath%>socialSecurity/list.do?currentPage=" + obj.curr + '&SECTION_ID=' + '${SECTION_ID}' + '&keywords=' + '${keywords}';
                }
            }
        });
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
        window.location.href = "<%=basePath%>socialSecurity/list.do?SECTION_ID=" + SECTION_ID;
    }

    //新增
    $("#add").on("click", function () {
        parent.parent.layer.edit = window;
        parent.parent.layer.open({
            title: "新增",
            type: 2,
            content: '<%=basePath%>socialSecurity/toAdd.do?SECTION_ID=' + '${SECTION_ID}' + '&currentPage=' + ${page.currentPage},
            area: ["1000px", "550px"]
        });
    });
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


    function edit(SECTION_ID, TYPE) {
        var msg = TYPE == '1' ? '查看' : '编辑';
        parent.parent.layer.edit = window;
        parent.parent.layer.open({
            title: msg,
            type: 2,
            content: '<%=basePath%>socialSecurity/toEdit.do?SECTION_ID=' + SECTION_ID + '&currentPage=' + ${page.currentPage} +'&TYPE=' + TYPE,
            area: ["1000px", "550px"]
        });
    }

    function del(SECTION_ID) {
        parent.parent.layer.confirm("是否删除此外部单位?", {
            btn: ['确定', '取消'],
            resize: false,
            title: "提示",
            zIndex:"5",
            maxWidth: 800
        }, function (index) {
            var url = "<%=basePath%>socialSecurity/delete.do?SECTION_ID=" + SECTION_ID;
            $.get(url, function (data) {
                if("hasChildren" == data.result){
                    parent.parent.layer.msg('本单位下有人员，请先删除人员信息!', {icon: 2,zIndex:"200000000"});
                }else if ("success" == data.result) {
                    window.location.href = "<%=basePath%>socialSecurity/list.do?SECTION_ID=${SECTION_ID}&currentPage=${page.currentPage}";
                    parent.parent.layer.closeAll();
                } else {
                    parent.parent.layer.msg('系统异常,删除失败!', {icon: 5});
                }
            });
        });
    }
</script>
</body>
</html>
