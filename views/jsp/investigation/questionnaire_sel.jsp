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

	<form action="classify/${msg}.do" class="layui-form"  name="form1" id="form1" >
		<input type="hidden" name="id" id="id" value="${pd.id}" />

		查看

		<div class="layui-form-item">
			<div class="layui-row">

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">创建人：</label>
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
       // var sum ="&selAreaCode=${pd.selAreaCode}&selApplyYear=${pd.selApplyYear}&selAreaName=${pd.selAreaName}&selApplyAnnual=${pd.selApplyAnnual }";

        if("${pd.types}"=="1"){

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
		$("#problem-type dd").on("click",function(){
			var val=$(this).text();
			if(val=="填空"){
			    $(".problem-select").hide();
			    $(".problem-fill-blank").show()
			}else{
                $(".problem-select").show();
                $(".problem-fill-blank").hide()
			}
		})



	   $("#addList").on("click", function () {
		   var num = parseInt($("#sonTable tr:last td:first").text()) + 1;
		   var html = "";
		   html += "<tr><td class='td_center'><input id=" + 'option' + num + " name=" + 'option' + num + " placeholder='请输入内容' style='border: 0px;text-align: center;width: 100%;' maxlength='50' type='text'></td>" +
			   "<td><input id=" + 'leader_name' + num + " name=" + 'leader_name' + num + " placeholder='请输入内容' style='border: 0px;text-align: center;width: 100%;' maxlength='50' type='text'></td>" +

			   "<td><a class='layui-btn layui-btn-danger layui-btn-mini del'>删除</a></td>";
		   $("#sonTable tbody").append(html);
	   })
	   $("#add-blank").on("click", function () {
		   $("#fill-blank").insertContent("_____")
	   })


        $(document).ready(function(){

            $("#sure").on("click",function(){

                parent.layer.closeAll();

               var page ="${pd.currentPage}";

                $("#form1").ajaxSubmit({
                    type: 'post',
                    success: function(data) {
                        if ("success" == data.msg) {
                            parent.layer.transmit.location.href = "<%=basePath%>affairs/list.do?currentPage=" + page;
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

