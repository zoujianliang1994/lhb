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
</head>
<style>
	.layui-input2{
		width:100%;
		text-align:center;
		border:0;
		/* height: 25px; */
	}
	.layui-table tbody tr:hover, .layui-table-hover{
		background:#fff!important
	}
</style>
<body >
<div class="edit_menu" class="disnone">
	<form action="oldExpand/${msg}.do" class="layui-form" name="form1" id="form1" method="post" >
		<input type="hidden" name="id" id="id" value="${pd.id}" />
		<input type="hidden" name="szqy_code" id="szqy_code" value="${null == pd.szqy_code ? user.areaCode:pd.szqy_code}" />

		<div class="layui-form-item">
			<div class="layui-row">

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>文件名称：</label>
					<div class="layui-input-block">
						<input  name="name" id="name"  value="${pd.name}" type="text" 
								class="layui-input"  >
					</div>
				</div>

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>文件类型：</label>
					<div class="layui-input-block">
						<select name="nds" lay-verify="required" lay-filter='select1'>
                        	<option value="">请选择文件类型</option>
                        	<option value="1" <c:if test="${pd.nd == '1'}">selected</c:if>>政策类</option>
                        	<option value="2" <c:if test="${pd.nd == '2'}">selected</c:if>>法规类</option>
                        	<option value="3" <c:if test="${pd.nd == '3'}">selected</c:if>>通知类</option>
                    	</select>					
                    </div>
				</div>
			</div>
		</div>
		
		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">发布人：</label>
					<div class="layui-input-block">
						<input  name="author" id="author"  value="${null == pd.author ? user.NAME:pd.author}"  type="text"  class="layui-input" readonly>
					</div>
				</div>

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">发布时间：</label>
					<div class="layui-input-block">
						<input  name="publishDate" id="publishDate" value="${pd.publishDate}" type="text"  class="layui-input" >
					</div>
				</div>
			</div>
		</div>
		
		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>共享范围：</label>
					<div class="layui-input-block">
						<select name="nds" lay-verify="required" lay-filter='select1'>
                        	<option value="">请选择共享范围</option>
                        	<option value="1" <c:if test="${pd.nd == '1'}">selected</c:if>>所有人</option>
                        	<option value="2" <c:if test="${pd.nd == '2'}">selected</c:if>>四川省</option>
                        	<option value="3" <c:if test="${pd.nd == '3'}">selected</c:if>>市洲</option>
                        	<option value="4" <c:if test="${pd.nd == '4'}">selected</c:if>>区县</option>
                        	<option value="5" <c:if test="${pd.nd == '5'}">selected</c:if>>乡镇、社区</option>
                        	<option value="6" <c:if test="${pd.nd == '6'}">selected</c:if>>村、社区</option>
                    	</select>					
                    </div>
				</div>

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">附件上传：</label>
					<div class="layui-input-block">
						<!-- 查看下载附件 -->
						<c:if test="${pd.TYPE=='1'&&pd.fj != null && pd.fj != ''}">
							<a href="<%=basePath %>uploadFiles/file/${pd.gzzdfj_rel}">
								<div class="layui-upload-drag test" style="width:100%">
									<i class="layui-icon">&#xe60a;</i>
									<p  class="name">${pd.gzzdfj_original}</p>
									<input readonly="readonly" type="hidden" name="fj" id="fj" value="${pd.gzzdfj}" />
								</div>
							</a>
						</c:if>
						<!-- 修改 -->
						<c:if test="${pd.TYPE=='2'||pd.TYPE=='' ||pd.TYPE==null}">
							<div class="layui-upload-drag test" style="width:100%">
								<c:if test="${pd.fj == null || pd.fj == ''}">
									<i class="layui-icon"></i>
									<p  class="name">点击上传</p>
								</c:if>
								<c:if test="${pd.fj != null && pd.fj != ''}">
									<i class="layui-icon">&#xe60a;</i>
									<p  class="name">${pd.gzzdfj_original}</p>
									<input readonly="readonly" type="hidden" name="gzzdfj_rd" id="fj" value="${pd.fj}" />
								</c:if>
							</div>
							<input  type="file" name="gzzdfj" id="imgfile1" class="imgfile">
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</form>

	<div class="btnbox" >
		<button id="publish" class="layui-btn layui-btn-warm layui-btn-small">发布</button>
		<button id="sure" class="layui-btn layui-btn-primary layui-btn-small">保存</button>
		<button id="cancel" class="layui-btn layui-btn-primary layui-btn-small">取消</button>
	</div>
</div>


	<!-- 页面底部js¨ -->
	<%@ include file="../system/index/foot.jsp"%>
	<!--提示框-->
	<script type="text/javascript">
   		var form = layui.form;
		//初始化日期控件
		layui.use('laydate', function () {
	        var laydate = layui.laydate;
	        //执行一个laydate实例
	        laydate.render({
	            elem: '#finishDate'
	            ,type: 'date',
	            value:new Date()
	        })
	        laydate.render({
	            elem: '#publishDate'
	            ,type: 'date',
	            value:new Date()
	        })
	    });

        $(document).ready(function(){
            $("#form1").on("submit",function(){
                 return false;
            });
            var schoolStree = $.Stree({
                title: "${pd.publish_scope}",
                el: $("#div_publish_scope"),
                oldData: [],
                isSingle: false,  //单选
                data: [],
                callback: function () {
                    if(this.arr == ""){
                        $("#teacher_id").val("");
                        $("#teacher_name").val("")
                        return
                    }
                    $("#teacher_name").val($.getString(this.arr, "title") );
                    $("#teacher_id").val($.getString(this.arr, "id") )
                }
            });
            if (${pd.TYPE == '1'}) {
            	$.formToDiv(true);
                $(".btnbox").hide();
            } else {
                $(".btnbox").show();
            }
            
            $("#sure").on("click",function(){
            	if ($("#name").val() == "") {
                    layer.tips('工作任务不能为空', $("#name"), {
                        tips: [3, '#D16E6C'],
                        time: 4000
                    });
                    $("#name").focus();
                    return false;
                }
            	if ($("#finishDate").val() == "") {
                    layer.tips('规定完成时间不能为空', $("#finishDate"), {
                        tips: [3, '#D16E6C'],
                        time: 4000
                    });
                    $("#finishDate").focus();
                    return false;
                }
               var page =${pd.currentPage};
              // console.log($('#form1').serialize())
               parent.layer.load(1);
               $.post('<%=basePath%>work/${msg}.do',$('#form1').serialize(), function (data) {
                	parent.layer.closeAll('loading');
                    if ("success" == data.result) {
                         parent.layer.edit.location.href = "<%=basePath%>work/list.do?id=${id}&currentPage=${pd.currentPage}";
                       	 parent.layer.closeAll();
                    } else {
                        layer.msg('系统异常,保存失败!', {icon: 5});
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

