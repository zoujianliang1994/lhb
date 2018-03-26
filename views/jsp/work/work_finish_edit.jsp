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
		<blockquote class="layui-elem-quote">工作任务信息</blockquote>

		<div class="layui-form-item">
			<div class="layui-row">

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>任务名称：</label>
					<div class="layui-input-block">
						${pd.name}
					</div>
				</div>

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>规定完成时间：</label>
					<div class="layui-input-block">
						${pd.finishDate}
					</div>
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">发布人：</label>
					<div class="layui-input-block">
						${pd.author}
					</div>
				</div>

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">发布时间：</label>
					<div class="layui-input-block">
						${pd.publishDate}
					</div>
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">发布处室：</label>
					<div class="layui-input-block">
						${pd.publishOffice}
					</div>
				</div>

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">发布单位：</label>
					<div class="layui-input-block">
						${pd.publishUnite}
					</div>
				</div>
			</div>
		</div>
		<blockquote class="layui-elem-quote">工作任务完成情况</blockquote>
		 <div class="layui-form-item">
		      <select name="status" lay-filter="status">
			        <option value=""></option>
			        <option value="0" selected="">完成</option>
			        <option value="1" >未完成</option>
		      </select>
 		 </div>
 		 <div class="layui-col-sm12">
		    <table class="layui-table center" id="table">
		        <colgroup>
		            <col width="60">
					<col>
					<col>
					<col>
		        </colgroup>
		        <thead>
		        <tr>
		            <th>序号</th>
		            <th>接收单位名称</th>
					<th>任务完成日期</th>
					<th>任务完成情况</th>
		        </tr>
		        </thead>
		        <tbody>
	 		 		<tr>
	                    <td>1</td>
	                    <td>成都市老龄办</td>
	                    <td>2018/3/6</td>
	                    <td>完成</td>
					</tr> 		 
	 		   </tbody>
		    </table>
 		 </div>
	</form>

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
           /*  if (${pd.TYPE == '1'}) {
            	$.formToDiv(true);
                $(".btnbox").hide();
            } else {
                $(".btnbox").show();
            }
             */
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

