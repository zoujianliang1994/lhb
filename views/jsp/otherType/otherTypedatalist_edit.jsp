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
                <span class="title-word"> 全省：</span>老年病医院<div class="layui-input-block f1"><input type="text" name="old-hospital" id="old-hospital"></div><span class="unit">个</span>
                老年病门诊<div class="layui-input-block f1"><input type="text" name="old-outpatient" id="old-outpatient"></div><span class="unit">个</span>
                老年病床位
                <div class="layui-input-block f1"><input type="text" name="old-bed" id="old-bed"></div><span class="unit">个</span>
                组建医生团队
                <div class="layui-input-block f1"><input type="text" name="doc-team" id="doc-team"></div><span class="unit">个</span>
                全科医生<div class="layui-input-block f1"><input type="text" name="general-doc" id="general-doc"></div><span class="unit">个</span>

                签约老人<div class="layui-input-block f1"><input type="text" name="contract-old" id="contract-old"></div><span class="unit">个</span>
                养老机构总数<div class="layui-input-block f1"><input type="text" id="pension-total" name="pension-total"></div><span class="unit">个</span>

                签约养老机构<div class="layui-input-block f1"><input type="text" id="contract-pension" name="contract-pension"></div><span class="unit">个</span>
                提供服务<div class="layui-input-block f1"><input type="text" id="provide-server" name="provide-server"></div><span class="unit">次</span>

                老年医疗护理从业人员<div class="layui-input-block f1"><input type="text" name="loot-after-old" id="look-after-old"></div><span class="unit">人</span>
                （医生<div class="layui-input-block f1"><input type="text" name="doc" id="doc"></div><span class="unit">人</span>

                护士<div class="layui-input-block f1"><input type="text" name="nurse" id="nurse"></div><span class="unit">人</span>

                护工<div class="layui-input-block f1"><input type="text" name="care-worker" id="care-worker"></div><span class="unit">人）</span>

                同比增长<div class="layui-input-block f1"><input type="text" id="growth-rate" name="growth-rate"></div><span class="unit">%</span>

                社区管理60岁及以上严重精神障碍患者 <div class="layui-input-block f1"><input type="text" id="mental-disorders" name="mental-disorders"></div><span class="unit">人</span>

                65岁及以上老年人建立健康档案<div class="layui-input-block f1"><input type="text" id="health-records" name="health-records"></div><span class="unit">人</span>

                65岁及以上老年人免费体检<div class="layui-input-block f1"><input type="text" id="free-medical-examination" name="free-medical-examination"></div><span class="unit">人</span>

                免费体检金额<div class="layui-input-block f1"><input type="text" id="free-money" name="free-money"></div><span class="unit">元</span>

                90岁及以上老年人免费体检  <div class="layui-input-block f1"><input type="text" id="old-free-medical-examination" name="old-free-medical-examination"></div><span class="unit">人</span>

                免费体检金额<div class="layui-input-block f1"><input type="text" id="old-free-money" name="old-free-money"></div><span class="unit">元</span>

                当年全省计划生育奖励扶助总数<div class="layui-input-block f1"><input type="text" name="reward-assistance-total" id="reward-assistance-total"></div><span class="unit">人次</span>

                发放奖励扶助金 <div class="layui-input-block f1"><input type="text" name="reward-assistance-money" id="reward-assistance-money"></div><span class="unit">亿元</span>

                国家奖励扶助<div class="layui-input-block f1"><input type="text" name="county-reward-assistance" id="county-reward-assistance"></div><span class="unit">人</span>

                省级奖励扶助<div class="layui-input-block f1"><input type="text"  name="provincial-reward-assistance" id="provincial-reward-assistance"></div><span class="unit">人</span>

                市级奖励扶助<div class="layui-input-block f1"><input type="text" name="city-reward-assistance" id="city-reward-assistance"></div><span class="unit">人</span>

                计划生育特别扶助  <div class="layui-input-block f1"><input type="text" id="especially-assistant" name="especially-assistant"></div><span class="unit">人</span>

                扶助总金额<div class="layui-input-block f1"><input type="text" id="assistant-total-money" name="assistant-total-money"></div><span class="unit">元</span>

                扶助标准<div class="layui-input-block f1"><input type="text" id="assistant-standard" name="assistant-standard"></div><span class="unit">元/年</span>


                农村独生子家庭父母补贴标准  <div class="layui-input-block f1"><input type="text" id="rural-subsidy-standard"></div><span class="unit">元/人</span>

                独生子女死亡家庭父母<div class="layui-input-block f1"><input type="text" id="death-child-standard"></div><span class="unit">元/人年</span>
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

