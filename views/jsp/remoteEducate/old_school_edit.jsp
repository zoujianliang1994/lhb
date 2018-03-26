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
		.imgBox{
			position:relative;
		}
		.imgfile{
			position:absolute;
			z-index: -1;
			top: 0px;
			left:0
		}
	</style>
</head>
<body >
<div class="edit_menu" class="disnone">
	<form action="oldSchool/${msg}.do" class="layui-form" name="form1" enctype="multipart/form-data" id="form1" method="post" >
		<input type="hidden" name="id" id="id" value="${pd.id}" />
		<input type="hidden" name="dwxz" value="${pd.dwxz}" >
		<input type="hidden" name="szqy_code" id="szqy_code" value="${null == pd.szqy_code ? user.areaCode:pd.szqy_code}" />

		<div class="layui-form-item">
			<div class="layui-row">

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">填表人：</label>
					<div class="layui-input-block">
						<input  name="tbr" id="tbr"  value="${null == pd.tbr ? user.NAME:pd.tbr}" type="text" 
								class="layui-input" readonly style="background-color: #f2f2f2">
					</div>
				</div>

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">填表单位：</label>
					<div class="layui-input-block">
						<input  name="tbdw" id="tbdw" value="${null == pd.tbdw ? user.SECTION_NAME:pd.tbdw}" type="text" 
								class="layui-input" readonly style="background-color: #f2f2f2">
					</div>
				</div>

			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">填表日期：</label>
					<div class="layui-input-block">
						<input  name="tbrq" id="tbrq"  value="${null == pd.tbrq ? date:pd.tbrq}" type="text" 
								class="layui-input" readonly style="background-color: #f2f2f2">
					</div>
				</div>

				  <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                      <label class="layui-form-label"><i class="require">*</i>所在区域：</label>
                      <input type="hidden" name="szqy_code" id="szqy_code" value="${pd.szqy_code}"/>
                      <input type="hidden" value="${pd.szqy_xm }" name="szqy_xm" id="szqy_xm"/>
                      <div class="layui-input-block sTree" id="sTree"> </div>
                  </div>
			</div>
		</div>
        <blockquote class="layui-elem-quote">基础信息</blockquote>

		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>老年大学（学校）名称：</label>
					<div class="layui-input-block">
						<input  name="name" id="name" placeholder="这里输入老年大学（学校）名称" value="${pd.name}" type="text"  maxlength=30 
								class="layui-input">
					</div>
				</div>


				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">主管部门：</label>
					<div class="layui-input-block">
						<input  name="zgbm" id="zgbm" placeholder="这里输入主管部门" value="${pd.zgbm}" type="text"  maxlength=30 
								class="layui-input">
					</div>
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>机构性质：</label>
					<div class="layui-input-block">
                         <input type="radio" name="jxxz" value="1" title="行政单位" lay-filter="yes"   <c:if test="${pd.jxxz == '1'}">checked</c:if>>
					     <input type="radio" name="jxxz" value="2" title="事业单位" lay-filter="no"   <c:if test="${pd.jxxz == '2'}">checked</c:if>>
					     <input type="radio" name="jxxz" value="3" title="社会团体" lay-filter="yes2" <c:if test="${pd.id == ''}">checked</c:if> <c:if test="${pd.jxxz == '3'}">checked</c:if>>
					     <input type="radio" name="jxxz" value="4" title="民办非企业单位" lay-filter="no2"  <c:if test="${pd.jxxz == '4'}">checked</c:if>>
					     <input type="radio" name="jxxz" value="5" title="企业" lay-filter="yes3" <c:if test="${pd.jxxz == '5'}">checked</c:if>>
					</div>
				</div>

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">占地面积：</label>
					<div class="layui-input-block">
						<input  name="zdmj" id="zdmj" placeholder="这里输入占地面积" value="${pd.zdmj}" min="1" type="number"  maxlength=8  oninput="if(value.length>8)value=value.slice(0,8)" onpropertychange="if(value.length>8)value=value.slice(0,8)"
								class="layui-input">
					</div>
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">教职员工数量：</label>
					<div class="layui-input-block">
						<input  name="jzygsl" id="jzygsl" placeholder="这里输入教职员工数量" value="${pd.jzygsl}" min="1" type="number" maxlength=8 oninput="if(value.length>8)value=value.slice(0,8)" onpropertychange="if(value.length>8)value=value.slice(0,8)"
								class="layui-input">
					</div>
				</div>


				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">建校日期：</label>
					<div class="layui-input-block">
                                    <input type="text" value="${pd.jxrq}" name="jxrq" id="jxrq" required lay-verify="required"
                                           placeholder="请输入建校日期"
                                           autocomplete="off"
                                           class="layui-input">
                                </div>
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">负责人姓名：</label>
					<div class="layui-input-block">
						<input  name="fzrxm" id="fzrxm" placeholder="这里输入负责人姓名" value="${pd.fzrxm}" type="text" maxlength=20 
								class="layui-input">
					</div>
				</div>


				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">负责人联系电话：</label>
					<div class="layui-input-block">
						<input  name="fzrlxdh" id="fzrlxdh" placeholder="这里输入负责人联系电话" value="${pd.fzrlxdh}" type="text"  maxlength=20 
								class="layui-input">
					</div>
				</div>
			</div>
		</div>
		
		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">详细地址：</label>
					<div class="layui-input-block">
						<input  name="xxdz" id="xxdz" placeholder="这里输入详细地址" value="${pd.xxdz}" type="text" maxlength=100 
								class="layui-input">
					</div>
				</div>
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">课程设置：</label>
					<div class="layui-input-block">
						<input  name="kcsz" id="kcsz" placeholder="这里输入课程设置" value="${pd.kcsz}" type="text" maxlength=30 
								class="layui-input">
					</div>
				</div>

				
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">教学点个数：</label>
					<div class="layui-input-block">
						<input  name="jxdgs" id="jxdgs" placeholder="这里输入教学点个数" value="${pd.jxdgs}" min="1" type="number" maxlength=8 oninput="if(value.length>8)value=value.slice(0,8)" onpropertychange="if(value.length>8)value=value.slice(0,8)"
								class="layui-input">
					</div>
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-row">
				<c:if test="${pd.type=='0'}">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">上传学校各项管理制度：</label>
					<div class="layui-input-block imgBox">
						<!-- 查看下载附件 -->
						<c:if test="${pd.TYPE=='1'&&pd.gzzdfj != null && pd.gzzdfj != ''}">
							<a href="<%=basePath %>uploadFiles/file/${pd.gzzdfj_rel}">
								<div class="layui-upload-drag test" style="width:100%">
									<i class="layui-icon">&#xe60a;</i>
									<p  class="name">${pd.gzzdfj_original}</p>
									<input readonly="readonly" type="hidden" name="gzzdfj" id="gzzdfj" value="${pd.gzzdfj}" />
								</div>
							</a>
						</c:if>
						<!-- 修改 -->
						<c:if test="${pd.TYPE=='2'||pd.TYPE=='' ||pd.TYPE==null}">
							<div class="layui-upload-drag test" style="width:100%">
								<c:if test="${pd.gzzdfj == null || pd.gzzdfj == ''}">
									<i class="layui-icon"></i>
									<p  class="name">点击上传</p>
								</c:if>
								<c:if test="${pd.gzzdfj != null && pd.gzzdfj != ''}">
									<i class="layui-icon">&#xe60a;</i>
									<p  class="name">${pd.gzzdfj_original}</p>
									<input readonly="readonly" type="hidden" name="gzzdfj_rd" id="gzzdfj" value="${pd.gzzdfj}" />
								</c:if>
							</div>
							<input  type="file" name="gzzdfj" id="imgfile1" class="imgfile">
						</c:if>
					</div>
				</div>
				</c:if>
				<c:if test="${pd.type=='0'}">
					<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
						<label class="layui-form-label">其他附件：</label>
						<div class="layui-input-block imgBox">
							<!-- 查看下载附件 -->
							<c:if test="${pd.TYPE=='1'&&pd.qtfj != null && pd.qtfj != ''}">
								<a href="<%=basePath %>uploadFiles/file/${pd.qtfj_rel}">
									<div class="layui-upload-drag test" style="width:100%">
										<i class="layui-icon">&#xe60a;</i>
										<p  class="name">${pd.qtfj_original}</p>
										<input readonly="readonly" type="hidden" name="qtfj" id="qtfj" value="${pd.qtfj}" />
									</div>
								</a>
							</c:if>
							<!-- 修改 -->
							<c:if test="${pd.TYPE=='2'||pd.TYPE=='' ||pd.TYPE==null}">
								<div class="layui-upload-drag test" style="width:100%">
									<c:if test="${pd.qtfj == null || pd.qtfj == ''}">
										<i class="layui-icon"></i>
										<p  class="name">点击上传</p>
									</c:if>
									<c:if test="${pd.qtfj != null && pd.qtfj != ''}">
										<i class="layui-icon">&#xe60a;</i>
										<p  class="name">${pd.qtfj_original}</p>
										<input readonly="readonly" type="hidden" name="qtfj_rd" id="qtfj" value="${pd.qtfj}" />
									</c:if>
								</div>
								<input  type="file" name="qtfj" id="imgfile1" class="imgfile">
							</c:if>
						</div>
					</div>
				</c:if>
			</div>
		</div>
		<div id="xzsydwxx" style="<c:if test="${pd.jxxz == '3'||pd.jxxz == '4'||pd.jxxz == '5'||pd.jxxz == ''||pd.jxxz==null}">display:none;</c:if>">
		 <blockquote class="layui-elem-quote" id="title_name">
		 	<c:if test="${pd.jxxz == 1||pd.jxxz ==''||pd.jxxz ==null}">行政单位</c:if>
		 	<c:if test="${pd.jxxz == 2}">事业单位</c:if>
		 </blockquote>
		 <div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">邮政编码：</label>
					<div class="layui-input-block">
									<input  name="bwpf" id="bwpf" placeholder="这里输入邮政编码" value="${pd.bwpf}" type="text"  maxlength=8 oninput="if(value.length>8)value=value.slice(0,8)" onpropertychange="if(value.length>8)value=value.slice(0,8)"
								class="layui-input">
					</div>
				</div>
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">人员编制总数：</label>
					<div class="layui-input-block">
						<input  name="rybzzs" id="rybzzs" placeholder="这里输入人员编制总数" value="${pd.rybzzs}" min="1" type="number"  maxlength=8 oninput="if(value.length>8)value=value.slice(0,8)" onpropertychange="if(value.length>8)value=value.slice(0,8)"
								class="layui-input">
					</div>
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">编制领导职数：</label>
					<div class="layui-input-block">
						<input  name="bzldzs" id="bzldzs" placeholder="这里输入编制领导职数" value="${pd.bzldzs}" min="1" type="number" maxlength=8  oninput="if(value.length>8)value=value.slice(0,8)" onpropertychange="if(value.length>8)value=value.slice(0,8)"
								class="layui-input">
					</div>
				</div>
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">聘用人员总数：</label>
					<div class="layui-input-block">
						<input  name="pyryzs" id="pyryzs" placeholder="这里输入聘用人员总数" value="${pd.pyryzs}" min="1" type="number" maxlength=8 oninput="if(value.length>8)value=value.slice(0,8)" onpropertychange="if(value.length>8)value=value.slice(0,8)"
								class="layui-input">
					</div>
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">教学人员总数：</label>
					<div class="layui-input-block">
						<input  name="jxryzs" id="jxryzs" placeholder="这里输入教学人员总数" value="${pd.jxryzs}" min="1" type="number" maxlength=8  oninput="if(value.length>8)value=value.slice(0,8)" onpropertychange="if(value.length>8)value=value.slice(0,8)"
								class="layui-input">
					</div>
				</div>
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">管理人员总数：</label>
					<div class="layui-input-block">
						<input  name="glryzs" id="glryzs" placeholder="这里输入管理人员总数" value="${pd.glryzs}" min="1" type="number" maxlength=8 oninput="if(value.length>8)value=value.slice(0,8)" onpropertychange="if(value.length>8)value=value.slice(0,8)"
								class="layui-input">
					</div>
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">机构级别：</label>
					<div class="layui-input-block">
								 <html:select name="jgjb" classs="layui-input-inline" style=" lay-filter='yes'">
								<html:options collection="Institutional_level"  defaultValue="${pd.jgjb}"></html:options>
							</html:select>
					</div>
				</div>
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">内设机构数（个）：</label>
					<div class="layui-input-block">
						<input  name="nsjgs" id="nsjgs" placeholder="这里输入内设机构数" value="${pd.nsjgs}" min="1" type="number" maxlength=8  oninput="if(value.length>8)value=value.slice(0,8)" onpropertychange="if(value.length>8)value=value.slice(0,8)"
								class="layui-input">
					</div>
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">是否列入财政预算：</label>
					<div class="layui-input-block">
						 <html:select name="sflrczys" classs="layui-input-inline" style=" lay-filter='yes'">
										<html:options collection="sf"  defaultValue="${pd.sflrczys}"></html:options>
									</html:select>
					</div>
				</div>
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">预算经费：</label>
					<div class="layui-input-block">
						<input  name="ysjf" id="ysjf" placeholder="这里输入预算经费" value="${pd.ysjf}" min="1" type="number" maxlength=8  oninput="if(value.length>8)value=value.slice(0,8)" onpropertychange="if(value.length>8)value=value.slice(0,8)"
								class="layui-input">
					</div>
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<c:if test="${pd.type=='0'}">
				<div class="layui-row">
					<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
						<label class="layui-form-label">其他附件：</label>
						<div class="layui-input-block imgBox">
							<c:if test="${pd.TYPE=='1'&&pd.jbxxqtfj != null && pd.jbxxqtfj != ''}">
							<a href="<%=basePath %>uploadFiles/file/${pd.jbxxqtfj_rel}">
								<div class="layui-upload-drag test" style="width:100%">
									<i class="layui-icon">&#xe60a;</i>
									<p  class="name">${pd.jbxxqtfj_original}</p>
									<input readonly="readonly" type="hidden" name="jbxxqtfj" id="jbxxqtfj" value="${pd.jbxxqtfj}" />
								</div>
							</a>
							</c:if>
							<!-- 修改 -->
							<c:if test="${pd.TYPE=='2'||pd.TYPE=='' ||pd.TYPE==null}">
								<div class="layui-upload-drag test" style="width:100%">
									<c:if test="${pd.jbxxqtfj == null || pd.jbxxqtfj == ''}">
										<i class="layui-icon"></i>
										<p  class="name">点击上传</p>
									</c:if>
									<c:if test="${pd.jbxxqtfj != null && pd.jbxxqtfj != ''}">
										<i class="layui-icon">&#xe60a;</i>
										<p  class="name">${pd.jbxxqtfj_original}</p>
										<input readonly="readonly" type="hidden" name="jbxxqtfj_rd" id="jbxxqtfj" value="${pd.jbxxqtfj}" />
									</c:if>
								</div>
								<input  type="file" name="jbxxqtfj" id="imgfile1" class="imgfile">
							</c:if>
						</div>
					</div>
				</div>
			</c:if>
		</div>
		</div>
		<div id="qt" style="<c:if test="${pd.jxxz == '1'||pd.jxxz == '2'}">display:none;</c:if>">
			<blockquote class="layui-elem-quote" id="title_name2">
				<c:if test="${pd.jxxz == 3||pd.jxxz ==null||pd.jxxz ==''}">社会团体</c:if>
				<c:if test="${pd.jxxz == 4}">民办非企业单位</c:if>
				<c:if test="${pd.jxxz == 5}">企业</c:if>
			</blockquote>
			 <div class="layui-form-item">
				<div class="layui-row">
					<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
						<label class="layui-form-label">是否到民政部门填表：</label>
						<div class="layui-input-block">
							 <html:select name="sfmzbmtb" classs="layui-input-inline" style=" lay-filter='yes'">
											<html:options collection="sf"  defaultValue="${pd.sfmzbmtb}"></html:options>
										</html:select>
						</div>
					</div>
				</div>
			</div>
		</div>
		 <blockquote class="layui-elem-quote">学员信息</blockquote>
		 <div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">学员总数：</label>
					<div class="layui-input-block">
						<input  name="xyzs" id="xyzs" placeholder="这里输入学员总数" value="${pd.xyzs}" min="1" type="number" maxlength=8  oninput="if(value.length>8)value=value.slice(0,8)" onpropertychange="if(value.length>8)value=value.slice(0,8)"
								class="layui-input">
					</div>
				</div>
			</div>
		</div>
		
	</form>
	<div class="btnbox" >
		<button id="sure" class="layui-btn layui-btn-primary layui-btn-small">保存</button>
		<button id="cancel" class="layui-btn layui-btn-primary layui-btn-small">取消</button>
	</div>
