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
		<input  type="hidden" name="areaCode" id="areaCode" value="${pd.areaCode}" />
		<input  name="areaName" id="areaName"  value="${pd.areaName}" type="hidden" >
		<input  name="applyName" id="applyName" value="${pd.applyName}" type="hidden" >
		<input type="hidden" name="applyUnitId" id="applyUnitId" value="${pd.applyUnitId}" />
		<input name="applyUnitName" id="applyUnitName" value="${pd.applyUnitName}" type="hidden">

		<div class="layui-form-item">
			<div class="layui-row">

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>活动总次数：</label>
					<div class="layui-input-block">
						<input  name="activityTimes" id="activityTimes" placeholder="活动次数" value="${pd.activityTimes}" type="text"  class="layui-input">
					</div>
				</div>

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>志愿者参与总数：</label>
					<div class="layui-input-block">
						<input name="volunteerCount" id="volunteerCount" placeholder="志愿者参与总数" value="${pd.volunteerCount}"  type="text"  class="layui-input">
					</div>
				</div>


			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>享受服务人数：</label>
					<div class="layui-input-block">
						<input name="servesCount" id="servesCount" placeholder="享受服务人数" value="${pd.servesCount}"  type="text"  class="layui-input">

					</div>
				</div>




				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">上报时间：</label>
					<div class="layui-input-block">
						<input readonly="readonly"  name="applyDate" id="applyDate" placeholder="这里输入名称" value="${pd.applyDate}" type="text" placeholder="请输入角色名"
							   class="layui-input">
					</div>
				</div>

			</div>
		</div>


		<div class="layui-form-item">
			<div class="layui-row">

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>年份：</label>
					<div class="layui-input-block">
						<input  name="applyYear" id="applyYear"  value="${pd.applyYear}" type="text"required lay-verify="required"  placeholder="年份" autocomplete="off"
								class="layui-input">
					</div>
				</div>
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>年度：</label>
					<div class="layui-input-block">

						<html:select name="applyAnnual" id="applyAnnual" classs="layui-input" style=" lay-filter='rightsType'">
							<html:options collection="nd" defaultValue="${pd.applyAnnual}"></html:options>
						</html:select>


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
                elem: '#applyYear'
                ,type: 'year'
            })
        });
        $(document).ready(function(){
			var form= layui.form;
            typeControl(${pd.type});

            $("#sure").on("click",function(){
                if ($("#activityTimes").val() == ""||isNaN($("#activityTimes").val())) {
                    layer.tips('请检查活动次数',  $("#activityTimes"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#activityTimes").focus();
                    return false;
                }
                if ($("#volunteerCount").val() == ""||isNaN($("#volunteerCount").val())) {
                    layer.tips('请检查志愿者参与总数',  $("#volunteerCount"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#volunteerCount").focus();
                    return false;
                }
                if ($("#servesCount").val() == ""||isNaN($("#servesCount").val())) {
                    layer.tips('请检查享受服务人数',  $("#servesCount"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#servesCount").focus();
                    return false;
                }
                if ($("#applyYear").val() == "") {
                    layer.tips('请检查输入数据',  $("#applyYear"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#applyYear").focus();
                    return false;
                }

               var page ="${pd.currentPage}"

                $("#form1").ajaxSubmit({
                    type: 'post',
                    success: function(data) {
                        if ("success" == data.msg) {
                            parent.layer.transmit.location.href = "<%=basePath%>volunteer/info.do?currentPage=" + page+"&type=${pd.type}&selAreaCode=${pd.selAreaCode}&selAreaName=${pd.selAreaName}";
                            parent.layer.closeAll();
                        } else if ("error" == data.msg) {
                            layer.msg('系统异常,保存失败!', {icon: 5});
                        }else if("falses" == data.msg){
                            layer.msg('保存失败，同类型数据已存在!', {icon: 5});
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

