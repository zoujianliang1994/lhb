﻿
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>四川省60岁以上人口总量分析</title>
    <%@ include file="../system/index/headcss.jsp" %>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/source/public/css/report_edit_head.css">
</head>
<style>
    .edit_menu{font-size:13px}
</style>
<body>
<div class="edit_menu">
    <form id="form">
        <div class="layui-form-item">
            <label class="layui-form-label">行政区划：</label>
            <div class="layui-input-block">
                <input type="text" name="xzqh_name" class="layui-input" readonly value="${sixtenData.xzqh_name}"/>
            </div>
          <%--  <div class="layui-input-block sTree" id="sTree">

            </div>--%>
            <input type="hidden" name="id" value="${sixtenData.id}"/>
            <input type="hidden" name="xzqh_code" value="${sixtenData.xzqh_code}"/>
            <input type="hidden" name="level" value="${sixtenData.level}"/>
            <input type="hidden" name="totalCount" value="${sixtenData.totalCount}"/>
        </div>

      <div class="layui-form-item">
            <label class="layui-form-label">户籍人口人数：</label>
            <div class="layui-input-block">
                <input  autocomplete="off" type="number" value="${sixtenData.hjage_one}" name="hjage_one" class="layui-input number" >
            </div>
        </div>
      
        <div class="layui-form-item">
            <label class="layui-form-label">60-64岁人数：</label>
            <div class="layui-input-block">
                <input  autocomplete="off" type="number" value="${sixtenData.age_one}" name="age_one" class="layui-input number">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">65-69岁人数：：</label>
            <div class="layui-input-block">
                <input  autocomplete="off" type="number" value="${sixtenData.age_two}" name="age_two" class="layui-input number">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">70-79岁人数：</label>
            <div class="layui-input-block">
                <input  autocomplete="off" type="number" value="${sixtenData.age_three}" name="age_three" class="layui-input number">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">80-89岁人数：</label>
            <div class="layui-input-block">
                <input  autocomplete="off" type="number" value="${sixtenData.age_four}" name="age_four" class="layui-input number">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">90-99岁人数：</label>
            <div class="layui-input-block">
                <input  autocomplete="off" type="number" value="${sixtenData.age_five}" name="age_five" class="layui-input number">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">100岁以上：</label>
            <div class="layui-input-block">
                <input  autocomplete="off" type="number" value="${sixtenData.age_six}" name="age_six" class="layui-input number">
            </div>
        </div>
    </form>
    <div class="btnbox">
        <button id="sure" class="layui-btn layui-btn-primary layui-btn-small">确定</button>
        <button id="cancel" class="layui-btn layui-btn-primary layui-btn-small">取消</button>
    </div>
</div>


</div>
<%@ include file="../system/index/foot.jsp" %>
<script>
    $(function(){
       /* $.post("<%=basePath%>areaCode/listSubAreaCodeByParentId", {parentId: 0}, function (data) {
            var sTree = $.Stree({
                el: $("#sTree"),
                data: data,
                isSingle: true,  //单选
                oldData: ["${sixtenData.xzqh_code}"],
                title:"${sixtenData.xzqh_name}",
                callback: function (obj) {
                    if(obj.level != 2){
                        this.$el.find(".lev" + obj.lev).children(".treeItem ").removeClass("active");
                        return
                    }
                    $("input[name='xzqh_code']").val(obj.areaCode)
                    $("input[name='xzqh_name']").val(obj.title)
                    $("input[name='level']").val(obj.level)
                },
                switchCallback: function (obj) {
                    var id = obj.id;
                    if (obj.children == "") {
                        var options={
                            url:"<%=basePath%>areaCode/listSubAreaCodeByParentId",
                            opt:{parentId: id},
                            id:id
                        }
                        this.addData(options)
                    }
                }
            });

        })*/

        $("form").on("input propertychange",".number",function(){
            var val= parseInt($(this).val());
            if(val<0){
                $(this).val(0)
                return
            }
            if(val > 1000000000000){
                $(this).val(1000000000000)
            }
        })


        $("#cancel").on("click",function(){
            top.layer.closeAll();
        })

        $("#sure").on("click",function(){
            if($("input[name='xzqh_code']").val() == ""){
                layer.tips("请选择行政区划",$("#sTree"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                })
                return
            }

            var mark= true;
            var count= 0;
            $(".number").each(function(){
            	if($(this)[0].name!="hjage_one"){
            		 if($(this).val()== ""){
                         $(this).val(0)
                     }
                     count+= parseInt($(this).val())
            	}
            })
            $("input[name='totalCount']").val(count)

            var formData= $("#form").serializeArray()
			console.log(formData);
            layer.load(2);
            $.ajax({
                type:"POST",
                url:"<%=basePath%>fixedStatistics/addOrupdateSixtenReport",
                data:formData,
                success:function(data){
                	layer.closeAll("loading");
                   console.log(data);
                   if(data.code == 10000){
                	   top.layer.trasmit.location.reload();
                	   top.layer.closeAll();
                   }else{
                	   top.layer.msg(data.desc,{
                		   icon:2,
                		   shift:6
                	   })
                   }
                },
                error:function(e) {
                    alert("出错："+e);
                }
            });
        })
    })
</script>
</body>
</html>