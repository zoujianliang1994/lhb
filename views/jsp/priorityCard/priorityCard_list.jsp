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
<body >
	<div class="tableBox">
		<div class="operationBox">
			<form action="list.do" method="post" name="Form" id="Form">
				<div class="searchBox fl">

					<div class="searchBox fl">
						<input value="${pd.keywords }"  id="keywords" name="keywords"   type="text" placeholder="请输入要搜索姓名" class="layui-input fl search">
						<div class="fl srarchBtn" onclick="gsearch()">
							<i class="layui-icon">&#xe615;</i>
						</div>
					</div>

					<div class="searchBox fl marL-20">
						<input value="${pd.selIdcade }"  id="selIdcade" name="selIdcade"   type="text" placeholder="请输入要搜索身份证" class="layui-input fl  search">
						<div class="fl srarchBtn" >
							<i class="layui-icon">&#xe612;</i>
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
						<input type="text" value="${pd.selDate}" name="selDate" id="selDate" required lay-verify="required"
							   placeholder="请输入要搜索发证日期"
							   autocomplete="off"
							   class="layui-input fl search">

						<div class="fl srarchBtn" >
							<i class="layui-icon">&#xe637;</i>
						</div>
					</div>
				</div>
			</form>

			<shiro:hasPermission name="priorityCard:add">
			<button class="layui-btn fl  marL-20 layui-btn-blue" id="add">办理优待证</button>
			</shiro:hasPermission>

		</div>


		<table class="layui-table center" id="table">
			<colgroup>
				<col >
				<col >
				<col  >
				<col >
				<col  width="300">
			</colgroup>
			<thead>
				<tr>
					<th>所在区域</th>
					<th>姓名</th>
					<th>身份证</th>

					<th>填表日期</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>


			<c:choose>
				<c:when test="${not empty priorityCard_List}">
					<shiro:hasPermission name="priorityCard:select">

						<c:forEach items="${priorityCard_List}" var="var" varStatus="vs">

							<tr>
								<td>${var.areaName }</td>
								<td>${var.partyName }</td>
								<td>${var.partyIdCard }</td>

								<td>${var.applyDate }</td>
								<td style="width: 160px; text-align: center;">
										<a class="layui-btn layui-btn-primary layui-btn-mini print" data_row="${var.id }" data_day="${var.diffDate}" data_id="${var.partyIdCard }">打印优待证</a>


										<a class="layui-btn layui-btn-primary layui-btn-mini selUser" data_id="${var.id }">查看</a>

										<shiro:hasPermission name="priorityCard:del">
											<a class="layui-btn layui-btn-danger layui-btn-mini del" data_id="${var.id}">删除</a>
										</shiro:hasPermission>

								</td>
							</tr>
						</c:forEach>
					</shiro:hasPermission>

					<shiro:lacksPermission name="priorityCard:select">
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

        var sum ="&keywords=${pd.keywords}&selAreaCode=${pd.selAreaCode}&selAreaName=${pd.selAreaName}&selIdcade=${pd.selIdcade }&selDate=${pd.selDate}"

        layui.use('laydate', function () {
            var laydate = layui.laydate;

            //执行一个laydate实例
            laydate.render({
                elem: '#selDate'
				,done: function(value, date, endDate){
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
                        window.location.href = "<%=basePath%>priorityCard/list.do?currentPage=" + obj.curr + sum;
                    }
                }
            });


            $("#keywords").on("keyup",function(e){
                var ev= e || window.event;
                if(ev.keyCode == 13){
                    gsearch();
                }
            })
            $("#selIdcade").on("keyup",function(e){
                var ev= e || window.event;
                if(ev.keyCode == 13){
                    gsearch();
                }
            })
			//搜索


            //查看
            $("#table").on("click", ".print", function() {
                var id =  $(this).attr("data_id");
                var day = $(this).attr("data_day");
                var row = $(this).attr("data_row");


				parent.layer.open({
					title:"优待信息",
					type: 2,
					content:'<%=basePath%>priorityCard/print.do?partyIdCard='+id+'&id='+row,
					area: ["800px","550px"]
				});
				transmit(window);

            })

			//新增  
			$("#add").on("click", function() {

                parent.layer.open({
                    title:"新增优待信息",
                    type: 2,
                    content:'<%=basePath%>views/jsp/priorityCard/priorityCard_edit.html?currentPage=${page.currentPage}'+sum,
                    area: ["800px","250px"]
                });
                transmit(window);
			})

            $("#addUser").on("click", function () {
                parent.parent.layer.edit = window;
                parent.parent.layer.open({
                    title: "新增",
                    type: 2,
                    content: '<%=basePath%>personalInfo/goAddU.do?currentPage=' + ${page.currentPage} +'&xzqh_code=' + '${pd.xzqh_code}',
                    area: ["1000px", "700px"]
                });
            });

			//查看
            $("#table").on("click", ".selUser", function() {
                var id =  $(this).attr("data_id");
                parent.layer.open({
                    title:"优待信息",
                    type: 2,
                    content:'<%=basePath%>priorityCard/toSelect.do?id='+id,
                    area: ["800px","400px"]
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
                    var url = "<%=basePath%>priorityCard/delete.do?id=" + id + "&guid=" + new Date().getTime();
                    $.get(url, function (data) {
                        if ("success" == data.result) {
                            window.location.href = "<%=basePath%>priorityCard/list.do?currentPage=${page.currentPage}"+ sum;
                            parent.parent.layer.closeAll();
                        } else if ("false" == data.result) {
                            layer.msg('删除失败!', {icon: 5});
                        }
                    });
				});

			})

		});

        var sTree = $.Stree({
            title:"${selAreaName}",
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