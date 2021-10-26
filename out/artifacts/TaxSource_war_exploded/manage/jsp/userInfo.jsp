<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
  	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>任务录入</title>
    <link rel="stylesheet" type="text/css" href="../../static/css/base.css" >
    <link rel="stylesheet" type="text/css" href="../../static/easyui/uimaker/easyui.css">
    <link rel="stylesheet" type="text/css" href="../../static/easyui/uimaker/icon.css">
    <link rel="stylesheet" type="text/css" href="../../static/css/edit.css">
  </head>
  <style>
  	input{
  		readonly:true
  	}  
  </style>
  <body>
   <div class="container">
    <div class="content">
        <div title="纳税人信息" data-options="closable:false" class="basic-info">
            <div class="column"><span class="current">用户基本信息</span></div>
            <table class="kv-table">
                <tbody>
                <tr>
                    <td class="kv-label">用户员工编号</td>
                    <td class="kv-content"><input type="text" name="payerCode" value="${sessionScope.user.taxerId }"></td>
                    <td class="kv-label">用户权限</td>
                    <td class="kv-content">${sessionScope.user.permissionId}</td>
                    <td class="kv-label">用户状态</td>
                    <td class="kv-content">${sessionScope.user.state}</td>
                </tr>
                <tr>
                    <td class="kv-label">税务人员工号</td>
                    <td class="kv-content">${sessionScope.taxer.taxerCode }</td>
                    <td class="kv-label">税务人员名称</td>
                    <td class="kv-content">${sessionScope.taxer.taxerName }</td>
                    <td class="kv-label">税务人员电话</td>
                    <td class="kv-content">${sessionScope.taxer.mobile }</td>
                </tr>
                <tr>
                    <td class="kv-label">地址</td>
                    <td class="kv-content">${sessionScope.taxer.address }</td>
                    <td class="kv-label">性别</td>
                    <td class="kv-content">${sessionScope.taxer.sex }</td>
                    <td class="kv-label">出生日期</td>
                    <td class="kv-content">${sessionScope.taxer.birthday }</td>
                </tr>
                <tr>
                    <td class="kv-label">邮箱</td>
                    <td class="kv-content">${sessionScope.taxer.email }</td>
                    <td class="kv-label">税务机关</td>
                    <td class="kv-content">${sessionScope.taxer.organId }</td>
                    <td class="kv-label">税务状态</td>
                    <td class="kv-content">${sessionScope.taxer.state }</td>
                </tr>
                <tr>
                    <td class="kv-label">上级主管</td>
                    <td class="kv-content">${sessionScope.taxer.mgr }</td>
                    <td class="kv-label">系统管理员标志</td>
                    <td class="kv-content">${sessionScope.taxer.admin }</td>
                    <td class="kv-label">记录日期</td>
                    <td class="kv-content">${sessionScope.taxer.recordDate }</td>
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
</html>
