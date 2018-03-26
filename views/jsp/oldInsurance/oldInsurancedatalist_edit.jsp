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

    </style>
</head>
<body >
<div class="edit_menu" class="disnone">

    <form action="affairs/${msg}.do" class="layui-form"  name="form1" id="form1" >
        <input type="hidden" name="id" id="id" value="${pd.id}" />

        <div class="layui-form-item">
            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">提交人：</label>
                    <div class="layui-input-block">
                        <input  name="submit-people" id="submit-people" placeholder="这里输入姓名" value="${pd.applyName}" type="text" placeholder="请输入角色名"
                                class="layui-input">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">提交处室：</label>
                    <div class="layui-input-block">
                        <input  name="submit-office" id="submit-office" placeholder="这里输入处室" value="${pd.applyUnitName}" type="text" placeholder="请输入角色名"
                                class="layui-input">
                    </div>
                </div>

            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-row">
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">提交单位：</label>
                    <div class="layui-input-block">
                        <input  name="submit-department" id="submit-department" placeholder="这里输入单位" value="" type="text" placeholder="请输入角色名"
                                class="layui-input">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">提交日期：</label>
                    <div class="layui-input-block">
                        <input  name="submit-date" id="submit-date" placeholder="这里输入日期" value="${pd.areaName}" type="text" placeholder="请输入角色名"
                                class="layui-input">
                    </div>
                </div>

            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-row">
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">数据年份：</label>
                    <div class="layui-input-block">
                        <input  name="data-date" id="data-date" placeholder="这里输入年份" value="" type="text" placeholder="请输入角色名"
                                class="layui-input">
                    </div>
                </div>

            </div>
        </div>

        <blockquote class="layui-elem-quote">填表信息</blockquote>
        <div class="word-info">
            <div class="word-info">
                <span class="title-word"> 全省：</span>
                参加城镇企业职工基本养老保险的退休人员<div class="layui-input-block f1"><input type="text" id="retirees" name="retirees"></div><span class="unit">人</span>
                月平均养老金<div class="layui-input-block f1"><input type="text" name="month-pension-money" id="money-pension-money"></div><span class="unit">元</span>
                领取养老金失地农民<div class="layui-input-block f1"><input type="text" id="receive-money-farmers" name="receive-money-farmers"></div><span class="unit">人</span>
                月平均领养老金<div class="layui-input-block f1"><input type="text" id="month-receive-money"></div><span class="unit">元</span>
                享受城乡居民养老保险（新农保）养老金<div class="layui-input-block f1"><input type="text" id="city-pension" name="city-pension"></div><span class="unit">人</span>

                养老金月平均数<div class="layui-input-block f1"><input type="text" name="pension-money-month" id="pension-money-month"></div><span class="unit">元</span>
                参保覆盖率达到<div class="layui-input-block f1"><input type="text" id="cover-rate" name="cover-rate"></div><span class="unit">%</span>

                全省养老保险基金总收入<div class="layui-input-block f1"><input type="text" id="pension-insurance-total" name="pension-insurance-total"></div><span class="unit">亿元</span>
                同比增长<div class="layui-input-block f1"><input type="text" id="increase-rate" name="increase-rate"></div><span class="unit">%</span>

                全省养老保险基金支出<div class="layui-input-block f1"><input type="text" id="pension-insurance-outlay" name="pension-insurance-outlay"></div><span class="unit">亿元</span>
                同比增长<div class="layui-input-block f1"><input type="text" name="outlay-increase-rate" id="outlay-increase-rate"></div><span class="unit">%</span>

                参加城镇职工基本医疗保险退休人员<div class="layui-input-block f1"><input type="text" name="insurance-retirees" id="insurance-retirees"></div><span class="unit">人</span>

                发生医疗费用<div class="layui-input-block f1"><input type="text" name="retirees-money" id="retirees-money"></div><span class="unit">元</span>

                参加城乡居民基本医疗保险参保的老年人<div class="layui-input-block f1"><input type="text" name="insurance-old" id="insurance-old"></div><span class="unit">人</span>

                参保率<div class="layui-input-block f1"><input type="text" id="insured-rate" name="insured-rate"></div><span class="unit">%</span>

                老年人发生了住院医疗费用<div class="layui-input-block f1"><input type="text" id="old-hospitalzation-money" name="old-hospitalization-money"></div><span class="unit">人次</span>

                基本医疗保险发生医疗费用<div class="layui-input-block f1"><input type="text" name="basic-insurance-money" id="basic-insurance-money"></div><span class="unit">元</span>

                基本保险报销金额<div class="layui-input-block f1"><input type="text" name="basic-reimbursement-money" id="basic-reimbursement-money"></div><span class="unit">元</span>

                大病医疗互助补充保险报  <div class="layui-input-block f1"><input type="text" name="serious-illness-reimbursement" id="serious-illness-reimbursement"></div><span class="unit">元</span>

                城乡大病保险报销<div class="layui-input-block f1"><input type="text" id="city-serious-insurance-money" name="city-serious-insurance-money"></div><span class="unit">元</span>

                个人负担<div class="layui-input-block f1"><input type="text" id="personal-payment" name="personal-payment"></div><span class="unit">元</span>
            </div>

        </div>

    </form>
    <div class="btnbox" >
        <c:if test="${pd.types=='0'}">
            <button id="sure" class="layui-btn layui-btn-primary layui-btn-small">提交</button>
        </c:if>
        <button id="cancel" class="layui-btn layui-btn-primary layui-btn-small">取消</button>
    </div>
