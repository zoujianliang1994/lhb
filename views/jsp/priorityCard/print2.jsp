<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2017/10/16
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/tld/web-html" prefix="html"%>

<html>
<head>
    <style type="text/css">
        body {
            width: 100%;
            margin: 0;
            padding: 0;
            font: 10pt Helvetiva,Tahoma,Arial,"Microsoft YaHei","微软雅黑","SimSun","宋体",sans-serif;
        }
        * {
            box-sizing: border-box;
            -moz-box-sizing: border-box;
        }
        .printpage {
            width: 149mm;
            height: 102mm;
            padding: 7mm;
            border: 1px solid #ddd;
        }
        .lefttext {
            position: relative;
            float: left;
            width: 72mm;
            /*width: 62mm;*/
            height: 100%;
            color: #ddd;
            border-right: 1px solid #ddd;
            padding-left: 2mm;
            padding-right: 8mm;
        }
        .lefttext h1 {
            font-size: 14pt;
            text-align: center;
        }
        .lefttext p {
            font-size: 11pt;
        }
        .lefttext .applydate {
            position: absolute;
            top: 76mm;
            left: 7mm;
            text-align: left;
        }
        .lefttext .applydate .year {
            margin-left: 2mm;
        }
        .lefttext .applydate .month,
        .lefttext .applydate .day {
            margin-left: 3mm;
        }
        .printtable {
            float: left;
            width: 57mm;
            margin-left: 5mm;
            /*border-left: 1px solid #ddd;*/
            /*border-top: 1px solid #ddd;*/
            border-collapse: collapse;
            border-spacing: 0;
        }
        .printtable thead tr td,
        .printtable tbody tr td {
            color: #ddd;
            font-size: 9pt;
            /*border-right: 1px solid #ddd;*/
            /*border-bottom: 1px solid #ddd;*/
        }
        .printtable .hd {
            width: 24mm;
            height: 12mm;
            text-align: left;
            vertical-align: bottom;
        }
        .printtable .md {
            width: 20mm;
            height: 12mm;
            text-align: left;
            vertical-align: bottom;
        }
        .printtable .ft {
            width: 23mm;
            text-align: center;
            vertical-align: bottom;
        }
        .printtable .date {
            /*width: 45mm;*/
            text-align: left;
        }
        .printtable .date span {
            vertical-align: bottom;
        }
        .printtable .date .year {
            margin-left: 5mm;
        }
        .printtable .date .month,
        .printtable .date .day {
            margin-left: 3mm;
        }
        .printtable .text {
            /*width: 40mm;*/
            text-align: left;
            max-height: 9mm;
            overflow: visible;
        }
        .printtable .num {
            /*width: 40mm;*/
            text-align: center;
        }
        .printtable .picbox {
            height: 28mm;
            padding: 3mm 0;
            overflow: hidden;
            border: 1px solid #ddd;
        }
        .printtable .underline {
            border-bottom: 1px solid #ddd;
        }
        .output {
            color: #000;
            word-break: break-all;
        }
    </style>
    <style type="text/css" media="screen">
        .printpage {
            margin: 10px auto 0;
        }
        .printtable .date .year {
            margin-left: 0px;
        }
        .printtable .date .month,
        .printtable .date .day {
            /*margin-left: 10px;*/
        }
        .tools {
            width: 149mm;
            margin: 5mm auto 0;
            text-align: center;
        }
        .tools button {
            font-size: 12pt;
            padding: 10px 25px;
            border: 1px solid #999;
            background: #f5f5f5;
            cursor: pointer;
            border-radius: 6px;
            outline: none;
            transition: all linear .15s;
        }
        .tools button:hover {
            border: 1px solid #2886ec;
            color: #2886ec;
            background: #fafafa;
            box-shadow: 0 2px 5px 2px rgba(40, 134, 236, .2);
        }
    </style>
    <style type="text/css" media="print">
        @page {
            size: 149mm 102mm portrait;
            margin: 0;
        }
        html, body {
            width: 149mm;
            height: 102mm;
        }
        table, figure {
            page-break-inside: avoid;
        }
        .printpage {
            border-color: transparent;
            page-break-after: always;
        }
        .lefttext {
            height: 88mm;
            border-color: transparent;
        }
        .printtable {
            border-color: transparent;
        }
        .printtable>thead>tr>td,
        .printtable>tbody>tr>td {
            border-color: transparent;
        }
        .printtable .picbox {
            border: none;
        }
        .printtable .underline {
            border-bottom: none;
        }
        .noprint {
            visibility: hidden;
        }
    </style>
