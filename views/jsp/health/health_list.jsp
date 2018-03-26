<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<title>政务优待信息</title>

	<%@ include file="../system/index/headcss.jsp"%>
</head>
<body>
	<div class="tableBox">
		<div class="operationBox layui-form">
			<form action="list.do" method="post" name="Form" id="Form">
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
					<input type="text" value="${pd.selApplyYear}" name="selApplyYear" id="selApplyYear" required lay-verify="required"  placeholder="年份" autocomplete="off" class="layui-input fl search">
					<div class="fl srarchBtn" >
						<i class="layui-icon">&#xe637;</i>
					</div>
				</div>

				<div class="searchBox fl marL-20">

					<html:select name="selApplyAnnual" id="selApplyAnnual" classs="layui-input fl search" style=" lay-filter='nd'">
						<option value="">全部</option>
						<html:options collection="nd" defaultValue="${pd.selApplyAnnual}"></html:options>
					</html:select>


				</div>
			</form>

			<shiro:hasPermission name="health:add">
			<button class="layui-btn fl  marL-20 layui-btn-blue" id="add">新增</button>
			</shiro:hasPermission>
		</div>


		<table class="layui-table center" id="table">

			<thead>
				<tr>
					<td>所在区域</td>
					<td>年份</td>
					<td>年度</td>
					<td>填表人</td>
					<td>填报日期</td>
					<td>填表单位</td>
					<td>操作</td>
				</tr>
			</thead>
			<tbody>


			<c:choose>
				<c:when test="${not empty health_List}">
					<shiro:hasPermission name="health:select">

						<c:forEach items="${health_List}" var="var" varStatus="vs">

							<tr>
								<td>${var.areaName}</td>
								<td>${var.applyYear}</td>
								<td><html:selectedValue collection="nd" defaultValue="${var.applyAnnual}"></html:selectedValue></td>
								<td>${var.applyName}</td>
								<td>${var.applyDate}</td>
								<td>${var.applyUnitName}</td>
								<td style="width: 160px; text-align: center;">
										<a class="layui-btn layui-btn-primary layui-btn-mini selUser" data_id="${var.id }">查看</a>
										<shiro:hasPermission name="health:updata">
											<a class="layui-btn layui-btn-mini edit"  data_id="${var.id }">编辑</a>
										</shiro:hasPermission>

										<shiro:hasPermission name="health:del">
											<a class="layui-btn layui-btn-danger layui-btn-mini del" data_id="${var.id}">删除</a>
										</shiro:hasPermission>
								</td>
							</tr>
						</c:forEach>
					</shiro:hasPermission>

					<shiro:lacksPermission name="health:select">
						<tr>
							<td class='center' style="width: 25px;">--</td>
							<td class="center">您无权查看</td>
							<td class='center' style="width: 25px;">--</td>
						</tr>
					</shiro:lacksPermission>

				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="100" class="center">没有相关数据</td>
					</tr>
				</c:otherwise>
			</c:choose>

			</tbody>
		</table>

		<div class="laypageBox ">
			<div id="laypage" class="fr"></div>
		</div>
	</div>

<%--	<div class="layui-form">
		<div class="layui-form-item" pane="">
			<label class="layui-form-label">原始复选框</label>
			<div class="layui-input-block">
				 复选框值源于数据库字典，根据父级英文名查询所得 默认样式(样式问题询问佳杰)
				<html:checkbox name="type" defaultValue="1,3,5,2" collection="personnel_categories" ></html:checkbox>

			</div>
		</div>
	</div>--%>

	<%@ include file="../system/index/foot.jsp"%>
	<script type="text/javascript">
		var first= true;

        function gsearch() {
            $("#Form").submit();
        }

        var sum ="&selAreaCode=${pd.selAreaCode}&selApplyYear=${pd.selApplyYear}&selAreaName=${pd.selAreaName}&selApplyAnnual=${pd.selApplyAnnual }"

        layui.use('laydate', function () {
            var laydate = layui.laydate;

            //执行一个laydate实例
            laydate.render({
                elem: '#selApplyYear'
                ,type:'year'
                ,done: function(value, date, endDate){
                    $("#selApplyYear").val(value)
                    gsearch()
                }
            });

        });

		layui.use('laypage', function() {
			var laypage = layui.laypage;
			var layer = layui.layer;
			var form = layui.form;


            //执行一个laypage实例
            laypage.render({
                elem: 'laypage',
                count: ${page.totalResult},
                curr: ${page.currentPage},
                layout: ['prev', 'page', 'next', 'count', 'skip'],
                jump: function (obj, first) {
                    if (!first) {
                        window.location.href = "<%=basePath%>health/list.do?currentPage=" + obj.curr +sum;
                    }
                }
            });

            //搜索

            form.on('select(nd)', function(data){
                gsearch()
            });

			//新增  
			$("#add").on("click", function() {
                parent.layer.open({
                    title:"新增优待信息",
                    type: 2,
                    content:'<%=basePath%>health/toAdd.do?currentPage=${page.currentPage}'+sum,
                    area: ["1000px","620px"]
                });
                transmit(window);
			})

			//查看
            $("#table").on("click", ".selUser", function() {
                var id =  $(this).attr("data_id");
                parent.layer.open({
                    title:"优待信息",
                    type: 2,
                    content:'<%=basePath%>health/toSelect.do?id='+id,
                    area: ["1000px","625px"]
                });
                transmit(window);
            })
			//编辑
			$("#table").on("click", ".edit", function() {
                var id =  $(this).attr("data_id");
                parent.layer.open({
                    title:"编辑优待信息",
                    type: 2,
                    content:'<%=basePath%>health/toEdit.do?id='+id+'&currentPage=${page.currentPage}'+sum,
                    area: ["1000px","620px"]
                });
                transmit(window);
			})

			//删除
			$("#table").on("click", ".del", function() {

                var id =  $(this).attr("data_id");
                parent.layer.confirm("是否确认删除此数据", {
					btn : [ '确定', '取消' ] //按钮
					,resize : false
					,title : "提示"
					,maxWidth : 800
				}, function(index) {
                    var url = "<%=basePath%>health/delete.do?id=" + id + "&guid=" + new Date().getTime();
                    $.get(url, function (data) {
                        if ("successs" == data.result) {
                            window.location.href = "<%=basePath%>health/list.do?currentPage=${page.currentPage}"+sum;
                            parent.parent.layer.closeAll();
                        } else if ("false" == data.result) {
                            layer.msg('删除失败!', {icon: 5});
                        }
                    });
				});

			})

		});

        //所在区域
        $.post("<%=basePath%>areaCode/listSubAreaCodeByParentId",{parentId:0},function(data){
            var sTree = $.Stree({
                title:"${pd.selAreaName}",
                el: $("#sTree"),
                isSingle: true,  //单选
                data:data,
                callback:function(){
                    $("#selAreaName").val($.getString(this.arr,"title"))
                    $("#selAreaCode").val($.getString(this.arr,"areaCode"))
                    if(!first){
                        gsearch()
                    }
                },
                switchCallback: function (obj) {
                    var id = obj.id;
                    if(obj.children == ""){
                        getAddress(id, sTree)
                    }
                }
            });
            first=false;
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

        function transmit(obj){
            parent.layer.transmit= obj;
        }
	</script>
</body>
</html>