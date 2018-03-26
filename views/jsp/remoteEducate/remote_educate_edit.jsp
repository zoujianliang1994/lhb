<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="X-UA-Compatible" content="IE=8" > 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
	<!-- jsp文件头和头部 -->
	<%@ include file="../system/index/headcss.jsp"%>
</head>
<style>
	.edit_menu{padding:10px 20px}
	.layui-form{margin-top:20px}
	.layui-form-label{width:120px}
	.layui-input-block{margin-left:150px;}
	.layui-tab-item{width:100%;height:250px}
	.layui-tab-title li{font-size:13px}
	.layui-tab-content{margin-top:10px}
	.layui-form-select dl dd{text-align:left!important}
	html{
		font-size:13px
	}
	.layui-table-input{
		color:#333;
	}
	.layui-table tbody tr:hover, .layui-table-hover{
		background:#fff!important;
	}
</style>
<body >
<div class="edit_menu" class="disnone">

	<div class="layui-tab" lay-filter="tab">
		<ul class="layui-tab-title">
			<li class="layui-this" lay-id="0">基本信息</li>
			<li class="<c:if test="${pd.is_open != '1'}">disnone</c:if> layui-tab-hidden" lay-id="1">开展方式</li>
			<li class="<c:if test="${pd.is_open != '1'}">disnone</c:if>  layui-tab-hidden" lay-id="2">教学内容</li>
		</ul>
		<div class="layui-tab-content ">
			<div class="layui-tab-item layui-show">
				<form action="role/${msg}.do" class="layui-form" name="form1" id="form1" method="post" >
					<input type="hidden" name="id" id="id" value="${pd.id}" />
					<input type="hidden" name="jyfs" id="jyfs" value="${pd.jyfs}" />
					<input type="hidden" name="jynr" id="jynr" value="${pd.jynr}" />
					
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

					<div class="layui-form-item">
						<div class="layui-row">
							<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
								<label class="layui-form-label"><i class="require">*</i>是否开展远程教育：</label>
								<div class="layui-input-block">
									<%-- <html:select name="is_open" classs="layui-input-inline" style=" lay-filter='yes'">
										<html:options collection="sf"  defaultValue="${pd.is_open}"></html:options>
									</html:select> --%>
									 <input type="radio" name="is_open" value="1" title="是" lay-filter="yes" <c:if test="${pd.is_open == '1'}">checked</c:if>>
									<input type="radio" name="is_open" value="2" title="否" lay-filter="no" <c:if test="${pd.id == ''}">checked</c:if>  <c:if test="${pd.is_open == '0'}">checked</c:if>> 
								</div>
							</div>


							<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
								<label class="layui-form-label">覆盖乡镇个数：</label>
								<div class="layui-input-block">
									<input  name="fgxzs" id="fgxzs" placeholder="这里输入覆盖乡镇个数" value="${pd.fgxzs}" min="1" type="number" oninput="if(value.length>8)value=value.slice(0,8)" onpropertychange="if(value.length>8)value=value.slice(0,8)"
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


				</form>
			</div>
			<div class="layui-tab-item">
				<table class="layui-table center layui-form">
					<colgroup>
						<col >
						<col >
						<col>
						<col>
						<col width="120">
					</colgroup>
					<thead>
						<tr>
							<th>开展方式</th>
							<th>享受教育人数</th>
							<th>教育基地个数</th>
							<th>备注</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="educationMode">

					</tbody>
				</table>
				<c:if test="${pd.TYPE != '1'}"><button class="layui-btn layui-btn-small  layui-btn-primary " id="addMsg" >添加信息</button></c:if>
				
			</div>
			<div class="layui-tab-item">
				<table class="layui-table center layui-form">
					<colgroup>
						<col >
						<col >
						<col>
						<col>
						<col width="120">
					</colgroup>
					<thead>
					<tr>
						<th>教学内容</th>
						<th>总人数</th>
						<th>备注</th>
						<th>操作</th>
					</tr>
					</thead>
					<tbody id="curriculumSetting">

					</tbody>
				</table>
				<c:if test="${pd.TYPE != '1'}"><button class="layui-btn layui-btn-small  layui-btn-primary " id="addMsg2" >添加信息</button></c:if>
				
			</div>
		</div>
	</div>

	<div class="btnbox" >
		<button id="sure" type="button" class="layui-btn layui-btn-primary layui-btn-small">保存</button>
		<button id="cancel" type="button" class="layui-btn layui-btn-primary layui-btn-small">取消</button>
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
            value: new Date()
        })
    });

	if (${pd.TYPE == '1'}) {
    	$.formToDiv(true);
        $(".btnbox").hide();
    } else {
        $(".btnbox").show();
    }
    $(document).ready(function(){
        var element= layui.element;
        var form= layui.form;
		var laytpl= layui.laytpl;
		var expandJsonArray=eval('${pd.expandJsonArray}');
		var courseJsonArray=eval('${pd.courseJsonArray}');
		//开展方式数据
		var data={
            list:[ {kzfs:"",xsjyrs:"",jyjds:"",bz:"",isSave:false,isnew:true}],
			select:[0,1,2]
		}
		 //课程设置数据
		var setting= [
            {jxnr:"",zrs:"",bz:"",isSave:false,isnew:true}
		]
		if(expandJsonArray!=null){
            $.each(expandJsonArray,function(){
                this.isSave= true;
                data.select[indexOf(this.kzfs)]= 999;
            })
            $.each(courseJsonArray,function(){
                this.isSave= true;
            })
            data.list=expandJsonArray;
			setting=courseJsonArray;
		}
        element.on('tab(tab)', function(){
            var layId=this.getAttribute('lay-id')
            if(layId == "1"){
                randerLaytpl(data)
			}else if(layId == "2"){
                randerSetting(setting)
			}
		})
		//教育方式
		//保存
		$("#educationMode").on("click",".save",function(){
		    var $tds= $(this).closest("tr").children();
		    var index= $(this).closest("tr").index();
            if(!isNull($tds)){
                return
            }
			var json={
                kzfs:getValue($tds,0),
                xsjyrs:getValue($tds,1),
                jyjds:getValue($tds,2),
                bz:getValue($tds,3),
                isSave:true
			}
			if(data.list[index]==undefined){
                data.list.push(json)
			}else{
                data.list[index]= json;
			}

            data.select[indexOf(json.kzfs)]= 999;
            randerLaytpl(data)
		})
		//取消
        $("#educationMode").on("click",".cancel",function(){
            var index= $(this).closest("tr").index();
            if(data.list.length<=1 && data.list[index].isnew){
                layer.msg("请至少填写一条数据",{icon:2})
                return
            }
            if(data.list[index].isnew){
                data.list.splice(index,1)
            }else{
                data.list[index].isSave= true;
			}

            randerLaytpl(data)
        })
		//修改
        $("#educationMode").on("click",".edit",function(){
            var index= $(this).closest("tr").index();
            data.list[index].isnew= false;
            data.list[index].isSave= false;
            var value= data.list[index].kzfs;
            data.select[indexOf(999)]= value;
            randerLaytpl(data)
        })
		//删除
        $("#educationMode").on("click",".del",function(){
            var index= $(this).closest("tr").index();
            var value= data.list[index].kzfs;
            if(data.list.length<=1){
                layer.msg("请至少填写一条数据",{icon:2})
                return
			}
            data.select[indexOf(999)]= value;
            data.list.splice(index,1)
            randerLaytpl(data)
        })
		//新增
		$("#addMsg").on("click",function(){
		    var mark= true;
		   	$.each(data.list,function(i,b){
		   	    if(!this.isSave){
                    layer.msg("请先保存数据",{icon:2})
					mark= false;
		   	        return false
				}
			})
			if(!mark)return;
		    if(data.list.length>=3){
		        layer.msg("最多添加三种教育方式",{icon:2})
				return;
			}
		    var json={kzfs:"",xsjyrs:"",jyjds:"",bz:"",isSave:false,isnew:true}
            data.list.push(json)
            randerLaytpl(data)
		})
		//教育内容
		//save
        $("#curriculumSetting").on("click",".save",function(){
            var $tds= $(this).closest("tr").children();
            var index= $(this).closest("tr").index();
            if(!isNull($tds)){
                return
            }
            var json={
                jxnr:getValue($tds,0),
                zrs:getValue($tds,1),
                bz:getValue($tds,2),
                isSave:true
            }
            if(setting[index]==undefined){
                setting.push(json)
            }else{
                setting[index]= json;
            }
            if(!isNull($tds)){
                return
            }
            randerSetting(setting)
        })
        //取消
        $("#curriculumSetting").on("click",".cancel",function(){
            var index= $(this).closest("tr").index();
            if(setting.length<=1 && setting[index].isnew){
                layer.msg("请至少填写一条数据",{icon:2})
                return
            }
            if(setting[index].isnew){
                setting.splice(index,1)
			}else{
                setting[index].isSave=true;
			}
            randerSetting(setting)
        })
        //edit
        $("#curriculumSetting").on("click",".edit",function(){
            var index= $(this).closest("tr").index();
            setting[index].isSave= false;
            setting[index].isnew= false;
            randerSetting(setting)
        })
        //del
        $("#curriculumSetting").on("click",".del",function(){
            var index= $(this).closest("tr").index();
            if(setting.length<=1){
                layer.msg("请至少填写一条数据",{icon:2})
                return
            }
            setting.splice(index,1)
            randerSetting(setting)
        })
        //add
        $("#addMsg2").on("click",function(){
            var mark= true;
            $.each(setting,function(i,b){
                if(!this.isSave){
                    layer.msg("请先保存数据",{icon:2})
                    mark= false;
                    return false
                }
            })
            if(!mark)return;
            var json={jxnr:"",zrs:"",bz:"",isSave:false,isnew:true}
            setting.push(json)
            randerSetting(setting)
        })
		//获取value值
		function getValue($tds,index){
            return $tds.eq(index).children().eq(0).val()
		}
		//空值提示
		function isNull($tds){
		    var mark = true;
		    var len= $tds.length
		    $tds.each(function(i){
		        if(i>=len-2){
		            return false
				}
		        var that= $(this)
		        if(that.children().eq(0).val() == ""){
                    layer.tips('不能为空', that,{
                        tips:  [1, 'rgb(209, 110, 108)']
					})
					mark =false
					return false
				}
			})
			return mark
		}
		//全是空
		function allIsNull($tds){
            var mark = true;
            var len= $tds.length
            $tds.each(function(i){
                if(i>=len-1){
                    return false
                }
                var that= $(this)
                if(that.children().eq(0).val() == ""){
                    mark =false
                    return false
                }
            })
            return mark
		}
		//修改select值
		function indexOf(val){
		    for(var i=0;i<data.select.length;i++){
		        if(data.select[i] == val){
		            return i
				}
			}
		}
		//isSave

        //下一步
        form.on('radio(yes)', function(data){
			$(".layui-tab-hidden").each(function(){
			    $(this).removeClass("disnone")
			})
        })

        form.on('radio(no)', function(data){
            $(".layui-tab-hidden").each(function(){
                $(this).addClass("disnone")
            })
        })

		//教育方式
		function randerLaytpl(data){
            var getTpl = modeTable.innerHTML,
                view = document.getElementById('educationMode');
            laytpl(getTpl).render(data, function(html){
                $(view).html("");
                $(view).append(html);
                form.render('select');
            });

		}
		//教学内容
		function randerSetting(data){
            var getTpl = settingTable.innerHTML,
                view = document.getElementById('curriculumSetting');
            laytpl(getTpl).render(data, function(html){
                $(view).html("");
                $(view).append(html);
            });
		}
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
        $("#sure").on("click",function(){
        	console.log(setting);
        	if($('input:radio:checked').val()==1&&!data.list[0].isSave){
        		//element.tabChange('tab', 1);
        		$(".layui-tab-title").children().eq(1).click();
        		layer.msg("请录入开展方式！",{icon:2});
        		return false;
        	}
        	if($('input:radio:checked').val()==1&&!setting[0].isSave){
        		$(".layui-tab-title").children().eq(2).click();
        		layer.msg("请录入教学内容！",{icon:2});
        		return false;
        	}
        	$(".layui-tab-title").children().eq(0).click();
        	if ($("#szqy_xm").val() == "") {
                layer.tips('所在区域不能为空', $("#sTree"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#sTree").focus();
                return false;
            }
        	if ($('input:radio:checked').val()==1&&$("#fgxzs").val() == "") {
                layer.tips('覆盖乡镇数不能为空', $("#fgxzs"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#fgxzs").focus();
                return false;
            }
        	if ($("#nf").val() == "") {
                layer.tips('年份不能为空', $("#nf"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#nf").focus();
                return false;
            }
           var page =${pd.currentPage};
           parent.layer.load(1);
          // console.log(data.list)
           //console.log(setting)
           $('#jyfs').val(JSON.stringify(data.list));
           $('#jynr').val(JSON.stringify(setting));
           $.post('<%=basePath%>remote/${msg}.do',$('#form1').serialize(), function (data) {
            	parent.layer.closeAll('loading');
                if ("success" == data.result) {
                     parent.layer.edit.location.href = "<%=basePath%>remote/list.do?id=${id}&currentPage=${pd.currentPage}";
                   	 parent.layer.closeAll();
                } else {
                    layer.msg('系统异常,保存失败!', {icon: 5});
                }
            }); 
        });
		//限制Number长度
		$("table").on("keyup",".checkNumber",function(){
		    var val= $(this).val();
		    $(this).val(val.substring(0,8))
		})
		//取消
        $("#cancel").on("click",function(){
            parent.layer.closeAll();
        })
    });
    
    function getFormJson(form) {
    	var o = {};
    	var a = $(form).serializeArray();
    	$.each(a, function () {
	    	if (o[this.name] !== undefined) {
		    	if (!o[this.name].push) {
		    		o[this.name] = [o[this.name]];
		    	}
	    	o[this.name].push(this.value || '');
	    	} else {
	    		o[this.name] = this.value || '';
	    	}
    	});
    	return o;
    }
</script>
<script  type="text/html" id="modeTable">
    {{#  layui.each(d.list, function(index, item){ }}
		{{#  if(!item.isSave){ }}
			<tr >
				<td>
					<select name="city" lay-verify="required">
						{{#  layui.each(d.select, function(index, item){ }}
							{{#  if(item == "0"){ }}
								<option value="0">电视</option>
							{{#  } }}
							{{#  if(item == "1"){ }}
								<option value="1">网络媒体</option>
							{{#  } }}
							{{#  if(item == "2"){ }}
								<option value="2">广播</option>
							{{#  } }}
						{{#  }); }}
						<%--<option value="0">电视</option>
						<option value="1">网络媒体</option>
						<option value="2">广播</option>--%>
					</select>
				</td>
				<td>
					<input type="number" name="title"  required value="{{item.xsjyrs}}"  lay-verify="required" autocomplete="off" class="layui-input layui-table-input checkNumber">
				</td>
				<td>
					<input type="number" name="title" required  value="{{item.jyjds}}" lay-verify="required" autocomplete="off" class="layui-input layui-table-input checkNumber">
				</td>
				<td>
					<input type="text" name="title" required  value="{{item.bz}}" lay-verify="required"  autocomplete="off" class="layui-input layui-table-input">
				</td>
				<td>
					<a class="layui-btn layui-btn-mini layui-btn-primary save" href="javascript:void(0);">确定</a>
					<a class="layui-btn layui-btn-mini  layui-btn-primary  cancel" href="javascript:void(0);">取消</a>
				</td>
			</tr>
		{{# } else { }}
			<tr>

				{{#  if(item.kzfs == "0"){ }}
					<td>电视</td>
				{{#  } }}
				{{#  if(item.kzfs == "1"){ }}
				<td>网络媒体</td>
				{{#  } }}
				{{#  if(item.kzfs == "2"){ }}
				<td>广播</td>
				{{#  } }}
				<td>{{item.xsjyrs}}</td>
				<td>{{item.jyjds}}</td>
				<td>{{item.bz}}</td>
				<td>
					<a class="layui-btn layui-btn-mini <c:if test="${pd.TYPE == '1'}">layui-btn-disabled</c:if><c:if test="${pd.TYPE != '1'}">edit</c:if>"  href="javascript:void(0);">编辑</a>
					<a class="layui-btn layui-btn-mini  <c:if test="${pd.TYPE == '1'}">layui-btn-disabled</c:if><c:if test="${pd.TYPE != '1'}">layui-btn-danger del</c:if> " href="javascript:void(0);">删除</a>
				</td>
			</tr>
		{{#  } }}
	{{#  }); }}
</script>
<script  type="text/html" id="settingTable">
	{{#  layui.each(d, function(index, item){ }}
	{{#  if(!item.isSave){ }}
	<tr >
		<td>
			<input type="text"  name="title" maxlength=50 required value="{{item.jxnr}}"  lay-verify="required" autocomplete="off" class="layui-input layui-table-input">
		</td>
		<td>
			<input type="number" name="title" required  value="{{item.zrs}}" lay-verify="required" autocomplete="off" class="layui-input layui-table-input checkNumber">
		</td>
		<td>
			<input type="text" name="title" required  value="{{item.bz}}" lay-verify="required"  autocomplete="off" class="layui-input layui-table-input">
		</td>
		<td>
			<a class="layui-btn layui-btn-mini layui-btn-primary save" href="javascript:void(0);">确定</a>
			<a class="layui-btn layui-btn-mini  layui-btn-primary  cancel" href="javascript:void(0);">取消</a>
		</td>
	</tr>
	{{# } else { }}
	<tr>
		<td>{{item.jxnr}}</td>
		<td>{{item.zrs}}</td>
		<td>{{item.bz}}</td>
		<td>
			<a class="layui-btn layui-btn-mini <c:if test="${pd.TYPE == '1'}">layui-btn-disabled</c:if><c:if test="${pd.TYPE != '1'}">edit</c:if>"  href="javascript:void(0);">编辑</a>
			<a class="layui-btn layui-btn-mini  <c:if test="${pd.TYPE == '1'}">layui-btn-disabled</c:if><c:if test="${pd.TYPE != '1'}">layui-btn-danger del</c:if>" href="javascript:void(0);">删除</a>
		</td>
	</tr>
	{{#  } }}
	{{#  }); }}

</script>
</body>
</html>

