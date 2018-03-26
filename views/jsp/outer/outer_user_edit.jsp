<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>外部单位人员编辑</title>
    <%@ include file="../system/index/headcss.jsp" %>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>static/source/public/css/list.css">
</head>
<body>
<div class="edit_menu">
    <form action="${msg}.do" class="layui-form" id="editForm" lay-filter="editForm" method="post">
        <input type="hidden" value="${pd.USER_ID}" name="USER_ID" id="USER_ID"/>
        <input type="hidden" value="2" name="TYPE" id="TYPE"/>
        <div class="layui-form-item">
            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label"><i class="require">*</i>外部单位：</label>
                    <div class="layui-input-block layui-form-select" id="mechanism">
                        <input type="hidden" value="${pd.SECTION_ID}" name="SECTION_ID" id="SECTION_ID"/>
                        <input type="hidden" value="${pd.SECTION_NAME}" name="SECTION_NAME" id="SECTION_NAME"/>
                        <dl class="layui-anim layui-anim-upbit" id="adminSelect" style="disnone:none;width:100%;">

                        </dl>
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label"><i class="require">*</i>角色名称：</label>
                    <input type="hidden" value="${pd.ROLE_ID}" name="ROLE_ID" id="ROLE_ID"/>
                    <input type="hidden" value="${pd.ROLENAME}" name="ROLENAME" id="ROLENAME" >
                    <div class="layui-input-block sTree" id="sTree"> </div>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label"><i class="require">*</i>姓名：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.NAME }" name="NAME" id="NAME" required lay-verify="required" placeholder="请输入姓名"
                               autocomplete="off" maxlength=50
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label"><i class="require">*</i>登陆账号：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.USERNAME }" name="USERNAME" id="USERNAME" required lay-verify="required" placeholder="请输入登陆账号"
                               autocomplete="new-password" maxlength=50
                               class="layui-input" onchange="checkUserName()">
                    </div>
                </div>

            </div>
        </div>

        <div class="layui-form-item" id="mimaDiv">
            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label"><i class="require">*</i>密码：</label>
                    <div class="layui-input-block">
                        <input type="password" name="PASSWORD" id="PASSWORD" required lay-verify="required" placeholder="请输入密码"
                               autocomplete="new-password" maxlength=20
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label"><i class="require">*</i>确认密码：</label>
                    <div class="layui-input-block">
                        <input type="password" name="QRPASSWORD" id="QRPASSWORD" required lay-verify="required" placeholder="请输入确认密码"
                               autocomplete="new-password" maxlength=20
                               class="layui-input">
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-row">
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">联系方式：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.PHONE }" name="PHONE" id="PHONE" required lay-verify="required" placeholder="请输入联系方式"
                               autocomplete="off" maxlength=20
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">职务：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.ZW }" name="ZW" id="ZW" required lay-verify="required" placeholder="请输入职务"
                               autocomplete="off" maxlength=50
                               class="layui-input">
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-row">
                <div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
                    <label class="layui-form-label">工作内容：</label>
                    <div class="layui-input-block">
                        <input type="text" value="${pd.GZNR }" name="GZNR" id="GZNR" required lay-verify="required" placeholder="请输入工作内容"
                               autocomplete="off" maxlength=200
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
                        <textarea name="BZ" id="BZ" placeholder="请输入备注" class="layui-textarea" maxlength=200>${pd.BZ }</textarea>
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
<%@ include file="../system/index/foot.jsp" %>
<script>
    $(function () {
        var form= layui.form;
        var TYPE = '${pd.TYPE}';

        layui.use('laydate', function () {
            var laydate = layui.laydate;
            //执行一个laydate实例
            laydate.render({
                elem: '#CS_DATE' //指定元素
            });
        });

        $("#sure").on("click", function () {
            if ($("#SECTION_NAME").val() == "") {
                layer.tips('外部单位不能为空', $("#mechanism"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#mechanism").focus();
                return false;
            }
            if ($("#ROLENAME").val() == "") {
                layer.tips('角色不能为空', $("#ROLENAME"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#ROLENAME").focus();
                return false;
            }
            if ($("#NAME").val() == "") {
                layer.tips('姓名不能为空', $("#NAME"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#NAME").focus();
                return false;
            }
            if ($("#USERNAME").val() == "") {
                layer.tips('登陆账号不能为空', $("#USERNAME"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#USERNAME").focus();
                return false;
            }


            if (InValidChar($("#USERNAME").val())){
                layer.tips('登陆账号仅限英文和数字', $("#USERNAME"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#USERNAME").focus();
                return false;
            }

            if ($("#USER_ID").val() == "" && $("#PASSWORD").val() == "") {
                layer.tips('登陆密码不能为空', $("#PASSWORD"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#PASSWORD").focus();
                return false;
            }
            if ($("#PASSWORD").val() != $("#QRPASSWORD").val()) {
                layer.tips('两次密码不相同', $("#QRPASSWORD"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#QRPASSWORD").focus();
                return false;
            }
        	parent.layer.load(1);
            $.post('${msg}.do', $('#editForm').serialize(), function (data) {
            	parent.layer.closeAll('loading');
                if ("success" == data.result) {
                    parent.layer.edit.location.href = "<%=basePath%>outer/user/listUsers.do?currentPage=${pd.currentPage}"+"&xzqh=${pd.xzqh}";
                    parent.layer.closeAll();
                } else if ("fail" == data.result) {
                    layer.msg('登陆账号重复,保存失败!', {icon: 5});
                } else {
                    layer.msg('系统异常,保存失败!', {icon: 5});
                }
            });
        });
        $("#cancel").on("click", function () {
            parent.layer.closeAll();
        });
        var isAdmin=${isAdmin};
		if(!isAdmin){
            //外部单位下拉
	        $.post("<%=basePath%>outer/user/listOuterUnit.do",{},function(data){
	            var data= eval(data.data);
	          //  console.log(data)
	            var id= '${pd.SECTION_ID}';
	            var select=  '<select lay-filter="SECTION_NAME"  lay-search> <option value=""></option>';
	            for(var i=0;i<data.length;i++){
	                var option='<option value="'+data[i].SECTION_ID+'"  '+(id==data[i].SECTION_ID?"selected ":"")+'>'+data[i].NAME+'</option>'
	                select+= option;
	            }
	            select+='</select>'
	            console.log(select);
	            $("#mechanism").append(select);
	            //默认一个初始值
	           /*  if( $("#SECTION_ID").val()==null||$("#SECTION_ID").val()==""){
	            	$("#SECTION_ID").val(data[0].SECTION_ID);
	                $("#SECTION_NAME").val(data[0].NAME);
	            } */
	            form.render('select');
	            //查看
	            $.formToDiv(TYPE == '1')
	        })
		}else{
            $("#mechanism").append('<input type="text"  id="areaName" value="${pd.SECTION_NAME}" placeholder="输入地区后回车显示数据"autocomplete="off" maxlength=20 class="layui-input">');
            $("#areaName").on("keyup",function(e){
                var ev= e || window.event;
                if(ev.keyCode == 13){
                    var val= $(this).val();
                    $.post("<%=basePath%>outer/user/listOuterUnit.do",{areaName:val},function(data){
                        var data= eval(data.data)
                        if(data == ""){
                            $("#adminSelect").html("");
                            $("#adminSelect").hide();
                            return
                        }
                        var dds=""
                        $.each(data,function(){
                            var dd='<dd lay-value="'+this.SECTION_ID+'">'+this.NAME+'</dd>';
                            dds+= dd;
                        })
                        $("#adminSelect").html(dds);
                        $("#adminSelect").show();
                    })
                }
            })

		}
		
		if (1 == TYPE) {
        	$.formToDiv(true)
            $("#btnDiv").hide();
            $("#mimaDiv").hide();
            $("input").removeAttr("placeholder", "");
        } else {
            $("#btnDiv").show();
        }
		
        $("#mechanism").on("click","dd",function(){
            $("#areaName").val($(this).text());
            $("#SECTION_NAME").val($(this).text());
            $("#SECTION_ID").val($(this).attr('lay-value'))

        })

        $(window).on("click",function(){
            $("#adminSelect").hide();
        })

        $("#areaName").click(function(e){
            e.stopPropagation();
            if($.trim($("#adminSelect").html()) == ""){
                return
            }
            $("#adminSelect").show();
        })

        form.on('select(SECTION_NAME)', function(data){
            $("#SECTION_ID").val(data.value);
            $("#SECTION_NAME").val(data.othis.find("input").val());
        });
		
        //角色下拉
        $.post("<%=basePath%>user/listSectionOrRoles.do",{TYPE:2,optType:1},function(data){
            var data= eval(data.data);
            var roleId='${pd.ROLE_ID}';
            var title="${pd.ROLENAME}";
            if(roleId!=","){
            	roleId=roleId.substring(0,roleId.length-1).split(",");
            }else{
            	roleId=[];
            	title="";
            }
            var sTree = $.Stree({
                title:title,
                type:${pd.TYPE == '1'},
                el: $("#sTree"),
                oldData:roleId,
                isSingle: false,  //单选
                data:data,
                callback:function(){
                    $("#ROLENAME").val($.getString(this.arr,"title")+',')
                    $("#ROLE_ID").val($.getString(this.arr,"id")+',')
                }
            });
           // console.log(data)
        })

    });



    function isCharsNotInBag (s, bag) //逐个判断s字符串中每个字符是否都在限定范围bag内
    {
        var i,c;
        for (i = 0; i < s.length; i++)
        {
            c = s.charAt(i);
            if (bag.indexOf(c) < 0) //不在则返回真
                return true;
        }
        return false;
    }

    function InValidChar(s) //无效输入判断(为真说明输入无效）
    {
        var haserrorChar;
        var CorrectChar = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
        haserrorChar = isCharsNotInBag(s, CorrectChar);
        return haserrorChar;
    }
    //判断登陆账号是否存在
    function checkUserName() {
        var USERNAME = $.trim($("#USERNAME").val());
        $.ajax({
            type: "POST",
            url: 'checkUserName',
            data: {USERNAME: USERNAME},
            dataType: 'json',
            cache: false,
            success: function (data) {
                if ("yes" == data.result) {
                    layer.tips('该登陆账号已经存在!', $("#USERNAME"), {
                        tips: [3, '#D16E6C'],
                        time: 4000
                    });
                    $("#USERNAME").val('');
                } else if ('error' == data.result) {
                    layer.msg('系统异常,请稍后再试!', {icon: 5});
                    $("#USERNAME").val('');
                } else {
                    //...
                }
            }
        });
    }

</script>
</body>
</html>