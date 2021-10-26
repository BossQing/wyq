<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>任务录入</title>
    <link href="../../static/css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="../../static/easyui/uimaker/easyui.css">
    <link rel="stylesheet" type="text/css" href="../../static/easyui/uimaker/icon.css">
    <link href="../../static/css/edit.css" rel="stylesheet">
  </head>

  <body>
    <div class="container">
    <div class="content">
        <div title="纳税人信息" data-options="closable:false" class="basic-info">
            <div class="column"><span class="current">纳税人基本信息</span></div>
            <table class="kv-table">
                <tbody>
                <tr>
                    <td class="kv-label">纳税人识别号</td>
                    <td class="kv-content"><label>${requestScope.payer.payerCode }</label></td>
                    <td class="kv-label">纳税人名称</td>
                    <td class="kv-content">${requestScope.payer.payerName }</td>
                    <td class="kv-label">生产经营地址</td>
                    <td class="kv-content">${requestScope.payer.bizAddress }</td>
                </tr>
                <tr>
                    <td class="kv-label">所属税务机关</td>
                    <td class="kv-content">${requestScope.organ.organName }</td>
                    <td class="kv-label">行业</td>
                    <td class="kv-content">${requestScope.industry.industryName }</td>
                    <td class="kv-label">经营范围</td>
                    <td class="kv-content">${requestScope.payer.bizScope }</td>
                </tr>
                <tr>
                    <td class="kv-label">票种核定</td>
                    <td class="kv-content">${requestScope.payer.invoiceType }</td>
                    <td class="kv-label">法人代表人</td>
                    <td class="kv-content">${requestScope.payer.legalPerson }</td>
                    <td class="kv-label">法人身份证号</td>
                    <td class="kv-content">${requestScope.payer.legalIdCard }</td>
                </tr>
                <tr>
                    <td class="kv-label">主管财务</td>
                    <td class="kv-content">${requestScope.payer.finaceName }</td>
                    <td class="kv-label">财务身份证号</td>
                    <td class="kv-content">${requestScope.payer.finaceIdCard }</td>
                    <td class="kv-label">税收管理员</td>
                    <td class="kv-content">${requestScope.payer.taxerName}</td>
                </tr>
                <tr>
                    <td class="kv-label">办税人员</td>
                    <td class="kv-content">${requestScope.payer.taxerName}</td>
                    <td class="kv-label">录入日期</td>
                    <td class="kv-content">${requestScope.payer.recordDate}</td>
                    <td class="kv-label">录入人</td>
                    <td class="kv-content">${requestScope.username}</td>
                </tr>
                </tbody>
            </table>
            <div class="column"><span class="current">任务信息</span></div>
            <table class="kv-table">
                <tbody>
                <tr>
                    <td class="kv-label">任务名称</td>
                    <td class="kv-content"><label>${requestScope.task.taskName }</label></td>
                    <td class="kv-label">下达部门</td>
                    <td class="kv-content"><label>${requestScope.subOrgan.organName }</label></td>
                    <td class="kv-label">批准人</td>
                    <td class="kv-content"><label>${requestScope.approverTaxer.taxerName }</label></td>
                </tr>

                <tr>
                	<td class="kv-label">执行人</td>
                    <td class="kv-content"><label>${requestScope.executeTaxer.taxerName }</label></td>
                 	<td class="kv-label">执行时间</td>
                    <td class="kv-content"><label>${requestScope.task.executeTime }</label></td>

                    <td class="kv-label">任务执行情况</td>
                    <td class="kv-content">
                        <textarea rows="3" readonly style="width: 90%;">${requestScope.task.taskState }</textarea>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

</div>
    </div>
  </body>
  <script type="text/javascript" src="../../static/jquery/jquery.min.js"></script>
<script type="text/javascript" src="../../static/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../static/js/calendar.js"></script>
<script type="text/javascript">
    $("input[name=executeTime]").datebox({
        formatter: easyUIFormater,
        parser: easyUIparser
    });
</script>
