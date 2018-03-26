<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>老年大学统计报表管理</title>
    <%@ include file="../system/index/headcss.jsp" %>
</head>
<body>
<div class="tableBox">
    <div class="operationBox">
        <form class="layui-form" action="list.do" method="post" name="Form" id="Form">

            <div class="searchBox fl ">
				<input type="hidden" name="area_code" id="area_code" value="${sysArea.area_code}"/>
                <input type="hidden" name="area_name" id="area_name" value="${sysArea.name}"/>
				<div class="sTree fl" id="sTree"  style="width:200px">

				</div>
				<div class="fl srarchBtn">
					<i class="layui-icon">&#xe715;</i>
				</div>
			</div>

			<div class="searchBox fl marL-20">
				<input type="text" value="${pd.startDate}" name="startDate" id="startDate" required lay-verify="required"  placeholder="开始日期" autocomplete="off" class="layui-input fl search">
				<div class="fl srarchBtn" >
					<i class="layui-icon">&#xe637;</i>
				</div>
			</div>

			<div class="searchBox fl marL-20">
				<input type="text" value="${pd.endDate}" name="endDate" id="endDate" required lay-verify="required" placeholder="结束日期"  autocomplete="off" class="layui-input fl search">
				<div class="fl srarchBtn" >
					<i class="layui-icon">&#xe637;</i>
				</div>
			</div>
 			<button type="button" class="layui-btn fl layui-btn-primary marL-20" id="dowExcel">导出</button>

        </form>
    </div>

    <hr>
    <div style="text-align:center;"><span style="color: #FF3333;">${sysArea.name}</span> 老年大学信息统计表</div>

    <table class=" layui-table center" id="table">
        <colgroup>
            <col width="150">
            <col width="150">
            <col width="150">
            <col width="150">
            <col width="150">
        </colgroup>
        <thead>
         <tr>
			<th rowspan="2">市（州）</th>
			<th rowspan="2">老年人口总数</th>
			<th rowspan="2">学校总数</th>
			<th rowspan="2">学员总数</th>
			<th rowspan="2">入学率</th>
			<th colspan="2">行政单位类老年大学（学校）</th>
			<th colspan="2">事业单位类老年大学（学校）</th>
			<th colspan="2">社会团体类老年大学（学校）</th>
			<th colspan="2">民办非企业单位类老年大学（学校）</th>
			<th colspan="2">企业类老年大学（学校）</th>
		</tr>
		<tr>
			<th>学校总数</th>
			<th>学员总数</th>
			<th>学校总数</th>
			<th>学员总数</th>
			<th>学校总数</th>
			<th>学员总数</th>
			<th>学校总数</th>
			<th>学员总数</th>
			<th>学校总数</th>
			<th>学员总数</th>
		</tr>
        </thead>
        <tbody id="tbody">
        <c:choose>
            <c:when test="${not empty list}">
                <c:forEach items="${list}" var="var" varStatus="vs">
                    <tr>
                        <td>
                            <c:if test="${pd.level == '4'}">
                                ${var.name }
                            </c:if>

                            <c:if test="${pd.level != '4'}">
                                <a style="color: #0C64B5;" class="address" data-id="${var.area_code }" data-level="${var.level}"  href="javascript:void(0);">${var.name }</a>
                            </c:if>
                        </td>
                        <td>${var.ln_num}</td>
                        <td>${var.dx_num}</td>
                        <td>${var.xy_num}</td>
                        <td>${var.rxl}</td>
                        <td>
                        	<c:if test="${pd.level == '4'}">
                        	     <a style="color: #0C64B5;" class="address" data-id="${var.area_code }" data-level="${var.level}"  data-jxxz="1"  href="javascript:void(0);">${var.xzdx_num}</a>
                        	</c:if>
                            <c:if test="${pd.level != '4'}">
                                ${var.xzdx_num}
                            </c:if>
                        </td>
                        <td>
                        	<c:if test="${pd.level == '4'}">
                        	     <a style="color: #0C64B5;" class="address" data-id="${var.area_code }" data-level="${var.level}" data-jxxz="1"  href="javascript:void(0);">${var.xzxy_num}</a>
                        	</c:if>
                        	 <c:if test="${pd.level != '4'}">
                                ${var.xzxy_num}
                            </c:if>
                        </td>
                        <td>
                        	<c:if test="${pd.level == '4'}">
                        	     <a style="color: #0C64B5;" class="address" data-id="${var.area_code }" data-level="${var.level}" data-jxxz="2"  href="javascript:void(0);">${var.qtdx_num}</a>
                        	</c:if>
                        	 <c:if test="${pd.level != '4'}">
                                ${var.qtdx_num}
                            </c:if>
                        </td>
                        <td>
                        	<c:if test="${pd.level == '4'}">
                        	     <a style="color: #0C64B5;" class="address" data-id="${var.area_code }" data-level="${var.level}" data-jxxz="2"  href="javascript:void(0);">${var.qtxy_num}</a>
                        	</c:if>
                        	 <c:if test="${pd.level != '4'}">
                                ${var.qtxy_num}
                            </c:if>
                        </td>
                        <td>
                        	<c:if test="${pd.level == '4'}">
                        	     <a style="color: #0C64B5;" class="address" data-id="${var.area_code }" data-level="${var.level}"  data-jxxz="3"  href="javascript:void(0);">${var.shttdx_num}</a>
                        	</c:if>
                        	 <c:if test="${pd.level != '4'}">
                                ${var.shttdx_num}
                            </c:if>
                        </td>
                        <td>
                        	<c:if test="${pd.level == '4'}">
                        	     <a style="color: #0C64B5;" class="address" data-id="${var.area_code }" data-level="${var.level}" data-jxxz="3"   href="javascript:void(0);">${var.shttxy_num}</a>
                        	</c:if>
                        	 <c:if test="${pd.level != '4'}">
                                ${var.shttxy_num}
                            </c:if>
                        </td>
                        <td>
                        	<c:if test="${pd.level == '4'}">
                        	     <a style="color: #0C64B5;" class="address" data-id="${var.area_code }" data-level="${var.level}" data-jxxz="4"   href="javascript:void(0);">${var.mbfqdx_num}</a>
                        	</c:if>
                        	 <c:if test="${pd.level != '4'}">
                                ${var.mbfqdx_num}
                            </c:if>
                        </td>
                        <td>
                        	<c:if test="${pd.level == '4'}">
                        	     <a style="color: #0C64B5;" class="address" data-id="${var.area_code }" data-level="${var.level}" data-jxxz="4"  href="javascript:void(0);">${var.mbfqxy_num}</a>
                        	</c:if>
                        	 <c:if test="${pd.level != '4'}">
                                ${var.mbfqxy_num}
                            </c:if>
                        </td>
                        <td>
                        	<c:if test="${pd.level == '4'}">
                        	     <a style="color: #0C64B5;" class="address" data-id="${var.area_code }" data-level="${var.level}" data-jxxz="5"  href="javascript:void(0);">${var.qydx_num}</a>
                        	</c:if>
                        	 <c:if test="${pd.level != '4'}">
                                ${var.qydx_num}
                            </c:if>
                        </td>
                        <td>
                        	<c:if test="${pd.level == '4'}">
                        	     <a style="color: #0C64B5;" class="address" data-id="${var.area_code }" data-level="${var.level}" data-jxxz="5"  href="javascript:void(0);">${var.qyxy_num}</a>
                        	</c:if>
                        	 <c:if test="${pd.level != '4'}">
                                ${var.qyxy_num}
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr class="main_info">
                    <td colspan="100" class="center">没有相关数据</td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>

