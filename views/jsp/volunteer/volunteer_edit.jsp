<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- jsp文件头和头部 -->
	<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
	<%@ include file="../system/index/headcss.jsp"%>
	<style>

	</style>
</head>
<body >
<div class="edit_menu" class="disnone">

	<form action="volunteer/${msg}.do" class="layui-form"  name="form1" id="form1" >
		<input type="hidden" name="id" id="id" value="${pd.id}" />

		<input type="hidden" name="type" id="type" value="${pd.type}" />
		<input readonly="readonly" type="hidden" name="areaCode" id="areaCode" value="${pd.areaCode}" />
		<input readonly="readonly"  name="areaName" id="areaName" value="${pd.areaName}" type="hidden" placeholder="请输入角色名" class="layui-input">

		<div class="layui-form-item">
			<div class="layui-row">

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">填表人名称：</label>
					<div class="layui-input-block">
						<input readonly="readonly"  name="applyName" id="applyName" placeholder="这里输入名称" value="${pd.applyName}" type="text" placeholder="请输入角色名"
								class="layui-input">
					</div>
				</div>

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">填表日期：</label>
					<div class="layui-input-block">
						<input readonly="readonly"  name="applyDate" id="applyDate" placeholder="这里输入名称" value="${pd.applyDate}" type="text" placeholder="请输入角色名"
							   class="layui-input">
					</div>
				</div>


			</div>
		</div>

		<div class="layui-form-item" id="law_type_block" >
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">填表单位：</label>
					<div class="layui-input-block">
						<input type="hidden" name="applyUnitId" id="applyUnitId" value="${pd.applyUnitId}" />
						<input readonly="readonly"  name="applyUnitName" id="applyUnitName" placeholder="这里输入名称" value="${pd.applyUnitName}" type="text" placeholder="请输入角色名"
							   class="layui-input">
					</div>
				</div>

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">是否注册：</label>
					<div class="layui-input-block">
						<html:select name="isRegister" id="isRegister" classs="layui-input" style=" lay-filter='rightsType'">
							<html:options collection="sf" defaultValue="${pd.isRegister}"></html:options>
						</html:select>
					</div>
				</div>

			</div>
		</div>


		<div class="layui-form-item">
			<div class="layui-row">

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>组织名称：</label>
					<div class="layui-input-block">
						<input  name="organizationName" id="organizationName"  value="${pd.organizationName}" type="text"required lay-verify="required"  placeholder="组织名称" autocomplete="off"
								class="layui-input">
					</div>
				</div>
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>组织负责人：</label>
					<div class="layui-input-block">
						<input  name="organizationLeader" id="organizationLeader"  value="${pd.organizationLeader}" type="text"required lay-verify="required"  placeholder="组织负责人" autocomplete="off"
								class="layui-input">
					</div>
				</div>



			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-row">

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>联系方式：</label>
					<div class="layui-input-block">
						<input  name="organizationPhone" id="organizationPhone"  value="${pd.organizationPhone}" type="text"required lay-verify="required"  placeholder="联系方式" autocomplete="off"
								class="layui-input">
					</div>
				</div>

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>志愿者总数：</label>
					<div class="layui-input-block">
						<input  name="volunteerCount" id="volunteerCount"  value="${pd.volunteerCount}" type="text"required lay-verify="required"  placeholder="志愿者总数" autocomplete="off"
								class="layui-input">

					</div>

				</div>
			</div>
		</div>


		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
					<label class="layui-form-label">志愿者组织描述：</label>
					<div class="layui-input-block">
						<textarea name="volunteerDetails" id="volunteerDetails" style="height: 200px;width: 850px;">${pd.volunteerDetails}</textarea>
					</div>
				</div>

			</div>
		</div>

	</form>
	<div class="btnbox" >
		<c:if test="${pd.types=='0'}">
			<button id="sure" class="layui-btn layui-btn-primary layui-btn-small">保存</button>
		</c:if>
		<button id="cancel" class="layui-btn layui-btn-primary layui-btn-small">取消</button>
	</div>
</div>


	<!-- 页面底部js¨ -->
	<%@ include file="../system/index/foot.jsp"%>

	<!--提示框-->
	<script type="text/javascript">


		if("${pd.types}"=="1"){

            $.formToDiv(true);
		}
		function typeControl(control) {
			if(control == "1"){
                $("#law_type_block").hide();

			}else{
                $("#law_type_block").show()
			}

        }
        layui.use('laydate', function () {
            var laydate = layui.laydate;

            //执行一个laydate实例
            laydate.render({
                elem: '#rightsYear'
                ,type: 'year'
            })
        });
        $(document).ready(function(){
			var form= layui.form;
            typeControl(${pd.type});

            $("#sure").on("click",function(){
                if ($("#organizationName").val() == "") {
                    layer.tips('请输入组织名称',  $("#organizationName"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#organizationName").focus();
                    return false;
                }
                if ($("#organizationLeader").val() == "") {
                    layer.tips('请输入组织负责人',  $("#organizationLeader"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#organizationLeader").focus();
                    return false;
                }
                if ($("#organizationPhone").val() == "") {
                    layer.tips('请检查联系方式',  $("#organizationPhone"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#organizationPhone").focus();
                    return false;
                }
                if ($("#volunteerCount").val() == ""||isNaN($("#volunteerCount").val())) {
                    layer.tips('请检查志愿者总数',  $("#volunteerCount"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#volunteerCount").focus();
                    return false;
                }

               var page ="${pd.currentPage}"

                $("#form1").ajaxSubmit({
                    type: 'post',
                    success: function(data) {
                        if ("success" == data.msg) {
                            parent.layer.transmit.location.href = "<%=basePath%>volunteer/list.do?currentPage=" + page+"&type=${pd.type}&selAreaCode=${pd.selAreaCode}&selAreaName=${pd.selAreaName}";
                            parent.layer.closeAll();
                        } else if ("error" == data.msg) {
                            layer.msg('系统异常,保存失败!', {icon: 5});
                        }
                    }
				});

            });

            $("#cancel").on("click",function(){
                parent.layer.closeAll();
            })
        });


	</script>
</body>
</html>

