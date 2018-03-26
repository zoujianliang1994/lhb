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
								请输入要搜索区域
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

						<select name="selApplyAnnual" lay-filter="nd" class="layui-input fl search" id="selApplyAnnual">
							<option value="1" <c:if test="${pd.selApplyAnnual == '1'}">selected</c:if>>上半年</option>
							<option value="3" <c:if test="${pd.selApplyAnnual == '3'}">selected</c:if>>下半年</option>
							<option value="2" <c:if test="${pd.selApplyAnnual == '2'}">selected</c:if>>全年</option>
						</select>


					</div>

                <button type="button" class="layui-btn layui-btn-primary  " id="dowload" style="margin-left: 16px;margin-bottom: 10px">导出</button>

			</form>
		</div>


		<table class="layui-table center" id="table">

			<thead>
				<tr>
					<th rowspan="2">区域</th>
					<th colspan="2">为65周岁以上老年人免费建立健康档案</th>
					<th colspan="2">为65周岁以上老年人提供免费体检</th>

					<th rowspan="2">为行动不便老年人提供上门医疗服务（次）</th>
					<th rowspan="2">建设老年病科二级以上综合医院（所）</th>

					<th colspan="2">减免老年人医疗费用</th>
					<th rowspan="2">设立家庭病床总数</th>
					<th rowspan="2">开展巡回医疗次数</th>
				</tr>
				<tr>
					<th>已建立档案（人）</th>
					<th>建档率</th>
					<th>体检人次</th>
					<th>体检率</th>
					<th>总金额</th>
					<th>享受减免人次</th>
				</tr>
			</thead>
			<tbody>


			<c:choose>
				<c:when test="${not empty health_List}">

						<c:forEach items="${health_List}" var="var" varStatus="vs">
							<tr>
								<c:if test="${pd.level==0}">
									<td><a style="color: #0C64B5;" class="address" data-id="${var.selAreaCode }" href="javascript:void(0);">${var.name }</a></td>
								</c:if>
								<c:if test="${pd.level!=0}">
									<td>${var.name }</td>
								</c:if>
								<td>${var.jkdajlzs}</td>
								<td>${var.jdl}</td>
								<td>${var.tgmftjcs}</td>
								<td>${var.tjl}</td>
								<td>${var.tgsmylccs}</td>

								<td>${var.kslnbkejysyysl}</td>
								<td>${var.jmlnrylfyzje}</td>
								<td>${var.xsylfyjmrc}</td>
								<td>${var.jljtbczs}</td>
								<td>${var.kzxhylcs}</td>

							</tr>

						</c:forEach>
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
                    $("#selApplyYear").val(value)
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

            $("#table").on("click",".address",function(){
                var id= $(this).data("id");
                var title= $(this).text()
                parent.addTab(title+"卫生优待统计","health/count.do?selAreaCode="+id+"&selApplyYear=${pd.selApplyYear}&selApplyAnnual=${pd.selApplyAnnual}")
            })

            //导出
            $("#dowload").on("click", function () {
				window.location.href = '<%=basePath%>health/exportExcel.do?version=${version}';
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