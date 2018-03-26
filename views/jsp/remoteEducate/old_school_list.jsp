<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>老年大学</title>
    <%@ include file="../system/index/headcss.jsp" %>
</head>
<body>
<div class="tableBox">
	<div class="operationBox">
	    <form action="list.do?xzqh=${pd.xzqh_code}" method="post" name="Form" id="Form" class="layui-form" >
	        <div class=" fl">
				<div class="searchBox fl">
					<input id="keywords" name="keywords" type="text" value="${pd.keywords}" placeholder="请输入主管部门/学校名称" class="layui-input fl search">
					<div class="fl srarchBtn" onclick="gsearch()">
						<i class="layui-icon">&#xe615;</i>
					</div>
				</div>
				<div class="searchBox fl marL-20">
					<input type="hidden" name="area_name" id="area_name" value="${pd.area_name}"/>
        			<input type="hidden" name="szqy_code" id="szqy_code" value="${pd.szqy_code}"/>
					<div class="sTree fl" id="sTree"  style="width:200px">
						
					</div>
					<div class="fl srarchBtn">
						<i class="layui-icon">&#xe715;</i>
					</div>
				</div>
			</div>
	    </form>
	  	 	  <shiro:hasPermission name="school:add">
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
				<th>所在区域</th>
	            <th>大学（学校）名称</th>
				<th>主管部门</th>
				<th>机构性质</th>
				<th>负责人姓名</th>
				<th>负责人联系电话</th>
				<th>操作</th>
	        </tr>
	        </thead>
	        <tbody>
	        <c:choose>
	            <c:when test="${not empty listSchool}">
	                <shiro:hasPermission name="school:select">
	                    <c:forEach items="${listSchool}" var="var" varStatus="vs">
	                        <tr>
	                            <td>${vs.index+1}</td>
								<td>${var.szqy_xm}</td>
	                             <td>${var.name}</td>

	                            <td>${var.zgbm}</td>
	                            <td>
	                            	 <c:if test="${var.jxxz == '1'}">行政单位</c:if>
	                                 <c:if test="${var.jxxz == '2'}">事业单位</c:if>
	                                 <c:if test="${var.jxxz == '3'}">社会团体</c:if>
	                                 <c:if test="${var.jxxz == '4'}">民办非企业单位</c:if>
	                                 <c:if test="${var.jxxz == '5'}">企业</c:if>
	                            </td>
	                           <td>${var.fzrxm}</td>
	                            <td>${var.fzrlxdh}</td>
	                            <td style="text-align: center;">
	                                <shiro:hasPermission name="school:detail">
	                                    <a class="layui-btn layui-btn-mini layui-btn-normal" onclick="edit('${var.id}','1');">查看</a>
	                                </shiro:hasPermission>
	                                <shiro:hasPermission name="school:edit">
	                                    <a class="layui-btn layui-btn-mini edit" onclick="edit('${var.id}','2');">编辑</a>
	                                </shiro:hasPermission>
	                                <shiro:hasPermission name="school:del">
	                                <a class="layui-btn layui-btn-danger layui-btn-mini del" onclick="del('${var.id}');">删除</a></td>
	                            </shiro:hasPermission>
	                            </td>
	                        </tr>
	                    </c:forEach>
	                </shiro:hasPermission>
	                <shiro:lacksPermission name="school:select">
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
    layui.use('laypage', function () {
        var laypage = layui.laypage;
        var layer = layui.layer;
        var form = layui.form;
        var laydate = layui.laydate;
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
                    window.location.href = "<%=basePath%>oldSchool/list.do?currentPage=" + obj.curr + '&id=' + '${id}' + '&keywords=' + '${keywords}';
                }
            }
        });

		 //所在区域
	    $.post("<%=basePath%>areaCode/listSubAreaCodeByParentId", {parentId:0}, function (data) {
	        var sTree = $.Stree({
	            title: "${pd.area_name}",
	            el: $("#sTree"),
	            oldData: ['${pd.area_code}'],
	            isSingle: true,  //单选
	            data: data,
	            callback: function () {
	                $("#area_name").val($.getString(this.arr, "title"));
	                $("#szqy_code").val($.getString(this.arr, "areaCode"));
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
              content: '<%=basePath%>oldSchool/toAdd.do?id=' + '${id}' + '&currentPage=' + ${page.currentPage},
              area: ["800px", "550px"]
          });
    });

    function edit(id, TYPE) {
        var msg = TYPE == '1' ? '查看' : '编辑';
        parent.parent.layer.edit = window;
        parent.parent.layer.open({
            title: msg,
            type: 2,
            content: '<%=basePath%>oldSchool/goEdit.do?id=' + id + '&currentPage=' + ${page.currentPage} +'&TYPE=' + TYPE,
            area: ["800px", "550px"]
        });
    }

    function del(id) {
        parent.parent.layer.confirm("是否删除此数据?", {
            btn: ['确定', '取消'],
            resize: false,
            title: "提示",
            maxWidth: 800
        }, function (index) {
            var url = "<%=basePath%>oldSchool/delete.do?id=" + id;
            $.get(url, function (data) {
                if ("success" == data.result) {
                    window.location.href = "<%=basePath%>oldSchool/list.do?id=${id}&currentPage=${page.currentPage}";
                    parent.parent.layer.closeAll();
                } else {
                    layer.msg('系统异常,删除失败!', {icon: 5});
                }
            });
        });
    }

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