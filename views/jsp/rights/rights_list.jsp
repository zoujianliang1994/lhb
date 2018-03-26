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
<title>老年优待证办理</title>

	<%@ include file="../system/index/headcss.jsp"%>
</head>
<body>
	<div class="tableBox">
		<div class="operationBox layui-form">
			<form action="list.do" method="post" name="Form" id="Form">


				<div class="searchBox fl">
					<input type="hidden" name="selAreaCode" id="selAreaCode" value="${pd.selAreaCode}"/>
					<input type="hidden" name="selAreaName" id="selAreaName" value="${pd.selAreaName}"/>
					<div class="sTree fl" id="sTree"  style="width:200px">
					</div>
					<div class="fl srarchBtn">
						<i class="layui-icon">&#xe715;</i>
					</div>
				</div>

			</form>

			<shiro:hasPermission name="rights:add">
			<button class="layui-btn fl  marL-20 layui-btn-blue" id="add">新增</button>
			</shiro:hasPermission>
		</div>


		<table class="layui-table center" id="table">

			<thead>
				<tr>
					<th>序号</th>
					<td>所在区域</td>
					<td>年份</td>
					<td>年度</td>
					<td>填表人</td>
					<td>填报日期</td>
					<td>填表单位</td>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>


			<c:choose>
				<c:when test="${not empty rights_List}">
					<shiro:hasPermission name="rights:select">

						<c:forEach items="${rights_List}" var="var" varStatus="vs">

							<tr>
								<td>${vs.index+1}</td>
								<td>${var.areaName}</td>
								<td>${var.applyYear}</td>
								<td><html:selectedValue collection="nd" defaultValue="${var.applyAnnual}"></html:selectedValue></td>
								<td>${var.applyName}</td>
								<td>${var.applyDate}</td>
								<td>${var.applyUnitName}</td>
								<td style="width: 160px; text-align: center;">
										<a class="layui-btn layui-btn-primary layui-btn-mini selUser" data_id="${var.id }">查看</a>
										<shiro:hasPermission name="rights:updata">
											<a class="layui-btn layui-btn-mini edit"  data_id="${var.id }">编辑</a>
										</shiro:hasPermission>

										<shiro:hasPermission name="rights:del">
											<a class="layui-btn layui-btn-danger layui-btn-mini del" data_id="${var.id}">删除</a>
										</shiro:hasPermission>
								</td>
							</tr>
						</c:forEach>
					</shiro:hasPermission>

					<shiro:lacksPermission name="rights:select">
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


        layui.use('laydate', function () {
            var laydate = layui.laydate;

            //执行一个laydate实例
            laydate.render({
                elem: '#applyYear'
                ,type: 'year'
            })
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
                        window.location.href = "<%=basePath%>rights/list.do?currentPage=" + obj.curr + "&selAreaCode=${pd.selAreaCode}&selAreaName=${pd.selAreaName}";
                    }
                }
            });

            //搜索

            form.on('select(rightsType)', function(data){
                gsearch()
            });

			//新增  
			$("#add").on("click", function() {
                parent.layer.open({
                    title:"新增维权信息",
                    type: 2,
                    content:'<%=basePath%>rights/toAdd.do?currentPage=${page.currentPage}&selAreaCode=${pd.selAreaCode}&selAreaName=${pd.selAreaName}',
                    area: ["800px","560px"]
                });
                transmit(window);
			})

			//查看
            $("#table").on("click", ".selUser", function() {
                var id =  $(this).attr("data_id");
                parent.layer.open({
                    title:"维权信息",
                    type: 2,
                    content:'<%=basePath%>rights/toSelect.do?id='+id,
                    area: ["800px","560px"]
                });
                transmit(window);
            })
			//编辑
			$("#table").on("click", ".edit", function() {
                var id =  $(this).attr("data_id");
                parent.layer.open({
                    title:"编辑维权信息",
                    type: 2,
                    content:'<%=basePath%>rights/toEdit.do?id='+id+'&currentPage=${page.currentPage}&selAreaCode=${pd.selAreaCode}&selAreaName=${pd.selAreaName}',
                    area: ["800px","560px"]
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
                    var url = "<%=basePath%>rights/delete.do?id=" + id + "&guid=" + new Date().getTime();
                    $.get(url, function (data) {
                        if ("success" == data.results) {
                            window.location.href = "<%=basePath%>rights/list.do?currentPage=${page.currentPage}&selAreaCode=${pd.selAreaCode}&selAreaName=${pd.selAreaName}";
                            parent.parent.layer.closeAll();
                        } else if ("false" == data.results) {
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