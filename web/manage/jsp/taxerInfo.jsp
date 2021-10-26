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
    <title>查看办税专员</title>
    <link href="../../static/css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="../../static/easyui/uimaker/easyui.css">
    <link rel="stylesheet" type="text/css" href="../../static/easyui/uimaker/icon.css">
    <link href="../../static/css/edit.css" rel="stylesheet">

  </head>
  <body>
     <div class="container">
        <div class="content">
            <div title="办税专员信息" data-options="closable:false" class="basic-info">
                <div class="column"><span class="current">查看办税专员</span></div>
                <form id="editForm">
                <input name="id" id="id" type="hidden" value="${requestScope.taxer.id }">
                <table class="kv-table">              	
                    <tbody> 
                    
                       <tr>
                        <td class="kv-label">办税专员编号</td>
                        <td class="kv-content"><label>${requestScope.taxer.taxerCode }</label></td>
                        <td class="kv-label">办税专员名称</td>
                        <td class="kv-content"><label>${requestScope.taxer.taxerName }</label></td>
                    </tr>
                    <tr>
                        <td class="kv-label">手机号</td>
                        <td class="kv-content"><label>${requestScope.taxer.mobile }</label></td>
                        <td class="kv-label">地址</td>
                        <td class="kv-content"><label>${requestScope.taxer.address }</label></td>
                    </tr>
                     <tr>
                        <td class="kv-label">性别</td>
                        <td class="kv-content">
                        	<label> ${"男" == requestScope.taxer.sex ? "男":""}
                        	${"女" == requestScope.taxer.sex ? "女":""}</label>
                        	</td>
                        <td class="kv-label">生日</td>
                        <td class="kv-content"><label>${requestScope.taxer.birthday }</label></td>
                    </tr>
                    <tr>
                    <td class="kv-label">Email</td>
                        <td class="kv-content"><label>${requestScope.taxer.email }</label></td>
                        <td class="kv-label">所属税务机关</td>
                        <td class="kv-content">
                        	<label>${requestScope.organ.organName }</label>                          
                        </td>
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
 <script type="text/javascript" src="../../static/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../static/js/calendar.js"></script>
<script type="text/javascript">
$("input[name=birthday]").datebox({
    formatter: easyUIFormater,
    parser: easyUIparser
});  
   
</script>
</html>
