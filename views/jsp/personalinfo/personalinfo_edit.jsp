<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>老龄人口编辑</title>
    <%@ include file="../system/index/headcss.jsp" %>
</head>
<style>
    .edit_menu {
        padding: 10px 20px
    }

    .layui-form-label {
        width: 120px
    }

    .layui-input-block {
        margin-left: 150px;
    }

    .layui-tab-item {
        width: 100%;
    }

    .layui-tab-title li {
        font-size: 13px
    }

    .layui-tab-content {
        margin-top: 10px
    }

    html {
        font-size: 13px
    }
</style>
<body>
<div class="edit_menu">

    <div class="layui-tab" lay-filter="tab">
        <ul class="layui-tab-title">
            <li class="layui-this" lay-id="0">人员属性信息</li>
            <c:if test="${pd.TYPE== '1'||pd.TYPE== '2'}">
                <li lay-id="1">意外保险信息</li>
                <li lay-id="2">养老服务补贴信息</li>
                <li lay-id="3">护理补贴信息</li>
                <li lay-id="4">高龄津贴信息</li>
            </c:if>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <form action="${msg}.do" class="layui-form" id="editForm" lay-filter="editForm" method="post">
                    <input type="hidden" value="${pd.personal_info_id}" name="personal_info_id" id="personal_info_id"/>
                    <input type="hidden" value="${pd.ywlx}" name="ywlx" id="ywlx"/>
                    <input type="hidden" value="${pd.first_xzqh}" name="first_xzqh" id="first_xzqh"/>
                    <blockquote class="layui-elem-quote">基础信息</blockquote>
                    <div class="layui-form-item">
                        <div class="layui-row">

                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                                <label class="layui-form-label"><i class="require">*</i>姓名：</label>
                                <div class="layui-input-block">
                                    <input type="text" value="${pd.xm }" name="xm" id="xm" required lay-verify="required" placeholder="请输入姓名"
                                           autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>

                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                                <label class="layui-form-label"><i class="require">*</i>身份证号：</label>
                                <input type="hidden" value="${pd.sfz}" name="sfz_old" id="sfz_old"/>
                                <div class="layui-input-block">
                                    <input type="text" value="${pd.sfz }" name="sfz" id="sfz" required lay-verify="required" placeholder="请输入身份证号"
                                           autocomplete="off"
                                           class="layui-input" maxlength="18">
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-row">

                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                                <label class="layui-form-label">年龄：</label>
                                <div class="layui-input-block">
                                    <input type="text" value="${pd.age }" name="age" id="age" readonly style="background-color: #f2f2f2"
                                           autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>

                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                                <label class="layui-form-label">性别：</label>
                                <div class="layui-input-block">
                                    <input id="r0" type="radio" name="xb" value="2" title="男" <c:if test="${pd.xb == 2 }">checked</c:if>>
                                    <input id="r1" type="radio" name="xb" value="1" title="女" <c:if test="${pd.xb == 1 }">checked</c:if>>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-row">

                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                                <label class="layui-form-label">民族：</label>
                                <div class="layui-input-block">
                                    <html:select id="mz" name="mz" classs="layui-input-inline">
                                        <html:options collection="Person_mz" defaultValue="${pd.mz}"></html:options>
                                    </html:select>
                                </div>
                            </div>


                        </div>
                    </div>
                    <div class="layui-form-item">

                        <div class="layui-row">

                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                                <label class="layui-form-label"><i class="require">*</i>户籍地址：</label>
                                <div class="layui-input-block">
                                    <input type="text" value="${pd.hjdz }" name="hjdz" id="hjdz" required lay-verify="required" placeholder="请输入户籍地址"
                                           autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>

                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                                <label class="layui-form-label"><i class="require">*</i>常住地址：</label>
                                <div class="layui-input-block">
                                    <input type="text" value="${pd.czdz }" name="czdz" id="czdz" required lay-verify="required" placeholder="请输入常住地址"
                                           autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>

                        </div>
                    </div>

                    <blockquote class="layui-elem-quote">扩展信息</blockquote>
                    <div class="layui-form-item">
                        <div class="layui-row">

                            <div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
                                <label class="layui-form-label">人员类别：</label>
                                <div class="layui-input-block">
                                    <html:checkbox name="type" collection="personnel_categories" defaultValue="${pd.type}"></html:checkbox>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-row">
                            <div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
                                <label class="layui-form-label">经济来源：</label>
                                <div class="layui-input-block">
                                    <html:checkbox name="jjly" collection="economic_source" defaultValue="${pd.jjly}"></html:checkbox>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-row">
                            <div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
                                <label class="layui-form-label">参保情况：</label>
                                <div class="layui-input-block">
                                    <html:checkbox name="cbqk" collection="insured_situation" defaultValue="${pd.cbqk}"></html:checkbox>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-row">
                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                                <label class="layui-form-label">自理能力：</label>
                                <div class="layui-input-block">
                                    <html:select name="zlll" classs="layui-input-inline">
                                        <html:options collection="self_care" defaultValue="${pd.zlll}"></html:options>
                                    </html:select>

                                </div>
                            </div>


                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                                <label class="layui-form-label">健康状况：</label>
                                <div class="layui-input-block">
                                    <html:select name="jkzk" classs="layui-input-inline">
                                        <html:options collection="health_condition" defaultValue="${pd.jkzk}"></html:options>
                                    </html:select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-row">
                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                                <label class="layui-form-label">居住状况：</label>
                                <div class="layui-input-block">
                                    <html:select name="jzzk" classs="layui-input-inline">
                                        <html:options collection="living_condition" defaultValue="${pd.jzzk}"></html:options>
                                    </html:select>
                                </div>
                            </div>

                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                                <label class="layui-form-label"><i class="require">*</i>行政区划：</label>
                                <input type="hidden" value="${pd.xzqh_code}" name="xzqh_code" id="SZQY_CODE"/>
                                <input type="hidden" value="${pd.xzqh}" name="xzqh" id="SZQY">
                                <div class="layui-input-block sTree" id="sTree">
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="layui-form-item">

                        <div class="layui-row">
                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                                <label class="layui-form-label">社保账号：</label>
                                <div class="layui-input-block">
                                    <input type="text" value="${pd.sbzh }" name="sbzh" id="sbzh" required lay-verify="required" placeholder="请输入社保账号"
                                           autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>

                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                                <label class="layui-form-label">银行开户行、账号：</label>
                                <div class="layui-input-block">
                                    <input type="text" value="${pd.yhzh}" name="yhzh" id="yhzh" required lay-verify="required" placeholder="请输入银行账号及开户行名称"
                                           autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="layui-form-item">
                        <div class="layui-row">
                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                                <label class="layui-form-label">养老方式：</label>

                                <div class="layui-input-block">
                                    <html:select name="ylfs" classs="layui-input-inline">
                                        <html:options collection="ylfs" defaultValue="${pd.ylfs}"></html:options>
                                    </html:select>
                                </div>

                            </div>

                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                                <label class="layui-form-label">养老机构：</label>
                                <div class="layui-input-block">
                                    <input type="hidden" value="${pd.jg_id}" name="jg_id" id="jg_id"/>
                                    <input type="text" value="${pd.yljg}" name="yljg" id="yljg" required lay-verify="required"
                                           placeholder="请输入入住养老机构名称"
                                           autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-row">

                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md6 ">
                                <label class="layui-form-label">是否购买意外保险：</label>
                                <div class="layui-input-block">
                                    <html:select name="ywsh" classs="layui-input-inline">
                                        <html:options collection="sf" defaultValue="${pd.ywsh}"></html:options>
                                    </html:select>
                                </div>
                            </div>

                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md6 ">
                                <label class="layui-form-label">购买意外保险方式：</label>
                                <div class="layui-input-block">
                                    <html:select name="ywsh_type" classs="layui-input-inline">
                                        <html:options collection="ywsh_type" defaultValue="${pd.ywsh_type}"></html:options>
                                    </html:select>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-row">

                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                                <label class="layui-form-label">是否参加老年大学：</label>
                                <div class="layui-input-block">
                                    <html:select name="is_lndx" classs="layui-input-inline">
                                        <html:options collection="sf" defaultValue="${pd.is_lndx}"></html:options>
                                    </html:select>
                                </div>
                            </div>

                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                                <label class="layui-form-label">老年大学：</label>
                                <div class="layui-input-block">
                                    <input type="text" value="${pd.lndx}" name="lndx" id="lndx" required lay-verify="required" placeholder="请输入老年大学名称"
                                           autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-row">

                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                                <label class="layui-form-label">是否参加老年协会：</label>
                                <div class="layui-input-block">
                                    <html:select name="is_lnxh" classs="layui-input-inline">
                                        <html:options collection="sf" defaultValue="${pd.is_lnxh}"></html:options>
                                    </html:select>
                                </div>
                            </div>

                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                                <label class="layui-form-label">老年协会：</label>
                                <div class="layui-input-block">
                                    <input type="text" value="${pd.lnxh}" name="lnxh" id="lnxh" required lay-verify="required" maxlength="20"
                                           placeholder="请输入老年协会名称"
                                           autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-row">
                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                                <label class="layui-form-label">是否建立健康档案：</label>
                                <div class="layui-input-block">
                                    <html:select name="is_jlda" classs="layui-input-inline">
                                        <html:options collection="sf" defaultValue="${pd.is_jlda}"></html:options>
                                    </html:select>
                                </div>
                            </div>
                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                                <label class="layui-form-label">健康档案编号：</label>
                                <div class="layui-input-block">
                                    <input type="text" value="${pd.dabh}" name="dabh" id="dabh" required lay-verify="required" placeholder="请输入健康档案编号"
                                           autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-row">
                            <div class="layui-col-xs12 layui-col-sm12 layui-col-md12 label-long">
                                <label class="layui-form-label ">享受养老服务补贴开始日期 ：</label>
                                <div class="layui-input-block ">
                                    <input type="text" value="${pd.ylbt_begin}" name="ylbt_begin" id="ylbt_begin" required lay-verify="required"
                                           placeholder="请输入养老服务补贴开始日期"
                                           autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-row">
                            <div class="layui-col-xs12 layui-col-sm12 layui-col-md12 label-long">
                                <label class="layui-form-label">享受养老服务补贴金额(元/月)：</label>
                                <div class="layui-input-block">
                                    <input type="number" value="${pd.ylbt_je}" name="ylbt_je" id="ylbt_je" required lay-verify="required"
                                           placeholder="请输入养老服务补贴金额"
                                           autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-row">
                            <div class="layui-col-xs12 layui-col-sm12 layui-col-md12 label-long">
                                <label class="layui-form-label">享受护理补贴开始日期：</label>
                                <div class="layui-input-block">
                                    <input type="text" value="${pd.hlbt_begin}" name="hlbt_begin" id="hlbt_begin" required lay-verify="required"
                                           placeholder="请输入护理补贴开始日期"
                                           autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-row">
                            <div class="layui-col-xs12 layui-col-sm12 layui-col-md12 label-long">
                                <label class="layui-form-label">享受护理补贴金额(元/月)：</label>
                                <div class="layui-input-block">
                                    <input type="number" value="${pd.hlbt_je}" name="hlbt_je" id="hlbt_je" required lay-verify="required"
                                           placeholder="请输入护理补贴金额"
                                           autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-row">
                            <div class="layui-col-xs12 layui-col-sm12 layui-col-md12 label-long">
                                <label class="layui-form-label">领取高龄津贴开始日期：</label>
                                <div class="layui-input-block">
                                    <input type="text" value="${pd.gljt_begin}" name="gljt_begin" id="gljt_begin" required lay-verify="required"
                                           placeholder="请输入高龄津贴开始日期"
                                           autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-row">
                            <div class="layui-col-xs12 layui-col-sm12 layui-col-md12 label-long">
                                <label class="layui-form-label">领取高龄津贴金额(元/月)：</label>
                                <div class="layui-input-block">
                                    <input type="number" value="${pd.gljt_je}" name="gljt_je" id="gljt_je" required lay-verify="required"
                                           placeholder="请输入高龄津贴金额"
                                           autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
            <%--意外保险--%>
            <c:if test="${pd.TYPE== '1'||pd.TYPE== '2'}">
                <div class="layui-tab-item">
                    <table class="layui-table center">
                        <colgroup>
                            <col width="150">
                            <col width="200">
                            <col>
                        </colgroup>
                        <thead>
                        <tr>
                            <th colspan="4">投保保险公司</th>
                        </tr>
                        <tr>
                            <th>投保保险公司</th>
                            <th>保费金额（元）</th>
                            <th>保险金额（元）</th>
                            <th>保险生效日期</th>
                        </tr>
                        </thead>
                        <tbody id="insurance">


                        </tbody>
                    </table>

                    <table class="layui-table center">
                        <colgroup>
                            <col width="150">
                            <col width="200">
                            <col>
                        </colgroup>
                        <thead>
                        <tr>
                            <th colspan="4">理赔信息</th>
                        </tr>
                        <tr>
                            <th>投保保险公司</th>
                            <th>保险金额（元）</th>
                            <th>赔付金额</th>
                            <th>理赔日期</th>
                        </tr>
                        </thead>
                        <tbody id="information">

                        </tbody>
                    </table>
                </div>
                <div class="layui-tab-item">
                    <div class="operationBox layui-form">
                        <div class="searchBox fl">
                            <input id="year1" placeholder="请选择年份" class="layui-input fl search">
                            <div class="fl srarchBtn">
                                <i class="layui-icon">&#xe637;</i>
                            </div>
                        </div>
                    </div>

                    <table class="layui-table center">
                        <colgroup>
                            <col width="150">
                            <col width="200">
                            <col>
                        </colgroup>
                        <thead>
                        <tr>
                            <th>年度</th>
                            <th>领取日期</th>
                            <th>标准</th>
                        </tr>
                        </thead>
                        <tbody id="serviceSubsidy">

                        </tbody>
                    </table>
                </div>
                <div class="layui-tab-item">
                    <div class="operationBox layui-form">
                        <div class="searchBox fl">
                            <input id="year2" placeholder="请选择年份" class="layui-input fl search">
                            <div class="fl srarchBtn">
                                <i class="layui-icon">&#xe637;</i>
                            </div>
                        </div>

                    </div>

                    <table class="layui-table center">
                        <colgroup>
                            <col width="150">
                            <col width="200">
                            <col>
                        </colgroup>
                        <thead>
                        <tr>
                            <th>年度</th>
                            <th>领取日期</th>
                            <th>标准</th>
                        </tr>
                        </thead>
                        <tbody id="nursingSubsidy">

                        </tbody>
                    </table>
                </div>
                <div class="layui-tab-item">
                    <div class="operationBox layui-form">
                        <div class="searchBox fl">
                            <input id="year3" placeholder="请选择年份" class="layui-input fl search">
                            <div class="fl srarchBtn">
                                <i class="layui-icon">&#xe637;</i>
                            </div>
                        </div>

                    </div>

                    <table class="layui-table center">
                        <colgroup>
                            <col width="150">
                            <col width="200">
                            <col>
                        </colgroup>
                        <thead>
                        <tr>
                            <th>年度</th>
                            <th>发放日期</th>
                            <th>发放周期</th>
                            <th>标准</th>
                            <th>金额</th>
                        </tr>
                        </thead>
                        <tbody id="personService">

                        </tbody>
                    </table>
                </div>
            </c:if>
        </div>
    </div>


    <div class="btnbox" id="btnDiv" hidden="true">
        <button id="sure" class="layui-btn layui-btn-primary layui-btn-small">确定</button>
        <button id="cancel" class="layui-btn layui-btn-primary layui-btn-small">取消</button>
    </div>


