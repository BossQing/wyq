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
    <title>修改纳税人</title>
    <link href="../../static/css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="../../static/easyui/uimaker/easyui.css">
    <link rel="stylesheet" type="text/css" href="../../static/easyui/uimaker/icon.css">
    <link href="../../static/css/edit.css" rel="stylesheet">

  </head>
  <body>
     <div class="container">
        <div class="content">
            <div title="纳税人信息" class="basic-info">
                <div class="column"><span class="current">修改纳税人信息</span></div>
                <form id="editForm">
                <table class="kv-table">              	
                    <tbody>                 
                    <tr>
                        <td class="kv-label">纳税人识别号</td>
                        <td class="kv-content"><label>${requestScope.payer.payerCode}</label></td>
                        <td class="kv-label">纳税人名称</td>
                        <td class="kv-content"><label>${requestScope.payer.payerName}</label></td>
                    </tr>
                    <tr>
                        <td class="kv-label">生产经营地址</td>
                        <td class="kv-content"><label>${requestScope.payer.bizAddress}</label></td>
                        <td class="kv-label">生产经营地电话</td>
                        <td class="kv-content"><label>${requestScope.payer.bizAddressPhone}</label></td>
                    </tr>
                    <tr>
                        <td class="kv-label">所属税务机关</td>
                        <td class="kv-content"> 
                           	<label>${requestScope.organ.organName}</label>                                           
                        </td>
                        <td class="kv-label">行业</td>
                        <td class="kv-content">
                            	<label>${requestScope.industry.industryName}</label>                                     
                        </td>
                    </tr>
                    <tr>
                        <td class="kv-label">生产经营范围</td>
                        <td class="kv-content">
                            <label>${requestScope.payer.bizScope }</label>
                        </td>
                        <td class="kv-label">票种核定</td>
                        <td class="kv-content">
                              <label>${requestScope.payer.invoiceType}</label>                                
                        </td>
                    </tr>
                    <tr>
                        <td class="kv-label">法人代表人</td>
                        <td class="kv-content">
                            <label>${requestScope.payer.legalPerson }</label>
                        </td>
                        <td class="kv-label">法人身份证号</td>
                        <td class="kv-content">
                            <label>${requestScope.payer.legalIdCard }</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="kv-label">主管财务</td>
                        <td class="kv-content">
                            <label>${requestScope.payer.finaceName }</label>
                        </td>
                        <td class="kv-label">财务身份证号</td>
                        <td class="kv-content">
                            <label>${requestScope.payer.finaceIdCard }</label>
                        </td>
                    </tr>
                    
                      <tr>
                        <td class="kv-label">法人身份证照片</td>
                        <td class="kv-content">
                        	<img id="chooseLegalIdCardPreview" alt="" src="upload/${requestScope.payer.legalIdCardImageURL }"/>
                        </td>
                        <td class="kv-label">财务身份证照片</td>
                        <td class="kv-content">
                        	<img id="chooseFinaceIdCardPreview" alt="" src="upload/${requestScope.payer.finaceIdCardImageURL }"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="kv-label">录入人员</td>
                        <td class="kv-content">
                                <label>${requestScope.user.taxerName }</label>
                        </td>
                        <td class="kv-label">录入日期</td>
                        <td class="kv-content">${requestScope.payer.recordDate }</td>
                    </tr>
                    </tbody>                                
                </table>
                </form>
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
</html>