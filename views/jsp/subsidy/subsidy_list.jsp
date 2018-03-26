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
	<div class="tableBox ">
		<div class="operationBox layui-form">
			<form action="list.do" method="post" name="Form" id="Form">
				<div class="searchBox fl">
					<input type="hidden" name="type" id="type" value="${pd.type}">
					<div class="searchBox fl" >
						<input value="${pd.selSubsidyMoney }"  id="selSubsidyMoney" name="selSubsidyMoney"   type="text" placeholder="请输入补贴标准" class="layui-input fl search">
						<div class="fl srarchBtn" onclick="gsearch()">
							<i class="layui-icon">&#xe615;</i>
						</div>
					</div>


					<div  class=" fl searchBox marL-20">
						<input type="hidden" name="selAreaCode" id="selAreaCode" value="${pd.selAreaCode}"/>
						<input type="hidden" name="selAreaName" id="selAreaName" value="${pd.selAreaName}"/>
						<div class="sTree fl" style="width:200px" id="sTree">

						</div>
						<div class="fl srarchBtn">
							<i class="layui-icon">&#xe715;</i>
						</div>
					</div>

					<div class="searchBox fl marL-20">

						<html:select name="selStatus" id="selStatus" classs="layui-input  fl search" style=" lay-filter='selStatus'">
							<option value="">全部</option>
							<html:options collection="btzt" defaultValue="${pd.selStatus}"></html:options>
						</html:select>
					</div>
				</div>
			</form>

			<shiro:hasPermission name="subsidy:add">
			<button class="layui-btn fl  marL-20 layui-btn-blue" id="add">新增</button>
			</shiro:hasPermission>
		</div>


		<table class="layui-table center" id="table">

			<thead>
				<tr>
					<th>所在区域</th>
					<th>补贴标准（元/月）</th>
					<th>建立时间</th>
					<th>生效时间</th>
					<th>填表单位</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>


			<c:choose>
				<c:when test="${not empty subsidy_List}">
					<shiro:hasPermission name="subsidy:select">

						<c:forEach items="${subsidy_List}" var="var" varStatus="vs">

							<tr>
								<td>${var.areaName }</td>
								<td>${var.subsidyMoney }</td>
								<td>${var.applyDate }</td>
								<td>${var.effectiveDate }</td>
								<td>${var.applyUnitName }</td>
								<td><html:selectedValue collection="btzt" defaultValue="${var.status }"></html:selectedValue></td>
								<td style="width: 160px; text-align: center;">

										<a class="layui-btn layui-btn-primary layui-btn-mini selUser" data_id="${var.id }">查看</a>
									<c:if test="${var.status==3 }">
										<shiro:hasPermission name="subsidy:updata">
											<a class="layui-btn layui-btn-mini edit"  data_id="${var.id }">编辑</a>
										</shiro:hasPermission>

										<shiro:hasPermission name="subsidy:del">
											<a class="layui-btn layui-btn-danger layui-btn-mini del" data_id="${var.id}">删除</a>
										</shiro:hasPermission>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</shiro:hasPermission>

					<shiro:lacksPermission name="subsidy:select">
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
        var sum ="&subsidyMoney=${pd.subsidyMoney}&selAreaCode=${pd.selAreaCode}&selAreaName=${pd.selAreaName}&selStatus=${pd.selStatus }&type=${pd.type}"


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
                        window.location.href = "<%=basePath%>subsidy/list.do?currentPage=" + obj.curr +sum;
                    }
                }
            });


            $("#selSubsidyMoney").on("keyup",function(e){
                var ev= e || window.event;
                if(ev.keyCode == 13){
                    gsearch();
                }
            })

            form.on('select(selStatus)', function(data){
                gsearch()
            });


			//搜索


			//新增  
			$("#add").on("click", function() {
                parent.layer.open({
                    title:"新增标准",
                    type: 2,
                    content:'<%=basePath%>subsidy/toAdd.do?currentPage=${page.currentPage}'+sum,
                    area: ["1050px","650px"]
                });
                transmit(window);
			})

			//查看
            $("#table").on("click", ".selUser", function() {
                var id =  $(this).attr("data_id");
                parent.layer.open({
                    title:"标准信息",
                    type: 2,
                    content:'<%=basePath%>subsidy/toSelect.do?id='+id,
                    area: ["800px","500px"]
                });
                transmit(window);
            })
			//编辑
			$("#table").on("click", ".edit", function() {
                var id =  $(this).attr("data_id");
                parent.layer.open({
                    title:"编辑标准信息",
                    type: 2,
                    content:'<%=basePath%>subsidy/toEdit.do?id='+id+'&currentPage=${page.currentPage}'+sum,
                    area: ["1050px","650px"]
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
                    var url = "<%=basePath%>subsidy/delete.do?id=" + id + "&guid=" + new Date().getTime();
                    $.get(url, function (data) {
                        if ("success" == data.result) {
                            window.location.href = "<%=basePath%>subsidy/list.do?currentPage=${page.currentPage}"+ sum;
                            parent.parent.layer.closeAll();
                        } else{
                            layer.msg('删除失败,请重试!', {icon: 5});
                        }
                    });
				});

			})

		});

        var sTree = $.Stree({
            title:"${pd.selAreaName}",
            el: $("#sTree"),
            isSingle: true,  //单选
            data:[],
            callback:function(){
                $("#selAreaName").val($.getString(this.arr,"title"))
                $("#selAreaCode").val($.getString(this.arr,"areaCode"))
                if(!first){
                    gsearch()
                }
                //
            },
            switchCallback: function (obj) {
                var id = obj.id;
                if(obj.children == ""){
                    getAddress(id, sTree)
                }
            }
        });

        first=false;
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


        function transmit(obj){
            parent.layer.transmit= obj;
        }
	</script>
</body>
</html>