<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改密码</title>
    <link rel="stylesheet" type="text/css" href="../../static/css/base.css" >
    <link rel="stylesheet" type="text/css" href="../../static/easyui/uimaker/easyui.css">
    <link rel="stylesheet" type="text/css" href="../../static/easyui/uimaker/icon.css">
    <link rel="stylesheet" type="text/css" href="../../static/css/edit.css">
   
  </head>
    <script type="text/javascript" src="../../static/jquery/jquery.min.js"></script>
  <body>
    <div class="container">
    <div class="content">
        <div title="纳税人信息" data-options="closable:false" class="basic-info">
            <div class="column"><span class="current">修改密码</span></div>
            <table class="kv-table">
                <tbody>
                <tr>
                    <td class="kv-label">密码</td>
                    <td class="kv-content"><input type="password" id="oldPassword" name="oldPassword"placeholder="密码"></td>
                </tr>
                <tr>
                    <td class="kv-label">新密码</td>
                    <td class="kv-content"><input type="password" id="newPassword" name="newPassword" placeholder="新密码"></td>  
                </tr> 
                <tr>                     
                    <td class="kv-label">确认密码</td>
        			<td class="kv-content"><input type="password" id="validatePassword" name="validatePassword" placeholder="确认密码"></td>                                                 
                </tr>       
                </tbody>      
       </table>
       </div>
        <div class="btn-selection">
            <a href="javascript:void(0);" class="easyui-linkbutton save-btn" id="modify_pwd" data-options="selected:true">保存</a>
            <a href="javascript:void(0);" class="easyui-linkbutton reset-btn" data-options="selected:true">重置</a>
        </div>
       </div>
       </div>
  </body>
  <script type="text/javascript" src="../../static/jquery/jquery.min.js"></script>
  <script type="text/javascript" src="../../static/easyui/jquery.easyui.min.js"></script>
  <script type="text/javascript" src="../../static/js/calendar.js"></script>
    <script type="text/javascript">
    $(function(){
    	$("#modify_pwd").on("click",function(){
        	var oldPassword=$("#oldPassword").val();
        	var newPassword=$("#newPassword").val();
        	var username = "${sessionScope.user.username}";
        	var validatePassword=$("#validatePassword").val();
        	if(!oldPassword){
        		alert("请输入初始密码")
        		return
        	}
        	if(!newPassword){
        		alert("请输入修改后的密码")
        		return
        	}
        	if(!validatePassword){
        		alert("请输入确认密码")
        		return
        	}
        	if(newPassword!=validatePassword){
        		alert("密码输入不一致")
        		return
        	}
        	$.post("updatePassword.do",{"username":username,"oldPassword":oldPassword,"newPassword":newPassword},function(data){
        		if(data.success){
        			parent.alert(data.msg)
        			parent.$("#topWindow").window("close")
        		}else{
        			parent.alert(data.msg)
        		}
        	},"json")
		
        })
    })
  		
  </script>
</html>

