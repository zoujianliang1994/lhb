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
<body >
<div class="edit_menu" class="disnone">
	<form action="trafficFree/${msg}.do" class="layui-form" name="form1" id="form1" method="post" >
		<input type="hidden" name="id" id="id" value="${pd.id}" />

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
                        <input type="hidden" name="szqy_code" id="szqy_code" value="${null == pd.szqy_code ? user.areaCode:pd.szqy_code}"/>
                        <input type="hidden" value="${pd.szqy_xm }" name="szqy_xm" id="szqy_xm"/>
                        <div class="layui-input-block sTree" id="sTree"> </div>
                    </div>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>上报年份：</label>
					<div class="layui-input-block">
									<input  name="nf" id="nf"  value="${pd.nf}" type="text"required lay-verify="required"  placeholder="点击选择年份" autocomplete="off"
											class="layui-input">
								</div>
				</div>
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>年度：</label>
					<div class="layui-input-block">
					 <html:select name="nd" classs="layui-input-inline" >
                            <html:options collection="nd"  defaultValue="${pd.nd}"></html:options>
                        </html:select>
					</div>
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">公共交通工具优惠/免票次数：</label>
					<div class="layui-input-block">
						<input  name="yhcs" id="yhcs" placeholder="这里输入公共交通工具优惠/免票次数" value="${pd.yhcs}" min="1" type="number" maxlength=10  oninput="if(value.length>8)value=value.slice(0,8)" onpropertychange="if(value.length>8)value=value.slice(0,8)"
								class="layui-input">
					</div>
				</div>


				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">总金额：</label>
					<div class="layui-input-block">
						<input  name="zje" id="zje" placeholder="这里输入总金额" value="${pd.zje}" type="number" min="1" maxlength=10 oninput="if(value.length>8)value=value.slice(0,8)" onpropertychange="if(value.length>8)value=value.slice(0,8)"
								class="layui-input">
					</div>
				</div>
			</div>
		</div>
		 <div class="layui-form-item">
            <div class="layui-row">
                <div class="layui-form-item">
                    <label class="layui-form-label">备注：</label>
                    <div class="layui-input-block">
                        <textarea name="bz" id="bz" placeholder="请输入备注" class="layui-textarea" maxlength=200>${pd.bz }</textarea>
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
	            elem: '#nf'
	            ,type: 'year',
	            value:new Date()
	        })
	    });

        $(document).ready(function(){
        	
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
            
            $("#form1").on("submit",function(){
                 return false;
            });
            if (${pd.TYPE == '1'}) {
            	$.formToDiv(true);
                $(".btnbox").hide();
            } else {
                $(".btnbox").show();
            }
            $("#sure").on("click",function(){
            	if ($("#szqy_xm").val() == "") {
                    layer.tips('所在区域不能为空', $("#sTree"), {
                        tips: [3, '#D16E6C'],
                        time: 4000
                    });
                    $("#sTree").focus();
                    return false;
                }
            	if ($("#nf").val() == "") {
                    layer.tips('上报年份不能为空', $("#nf"), {
                        tips: [3, '#D16E6C'],
                        time: 4000
                    });
                    $("#nf").focus();
                    return false;
                }
               var page =${pd.currentPage};
               parent.layer.load(1);
               $.post('<%=basePath%>trafficFree/${msg}.do',$('#form1').serialize(), function (data) {
                	parent.layer.closeAll('loading');
                    if ("success" == data.result) {
                         parent.layer.edit.location.href = "<%=basePath%>trafficFree/list.do?id=${id}&currentPage=${pd.currentPage}";
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
                })
                //默认选中

                sTree.cheakedOldData()
                //展示

            })
        }
	</script>
</body>
</html>

