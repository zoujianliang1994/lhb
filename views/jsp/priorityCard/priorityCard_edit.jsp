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
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/source/public/plugin/css/viewer.min.css">

    <style>
		.imgBox{
			position:relative;
		}
		#imgfile{
			position:absolute;
			z-index: -1;
			top: 0px;
			left:0
		}
		.layui-upload-drag{
			background-size:cover;
		}

	</style>
</head>
<body >
<div class="edit_menu" class="disnone">

	<form action="priorityCard/${msg}.do" class="layui-form"  enctype="multipart/form-data" name="form1" id="form1" >
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


		<blockquote class="layui-elem-quote">当事人信息</blockquote>

		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>姓名：</label>
					<div class="layui-input-block">
						<input  name="partyName" maxlength="10" id="partyName" placeholder="这里输入姓名" value="${pd.partyName}" type="text" placeholder="请输入角姓名"
								class="layui-input">
					</div>
				</div>


				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>身份证号：</label>
					<div class="layui-input-block">
						<input  name="partyIdCard" maxlength="18" id="partyIdCard" placeholder="这里输入身份证号" value="${pd.partyIdCard}" type="text" placeholder="这里输入身份证号"
								class="layui-input">
					</div>
				</div>
			</div>
		</div>

		<input hidden  type="file" name="imgfile" id="imgfile">


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
    <script src="<%=basePath%>static/source/public/plugin/js/treeView.js"></script>
	<!--提示框-->
	<script type="text/javascript">


		if("${pd.type}"=="1"){
            $.formToDiv(true);
		}


        $(document).ready(function(){
            var name="";
            $("#test10").click(function () {
               $("#imgfile").click()
            });

            $("#test10").dblclick(function(){
                console.log(1)
            })

            $("#imgfile").change(function (e) {
                var $target= $(e.target);
                var $imgbox= $target.prev();
                var $icon= $imgbox.find(".layui-icon")
                name= test(this.value,".")
                $("#name").text(test(this.value,"\\"));
                if(name == 'jpg' || name == 'png' || name == "jpeg"){
                    if(e.target.files){
                        $icon.css("opacity",0);
                        var file = e.target.files[0];
                        if(window.FileReader) {
                            var fr = new FileReader();
                            fr.onloadend = function(data) {
                                $imgbox.css({"background":"url("+data.target.result+")","background-size":"250px 150px" });
                            };
                            fr.readAsDataURL(file);
                        }
                    }else{
                        layer.msg("ie10以下无法支持预览功能，请升级浏览器",{shift: 6,icon:2})
                    }
                }else{
                    layer.msg("请上传正确的图片文件",{shift: 6,icon:2})
                    $imgbox.css({"background":"#fff",});
                    $icon.css("opacity",1);
                }
            });



            $("#sure").on("click",function(){
                if ($("#partyName").val() == "") {
                    layer.tips('请输入姓名',  $("#partyName"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#partyName").focus();
                    return false;
                }
                if ($("#partyIdCard").val() == "") {
                    layer.tips('请输入身份证',  $("#partyIdCard"), {
                        tips: [4, '#D16E6C'],
                        time: 4000
                    });
                    $("#partyIdCard").focus();
                    return false;
                }
               var page ="${pd.currentPage}"
               var sum ="&keywords=${pd.keywords}&selAreaCode=${pd.selAreaCode}&selAreaName=${pd.selAreaName}&selIdcade=${pd.selIdcade }&selDate=${pd.selDate}"


                $("#form1").ajaxSubmit({
                    type: 'post',
                    dataType:"html",
                    success: function(data) {
                        var jso = JSON.parse(data)
                        if ("success" == jso.msg) {
                            parent.layer.transmit.location.href = "<%=basePath%>priorityCard/list.do?currentPage=" + page + sum;
                            parent.layer.closeAll();
                        } else if ("error" == jso.msg) {
                            layer.msg('系统异常,保存失败!', {icon: 5});
                        } else if("false" == jso.msg){
                            layer.msg('该人员没有个人档案！', {icon: 5});
						}
                    }
				});

            });

            $("#cancel").on("click",function(){
                parent.layer.closeAll();
            })
        });

        function test(file_name,symbol){
            var result = file_name.split(symbol);
            return result[result.length-1];
        }
	</script>
</body>
</html>

