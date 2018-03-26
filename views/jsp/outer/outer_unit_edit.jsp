<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>外部单位编辑</title>
<%@ include file="../system/index/headcss.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=basePath%>static/source/public/css/list.css">
</head>
<body>
	<div class="edit_menu">

		<form action="${msg}.do" class="layui-form" id="editForm" lay-filter="editForm" method="post">
			<input type="hidden" name="SECTION_ID" id="SECTION_ID" value="${pd.SECTION_ID}" />
			<input type="hidden" name="TYPE" id="TYPE" value="2" />
			<input type="hidden" name="LEVEL" id="LEVEL" value="${pd.LEVEL}" />
			<input type="hidden" name="FZR" id="FZR" value="${pd.FZR}" />
			<input type="hidden" name="RS" id="RS" value="${pd.RS}" />
			<input type="hidden" name="ZNMS" id="ZNMS" value="${pd.ZNMS}" />

			<div class="layui-form-item">
				<div class="layui-row">
					<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
						<label class="layui-form-label">填表人：</label>
						<div class="layui-input-block">
							<input type="text" value="${null == pd.TBR ? user.NAME:pd.TBR}" name="TBR" id="TBR" required lay-verify="required" placeholder=""
								autocomplete="off" class="layui-input" readonly style="background-color: #f2f2f2">
						</div>
					</div>
					<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
						<label class="layui-form-label">填表单位：</label>
						<div class="layui-input-block">
							<input type="text" value="${null == pd.TBDW ? user.SECTION_NAME:pd.TBDW}" name="TBDW" id="TBDW" required lay-verify="required" placeholder=""
								autocomplete="off" class="layui-input" readonly style="background-color: #f2f2f2">
						</div>
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-row">
					<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
						<label class="layui-form-label">填表日期：</label>
						<div class="layui-input-block">
							<input type="text" value="${null == pd.TBRQ ? date:pd.TBRQ}" name="TBRQ" id="TBRQ" required lay-verify="required" placeholder=""
								autocomplete="off" class="layui-input" readonly style="background-color: #f2f2f2">
						</div>
					</div>
					<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
						<label class="layui-form-label"><i class="require">*</i>所在区域：</label>
						<input type="hidden" name="SZQY_CODE" id="SZQY_CODE" value="${pd.SZQY_CODE}" />
						<input type="hidden" value="${pd.SZQY }" name="SZQY" id="SZQY" />
						<div class="layui-input-block sTree" id="sTree"></div>
					</div>
				</div>
			</div>

			<div class="layui-form-item">

				<div class="layui-row">
					<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
						<label class="layui-form-label"><i class="require">*</i>单位名称：</label>
						<div class="layui-input-block">
							<input type="text" value="${pd.NAME }" name="NAME" id="NAME" required lay-verify="required" placeholder="请输入单位名称" autocomplete="off"
								maxlength=50 class="layui-input">
						</div>
					</div>
					<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
						<label class="layui-form-label"><i class="require">*</i>行政级别：</label>
						<div class="layui-input-block">
							<c:if test="${pd.TYPE == '1'||pd.TYPE == '2'}">
								<input type="radio" name="XZJB" value="1" title="乡镇/街道" lay-filter="yes" <c:if test="${pd.XZJB == '1'}">checked</c:if>>
								<input type="radio" name="XZJB" value="2" title="村/社区" lay-filter="no" <c:if test="${pd.XZJB == '2'}">checked</c:if>>
							</c:if>
							<c:if test="${pd.TYPE == ''||pd.TYPE==null}">
								<input type="radio" name="XZJB" value="1" title="乡镇/街道" lay-filter="yes" checked>
								<input type="radio" name="XZJB" value="2" title="村/社区" lay-filter="no" <c:if test="${pd.XZJB == '1'}">checked</c:if>>
							</c:if>
						</div>
					</div>
				</div>

			</div>
			<div class="layui-form-item">

				<div class="layui-row">
					<c:if test="${pd.XZJB == ''||pd.XZJB==null}">
						<div class="layui-col-xs6 layui-col-sm6 layui-col-md6" id="dyllbdw">
							<label class="layui-form-label"><i class="require">*</i>对应老龄办单位：</label>
							<input type="hidden" value="${pd.DEPARTMENT_ID}" name="DEPARTMENT_ID" id="DEPARTMENT_ID" />
							<input type="hidden" value="${pd.DEPARTMENT_NAME}" name="DEPARTMENT_NAME" id="DEPARTMENT_NAME" />
							<div class="layui-input-block sTree" id="swTree"></div>
	
						</div>

						<div class="layui-col-xs6 layui-col-sm6 layui-col-md6" id="zxjdb" style="display:none;">
							<label class="layui-form-label"><i class="require">*</i>对应乡镇/街道单位：</label>
							<div class="layui-input-block" >
								<select name="DYJDDW" lay-verify="required" id="select" lay-filter="dyjd">
							       
							     </select>
							</div>
						</div>
					</c:if>
					<c:if test="${pd.XZJB == '1'}">
						<div class="layui-col-xs6 layui-col-sm6 layui-col-md6" id="dyllbdw">
							<label class="layui-form-label"><i class="require">*</i>对应老龄办单位：</label>
							<input type="hidden" value="${pd.DEPARTMENT_ID}" name="DEPARTMENT_ID" id="DEPARTMENT_ID" />
							<input type="hidden" value="${pd.DEPARTMENT_NAME}" name="DEPARTMENT_NAME" id="DEPARTMENT_NAME" />
							<div class="layui-input-block sTree" id="swTree"></div>
	
						</div>
						<div class="layui-col-xs6 layui-col-sm6 layui-col-md6" id="zxjdb"  style="display:none;">
							<label class="layui-form-label"><i class="require">*</i>对应乡镇/街道单位：</label>
							<div class="layui-input-block" >
								<select name="DYJDDW" lay-verify="required" id="select" lay-filter="dyjd">
							       
							     </select>
							</div>
						</div>
					</c:if>
					<c:if test="${pd.XZJB == '2'}">
						<div class="layui-col-xs6 layui-col-sm6 layui-col-md6" id="dyllbdw" style="display:none;">
							<label class="layui-form-label"><i class="require">*</i>对应老龄办单位：</label>
							<input type="hidden" value="${pd.DEPARTMENT_ID}" name="DEPARTMENT_ID" id="DEPARTMENT_ID" />
							<input type="hidden" value="${pd.DEPARTMENT_NAME}" name="DEPARTMENT_NAME" id="DEPARTMENT_NAME" />
							<div class="layui-input-block sTree" id="swTree"></div>
	
						</div>
						<div class="layui-col-xs6 layui-col-sm6 layui-col-md6" id="zxjdb" >
							<label class="layui-form-label"><i class="require">*</i>对应乡镇/街道单位：</label>
							<div class="layui-input-block" >
								<select name="DYJDDW" lay-verify="required" id="select" lay-filter="dyjd">
							       
							     </select>
							</div>
						</div>
					</c:if>
				</div>

			</div>

			<div class="layui-form-item">

				<div class="layui-row">
					<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
						<label class="layui-form-label">单位地址：</label>
						<div class="layui-input-block">
							<input type="text" value="${pd.ADDRESS }" name="ADDRESS" id="ADDRESS" required lay-verify="required" placeholder="请输入单位地址" autocomplete="off"
								maxlength=150 class="layui-input">
						</div>
					</div>
					<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
						<label class="layui-form-label">联系电话：</label>
						<div class="layui-input-block">
							<input type="text" value="${pd.TEL }" name="TEL" id="TEL" required lay-verify="required" placeholder="请输入单位联系电话" autocomplete="off"
								maxlength=20 class="layui-input">
						</div>
					</div>
				</div>
			</div>
		</form>
		<div class="btnbox" id="btnDiv" hidden="true">
			<button id="sure" class="layui-btn layui-btn-primary layui-btn-small">保存</button>
			<button id="cancel" class="layui-btn layui-btn-primary layui-btn-small">取消</button>
		</div>
	</div>
	<%@ include file="../system/index/foot.jsp"%>
	<script>
    $(function () {
        $.formToDiv(${pd.TYPE == '1'});
        var form= layui.form;
        var TYPE = '${pd.TYPE}';
        if (1 == TYPE) {
        	initLevelSel('1');
            $("#btnDiv").hide();
            $("input,select,radio,textarea").attr("disabled", "disabled").css("background-color", "#f2f2f2");
            $("input").removeAttr("placeholder", "");
        } else if(2==TYPE){
        	//需要初始化选择框
        	initLevelSel('1');
        	$("#btnDiv").show();
        }else {
            $("#btnDiv").show();
        }
	
        form.on('radio(yes)', function(data){
        	$("#zxjdb").hide();
        	$("#dyllbdw").show();
        	/* $("#select").html("");
		 	$("#swTree").find("input").attr("disabled",false)
			$("#select").attr("disabled",true)
			form.render('select'); */
        })

        form.on('radio(no)', function(data){
        	initLevelSel(data.value);
        	$("#dyllbdw").hide();
        	$("#zxjdb").show();
        	
         	/* $("#select").attr("disabled",false)
        	$("#swTree").find("input").attr("disabled",true)
        	$("#swTree").attr("disabled",true)
        	form.render('select');  */
        })
        form.on('select(dyjd)', function(data){
		  $("#DEPARTMENT_ID").val($(data.elem[0]).attr("depId"));
		//  console.log(data); //得到select原始DOM对象
		 // console.log(data.elem.attributes)
		 
		}); 
        
        
        //所在区域
        $.post("<%=basePath%>areaCode/listSubAreaCodeByParentId",{parentId:0},function(data){
            var sTree = $.Stree({
                title:"${pd.SZQY}",
                type:${pd.TYPE == '1'},
                el: $("#sTree"),
                oldData:['${pd.SZQY_CODE}'],
                isSingle: true,  //单选
                data:data,
                callback:function(){
                    $("#SZQY").val($.getString(this.arr,"title"))
                    $("#SZQY_CODE").val($.getString(this.arr,"areaCode"))
                },
                switchCallback: function (obj) {
                    var id = obj.id;
                    if(obj.children == ""){
                        getAddress(id, sTree)
                    }
                }
            });
        },"json")
        
        //所在机构
        $.post("<%=basePath%>section/getSectionDepartment.do",function(data){
            var swTree= $.Stree({
            	title:"${pd.DEPARTMENT_NAME}",
                type:${pd.TYPE == '1'},
                el: $("#swTree"),
                oldData:['${pd.DEPARTMENT_ID}'],
                isSingle: true,  //单选
                data:eval(data.zTreeNodes),
                callback:function(){
                    $("#DEPARTMENT_NAME").val($.getString(this.arr,"title"));
                    $("#DEPARTMENT_ID").val($.getString(this.arr,"id"));
                }
            });
        })

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

        $("#sure").on("click", function () {
        	
        	 if ($("#SZQY").val() == "") {
                 layer.tips('所在区域不能为空', $("#sTree"), {
                     tips: [3, '#D16E6C'],
                     time: 4000
                 });
                 $("#sTree").focus();
                 return false;
             }
        	
            if ($("#NAME").val() == "") {
                layer.tips('单位名称不能为空', $("#NAME"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#NAME").focus();
                return false;
            }
            if($('input:radio:checked').val()==2&&$("#select").val()==null){
            	layer.tips('对应乡镇/街道单位不能为空', $("#zxjdb"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#zxjdb").focus();
                return false;
        	}else if($('input:radio:checked').val()==1&&($("#DEPARTMENT_ID").val()==null||$("#DEPARTMENT_ID").val()=="")){
        		layer.tips('对应老龄办单位不能为空', $("#swTree"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#swTree").focus();
                return false;
        	}
			parent.layer.load(1);
            $.post('${msg}.do', $('#editForm').serialize(), function (data) {
            	parent.layer.closeAll('loading');
                if ("success" == data.result) {
                     parent.layer.edit.location.href = "<%=basePath%>outer/list.do?DEPARTMENT_ID=${DEPARTMENT_ID}&currentPage=${pd.currentPage}";
                   	 parent.layer.closeAll();
                } else {
                    layer.msg('系统异常,保存失败!', {icon: 5});
                }
            });
        });
        $("#cancel").on("click", function () {
            parent.layer.closeAll();
        });
        
        //初始化外部单位选择
        function initLevelSel(level){
        	$.post("<%=basePath%>outer/listOutUnitStree.do",{level:level},function(data){
                //console.log(data)
                var options="";
                var DYJDDW='${pd.DYJDDW}';
                $.each(data,function(){
                	var option="";
                	if(TYPE==1&&DYJDDW==this.id){
                		$("#zxjdb > div").html(this.title);
                		return;
                	}
                	if(DYJDDW==this.id){
                		option="<option value="+this.id+" depId='"+this.depId+"' selected = 'selected'>"+this.title+"</option>"
                	}else{
                		 option="<option value="+this.id+" depId='"+this.depId+"' >"+this.title+"</option>"
                	}
                	options+= option;
                })
                //默认赋值一个默认值
                $("#DEPARTMENT_ID").val(data[0].depId);
              //  console.log(options)
                $("#select").html(options);
                form.render('select')
            })
        }
    });
    
</script>
</body>
</html>