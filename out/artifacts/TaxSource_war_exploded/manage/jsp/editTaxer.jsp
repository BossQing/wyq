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
    <title>修改办税专员</title>
    <link href="../../static/css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="../../static/easyui/uimaker/easyui.css">
    <link rel="stylesheet" type="text/css" href="../../static/easyui/uimaker/icon.css">
    <link href="../../static/css/edit.css" rel="stylesheet">

  </head>
  <body>
     <div class="container">
        <div class="content">
            <div title="办税专员信息" data-options="closable:false" class="basic-info">
                <div class="column"><span class="current">修改办税专员</span></div>
                <form id="editForm">
                <input name="id" id="id" type="hidden" value="${requestScope.taxer.id }">
                <table class="kv-table">              	
                    <tbody> 
                    
                       <tr>
                        <td class="kv-label">办税专员编号</td>
                        <td class="kv-content"><input type="text" name="taxerCode" class="easyui-validatebox" data-options="required:true" placeholder="办税专员编号" value="${requestScope.taxer.taxerCode }"></td>
                        <td class="kv-label">办税专员名称</td>
                        <td class="kv-content"><input type="text" name="taxerName" class="easyui-validatebox" data-options="required:true" placeholder="办税专员名称" value="${requestScope.taxer.taxerName }"></td>
                    </tr>
                    <tr>
                        <td class="kv-label">手机号</td>
                        <td class="kv-content"><input type="text" name="mobile" class="easyui-validatebox" data-options="required:true" placeholder="手机号" value="${requestScope.taxer.mobile }"></td>
                        <td class="kv-label">地址</td>
                        <td class="kv-content"><input type="text" name="address" placeholder="地址" value="${requestScope.taxer.address }"></td>
                    </tr>
                     <tr>
                        <td class="kv-label">性别</td>
                        <td class="kv-content">
                        	<input type="radio" name="sex" class="easyui-validatebox" data-options="required:true" placeholder="男" ${"男" == requestScope.taxer.sex ? "checked":""} value="男"> 男
                        	<input type="radio" name="sex" class="easyui-validatebox" data-options="required:true" placeholder="女" ${"女" == requestScope.taxer.sex ? "checked":""} value="女"> 女
                        	</td>
                        <td class="kv-label">生日</td>
                        <td class="kv-content"><input type="text" name="birthday" placeholder="生日"  value="${requestScope.taxer.birthday }"></td>
                    </tr>
                    <tr>
                    <td class="kv-label">Email</td>
                        <td class="kv-content"><input type="text" name="email" placeholder="Email" value="${requestScope.taxer.email }"></td>
                        <td class="kv-label">所属税务机关</td>
                        <td class="kv-content">
                            <select name="organId" id="selectOrgan" > 
                            <option value="-1">请选择税务机关</option>
                            <c:forEach items="${requestScope.organs }" var="organ">
                            	<option value="${organ.id }" ${organ.id == requestScope.taxer.organId ? "selected":""}>${organ.organName }</option>
                            </c:forEach>                                             
                            </select>
                        </td>
                    </tr>                     
                    </tbody>                                
                </table>
                </form>
            </div>
            <div class="btn-selection">
                <a href="javascript:void(0);" class="easyui-linkbutton save-btn" id="editPayer" data-options="selected:true">修改</a>
                <a href="javascript:void(0);" class="easyui-linkbutton reset-btn" id="reset" data-options="selected:true">重置</a>
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
    $(function(){
    	$("#editPayer").on("click",function(){
    		var isValid = $('#editForm').form('validate');
			if(!isValid){
				return;
			}	
    		$.post("toEditTaxPayerServlet.do",
    				$("#editForm").serialize(),
    				function(data){
		    			if(data.success){
		       				parent.$.messager.alert({
			       				title:"提示",
			       				msg:data.msg
		       				}) 
		       				parent.$("#topWindow").window("close")
							//parent.doSearch()	
		     			}else{
		    				$.messager.alert({
			           			title:"提示",
			           			msg:data.msg
					        })
		     			}
		    		},
		    		"json")    	    	
    	})
    	$("#reset").on("click",function(){
			$("#editForm").form("reset")
		})           
    })
</script>
</html>
