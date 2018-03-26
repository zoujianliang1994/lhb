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

	<form action="rights/${msg}.do" class="layui-form"  name="form1" id="form1" >
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

						<html:select name="applyAnnual" id="applyAnnual" classs="layui-input" style=" lay-filter='rightsType'">
							<html:options collection="nd" defaultValue="${pd.applyAnnual}"></html:options>
						</html:select>

					</div>
				</div>
			</div>
		</div>

		<blockquote class="layui-elem-quote">法律事务相关</blockquote>

		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>法律援助案件：</label>
					<div class="layui-input-block">
						<input  name="flyzaj" id="flyzaj" placeholder="法律援助案件（件）" value="${pd.flyzaj}" type="text"
								class="layui-input">
					</div>
				</div>


				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label" ><i class="require">*</i>人民法院受理侵犯老年人合法权利案件：</label>
					<div class="layui-input-block">
						<input  name="sfaj" id="sfaj" placeholder="司法案件（件）" value="${pd.sfaj}" type="text"
								class="layui-input">
					</div>
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>司法救助数量：</label>
					<div class="layui-input-block">
						<input  name="sfjzsl" id="sfjzsl" placeholder="法律援助案件（件）" value="${pd.sfjzsl}" type="text"
								class="layui-input">
					</div>
				</div>


				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label" ><i class="require">*</i>司法救助金额：</label>
					<div class="layui-input-block">
						<input  name="sfjzje" id="sfjzje" placeholder="司法救助金额（元）" value="${pd.sfjzje}" type="text"
								class="layui-input">
					</div>
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>其它法律事务相关：</label>
					<div class="layui-input-block">
						<input  name="qt" id="qt" placeholder="其它法律事务相关（件）" value="${pd.qt}" type="text"
								class="layui-input">
					</div>
				</div>
			</div>
		</div>


		<blockquote class="layui-elem-quote">维权宣传</blockquote>

		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>防电信诈骗次数：</label>
					<div class="layui-input-block">
						<input  name="fdxzpcs" id="fdxzpcs" placeholder="防电信诈骗次数（次）" value="${pd.fdxzpcs}" type="text"
								class="layui-input">
					</div>
				</div>


				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label" ><i class="require">*</i>防电信诈骗参与人数：</label>
					<div class="layui-input-block">
						<input  name="fdxzpcyrs" id="fdxzpcyrs" placeholder="防电信诈骗参与人数" value="${pd.fdxzpcyrs}" type="text"
								class="layui-input">
					</div>
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>防非法集资次数：</label>
					<div class="layui-input-block">
						<input  name="fffjzcs" id="fffjzcs" placeholder="防非法集资次数（次）" value="${pd.fffjzcs}" type="text"
								class="layui-input">
					</div>
				</div>


				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label" ><i class="require">*</i>防非法集资参与人数：</label>
					<div class="layui-input-block">
						<input  name="fffjzcyrs" id="fffjzcyrs" placeholder="防非法集资参与人数" value="${pd.fffjzcyrs}" type="text"
								class="layui-input">
					</div>
				</div>
			</div>
		</div>


		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>普法文艺宣传次数：</label>
					<div class="layui-input-block">
						<input  name="pfwyxccs" id="pfwyxccs" placeholder="普法文艺宣传次数（次）" value="${pd.pfwyxccs}" type="text"
								class="layui-input">
					</div>
				</div>


				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label" ><i class="require">*</i>普法文艺宣传参与人数：</label>
					<div class="layui-input-block">
						<input  name="pfwyxccyrs" id="pfwyxccyrs" placeholder="普法文艺宣传参与人数" value="${pd.pfwyxccyrs}" type="text"
								class="layui-input">
					</div>
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>普法讲座次数：</label>
					<div class="layui-input-block">
						<input  name="pfjzcs" id="pfjzcs" placeholder="普法讲座次数（次）" value="${pd.pfjzcs}" type="text"
								class="layui-input">
					</div>
				</div>


				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label" ><i class="require">*</i>普法讲座参与人数：</label>
					<div class="layui-input-block">
						<input  name="pfjzcyrs" id="pfjzcyrs" placeholder="普法讲座参与人数" value="${pd.pfjzcyrs}" type="text"
								class="layui-input">
					</div>
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>印制宣传册数量：</label>
					<div class="layui-input-block">
						<input  name="yzxccsl" id="yzxccsl" placeholder="印制宣传册数量（册）" value="${pd.yzxccsl}" type="text"
								class="layui-input">
					</div>
				</div>


				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label" ><i class="require">*</i>印制宣传册参与人数：</label>
					<div class="layui-input-block">
						<input  name="yzxcccyrs" id="yzxcccyrs" placeholder="印制宣传册参与人数" value="${pd.yzxcccyrs}" type="text"
								class="layui-input">
					</div>
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>编排普法节目数量：</label>
					<div class="layui-input-block">
						<input  name="bppfjmsl" id="bppfjmsl" placeholder="编排普法节目数量" value="${pd.bppfjmsl}" type="text"
								class="layui-input">
					</div>
				</div>
			</div>
		</div>

	</form>
	<div class="btnbox" >
		<c:if test="${pd.type=='0'}">
			<button id="sure" class="layui-btn layui-btn-primary layui-btn-small">保存</button>
		</c:if>
		<button id="cancel" class="layui-btn layui-btn-primary layui-btn-small">取消</button>
	</div>