</div>


	<!-- 页面底部js¨ -->
	<%@ include file="../system/index/foot.jsp"%>

	<!--提示框-->
	<script type="text/javascript">
		//初始化日期控件
		layui.use('laydate', function () {
	        var laydate = layui.laydate;
	        //执行一个laydate实例
	        laydate.render({
	            elem: '#jxrq'
	            ,type: 'date',
	            value:new Date()
	        })
	    });
		var form= layui.form;
			
		form.on('radio(yes)', function(data){
			$("#title_name").html("行政单位");
			$("#qt").hide();
			$("#xzsydwxx").show();
        })

        form.on('radio(no)', function(data){
        	$("#title_name").html("事业单位");
        	$("#qt").hide();
        	$("#xzsydwxx").show();
        })
         form.on('radio(yes2)', function(data){
        	$("#title_name2").html("社会团体");
        	$("#xzsydwxx").hide();
 			$("#qt").show();
        })
         form.on('radio(no2)', function(data){
        	 $("#title_name2").html("民办非企业单位");
        	 $("#xzsydwxx").hide();
  			 $("#qt").show();
        })
         form.on('radio(yes3)', function(data){
        	 $("#title_name2").html("企业");
        	 $("#xzsydwxx").hide();
  			 $("#qt").show();
        })

        $(document).ready(function(){
            $("#form1").on("submit",function(){
                 return false;
            });
            if (${pd.TYPE == '1'}) {
            	$.formToDiv(true);
                $(".btnbox").hide();
            } else {
                $(".btnbox").show();
            }
            var name="";
            $(".test").click(function () {
				if(${pd.TYPE != '1'}){
                    $(this).next().click();
				}
            });

            $(".imgfile").change(function () {
                name= test(this.value,".")
                $(this).prev().find("p").text(test(this.value,"\\"));
               // $("#name").text(test(this.value,"\\"));
                if(name == 'xls' || name == 'xlsx' || name == "docx"|| name == "doc"|| name == "png"|| name == "jpg"|| name == "jpeg"||name=="zip" ||name=="rar"){
                    $(this).prev().find("i").html("&#xe60a;")
                }else{
                    layer.msg("请上传正确的文件",{shift: 6,icon:2})
                    $(this).prev().find("i").html("&#xe67c;")
                }
            });
            $("#sure").on("click",function(){
            	if ($("#szqy_xm").val() == "") {
                    layer.tips('所在区域不能为空', $("#sTree"), {
                        tips: [3, '#D16E6C'],
                        time: 4000
                    });
                    $("#sTree").focus();
                    return false;
                }
            	if ($("#name").val() == "") {
                    layer.tips('老年大学（学校）名称不能为空', $("#name"), {
                        tips: [3, '#D16E6C'],
                        time: 4000
                    });
                    $("#name").focus();
                    return false;
                }
               var page =${pd.currentPage};
               parent.layer.load(1);
               $("#form1").ajaxSubmit({
                   type: 'post',
                   success: function(data) {
                	   parent.layer.closeAll('loading');
                       if ("success" == data.result) {
                           parent.layer.edit.location.href = "<%=basePath%>oldSchool/list.do?id=${id}&currentPage=${pd.currentPage}";
                           parent.layer.closeAll();
                       } else  {
                           layer.msg('系统异常,保存失败!', {icon: 5});
                       }
                   }
				});
            });

            $("#cancel").on("click",function(){
                parent.layer.closeAll();
            })
            //所在区域
            $.post("<%=basePath%>areaCode/listSubAreaCodeByParentId",{parentId:0},function(data){
                var sTree = $.Stree({
                    title:"${pd.szqy_xm}",
                    type:${pd.TYPE == '1'},
                    el: $("#sTree"),
                    oldData:['${pd.szqy_code}'],
                    isSingle: true,  //单选
                    data:data,
                    callback:function(){
                        $("#szqy_xm").val($.getString(this.arr,"title"))
                        $("#szqy_code").val($.getString(this.arr,"areaCode"))
                    },
                    switchCallback: function (obj) {
                        var id = obj.id;
                        if(obj.children == ""){
                            getAddress(id, sTree)
                        }
                    }
                });
            },"json")
            
        });
      //获取地址
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

                sTree.cheakedOldData()
                //展示

            })
        }
      
        function test(file_name,symbol){
            var result = file_name.split(symbol);
            return result[result.length-1];
        }
	</script>
</body>
</html>