</div>
<%@ include file="../system/index/foot.jsp" %>
<script>

    $(function () {

        var laytpl = layui.laytpl;
        var element = layui.element;
        var laydate = layui.laydate;

        //人员id
        var id = "${pd.personal_info_id}";
        var form = layui.form;

        //身份证blur 年龄 性别
        $("#sfz").on("blur", function () {
            var val = $(this).val();
            if (val.length == 18) {
                var sex = parseInt(val.substr(16, 1)) % 2 == 0;
                var age = getAge(val);
                $("#age").val(age);
                if (sex) {
                    $("#r1").attr("checked", true);
                    $("#r0").attr("checked", false)
                } else {
                    $("#r1").attr("checked", false);
                    $("#r0").attr("checked", true)
                }
                form.render('radio');
            }

        });
        //table点击事件
        element.on('tab(tab)', function () {
            var layId = this.getAttribute('lay-id');
            if (layId == "1") {
                getInsurance();
                getInformation();
            } else if (layId == "2") {
                var year = new Date().getFullYear();
                $("#year1").val(year);
                laydate.render({
                    elem: '#year1'
                    , type: 'year'
                    , done: function (year) {
                        getServiceSubsidy(year)
                    }
                });
                getServiceSubsidy(year);
            } else if (layId == "3") {
                var year = new Date().getFullYear();
                $("#year2").val(year);
                laydate.render({
                    elem: '#year2'
                    , type: 'year'
                    , done: function (year) {
                        getNursingSubsidy(year);
                    }
                });
                getNursingSubsidy(year);
            } else if (layId == "4") {
                var year = new Date().getFullYear();
                $("#year3").val(year);
                laydate.render({
                    elem: '#year3'
                    , type: 'year'
                    , done: function (year) {
                        getAgeAllowance(year)
                    }
                });
                getAgeAllowance(year);
            }
        });

        form.on("select(test)", function (e) {
            var $next = $(this).closest(".layui-col-xs6").next();
            if (e.value == 0) {
                $next.removeClass("disnone")
            } else {
                $next.addClass("disnone");
                $next.find("input").val("")
            }
        });

        //查看
        $.formToDiv(${pd.TYPE== '1'});

        layui.use('laydate', function () {
            var laydate = layui.laydate;

            //执行一个laydate实例
            laydate.render({
                elem: '#ylbt_begin'
            });
            laydate.render({
                elem: '#hlbt_begin'
            });
            laydate.render({
                elem: '#gljt_begin'
            });
        });

        //获取行政区地址
        $.post("<%=basePath%>areaCode/listSubAreaCodeByParentId.do", {parentId: 0}, function (data) {
            var sTree = $.Stree({
                el: $("#sTree"),
                oldData: ["${pd.xzqh_code}"],
                type:${pd.TYPE== '1'},
                title: "${pd.xzqh}",
                isSingle: true,  //单选
                data: data,
                callback: function () {
                    if (this.arr == undefined || this.arr == "") {
                        return
                    }
                    if (this.arr[0].level != 4) {
                        this.$el.find(".lev" + this.arr[0].lev).children(".treeItem ").removeClass("active");
                        this.arr = [];
                        this.$el.find(".input").val("");
                        layer.tips('请选择社区或村', $("#sTree"), {
                            tips: [3, '#D16E6C'],
                            time: 4000
                        });
                    } else {
                        this.$el.find(".lev0").hide();
                    }

                    $("#SZQY_CODE").val($.getString(this.arr, 'areaCode'));
                    $("#SZQY").val($.getString(this.arr, 'title'));

                },
                switchCallback: function (obj) {
                    var id = obj.id;
                    if (obj.children == "") {
                        getAddress(id, sTree)
                    }

                }
            });
        });

        var TYPE = '${pd.TYPE}';
        if (1 == TYPE) {
            $("#btnDiv").hide();
            //$("input,select,radio,textarea").attr("disabled", "disabled").css("background-color", "#f2f2f2");
            $("input").removeAttr("placeholder", "");
        } else {
            $("#btnDiv").show();
        }
        //提交
        $("#sure").on("click", function () {

            var xm = $.trim($("#xm").val());
            if (xm == "") {
                layer.tips('姓名不能为空', $("#xm"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#xm").focus();
                return false;
            }

            var card = $.trim($("#sfz").val()).toUpperCase();
            if (card == "") {
                layer.tips('身份证不能为空', $("#sfz"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#sfz").focus();
                return false;
            }
            if (!card || !isCardNo(card) || !checkProvince(card) || !checkBirthday(card) || !checkParity(card)) {
                layer.tips('请输入正确的身份证号码', $("#sfz"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#sfz").focus();
                return false;
            }

            var hjdz = $.trim($("#hjdz").val());
            if (hjdz == "") {
                layer.tips('户籍地址不能为空', $("#hjdz"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#hjdz").focus();
                return false;
            }

            var czdz = $.trim($("#czdz").val());
            if (czdz == "") {
                layer.tips('常住地址不能为空', $("#czdz"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#czdz").focus();
                return false;
            }

            if ($("#SZQY_CODE").val() == "") {
                layer.tips('行政区划不能为空', $("#sTree"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#sTree").focus();
                return false;
            }

            var ylbt_je = $.trim($("#ylbt_je").val());
            if (ylbt_je != "" && ylbt_je <= 0) {
                layer.tips('养老补贴金额必须大于0', $("#ylbt_je"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#ylbt_je").focus();
                return false;
            }

            var hlbt_je = $.trim($("#hlbt_je").val());
            if (hlbt_je != "" && hlbt_je <= 0) {
                layer.tips('护理补贴金额必须大于0', $("#hlbt_je"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#hlbt_je").focus();
                return false;
            }

            var gljt_je = $.trim($("#gljt_je").val());
            if (gljt_je != "" && gljt_je <= 0) {
                layer.tips('高龄津贴金额必须大于0', $("#gljt_je"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
                $("#gljt_je").focus();
                return false;
            }

            parent.layer.load(1);
            $.post('${msg}.do', $('#editForm').serialize(), function (data) {
                if ("success" == data.result) {
                    var ywlx = $("#ywlx").val();
                    if ("benefit" == ywlx) {
                        parent.layer.edit.location.href = '<%=basePath%>benefitGrant/listBenefit.do?currentPage=${pd.currentPage}' + '&xzqh=' + '${pd.xzqh_benefit}';
                    } else {
                        parent.layer.edit.location.href = '<%=basePath%>personalInfo/listUsers.do?currentPage=${pd.currentPage}' + '&xzqh_code=' + '${pd.first_xzqh}';
                    }
                    parent.layer.closeAll();
                } else if ("error" == data.result) {
                    layer.msg('系统异常,保存失败!', {icon: 5});
                } else {
                    layer.msg(data.result, {icon: 5});
                }
                parent.layer.closeAll("loading");
            });
        });

        $("#cancel").on("click", function () {
            parent.layer.closeAll();
        });
        //获取地址
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
                });
                //默认选中
                sTree.cheakedOldData()
                //展示
            })
        }

        //获取保险数据
        function getInsurance() {
            $.post("<%=basePath%>personalInfo/getPersonServiceList", {yw: 1, personal_info_id: id}, function (data) {
                var getTpl = insuranceTable.innerHTML,
                    view = document.getElementById('insurance');
                laytpl(getTpl).render({list: data}, function (html) {
                    $(view).html("");
                    $(view).append(html);
                });
            })
        }

        //获取理赔信息
        function getInformation() {
            $.post("<%=basePath%>personalInfo/getPersonServiceList", {yw: 2, personal_info_id: id}, function (data) {
                var getTpl = informationTable.innerHTML,
                    view = document.getElementById('information');
                laytpl(getTpl).render({list: data}, function (html) {
                    $(view).html("");
                    $(view).append(html);
                });
            })
        }

        //服务补贴信息
        function getServiceSubsidy(year) {
            $.post("<%=basePath%>personalInfo/getPersonServiceList", {yw: 3, personal_info_id: id, YEAR: year}, function (data) {
                var getTpl = serviceSubsidyTable.innerHTML,
                    view = document.getElementById('serviceSubsidy');
                laytpl(getTpl).render({list: data, totals: getTotals(data, "LQ_MONEY")}, function (html) {
                    $(view).html("");
                    $(view).append(html);
                });
            })
        }

        //护理补贴信息
        function getNursingSubsidy(year) {
            $.post("<%=basePath%>personalInfo/getPersonServiceList", {yw: 4, personal_info_id: id, YEAR: year}, function (data) {
                var getTpl = serviceSubsidyTable.innerHTML,
                    view = document.getElementById('nursingSubsidy');
                laytpl(getTpl).render({list: data, totals: getTotals(data, "LQ_MONEY")}, function (html) {
                    $(view).html("");
                    $(view).append(html);
                });
            })
        }

        //高龄津贴
        function getAgeAllowance(year) {
            $.post("<%=basePath%>personalInfo/getPersonServiceList", {yw: 5, personal_info_id: id, YEAR: year}, function (data) {
                var getTpl = personServiceTable.innerHTML,
                    view = document.getElementById('personService');
                laytpl(getTpl).render({list: data, totals: getTotals(data, "FF_MONEY")}, function (html) {
                    $(view).html("");
                    $(view).append(html);
                });
            })
        }

        //获取总数
        function getTotals(data, key) {
            var totals = 0;
            for (var i in data) {
                totals += parseInt(data[i][key])
            }
            return totals
        }

        //获取当年年龄
        function getAge(card) {
            var cardYear = card.substr(6, 4);
            var cardDay = card.substr(10, 4);
            var date = new Date();
            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            var day = date.getDay();
            if (month < 10) {
                month = "0" + month
            }
            if (day < 10) {
                day = "0" + day
            }
            var day = month + "" + day;
            if (parseInt(cardDay) > parseInt(day)) {
                year = year - 1;
            }
            return year - cardYear
        }
    });
</script>
<%--投保保险公司--%>
<script id="insuranceTable" type="text/html">
    {{#  if(d.list != ""){ }}
    {{#  layui.each(d.list, function(index, item){ }}
    <tr>
        <td>{{item.NAME}}</td>
        <td>{{item.BF_MONEY}}</td>
        <td>{{item.BX_MONEY}}</td>
        <td>{{item.BXSX_DATE}}</td>
    </tr>
    {{#  }); }}
    {{# } else { }}
    <tr>
        <td colspan="4">没有相关数据</td>
    </tr>
    {{#  } }}
</script>
<%--理赔信息--%>
<script id="informationTable" type="text/html">
    {{#  if(d.list != ""){ }}
    {{#  layui.each(d.list, function(index, item){ }}
    <tr>
        <td>{{item.NAME}}</td>
        <td>{{item.BX_MONEY}}</td>
        <td>{{item.PF_MONEY}}</td>
        <td>{{item.PF_DATE}}</td>
    </tr>
    {{#  }); }}
    {{# } else { }}
    <tr>
        <td colspan="4">没有相关数据</td>
    </tr>
    {{#  } }}
</script>
<%--养老服务补贴&护理补贴信息--%>
<script id="serviceSubsidyTable" type="text/html">
    {{#  layui.each(d.list, function(index, item){

    }}
    <tr>
        <td>{{item.YEAR}}</td>
        <td>{{item.LQ_DATE}}</td>
        <td>{{item.LQ_MONEY}}</td>
    </tr>
    {{#  }); }}
    {{#  if(d.totals != 0){ }}
    <tr>
        <td colspan="2">合计</td>
        <td>{{d.totals}}</td>
    </tr>
    {{# } else { }}
    <tr>
        <td colspan="3">没有相关数据</td>
    </tr>
    {{#  } }}

</script>
<%--高龄津贴--%>
<script id="personServiceTable" type="text/html">
    {{#  layui.each(d.list, function(index, item){

    }}
    <tr>
        <td>{{item.YEAR}}</td>
        <td>{{item.FF_DATE}}</td>
        {{# if(item.FF_TYPE == 1){ }}
        <td>月</td>
        {{# } }}
        {{# if(item.FF_TYPE == 2){ }}
        <td>季度</td>
        {{# } }}
        {{# if(item.FF_TYPE == 3){ }}
        <td>半年</td>
        {{# } }}
        {{# if(item.FF_TYPE == 4){ }}
        <td>全年</td>
        {{# } }}
        <td>{{item.FF_BZ}}</td>
        <td>{{item.FF_MONEY}}</td>
    </tr>
    {{#  }); }}
    {{#  if(d.totals != 0){ }}
    <tr>
        <td colspan="4">合计</td>
        <td>{{d.totals}}</td>
    </tr>
    {{# } else { }}
    <tr>
        <td colspan="5">没有相关数据</td>
    </tr>
    {{#  } }}
</script>

</body>
</html>