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
		<div class="operationBox">
			<form action="count.do" method="post" name="Form" id="Form">

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
						<input type="text" value="${pd.selStartDate}" name="selStartDate" id="selStartDate" required lay-verify="required"  placeholder="开始日期" autocomplete="off" class="layui-input fl search">
						<div class="fl srarchBtn" >
							<i class="layui-icon">&#xe637;</i>
						</div>
					</div>

					<div class="searchBox fl marL-20">
						<input type="text" value="${pd.selEndDate}" name="selEndDate" id="selEndDate" required lay-verify="required" placeholder="结束日期"  autocomplete="off" class="layui-input fl search">
						<div class="fl srarchBtn" >
							<i class="layui-icon">&#xe637;</i>
						</div>
					</div>

			</form>

		</div>


		<table class="layui-table center" id="table">
			<colgroup>
				<col>
				<col>
			</colgroup>
			<thead>
				<tr>
					<th>地区</th>
					<th>人数</th>
				</tr>
			</thead>
			<tbody id="tbody">


			<c:choose>
				<c:when test="${not empty priorityCard_List}">
					<shiro:hasPermission name="priorityCard:select">

						<c:forEach items="${priorityCard_List}" var="var" varStatus="vs">

							<tr>
								<td>   <a style="color: #0C64B5;" class="address" data-id="${var.selAreaCode }" href="javascript:void(0);">${var.name }</a></td>
								<td>${var.num }</td>
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


        $("#tbody").on("click",".address",function(){
            var id= $(this).data("id");
            var title= $(this).text()
            parent.addTab(title+"优待证发放统计","priorityCard/count.do?selAreaCode="+id+"&selStartDate=${pd.selStartDate}&selEndDate=${pd.selEndDate}")
        })

        layui.use('laydate', function () {
            var laydate = layui.laydate;

            //执行一个laydate实例
            laydate.render({
                elem: '#selStartDate'
                ,done: function(value, date, endDate){
                    gsearch()
                }
            });
            laydate.render({
                elem: '#selEndDate'
                ,done: function(value, date, endDate){
                    gsearch()
                }
            });
        });
		layui.use('laypage', function() {
			var laypage = layui.laypage;
			var layer = layui.layer;
			var form = layui.form;

			//搜索
			$("#search").on("click",function(e){
                    gsearch();
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