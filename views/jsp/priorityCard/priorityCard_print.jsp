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
            width: 153mm;
            height: 99mm;
            padding: 7mm;
            border: 1px solid #ddd;
        }
        .lefttext {
            float: left;
            width: 72mm;
            height: 100%;
            color: #ddd;
            border-right: 1px solid #ddd;
            padding: 0 7mm;
        }
        .lefttext h1 {
            font-size: 14pt;
            text-align: center;
        }
        .printtable {
            float: left;
            margin-left: 5mm;
            border-left: 1px solid #ddd;
            border-top: 1px solid #ddd;
            border-collapse: collapse;
            border-spacing: 0;
        }
        .printtable thead tr td,
        .printtable tbody tr td {
            color: #ddd;
            font-size: 9pt;
            border-right: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
        }
        .printtable .hd {
            width: 13.5mm;
            height: 10mm;
            text-align: center;
        }
        .printtable .md {
            width: 22mm;
            height: 10mm;
            text-align: center;
        }
        .printtable .ft {
            width: 23mm;
            text-align: center;
        }
        .printtable .date {
            width: 45mm;
            text-align: left;
        }
        .printtable .date .year {
            margin-left: 10mm;
        }
        .printtable .date .month,
        .printtable .date .day {
            margin-left: 6mm;
        }
        .printtable .text {
            width: 45mm;
            text-align: left;
        }
        .printtable .num {
            width: 45mm;
            text-align: center;
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
            margin-left: 20px;
        }
        .printtable .date .month,
        .printtable .date .day {
            margin-left: 10px;
        }
        .tools {
            width: 153mm;
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
            size: 153mm 99mm portrait;
            margin: 0;
        }
        html, body {
            width: 153mm;
            height: 99mm;
        }
        table, figure {
            page-break-inside: avoid;
        }
        .printpage {
            /*margin-top: 2mm;*/
            border: none;
            page-break-after: always;
        }
        .lefttext {
            /*width: 72mm;*/
            width: 61mm;
            height: 99mm;
            border-color: transparent;
        }
        .printtable {
            border-color: transparent;
        }
        .printtable>thead>tr>td,
        .printtable>tbody>tr>td {
            border-color: transparent;
        }
        .noprint {
            display: none;
        }
    </style>
</head>
<body>
<div class="printpage">
    <div class="lefttext">
        <div class="noprint">
            <h1>使用注意事项</h1>
            <p>1.四川省老年人优待证由四川省人民政府委托四川省老龄工作委员会办公室...</p>
        </div>
    </div>
    <table class="printtable">
        <tr>
            <td class="hd">
                <span class="noprint">姓名</span>
            </td>
            <td class="md">
                <span class="output">${pd.xm}</span>
            </td>
            <td class="ft" rowspan="2">
                <span class="noprint">贴<br/>近<br/>期<br/>照<br/>片</span>
            </td>
        </tr>
        <tr>
            <td class="hd">
                <span class="noprint">性别</span>
            </td>
            <td class="md">
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
            <td class="md">
                <span class="output">
                    <html:selectedValue collection="Person_mz" defaultValue="${pd.mz}"></html:selectedValue>
                </span>
            </td>
            <td class="ft">
                <span class="noprint">加盖发证<br/>机关钢印</span>
            </td>
        </tr>
        <tr>
            <td class="hd">
                <span class="noprint">出生日期</span>
            </td>
            <td class="date" colspan="2">
                <span class="output year" id="year">2017</span>
                <span class="noprint">年</span>
                <span class="output month" id="month">7</span>
                <span class="noprint">月</span>
                <span class="output day" id="day">8</span>
                <span class="noprint">日</span>
            </td>
        </tr>
        <tr>
            <td class="hd">
                <span class="noprint">现住址</span>
            </td>
            <td class="text" colspan="2" style="padding-left:2mm">
                <span class="output">${pd.czdz}</span>
            </td>
        </tr>
        <tr>
            <td class="hd">
                <span class="noprint">身份证号</span>
            </td>
            <td class="num" colspan="2">
                <span class="output">${pd.sfz}</span>
            </td>
        </tr>
        <tr>
            <td class="hd">
                <span class="noprint">编号(川)</span>
            </td>
            <td class="num" colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td class="hd">
                <span class="noprint">发证日期</span>
            </td>
            <td class="date" colspan="2">
                <span class="output year" id="nowYear">2017</span>
                <span class="noprint">年</span>
                <span class="output month" id="nowMonth">7</span>
                <span class="noprint">月</span>
                <span class="output day" id="nowDay">8</span>
                <span class="noprint">日</span>
            </td>
        </tr>
    </table>
</div>
<div class="tools noprint"><button onclick="javascript:window.print();">打印</button></div>
</body>

<%@ include file="../system/index/foot.jsp"%>
<script>
    $(document).ready(function(){
        getBirthdatByIdNo('${pd.sfz}'.trim());
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