</div>


	<!-- 页面底部js¨ -->
	<%@ include file="../system/index/foot.jsp"%>

	<!--提示框-->
	<script type="text/javascript">


		if("${pd.type}"=="1"){
            $.formToDiv(true);
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


            $("#sure").on("click",function(){
                if ($("#applyYear").val() == "") {
                    layer.tips('请选择年份',  $("#applyYear"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#applyYear").focus();
                    return false;
                }
                if ($("#flyzaj").val() == ""||isNaN($("#flyzaj").val())||$("#flyzaj").val()<0) {
                    layer.tips('请检查输入数据',  $("#flyzaj"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#flyzaj").focus();
                    return false;
                }
                if ($("#sfaj").val() == ""||isNaN($("#sfaj").val())||$("#sfaj").val()<0) {
                    layer.tips('请检查输入数据',  $("#sfaj"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#sfaj").focus();
                    return false;
                }
                if ($("#sfjzsl").val() == ""||isNaN($("#sfjzsl").val())||$("#sfjzsl").val()<0) {
                    layer.tips('请检查输入数据',  $("#sfjzsl"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#sfjzsl").focus();
                    return false;
                }
                if ($("#sfjzje").val() == ""||isNaN($("#sfjzje").val())||$("#sfjzje").val()<0) {
                    layer.tips('请检查输入数据',  $("#sfjzje"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#sfjzje").focus();
                    return false;
                }

                if ($("#qt").val() == ""||isNaN($("#qt").val())||$("#qt").val()<0) {
                    layer.tips('请检查输入数据',  $("#qt"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#qt").focus();
                    return false;
                }if ($("#fdxzpcs").val() == ""||isNaN($("#fdxzpcs").val())||$("#fdxzpcs").val()<0) {
                    layer.tips('请检查输入数据',  $("#fdxzpcs"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#fdxzpcs").focus();
                    return false;
                }
                if ($("#fdxzpcyrs").val() == ""||isNaN($("#fdxzpcyrs").val())||$("#fdxzpcyrs").val()<0) {
                    layer.tips('请检查输入数据',  $("#fdxzpcyrs"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#fdxzpcyrs").focus();
                    return false;
                }
                if ($("#fffjzcs").val() == ""||isNaN($("#fffjzcs").val())||$("#fffjzcs").val()<0) {
                    layer.tips('请检查输入数据',  $("#fffjzcs"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#fffjzcs").focus();
                    return false;
                }
                if ($("#fffjzcyrs").val() == ""||isNaN($("#fffjzcyrs").val())||$("#fffjzcyrs").val()<0) {
                    layer.tips('请检查输入数据',  $("#fffjzcyrs"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#fffjzcyrs").focus();
                    return false;
                }
                if ($("#pfwyxccs").val() == ""||isNaN($("#pfwyxccs").val())||$("#pfwyxccs").val()<0) {
                    layer.tips('请检查输入数据',  $("#pfwyxccs"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#pfwyxccs").focus();
                    return false;
                }
                if ($("#pfwyxccyrs").val() == ""||isNaN($("#pfwyxccyrs").val())||$("#pfwyxccyrs").val()<0) {
                    layer.tips('请检查输入数据',  $("#pfwyxccyrs"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#pfwyxccyrs").focus();
                    return false;
                }
                if ($("#pfjzcs").val() == ""||isNaN($("#pfjzcs").val())||$("#pfjzcs").val()<0) {
                    layer.tips('请检查输入数据',  $("#pfjzcs"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#pfjzcs").focus();
                    return false;
                }if ($("#pfjzcyrs").val() == ""||isNaN($("#pfjzcyrs").val())||$("#pfjzcyrs").val()<0) {
                    layer.tips('请检查输入数据',  $("#pfjzcyrs"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#pfjzcyrs").focus();
                    return false;
                }if ($("#yzxccsl").val() == ""||isNaN($("#yzxccsl").val())||$("#yzxccsl").val()<0) {
                    layer.tips('请检查输入数据',  $("#yzxccsl"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#yzxccsl").focus();
                    return false;
                }if ($("#yzxcccyrs").val() == ""||isNaN($("#yzxcccyrs").val())||$("#yzxcccyrs").val()<0) {
                    layer.tips('请检查输入数据',  $("#yzxcccyrs"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#yzxcccyrs").focus();
                    return false;
                }if ($("#bppfjmsl").val() == ""||isNaN($("#bppfjmsl").val())||$("#bppfjmsl").val()<0) {
                    layer.tips('请检查输入数据',  $("#bppfjmsl"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#bppfjmsl").focus();
                    return false;
                }
               var page ="${pd.currentPage}"

                $("#form1").ajaxSubmit({
                    type: 'post',
                    success: function(data) {
                        if ("success" == data.msg) {
                            parent.layer.transmit.location.href = "<%=basePath%>rights/list.do?currentPage=" + page+"&rightsType=${pd.rightsType}&selAreaCode=${pd.selAreaCode}&selAreaName=${pd.selAreaName}";
                            parent.layer.closeAll();
                        } else if ("error" == data.msg) {
                            layer.msg('系统异常,保存失败!', {icon: 5});
                        } else if("false" == data.msg){
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

