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

	<form action="health/${msg}.do" class="layui-form"  name="form1" id="form1" >
		<input type="hidden" name="id" id="id" value="${pd.id}" />

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

						<html:select name="applyAnnual" id="applyAnnual" classs="layui-input" style=" lay-filter='applyAnnual'">
							<html:options collection="nd" defaultValue="${pd.applyAnnual}"></html:options>
						</html:select>

					</div>
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-row">

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>健康档案建立总数：</label>
					<div class="layui-input-block">
						<input  name="jkdajlzs" id="jkdajlzs" maxlength="10" value="${pd.jkdajlzs}" type="text"required lay-verify="required"  placeholder="健康档案建立总数" autocomplete="off"
								class="layui-input">
					</div>
				</div>
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>提供免费体检次数：</label>
					<div class="layui-input-block">
						<input name="tgmftjcs" id="tgmftjcs" maxlength="10" placeholder="提供免费体检次数" value="${pd.tgmftjcs}" type="text" placeholder="提供免费体检次数"
							   class="layui-input">
					</div>
				</div>

			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-row">


				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>提供上门医疗次数：</label>
					<div class="layui-input-block">
						<input  name="tgsmylccs" id="tgsmylccs" maxlength="10" value="${pd.tgsmylccs}" type="text"required lay-verify="required"  placeholder="提供上门医疗次数" autocomplete="off"
								class="layui-input">
					</div>
				</div>

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>开设老年病科二级以上医院数量：</label>
					<div class="layui-input-block">
						<input  name="kslnbkejysyysl" id="kslnbkejysyysl"  maxlength="10" value="${pd.kslnbkejysyysl}" type="text"required lay-verify="required"  placeholder="开始老年病科二级以上医院数量" autocomplete="off"
								class="layui-input">
					</div>
				</div>

			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-row">


				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>减免老年人医疗费用总金额：</label>
					<div class="layui-input-block">
						<input  name="jmlnrylfyzje" id="jmlnrylfyzje" maxlength="100" value="${pd.jmlnrylfyzje}" type="text"required lay-verify="required"  placeholder="减免老年人医疗费用总金额" autocomplete="off"
								class="layui-input">
					</div>
				</div>

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>享受医疗费用减免人次：</label>
					<div class="layui-input-block">
						<input  name="xsylfyjmrc" id="xsylfyjmrc" maxlength="10" value="${pd.xsylfyjmrc}" type="text"required lay-verify="required"  placeholder="享受医疗费用减免人次" autocomplete="off"
								class="layui-input">
					</div>
				</div>

			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-row">


				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>建立家庭病床总数：</label>
					<div class="layui-input-block">
						<input  name="jljtbczs" id="jljtbczs" maxlength="100"  value="${pd.jljtbczs}" type="text"required lay-verify="required"  placeholder="建立家庭病床总数" autocomplete="off"
								class="layui-input">
					</div>
				</div>

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>开展巡回与医疗次数：</label>
					<div class="layui-input-block">
						<input  name="kzxhylcs" id="kzxhylcs" maxlength="10"  value="${pd.kzxhylcs}" type="text"required lay-verify="required"  placeholder="开展巡回与医疗次数" autocomplete="off"
								class="layui-input">
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

        var sum ="&selAreaCode=${pd.selAreaCode}&selApplyYear=${pd.selApplyYear}&selAreaName=${pd.selAreaName}&selApplyAnnual=${pd.selApplyAnnual }"

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


                if ($("#applyYear").val() == "") {
                    layer.tips('请检查输入数据',  $("#applyYear"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#applyYear").focus();
                    return false;
                }
                if ($("#tgmftjcs").val() == ""||isNaN($("#tgmftjcs").val())||$("#tgmftjcs").val()<0) {
                    layer.tips('请检查输入数据',  $("#tgmftjcs"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#tgmftjcs").focus();
                    return false;
                }
                if ($("#jkdajlzs").val() == ""||isNaN($("#jkdajlzs").val())||$("#jkdajlzs").val()<0) {
                    layer.tips('请检查输入数据',  $("#jkdajlzs"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#jkdajlzs").focus();
                    return false;
                }
                if ($("#tgsmylccs").val() == ""||isNaN($("#tgsmylccs").val())||$("#tgsmylccs").val()<0) {
                    layer.tips('请检查输入数据',  $("#tgsmylccs"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#tgsmylccs").focus();
                    return false;
                }
                if ($("#kslnbkejysyysl").val() == ""||isNaN($("#kslnbkejysyysl").val())||$("#kslnbkejysyysl").val()<0) {
                    layer.tips('请检查输入数据',  $("#kslnbkejysyysl"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#kslnbkejysyysl").focus();
                    return false;
                }
                if ($("#jmlnrylfyzje").val() == ""||isNaN($("#jmlnrylfyzje").val())||$("#jmlnrylfyzje").val()<0) {
                    layer.tips('请检查输入数据',  $("#jmlnrylfyzje"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#jmlnrylfyzje").focus();
                    return false;
                }

                if ($("#xsylfyjmrc").val() == ""||isNaN($("#xsylfyjmrc").val())||$("#xsylfyjmrc").val()<0) {
                    layer.tips('请检查输入数据',  $("#xsylfyjmrc"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#xsylfyjmrc").focus();
                    return false;
                }
                if ($("#jljtbczs").val() == ""||isNaN($("#jljtbczs").val())||$("#jljtbczs").val()<0) {
                    layer.tips('请检查输入数据',  $("#jljtbczs"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#jljtbczs").focus();
                    return false;
                }
                if ($("#kzxhylcs").val() == ""||isNaN($("#kzxhylcs").val())||$("#kzxhylcs").val()<0) {
                    layer.tips('请检查输入数据',  $("#kzxhylcs"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#kzxhylcs").focus();
                    return false;
                }

               var page ="${pd.currentPage}"

                $("#form1").ajaxSubmit({
                    type: 'post',
                    success: function(data) {
                        if ("success" == data.msg) {
                            parent.layer.transmit.location.href = "<%=basePath%>health/list.do?currentPage=" + page+sum;
                            parent.layer.closeAll();
                        } else if ("error" == data.msg) {
                            layer.msg('系统异常,保存失败!', {icon: 5});
                        } else if("false" == data.msg){
                            layer.msg('相同类型数据已存在!', {icon: 5});
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

