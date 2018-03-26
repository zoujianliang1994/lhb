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

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">省财政下发福彩公益金(万元)：</label>
                    <div class="layui-input-block">
                        <input  name="money" id="money" placeholder="这里输入数字" value="${pd.areaName}" type="text" placeholder="请输入角色名"
                               class="layui-input">
                    </div>
                </div>

            </div>
        </div>

        <blockquote class="layui-elem-quote">养老机构信息</blockquote>
        <div class="pension-info">
            <div class="layui-form-item">
                <label class="layui-form-label pension-label">四川省：</label>
                <div class="layui-row">
                    <div class="layui-col-xs3 layui-col-sm3 layui-col-md3">
                        <label class="layui-form-label">养老机构</label>
                        <div class="layui-input-block">
                            <input  name="provincial-pension" id="provincial-pension" placeholder="这里输入数据" value="" type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label">所</label>
                    </div>

                    <div class="layui-col-xs3 layui-col-sm3 layui-col-md3">
                        <label class="layui-form-label">床位总数</label>
                        <div class="layui-input-block">
                            <input  name="provincial-bed" id="provincial-bed" placeholder="这里输入数据" value="${pd.areaName}" type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label">张</label>
                    </div>
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">平均每千名老人拥有床位</label>
                        <div class="layui-input-block">
                            <input  name="have-bed" id="have-bed" placeholder="这里输入数据" value="${pd.areaName}" type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label">张</label>
                    </div>

                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label pension-label">国办：</label>
                <div class="layui-row">
                    <div class="layui-col-xs3 layui-col-sm3 layui-col-md3">
                        <label class="layui-form-label">养老机构</label>
                        <div class="layui-input-block">
                            <input  name="country-pension" id="country-pension" placeholder="这里输入数据" value="" type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label">所</label>
                    </div>

                    <div class="layui-col-xs3 layui-col-sm3 layui-col-md3">
                        <label class="layui-form-label">床位总数</label>
                        <div class="layui-input-block">
                            <input  name="country-bed" id="country-bed" placeholder="这里输入数据" value="${pd.areaName}" type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label">张</label>
                    </div>
                    <div class="layui-col-xs3 layui-col-sm3 layui-col-md3">
                        <label class="layui-form-label">农村敬老院</label>
                        <div class="layui-input-block">
                            <input  name="rural-pension" id="rural-pension" placeholder="这里输入数据" value="${pd.areaName}" type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label">所</label>
                    </div>
                    <div class="layui-col-xs3 layui-col-sm3 layui-col-md3">
                        <label class="layui-form-label">床位总数</label>
                        <div class="layui-input-block">
                            <input  name="rural-bed" id="rural-bed" placeholder="这里输入数据" value="${pd.areaName}" type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label">张</label>
                    </div>

                </div>
            </div>

            <div class="layui-form-item">

                <label class="pension-label layui-col-xs6 layui-col-sm6 layui-col-md6">公建民营：</label>
                <label class="pension-label layui-col-xs6 layui-col-sm6 layui-col-md6">民建民营：</label>

                <div class="layui-row">
                    <div class="layui-col-xs3 layui-col-sm3 layui-col-md3">
                        <label class="layui-form-label">养老机构</label>
                        <div class="layui-input-block">
                            <input  name="public-construction-private-pension" id="public-construction-private-pension" placeholder="这里输入数据" value="" type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label">所</label>
                    </div>

                    <div class="layui-col-xs3 layui-col-sm3 layui-col-md3">
                        <label class="layui-form-label">床位总数</label>
                        <div class="layui-input-block">
                            <input  name="public-construction-private-bed" id="public-construction-private-bed" placeholder="这里输入数据" value="${pd.areaName}" type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label">张</label>
                    </div>
                    <div class="layui-col-xs3 layui-col-sm3 layui-col-md3">
                        <label class="layui-form-label">养老机构</label>
                        <div class="layui-input-block">
                            <input  name="civilian-owned-private-enterprises-pension" id="civilian-owned-private-enterprises-pension" placeholder="这里输入数据" value="" type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label">所</label>
                    </div>

                    <div class="layui-col-xs3 layui-col-sm3 layui-col-md3">
                        <label class="layui-form-label">床位总数</label>
                        <div class="layui-input-block">
                            <input  name="civilian-owned-private-enterprises-bed" id="civilian-owned-private-enterprises-bed" placeholder="这里输入数据" value="${pd.areaName}" type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label">张</label>
                    </div>

                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-row">
                <label class="pension-label layui-col-xs6 layui-col-sm6 layui-col-md6">新建和改造</label>
                <label class="pension-label layui-col-xs6 layui-col-sm6 layui-col-md6">改造公办：</label>
                </div>
                <div class="layui-row">
                    <div class="layui-col-xs3 layui-col-sm3 layui-col-md3">
                        <label class="layui-form-label">养老机构</label>
                        <div class="layui-input-block">
                            <input  name="new-retrofit-pension" id="new-retrofit-pension" placeholder="这里输入数据" value="" type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label">所</label>
                    </div>

                    <div class="layui-col-xs3 layui-col-sm3 layui-col-md3">
                        <label class="layui-form-label">床位总数</label>
                        <div class="layui-input-block">
                            <input  name="new-retrofit-bed" id="new-retrofit-bed" placeholder="这里输入数据" value="${pd.areaName}" type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label">张</label>
                    </div>
                    <div class="layui-col-xs3 layui-col-sm3 layui-col-md3">
                        <label class="layui-form-label">养老机构</label>
                        <div class="layui-input-block">
                            <input  name="retrofit-public-office-pension" id="retrofit-public-office-pension" placeholder="这里输入数据" value="" type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label">所</label>
                    </div>

                    <div class="layui-col-xs3 layui-col-sm3 layui-col-md3">
                        <label class="layui-form-label">床位总数</label>
                        <div class="layui-input-block">
                            <input  name="retrofit-public-office-bed" id="retrofit-public-office-bed" placeholder="这里输入数据" value="${pd.areaName}" type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label">张</label>
                    </div>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-row">
                    <label class="pension-label layui-col-xs6 layui-col-sm6 layui-col-md6">新增民办：</label>
                    <label class="pension-label layui-col-xs6 layui-col-sm6 layui-col-md6">新增公办：</label>
                </div>
                <div class="layui-row">
                    <div class="layui-col-xs3 layui-col-sm3 layui-col-md3">
                        <label class="layui-form-label">养老机构</label>
                        <div class="layui-input-block">
                            <input  name="new-private-office-pension" id="new-private-office-pension" placeholder="这里输入数据" value="" type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label">所</label>
                    </div>

                    <div class="layui-col-xs3 layui-col-sm3 layui-col-md3">
                        <label class="layui-form-label">床位总数</label>
                        <div class="layui-input-block">
                            <input  name="new-private-office-bed" id="new-private-office-bed" placeholder="这里输入数据" value="${pd.areaName}" type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label">张</label>
                    </div>
                    <div class="layui-col-xs3 layui-col-sm3 layui-col-md3">
                        <label class="layui-form-label">养老机构</label>
                        <div class="layui-input-block">
                            <input  name="new-public-office-pension" id="new-public-office-pension" placeholder="这里输入数据" value="" type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label">所</label>
                    </div>

                    <div class="layui-col-xs3 layui-col-sm3 layui-col-md3">
                        <label class="layui-form-label">床位总数</label>
                        <div class="layui-input-block">
                            <input  name="new-public-office-bed" id="new-public-office-bed" placeholder="这里输入数据" value="${pd.areaName}" type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label">张</label>
                    </div>
                </div>
            </div>



        </div>
        <blockquote class="layui-elem-quote">日照中心信息</blockquote>
        <div class="pension-info">
            <div class="layui-form-item">
                <div class="layui-row">
                <label class="pension-label layui-col-xs4 layui-col-sm4 layui-col-md4">四川省：</label>
                <label class="pension-label layui-col-xs4 layui-col-sm4 layui-col-md4">城市：</label>
                <label class="pension-label layui-col-xs4 layui-col-sm4 layui-col-md4">农村：</label>
                </div>
                <div class="layui-row">
                    <div class="layui-col-xs4 layui-col-sm4 layui-col-md4">

                        <label class="layui-form-label">日照中心</label>
                        <div class="layui-input-block">
                            <input  name="provincial-center" id="provincial-center" placeholder="这里输入数据" value="" type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label">所</label>
                    </div>

                    <div class="layui-col-xs4 layui-col-sm4 layui-col-md4">

                        <label class="layui-form-label">日照中心</label>
                        <div class="layui-input-block">
                            <input  name="city-cenyer" id="city-cenyer" placeholder="这里输入数据" value="${pd.areaName}" type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label">所</label>
                    </div>
                    <div class="layui-col-xs4 layui-col-sm4 layui-col-md4">

                        <label class="layui-form-label">日照中心</label>
                        <div class="layui-input-block">
                            <input  name="rural-cenyer" id="rural-cenyer" placeholder="这里输入数据" value="${pd.areaName}" type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label">所</label>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-row">
                    <label class="pension-label layui-col-xs4 layui-col-sm4 layui-col-md4">四川省新增：</label>
                    <label class="pension-label layui-col-xs4 layui-col-sm4 layui-col-md4">城市：</label>
                    <label class="pension-label layui-col-xs4 layui-col-sm4 layui-col-md4">农村：</label>
                </div>
                <div class="layui-row">
                    <div class="layui-col-xs4 layui-col-sm4 layui-col-md4">

                        <label class="layui-form-label">日照中心</label>
                        <div class="layui-input-block">
                            <input  name="provincial-add-center" id="provincial-add-center" placeholder="这里输入数据" value="" type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label">所</label>
                    </div>

                    <div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
                        <label class="layui-form-label">日照中心</label>
                        <div class="layui-input-block">
                            <input  name="city-add-cenyer" id="city-add-cenyer" placeholder="这里输入数据" value="${pd.areaName}" type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label">所</label>
                    </div>
                    <div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
                        <label class="layui-form-label">日照中心</label>
                        <div class="layui-input-block">
                            <input  name="rural-add-cenyer" id="rural-add-cenyer" placeholder="这里输入数据" value="${pd.areaName}" type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label">所</label>
                    </div>
                </div>
            </div>
        </div>
        <blockquote class="layui-elem-quote">社区养老院信息</blockquote>
        <div class="word-info">
            建成社区养老院<div class="layui-input-block f1"><input type="text" name="pension-num" id="pension-num"></div><span class="unit">所</span>床位总数<div class="layui-input-block f1" name="bed-num" id="bed-num"><input type="text"></div><span class="unit">张</span>
            为困难家庭失能老人和80周岁以上老人提供居家养老服务<div class="layui-input-block f1"><input type="text"name="pension-service" id="pension-service"></div><span class="unit">人</span>
            全省老年人设施总用地面积<div class="layui-input-block f1" name="facilities-area" id="facilities-area"><input type="text"></div><span class="unit">公顷</span>
        </div>
        <blockquote class="layui-elem-quote">有待津贴信息</blockquote>
        <div class="word-info">
           <span class="title-word"> 四川省：</span>享受低保老年人<div class="layui-input-block f1" name="old-dibao" id="old-dibao"><input type="text"></div><span class="unit">人</span>占全省低保对象总数<div class="layui-input-block f1"><input type="text" name="dibao-total"></div><span class="unit">%</span>
            <span class="title-word"> 城市：</span>
            <div class="layui-input-block f1"><input type="text" name="city-people"id="city-people"></div><span class="unit">人</span>
            <span class="title-word">农村：</span>
            <div class="layui-input-block f1"><input type="text" name="rural-people"id="rural-people"></div><span class="unit">人</span>补差标准<div class="layui-input-block f1"><input type="text" name="standard" id="standard"></div><span class="unit">元</span>

            城市低保<div class="layui-input-block f1"><input type="text" id="city-dibao" name="city-dibao"></div><span class="unit">元/月</span>

            农村低保<div class="layui-input-block f1"><input type="text" id="rural-dibao" name="rural-dibao"></div><span class="unit">元/月</span>


            全年为老人提供低保总额<div class="layui-input-block f1"><input type="text" id="dibao-total" name="dibao-total"></div><span class="unit">万元</span>

            享受农村“五保”老年人<div class="layui-input-block f1"><input type="text" id="rural-wubao-old" name="rural-wubao-old"></div><span class="unit">人</span>

            为农村五保老年人提供生活补贴达<div class="layui-input-block f1"><input type="text" name="rural-wubao-subsidy" id="rural-wubao-subsidy"></div><span class="unit">万元</span>

            集中供养<div class="layui-input-block f1"><input type="text" id="focus-support" name="focus-support"></div><span class="unit">人</span>

            集中供养平均标准为<div class="layui-input-block f1"><input type="text"id="focus-support-standard" name="focus-support-standard"></div><span class="unit">元/人月</span>

            分散供养<div class="layui-input-block f1"><input type="text" name="dispersion-support" id="dispersion-support"></div><span class="unit">人</span>

            分散供养平均标准为<div class="layui-input-block f1"><input type="text"name="dispersion-support-standard" id="dispersion-support-standard"></div><span class="unit">元/人月</span>

            城镇“三无”老年人<div class="layui-input-block f1"><input type="text" id="sanwu-old"name="sanwu-old"></div><span class="unit">人</span>

            集中供养<div class="layui-input-block f1"><input type="text"id="city-focus-support" name="city-focus-support"></div><span class="unit">人</span>

            分散供养<div class="layui-input-block f1"><input type="text"name="city-dispersion-support" id="city-dispersion-support"></div><span class="unit">人</span>

            供养补贴<div class="layui-input-block f1"><input type="text" name="support-subsidy" id="support-subsidy"></div><span class="unit">元/人月</span>
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

