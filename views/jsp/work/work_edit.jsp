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
					<label class="layui-form-label"><i class="require">*</i>工作任务：</label>
					<div class="layui-input-block">
						<input  name="name" id="name"  value="${pd.name}" type="text" 
								class="layui-input"  >
					</div>
				</div>

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>规定完成<br>时间：</label>
					<div class="layui-input-block">
						<input  name="finishDate" id="finishDate" value="${pd.finishDate}" type="text"  placeholder="点击选择时间" class="layui-input"  >
					</div>
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-row">
			    <label class="layui-form-label"><i class="require">*</i>发布范围：</label>
				<div class="layui-input-block">
						<input readonly="readonly" type="hidden" name="dep_ids" id="dep_ids" value="${pd.dep_ids}" />
						<input readonly="readonly" type="hidden" name="publish_scope" id="publish_scope" value="${pd.publish_scope}" />
						<div id="div_publish_scope" class="search sTree layui-input-block" style="margin:0px;">
							<select lay-filter='dep_isde' id="dep_isde" name="dep_isde"  class="layui-input-inline"  >
								<option value="">请选择</option>


							</select>
						</div>
					</div>
			</div>
		</div>
		<div class="layui-form-item">
            <div class="layui-row">
                <div class="layui-form-item">
                    <label class="layui-form-label">内容描述：</label>
                    <div class="layui-input-block">
                        <textarea name="bz" id="bz" placeholder="请输入内容描述" class="layui-textarea" maxlength=200>${pd.bz }</textarea>
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
					<label class="layui-form-label">发布处室：</label>
					<div class="layui-input-block">
						<input  name="publishOffice" id="publishOffice"  value="${null == pd.publishOffice ? user.SECTION_NAME:pd.publishOffice}"  type="text"  class="layui-input" readonly>
					</div>
				</div>

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">发布单位：</label>
					<div class="layui-input-block">
						<input  name="publishUnite" id="publishUnite" value="${null == pd.publishUnite ? user.DEPNAME:pd.publishUnite}" type="text"  readonly
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