</div>

<%@ include file="../system/index/foot.jsp" %>
<script type="text/javascript">
    var first = true;
    var form = layui.form;
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        laydate.render({
    		elem: '#startDate' ,
    		done: function(value, date, endDate){
                gsearch()
            }
    	});
    	laydate.render({
    		elem: '#endDate',
    		done: function(value, date, endDate){
                gsearch()
            }
    	});

    });
	
    //导出
    $("#dowExcel").on("click", function () {
        var version = '${version}';
        if (version != null && "" != version) {
            window.location.href = '<%=basePath%>oldSchoolReport/dowExcel.do?version=' + version + '&level=${pd.level}';
        } else {
            layer.tips('没有数据,无法导出!', $("#dowExcel"), {
                tips: [3, '#D16E6C'],
                time: 4000
            });
        }
    });
    
    $("#tbody").on("click", ".address", function () {
        var level = $(this).data("level");
        var szqy_code = $(this).data("id");
        var jxxz=$(this).data("jxxz");
       	var title = $(this).text();
       // parent.addTab(title + " 老年大学统计报表", "oldSchoolReport/list.do?area_code=" + szqy_code + "&area_name=" + title + "&startDate=" + '${pd.startDate}' + "&endDate=" + '${pd.endDate}');
        if(level==4){
       	 parent.layer.load(1);
       	 //检查本区县下是否有数据
       	 $.post("<%=basePath%>oldSchool/checkData", {szqy_code: szqy_code,startDate:'${pd.startDate}',endDate:'${pd.endDate}'}, function (data) {
       		parent.layer.closeAll('loading');
               if(data.result){
            	   var title = $(this).text();
                   parent.addTab(title + "老年大学统计报表", 'oldSchool/goReportViewDetail.do?szqy_code=' + szqy_code + '&startDate=' + '${pd.startDate}' + '&endDate=' + '${pd.endDate}&jxxz='+jxxz);
               }else{
               	   layer.msg("没有数据！",{icon:2});
               }
            })
       }else{
       	 var title = $(this).text();
         parent.addTab(title + "老年大学统计报表", "oldSchoolReport/list.do?area_code=" + szqy_code + "&area_name=&startDate=" + '${pd.startDate}' + "&endDate=" + '${pd.endDate}');
       }
    });

    function gsearch() {
        $("#Form").submit();
    }

    //所在区域
    $.post("<%=basePath%>areaCode/listSubAreaCodeByParentId", {parentId:0}, function (data) {
        var sTree = $.Stree({
            title: "${pd.area_name}",
            el: $("#sTree"),
            isSingle: true,  //单选
            data: data,
            callback: function () {
            	$("#area_name").val($.getString(this.arr, "title")||$("#area_name").val());
                $("#area_code").val($.getString(this.arr, "areaCode")||$("#area_code").val());
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
    function transmit(obj) {
        parent.layer.transmit = obj;
    }
</script>
</body>
</html>