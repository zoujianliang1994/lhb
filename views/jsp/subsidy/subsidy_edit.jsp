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

	<form action="subsidy/${msg}.do" class="layui-form"  name="form1" id="form1" >
		<input type="hidden" name="id" id="id" value="${pd.id}" />

		<input type="hidden" name="type" id="type" value="${pd.type}" />
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
					<label class="layui-form-label">填表单位：</label>
					<div class="layui-input-block">
						<input type="hidden" name="applyUnitId" id="applyUnitId" value="${pd.applyUnitId}" />
						<input readonly="readonly"  name="applyUnitName" id="applyUnitName" placeholder="这里输入名称" value="${pd.applyUnitName}" type="text" placeholder="请输入角色名"
							   class="layui-input">
					</div>
				</div>

			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">填表日期：</label>
					<div class="layui-input-block">
						<input readonly="readonly"  name="applyDate" id="applyDate" placeholder="这里输入名称" value="${pd.applyDate}" type="text" placeholder="请输入角色名"
							   class="layui-input">
					</div>
				</div>

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">所在区域：</label>
					<div class="layui-input-block">

						<input readonly="readonly" type="hidden" name="areaCode" id="areaCode" value="${pd.areaCode}" />
						<input readonly="readonly"  name="areaName" id="areaName" placeholder="这里输入名称" value="${pd.areaName}" type="text" placeholder="请输入角色名"
							   class="layui-input">
					</div>
				</div>

			</div>
		</div>


		<blockquote class="layui-elem-quote">标准信息</blockquote>

		<div class="layui-form-item">
			<div class="layui-row">

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>标准（元/月）：</label>
					<div class="layui-input-block">
						<input  name="subsidyMoney" id="subsidyMoney"  value="${pd.subsidyMoney}" maxlength=10 type="text"required lay-verify="required"  placeholder="标准" autocomplete="off"
								class="layui-input">
					</div>
				</div>
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>标准建立日期：</label>
					<div class="layui-input-block">
						<input readonly="readonly"  name="applyDate1" id="applyDate1" placeholder="标准建立日期" value="${pd.applyDate}" type="text"
							   class="layui-input">
					</div>
				</div>



			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-row">


				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>标准生效日期：</label>
					<div class="layui-input-block">
						<input  name="effectiveDate" id="effectiveDate"  value="${pd.effectiveDate}" type="text"required lay-verify="required"  placeholder="标准生效日期" autocomplete="off"
								class="layui-input">

					</div>

				</div>
			</div>
		</div>


		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
					<label class="layui-form-label">备注：</label>
					<div class="layui-input-block">
						<textarea name="details" id="details" style="height: 200px;width: 850px;">${pd.details}</textarea>
					</div>
				</div>

			</div>
		</div>

	</form>
	<div class="btnbox" >
		<c:if test="${pd.types=='0'}">
			<button id="sure" class="layui-btn layui-btn-primary layui-btn-small">确认</button>
		</c:if>
		<button id="cancel" class="layui-btn layui-btn-primary layui-btn-small">取消</button>
	</div>
</div>


	<!-- 页面底部js¨ -->
	<%@ include file="../system/index/foot.jsp"%>

	<!--提示框-->
	<script type="text/javascript">

        var sum ="&selSubsidyMoney=${pd.selSubsidyMoney}&selAreaCode=${pd.selAreaCode}&selAreaName=${pd.selAreaName}&selStatus=${pd.selStatus }&type=${pd.type}"

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
                elem: '#effectiveDate'
                ,min: 1 //7天前
            })
        });
        $(document).ready(function(){
			var form= layui.form;
            typeControl(${pd.type});

            $("#sure").on("click",function(){

                if ($("#subsidyMoney").val() == ""||isNaN($("#subsidyMoney").val())||$("#subsidyMoney").val()<0) {
                    layer.tips('请检查每月标准',  $("#subsidyMoney"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#subsidyMoney").focus();
                    return false;
                }

                if ($("#effectiveDate").val() == "") {
                    layer.tips('请选择标准生效日期',  $("#effectiveDate"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#effectiveDate").focus();
                    return false;
                }
               var page ="${pd.currentPage}"

                $("#form1").ajaxSubmit({
                    type: 'post',
                    success: function(data) {
                        if ("success" == data.msg) {
                            parent.layer.transmit.location.href = "<%=basePath%>subsidy/list.do?currentPage=" + page+"&type=${pd.type}";
                            parent.layer.closeAll();
                        } else if ("error" == data.msg) {
                            layer.msg('系统异常,保存失败!', {icon: 5});
                        } else if("false" == data.msg){
                            layer.msg('见习数据已存在!', {icon: 5});
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

