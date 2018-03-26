﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>角色管理</title>
<%@ include file="../index/headcss.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=basePath %>static/source/public/css/list.css"> 
</head>
<body>
	<div class="edit_menu" class="disnone">
		<form action="${MSG}.do" class="layui-form" id="editForm" lay-filter="editForm" method="post">
			<input type="hidden" name="MENU_ID" id="menuId" value="${pd.MENU_ID }" />
			<input type="hidden" name="PARENT_ID" id="PARENT_ID" value="${null == pd.PARENT_ID ? MENU_ID:pd.PARENT_ID}" />
			 <div class="layui-form-item">
			 	 <div class="layui-form-item">
				    <label class="layui-form-label">上级</label>
				    <div class="layui-input-block">
				      <blockquote class="layui-elem-quote" style="padding: 7px;">${null == pds.MENU_NAME ?'(无) 此项为顶级菜单':pds.MENU_NAME}</blockquote>
				    </div>
				  </div>
			    <label class="layui-form-label">名称</label>
			    <div class="layui-input-block">
			      <input type="text" value="${pd.MENU_NAME }" name="MENU_NAME" required  lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
			    </div>
			  </div>
			   <div class="layui-form-item">
			    <label class="layui-form-label">链接</label>
			    <div class="layui-input-block">

					<div class="col-sm-9">
						<c:if test="${null != pds.MENU_NAME}">

							<input type="text" name="MENU_URL" id="menuUrl" value="${pd.MENU_URL }" autocomplete="off" placeholder="这里输入菜单链接"  required  lay-verify="required" class="layui-input" />
						</c:if>
						<c:if test="${null == pds.MENU_NAME}">
							<input type="text" name="MENU_URL" id="menuUrl" value="" readonly="readonly" placeholder="顶级菜单禁止输入"   required  lay-verify="required" class="layui-input"  />
						</c:if>
					</div>

				</div>
			  </div>
				<div class="flayui-form-item">
					<label class="layui-form-label">类型</label>
					<div class="layui-input-block">
							<input value="1" title="系统菜单" name="MENU_TYPE"  type="radio" class="ace" id="form-field-radio1" <c:if test="${pd.MENU_TYPE == '1' }">checked="checked"</c:if> onclick="setType('1','1');" />


							<input  value="2" title="业务菜单" name="MENU_TYPE" type="radio" class="ace" id="form-field-radio2" <c:if test="${pd.MENU_TYPE == '2' }">checked="checked"</c:if> onclick="setType('1','2');" />

					</div>
				</div>

			   <div class="layui-form-item">
			    <label class="layui-form-label">序号</label>
			    <div class="layui-input-block">
			      <input required  lay-verify="required" type="number" name="MENU_ORDER" id="menuOrder" value="${pd.MENU_ORDER}" placeholder="这里输入菜单序号" title="请输入正整数" autocomplete="off" class="layui-input">
			    </div>
			  </div>
			   <div class="layui-form-item">
			    <label class="layui-form-label">状态</label>
			    <div class="layui-input-block">
			    	 <input value="1" type="radio" name="MENU_STATE" <c:if test="${pd.MENU_STATE == 1 }">checked="checked"</c:if> onclick="setType('2',1);" value="显示" title="显示" />
	  					 <input value="0" type="radio" name="MENU_STATE"  <c:if test="${pd.MENU_STATE == 0 }">checked="checked"</c:if> onclick="setType('2',0);" value="隐藏" title="隐藏" />
			    </div>
			  </div>
		</form>
		
		<div class="btnbox" >
			<button id="sure" class="layui-btn layui-btn-primary layui-btn-small">确认</button>
			<button id="cancel" class="layui-btn layui-btn-primary layui-btn-small">取消</button>
		</div>
	</div>
	

	<%@ include file="../index/foot.jsp"%>
	<script>


		$(function(){
            function setType(type, value) {
                if (type == '1') {
                    $("#MENU_TYPE").val(value);
                } else {
                    $("#MENU_STATE").val(value);
                }
            }
			$("#sure").on("click",function(){
                if ($("input[name='MENU_NAME']").val() == "") {
                    layer.tips('菜单名不能为空', $("input[name='MENU_NAME']"), {
                        tips: [4, '#2795cd'],
                        time: 4000
                    });
                    $("#menuName").focus();
                    return false;
                }
                if ($("#menuUrl").val() == "") {
                    $("#menuUrl").val('#');
                }
                //类型为空默认为业务类型
                if ($("#MENU_TYPE").val() == "") {
                    $("#MENU_TYPE").val('1');
                }
                //状态值为空默认为隐藏
                if ($("#MENU_STATE").val() == "") {
                    $("#MENU_STATE").val(0);
                }
                if ($("#menuOrder").val() == "") {
                    layer.tips('请输入菜单序号',  $("#menuOrder"), {
                        tips: [4, '#2795cd'],
                        time: 4000
                    });
                    $("#menuOrder").focus();
                    return false;
                }
                if (isNaN(Number($("#menuOrder").val()))) {
                    layer.tips('请输入菜单序号',  $("#menuOrder"), {
                        tips: [4, '#2795cd'],
                        time: 4000
                    });
                    $("#menuOrder").focus();
                    $("#menuOrder").val(1);
                    return false;
                }


                $.post('<%=basePath%>menu/${MSG}.do', $('#editForm').serialize(), function (data) {
                    parent.layer.closeAll();
                    parent.layer.transmit.location.href = "<%=basePath%>menu.do?MENU_ID="+data.parent_id;
                });


			})
			
			$("#cancel").on("click",function(){
				 parent.layer.closeAll();
			})
		})
		
		
	</script>
</body>
</html>