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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>添加办税专员</title>
    <link rel="stylesheet" type="text/css" href="../../static/css/base.css" >
    <link rel="stylesheet" type="text/css" href="../../static/easyui/uimaker/easyui.css">
    <link rel="stylesheet" type="text/css" href="../../static/easyui/uimaker/icon.css">
    <link rel="stylesheet" type="text/css" href="../../static/css/edit.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.bootcss.com/webuploader/0.1.1/webuploader.css">

  </head>
  <script type="text/javascript" src="../../static/jquery/jquery.min.js"></script>
  <script type="text/javascript" src="../../static/easyui/jquery.easyui.min.js"></script>
  <script type="text/javascript" src="../../static/easyui/easyui-lang-zh_CN.js"></script>
  <script type="text/javascript" src="../../static/js/calendar.js"></script>
  
  <script src="https://cdn.bootcss.com/webuploader/0.1.1/webuploader.min.js"></script>
  
  <body>
     <div class="container">
        <div class="content">
            <div title="办税专员信息" data-options="closable:false" class="basic-info">
                <div class="column"><span class="current">添加办税专员信息</span></div>
                <form id="addForm">
                <table class="kv-table" id="addPayer">
                    <tbody>
                    <tr>
                        <td class="kv-label">办税专员编号</td>
                        <td class="kv-content"><input type="text" name="taxerCode" class="easyui-numberbox" data-options="required:true,min:1000,max:999999" placeholder="办税专员编号"></td>
                        <td class="kv-label">办税专员名称</td>
                        <td class="kv-content"><input type="text" name="taxerName" class="easyui-validatebox" data-options="required:true,validType:'maxLength[4]'" placeholder="办税专员名称"></td>
                    </tr>
                    <tr>
                        <td class="kv-label">手机号</td>
                        <td class="kv-content"><input type="text" name="mobile" class="easyui-validatebox" data-options="required:true,validType:'mobile'" placeholder="手机号"></td>
                        <td class="kv-label">地址</td>
                        <td class="kv-content"><input type="text" name="address" class="easyui-validatebox" placeholder="地址" data-options="validType:'maxLength[64]'"></td>
                    </tr>
                     <tr>
                        <td class="kv-label">性别</td>
                        <td class="kv-content">
                        	<input type="radio" name="sex" class="easyui-validatebox" placeholder="男"  value="男"> 男
                        	<input type="radio" name="sex" class="easyui-validatebox" placeholder="女" value="女"> 女
                        	</td>
                        <td class="kv-label">生日</td>
                        <td class="kv-content"><input type="text" name="birthday" class="easyui-validatebox" placeholder="生日" data-options="validType:'date'"></td>
                    </tr>
                    <tr>
                     	<td class="kv-label">Email</td>
                        <td class="kv-content"><input type="text" name="email" class="easyui-validatebox" placeholder="Email" data-options="validType:'email'"></td>
                        <td class="kv-label">所属税务机关</td>
                        <td class="kv-content">
                            <select name="organId" id="selectOrgan" class="easyui-validatebox" data-options="validType:'choose'"> 
                            <option value="-1">请选择税务机关</option>
                            <c:forEach items="${requestScope.organs }" var="organ">
                            	<option value="${organ.id }">${organ.organName }</option>
                            </c:forEach>                                             
                            </select>
                        </td>
                    </tr>
                    </tbody>
                  
                </table>
                  </form>
            </div>
            <div class="btn-selection">
                <a href="javascript:void(0);" class="easyui-linkbutton save-btn" id="savePayer" data-options="selected:true">保存</a>
                <a href="javascript:void(0);" class="easyui-linkbutton reset-btn" id="reset" data-options="selected:true">重置</a>
            </div>
        </div>
    </div>
  </body>
  <script type="text/javascript">
  //自定义验证
  $.extend($.fn.validatebox.defaults.rules, {
	 maxLength: {     
	         validator: function(value, param){     
	                      return param[0] >= value.length;     
	         },     
	         message: '请输入最大{0}位字符.'    
	 },
	 mobile: {// 	        
        validator: function (value) {
        	return /^1[0-9]{10}$/i.test($.trim(value));  
        },
        message: '手机号码格式不正确'
        
    },    
    date: {// 验证姓名，可以是中文或英文
        validator: function (value) {
            //格式yyyy-MM-dd或yyyy-M-d
                return /^(?:(?!0000)[0-9]{4}([-]?)(?:(?:0?[1-9]|1[0-2])\1(?:0?[1-9]|1[0-9]|2[0-8])|(?:0?[13-9]|1[0-2])\1(?:29|30)|(?:0?[13578]|1[02])\1(?:31))|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)([-]?)0?2\2(?:29))$/i.test(value);
        },
        message: '清输入合适的日期格式'
    },
    email : {     
           validator: function(value){     
               return /^[a-zA-Z0-9_+.-]+\@([a-zA-Z0-9-]+\.)+[a-zA-Z0-9]{2,4}$/i.test($.trim(value));     
           },     
           message: '电子邮箱格式错误.'    
       },
    choose : {
       	validator : function(value) {    
       		var sV = $('#selectOrgan option:selected').val();
       		if('-1' == sV || '' == sV){  
       			
                   return false;  
               }  
               return true;  
           },     
           message: '必须选择一项.' 
     }
  });
  $("input[name=birthday]").datebox({
      formatter: easyUIFormater,
      parser: easyUIparser
  });  
	//添加纳税人
		$("#savePayer").on("click",function(){
			var isValid = $('#addForm').form('validate');
			if(!isValid){
				return;
			}	
			$.post("toAddTaxerServlet.do",$("#addForm").serialize(),function(data){
				if(data.success){
       				parent.$.messager.alert({
	       				title:"提示",
	       				msg:data.msg,
       				}) 
       				parent.$("#topWindow").window("close")      				
     			}else{
    				$.messager.alert({
	           			title:"提示",
	           			msg:data.msg,
        			})
     			}
			},"json")			
		})
		//重置
		$("#reset").on("click",function(){
			$("#addForm").form("reset")
		})
	</script>

	
</html>
