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
						<input type="text" value="${pd.selApplyYear}" name="selApplyYear" id="selApplyYear" required lay-verify="required"  placeholder="年份" autocomplete="off" class="layui-input fl search">
						<div class="fl srarchBtn" >
							<i class="layui-icon">&#xe637;</i>
						</div>
					</div>

					<div class="searchBox fl marL-20">

						<html:select name="selApplyAnnual" id="selApplyAnnual" classs="layui-input fl search" style=" lay-filter='nd'">
							<html:options collection="nd" defaultValue="${pd.selApplyAnnual}"></html:options>
						</html:select>


					</div>

                <button type="button" class="layui-btn layui-btn-primary  " id="dowload" style="margin-left: 16px;margin-bottom: 10px">导出</button>

			</form>
		</div>


		<table class="layui-table center" id="table">

			<thead>
				<tr>
					<th rowspan="2">区域</th>
					<th colspan="5">为老服务志愿者组织</th>
					<th colspan="6">老年人志愿者组织</th>

				</tr>
				<tr>
					<th>志愿者组织数量</th>
					<th>志愿者总数</th>
					<th>活动次数</th>
					<th>志愿者参与人数</th>
					<th>享受服务人数</th>

					<th>老年志愿者组织数</th>
					<th>老年志愿者总数</th>
					<th>注册率</th>
					<th>老年人志愿者占老年人总数比例</th>
					<th>活动总数</th>
					<th>享受服务人数</th>
				</tr>
			</thead>
			<tbody>


			<c:choose>
				<c:when test="${not empty rights_List}">
					<shiro:hasPermission name="volunteer:select">

						<c:forEach items="${rights_List}" var="var" varStatus="vs">
							<tr>
								<td>${var.name}</td>
								<td>${var.orgSum}</td>
								<td>${var.volunCount}</td>
								<td>${var.actSum}</td>
								<td>${var.volunSum}</td>
								<td>${var.serSum}</td>

								<td>${var.orgSumT}</td>
								<td>${var.volunCountT}</td>
								<td>${var.zcl}</td>
								<td>${var.zbl}</td>
								<td>${var.actSumT}</td>
								<td>${var.serSumT}</td>

							</tr>

						</c:forEach>


					</shiro:hasPermission>

					<shiro:lacksPermission name="volunteer:select">
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



        layui.use('laydate', function () {
            var laydate = layui.laydate;

            //执行一个laydate实例
            laydate.render({
                elem: '#selApplyYear'
				,type:'year'
                ,done: function(value, date, endDate){
                    $("#selRightsYear").val(value)
                    gsearch()
                }
            });

        });
		layui.use('laypage', function() {
			var laypage = layui.laypage;
			var layer = layui.layer;
			var form = layui.form;


            form.on('select(nd)', function(data){
                gsearch()
            });



            //导出
            $("#dowload").on("click", function () {
				window.location.href = '<%=basePath%>volunteer/exportExcel.do?version=${version}';
            });

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