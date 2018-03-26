﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>角色管理</title>
<%@ include file="../index/headcss.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=basePath %>static/source/public/css/list.css"> 
</head>
<body>
<div class="menu-list">

	<!-- tree -->
	<div class="layui-col-xs3 layui-col-sm3 layui-col-md3 layui-col-lg2 h100 treeBox" style="zoverflow:auto;">
		<div id="tree" class="tree">
		</div>
	</div>

	<div class="layui-col-xs9 layui-col-sm9 layui-col-md9 layui-col-lg10 h100 tableBox">
		<div class="operationBox">
			<shiro:hasPermission name="system:menu:add">
				<button class="layui-btn fl   layui-btn-blue" id="add">新增</button>
			</shiro:hasPermission>
			<c:if test="${null != pd.MENU_ID && pd.MENU_ID != '0'}">
				<button class="layui-btn fl layui-btn-primary marL-20"  onclick="goSonmenu('${pd.PARENT_ID}');">返回</button>
			</c:if>
		</div>

		<!-- table -->
			<table class="layui-table center" id="table">
				<colgroup>
					<col width="60">
					<col>
					<col>
					<col width="200">
				</colgroup>
				<thead>
				<tr>
					<th class="center" style="width: 50px;">序号</th>
					<th class='center'>名称</th>
					<th class='center'>资源路径</th>
					<th class='center' style="width: 150px;">操作</th>
				</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty menuList}">
						<c:forEach items="${menuList}" var="menu" varStatus="vs">
							<tr>
								<td>${menu.MENU_ORDER }</td>
								<td>

									<a style="color: #0C64B5;" href="javascript:goSonmenu('${menu.MENU_ID }')">${menu.MENU_NAME }</a>

								</td>

								<td>${menu.MENU_URL == '#'? '无': menu.MENU_URL}</td>


								<td  style="width: 160px; text-align: center;" >

									<shiro:hasPermission name="system:menu:permission_add">
										<c:if test="${menu.MENU_TYPE == '1' }">
											<a data_id="${menu.MENU_ID }" class="layui-btn layui-btn-primary layui-btn-mini addPermission">
												添加权限
											</a>
										</c:if>
									</shiro:hasPermission>

									<shiro:hasPermission name="system:menu:edit">

										<a data_id="${menu.MENU_ID }" class="layui-btn layui-btn-mini edit" href="javascript:editmenu('${menu.MENU_ID }');">
											修改
										</a>
									</shiro:hasPermission>

									<shiro:hasPermission name="system:menu:del">
										<a class="layui-btn layui-btn-danger layui-btn-mini del" data_id="${menu.MENU_ID }">
											删除
										</a>
									</shiro:hasPermission>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="100" class='center'>没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>

			<%--<div class="laypageBox">
                <div id="laypage" class="fr"></div>
            </div>--%>
	</div>

</div>






	<%@ include file="../index/foot.jsp"%>
	<script type="text/javascript">
        function goSonmenu(MENU_ID){
            window.location.href="<%=basePath%>menu.do?MENU_ID="+MENU_ID;
        };

        
		layui.use('laypage', function() {
			var laypage = layui.laypage;
			var layer = layui.layer;
			var form = layui.form;
			var tree = layui.tree;


			//渲染树
			tree({
			    elem: '#tree'
			  ,nodes: ${nodes}
			  ,click: function(node){
                    editmenu(node.id)
			  }
			})

					
			//新增  
			
			$("#add").on("click", function() {
				 parent.layer.open({
					  title:"新增",
					  type: 2, 
					  content: '<%=basePath%>menu/toAdd.do?MENU_ID='+${MENU_ID} ,
					  area: ["500px","500px"],
				});
				 transmit(window);
			})
			
			
			//菜单权限

            $("#table").on("click",".addPermission", function() {
                var id =  $(this).attr("data_id");
                parent.layer.open({
                    title:"权限菜单",
                    type: 2,
                    content:'<%=basePath%>menu/permissionqx.do?MENU_ID=' +id,
                    area: ["500px","440px"]
                });
                transmit(window);
            })


			//删除
			$("#table").on("click", ".del", function() {

                var id =  $(this).attr("data_id");
				parent.layer.confirm("是否确认删除此菜单", {
					btn : [ '确定', '取消' ] //按钮
					,resize : false
					,title : "提示"
					,maxWidth : 800
				}, function(index) {

                    var url = "<%=basePath%>menu/delete.do?MENU_ID="+id+"&guid="+new Date().getTime();
                    $.get(url,function(data){
                        if("success" == data.result){
                        	parent.layer.closeAll();
                            window.location.reload()
                        }else if("false" == data.result){
                            parent.layer.closeAll();
                            parent.layer.confirm("删除失败,请先删除子菜单!", {
                                btn : [ '确定' ] //按钮
                                ,resize : false
                                ,title : "提示"
                                ,maxWidth : 800
                            });

                        }
                    });

				});
			})
		
		});

        function editmenu(id) {
            parent.layer.open({
                type: 2,
                content: '<%=basePath%>menu/toEdit.do?id='+id ,
                area: ["500px","500px"]
            });
            transmit(window);
        }
		
        function transmit(obj){
        	parent.layer.transmit= obj;
        }
        
		
	</script>
</body>
</html>