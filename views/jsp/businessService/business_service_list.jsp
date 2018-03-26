<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>老年人商业服务、文体休闲优待信息表</title>
    <%@ include file="../system/index/headcss.jsp" %>
</head>
<body>
<div class="tableBox">
	<div class="operationBox">
	   <form action="list.do?xzqh=${pd.xzqh_code}" class="layui-form" method="post" name="Form" id="Form">
	       <div class="searchBox fl ">
                <input type="hidden" name="xzqh_code" id="xzqh_code" value="${pd.xzqh_code}"/>
                <input type="hidden" name="area_name" id="area_name" value="${pd.area_name}"/>
                <div class="sTree fl" id="sTree" style="width:200px">
                    
                </div>
                <div class="fl srarchBtn">
                    <i class="layui-icon">&#xe715;</i>
                </div>
            </div>

            <div class="searchBox fl marL-20">
                <input type="hidden" name="nf" id="nf" value="${pd.nf}"/>
                <input type="text" value="${pd.nf}" name="years" id="years" required lay-verify="required" placeholder="年份"
                       autocomplete="off" class="layui-input fl search">
                <div class="fl srarchBtn">
                    <i class="layui-icon">&#xe637;</i>
                </div>
            </div>

            <div class="searchBox fl marL-20">
                <input type="hidden" name="nd" id="nd" value="${pd.nd}"/>
                <div class="layui-form-item ">
                    <select name="nds" lay-verify="required" lay-filter='select1'>
                        <option value="2">全年</option>
                        <option value="1" <c:if test="${pd.nd == '1'}">selected</c:if>>上半年</option>
                    </select>
                </div>
            </div>
	    </form> 
	     <shiro:hasPermission name="business:info:add">
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
				<col>
	        </colgroup>
	        <thead>
	        <tr>
	            <th>序号</th>
				<th>区域</th>
				<th>年份</th>
				<th>上半年/全年</th>
				<th>填表人</th>
				<th>填表日期</th>
				<th>填表单位</th>
				<th>操作</th>
	        </tr>
	        </thead>
	        <tbody>
	        <c:choose>
	            <c:when test="${not empty listExpand}">
	                <shiro:hasPermission name="business:info:select">
	                    <c:forEach items="${listExpand}" var="var" varStatus="vs">
	                        <tr>
	                            <td>${vs.index+1}</td>
	                             <td>${var.szqy_xm}</td>
	                             <td>${var.nf}</td>
	                             <td>
	                                <c:if test="${var.nd == '1'}">上半年</c:if>
	                                <c:if test="${var.nd == '2'}">全年</c:if>
	                            </td>
	                            <td>${var.tbr}</td>
	                            <td>${var.tbrq}</td>
	                            <td>${var.tbdw}</td>
	                            <td style="text-align: center;">
	                                <shiro:hasPermission name="business:info:detail">
	                                    <a class="layui-btn layui-btn-mini layui-btn-normal" onclick="edit('${var.id}','1');">查看</a>
	                                </shiro:hasPermission>
	                                <shiro:hasPermission name="business:info:edit">
	                                    <a class="layui-btn layui-btn-mini edit" onclick="edit('${var.id}','2');">编辑</a>
	                                </shiro:hasPermission>
	                                <shiro:hasPermission name="business:info:del">
	                                <a class="layui-btn layui-btn-danger layui-btn-mini del" onclick="del('${var.id}');">删除</a></td>
	                            </shiro:hasPermission>
	                            </td>
	                        </tr>
	                    </c:forEach>
	                </shiro:hasPermission>
	                <shiro:lacksPermission name="business:info:select">
	                    <tr>
	                        <td colspan="100" class="center">您无权查看</td>
	                    </tr>
	                </shiro:lacksPermission>
	            </c:when>
	            <c:otherwise>
	                <tr class="main_info">
	                    <td colspan="100" class="center">没有相关数据</td>
	                </tr>
	            </c:otherwise>
	        </c:choose>
	        </tbody>
	    </table>
	
	    <div class="laypageBox">
	        <div id="laypage" class="fr"></div>
	    </div>
	</div>
</div>

<%@ include file="../system/index/foot.jsp" %>
<script type="text/javascript">
	var first = true;
	var laypage = layui.laypage;
	var layer = layui.layer;
	var form = layui.form;
	
	layui.use('laydate', function () {
	    var laydate = layui.laydate;
	    laydate.render({
	        elem: '#years',
	        type: 'year',
	        value: '${pd.nf}',
	        done: function (value) {
	            $("#nf").val(value);
	            gsearch();
	        }
	    });
	});
	
    layui.use('laypage', function () {
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
                    window.location.href = "<%=basePath%>businessService/list.do?currentPage=" + obj.curr + '&id=' + '${id}' + '&keywords=' + '${keywords}';
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

    //新增
    $("#add").on("click", function () {
    	  parent.parent.layer.edit = window;
          parent.parent.layer.open({
              title: "新增",
              type: 2,
              content: '<%=basePath%>businessService/toAdd.do?id=' + '${id}' + '&currentPage=' + ${page.currentPage},
              area: ["800px", "600px"]
          });
    });

    function edit(id, TYPE) {
        var msg = TYPE == '1' ? '查看' : '编辑';
        parent.parent.layer.edit = window;
        parent.parent.layer.open({
            title: msg,
            type: 2,
            content: '<%=basePath%>businessService/goEdit.do?id=' + id + '&currentPage=' + ${page.currentPage} +'&TYPE=' + TYPE,
            area: ["800px", "600px"]
        });
    }

    function del(id) {
        parent.parent.layer.confirm("是否删除此数据?", {
            btn: ['确定', '取消'],
            resize: false,
            title: "提示",
            maxWidth: 800
        }, function (index) {
            var url = "<%=basePath%>businessService/delete.do?id=" + id;
            $.get(url, function (data) {
                if ("success" == data.result) {
                    window.location.href = '<%=basePath%>businessService/list.do?currentPage=${page.currentPage}' + '&id=' + '${id}';
                    parent.parent.layer.closeAll();
                } else {
                    layer.msg('系统异常,删除失败!', {icon: 5});
                }
            });
        });
    }
    form.on('select(select1)', function (data) {
        $("#nd").val(data.value);
        gsearch();
    });

    //所在区域
    $.post("<%=basePath%>areaCode/listSubAreaCodeByParentId", {parentId:0}, function (data) {
        var sTree = $.Stree({
            title: "${pd.area_name}",
            el: $("#sTree"),
            isSingle: true,  //单选
            data: data,
            callback: function () {
            	 $("#area_name").val($.getString(this.arr, "title"));
                 $("#xzqh_code").val($.getString(this.arr, "areaCode"));
            	if (!first) {
            		  gsearch();
            	}
            },
            switchCallback: function (obj) {
                var id = obj.id;
                if (obj.children == "") {
                    getAddress(id, sTree);
                }
            }
        });
        first = false;
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

</script>
</body>
</html>