</head>
<body>
<div class="printpage">
    <div class="lefttext">
        <div class="noprint">
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;受成都市人民政府委托，成都市老年人《优待证》有成都市老龄工作委员会....</p>
        </div>
        <div class="applydate">
            <span class="noprint">办证时间：</span>
            <span class="output year" id="nowYear">2017</span>
            <span class="noprint">年</span>
            <span class="output month" id="nowMonth">7</span>
            <span class="noprint">月</span>
            <span class="output day" id="nowDay">8</span>
            <span class="noprint">日</span>
        </div>
    </div>
    <table class="printtable">
        <tr>
            <td class="hd">
                <span class="noprint">姓名</span>
            </td>
            <td class="md underline">
                <div class="output">${pd.xm}</div>
            </td>
            <td class="ft" rowspan="3">
                <div class="picbox">
                    <span class="noprint">贴<br/>近<br/>期<br/>照<br/>片</span>
                </div>
            </td>
        </tr>
        <tr>
            <td class="hd">
                <span class="noprint">性别</span>
            </td>
            <td class="md underline">
                <span class="output">
                <c:if test="${pd.xb == 1 }">女</c:if>
                <c:if test="${pd.xb != 1 }">男</c:if>
                </span>
            </td>
        </tr>
        <tr>
            <td class="hd">
                <span class="noprint">民族</span>
            </td>
            <td class="md underline">
                <span class="output">
                <html:selectedValue collection="Person_mz" defaultValue="${pd.mz}"></html:selectedValue>
                </span>
            </td>
        </tr>
        <tr>
            <td class="hd">
                <span class="noprint">出生日期</span>
            </td>
            <td class="md underline" colspan="2">
                <div class="date">
                    <span class="output year" id="year">2017</span>
                    <span class="noprint">年</span>
                    <span class="output month" id="month">7</span>
                    <span class="noprint">月</span>
                    <span class="output day" id="day">8</span>
                    <span class="noprint">日</span>
                </div>
            </td>
        </tr>
        <tr>
            <td class="hd">
                <span class="noprint">身份证号</span>
            </td>
            <td class="md num underline" colspan="2">
                <span class="output">${pd.sfz}</span>
            </td>
        </tr>
        <tr>
            <td class="hd">
                <span class="noprint">现住址</span>
            </td>
            <td class="md underline" colspan="2" style="padding-left:2mm">
                <div class="text">
                    <span class="output">${pd.czdz}</span>
                </div>
            </td>
        </tr>
        <!-- <tr>
            <td class="hd">
                <span class="noprint">编号(川)</span>
            </td>
            <td class="md num underline" colspan="2">&nbsp;</td>
        </tr> -->
        <tr>
            <td class="hd">
                <span class="noprint">家庭电话</span>
            </td>
            <td class="md underline" colspan="2">
                <div class="num">
                    <span class="output"></span>
                </div>
            </td>
        </tr>
    </table>
</div>
<div class="tools noprint"><button onclick="javascript:window.print();">打印</button></div>
</body>

<!-- <script>
    $(document).ready(function(){
        //TODO:
    });
</script> -->

<%@ include file="../system/index/foot.jsp"%>
<script>
    $(document).ready(function(){
        getBirthdatByIdNo(${pd.sfz}+"");
    });


    //获取出生日期
    function getBirthdatByIdNo(iIdNo) {
        var tmpStr = "";
        if (iIdNo.Length == 15) {
            tmpStr = iIdNo.substring(6, 12);
            tmpStr = "19" + tmpStr;
        }else {
            tmpStr = iIdNo.substring(6, 14);
        }
        $("#year").html(tmpStr.substring(0, 4));
        $("#month").html(tmpStr.substring(4, 6));
        $("#day").html(tmpStr.substring(6));
        var myDate = new Date();
        $("#nowYear").html( myDate.getFullYear());
        $("#nowMonth").html(myDate.getMonth()+1);
        $("#nowDay").html(myDate.getDate());

    }

</script>
</html>