</div>


<!-- 页面底部js¨ -->
<%@ include file="../system/index/foot.jsp"%>

<!--提示框-->
<script type="text/javascript">

    var sum ="&selAreaCode=${pd.selAreaCode}&selApplyYear=${pd.selApplyYear}&selAreaName=${pd.selAreaName}&selApplyAnnual=${pd.selApplyAnnual }";

    if("${pd.types}"=="1"){

        $.formToDiv(true);
    }
    function typeControl(control) {
        if(control == "1"){
            $("#law_type_block").hide();

        }else{
            $("#law_type_block").show()
        }

    }
    layui.use('laydate', function () {
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#data-date'
            ,type: 'year'
        })
        laydate.render({
            elem: '#submit-date'
        })
    });
    $(document).ready(function(){
        var form= layui.form;
        typeControl(${pd.type});

        $("#sure").on("click",function(){
            if ($("#applyYear").val() == "") {
                layer.tips('请检查输入数据',  $("#applyYear"), {
                    tips: [4, '#D16E6C'],
                    time: 4000
                });
                $("#applyYear").focus();
                return false;
            }

            if ($("#mcgysyclcs").val() == ""||isNaN($("#mcgysyclcs").val())||$("#mcgysyclcs").val()<0) {
                layer.tips('请检查输入数据',  $("#mcgysyclcs"), {
                    tips: [4, '#D16E6C'],
                    time: 4000
                });
                $("#mcgysyclcs").focus();
                return false;
            }

            if ($("#xsbzfwbtzrs").val() == ""||isNaN($("#xsbzfwbtzrs").val())||$("#xsbzfwbtzrs").val()<0) {
                layer.tips('请检查输入数据',  $("#xsbzfwbtzrs"), {
                    tips: [4, '#D16E6C'],
                    time: 4000
                });
                $("#xsbzfwbtzrs").focus();
                return false;
            }
            if ($("#xsbzfwbtzje").val() == ""||isNaN($("#xsbzfwbtzje").val())||$("#xsbzfwbtzje").val()<0) {
                layer.tips('请检查输入数据',  $("#xsbzfwbtzje"), {
                    tips: [4, '#D16E6C'],
                    time: 4000
                });
                $("#xsbzfwbtzje").focus();
                return false;
            }


            var page ="${pd.currentPage}";

            $("#form1").ajaxSubmit({
                type: 'post',
                success: function(data) {
                    if ("success" == data.msg) {
                        parent.layer.transmit.location.href = "<%=basePath%>affairs/list.do?currentPage=" + page+sum;
                        parent.layer.closeAll();
                    } else if ("error" == data.msg) {
                        layer.msg('系统异常,保存失败!', {icon: 5});
                    } else if("false" == data.msg){
                        layer.msg('相同类型数据已存在!', {icon: 5});
                    }
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

