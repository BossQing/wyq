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
            <div title="纳税人信息" data-options="closable:false" class="basic-info">
                <div class="column"><span class="current">修改纳税人信息</span></div>
                <form id="editForm">
                <input name="id" id="id" type="hidden" value="${requestScope.payer.id }">
                <table class="kv-table">              	
                    <tbody>                 
                    <tr>
                        <td class="kv-label">纳税人识别号</td>
                        <td class="kv-content"><input type="text" name="payerCode" readonly placeholder="纳税人识别号" value="${requestScope.payer.payerCode }"></td>
                        <td class="kv-label">纳税人名称</td>
                        <td class="kv-content"><input type="text" name="payerName" class="easyui-validatebox" data-options="required:true" placeholder="纳税人名称" value="${requestScope.payer.payerName }"></td>
                    </tr>
                    <tr>
                        <td class="kv-label">生产经营地址</td>
                        <td class="kv-content"><input type="text" name="bizAddress" class="easyui-validatebox" data-options="required:true" placeholder="生产经营地址" value="${requestScope.payer.bizAddress}"></td>
                        <td class="kv-label">生成经营地电话</td>
                        <td class="kv-content"><input type="text" name="bizAddressPhone"  placeholder="生产经营地电话" value="${requestScope.payer.bizAddressPhone }"></td>
                    </tr>
                    <tr>
                        <td class="kv-label">所属税务机关</td>
                        <td class="kv-content">
                            <select name="taxOrganId" class="easyui-validatebox" data-options="required:true" id="selectOrgan"> 
                            <option value="-1">请选择所属税务机关</option>
                            <c:forEach items="${requestScope.organs }" var="organ">
                            	<option value="${organ.id }"  ${organ.id == requestScope.organ.id ? "selected":""}>${organ.organName }</option>
                            </c:forEach>                                             
                            </select>
                        </td>
                        <td class="kv-label">行业</td>
                        <td class="kv-content">
                            <select name="industryId" id="selectIndustry"> 
                            <option value="-1">请选择行业</option>
                            <c:forEach items="${requestScope.industrys }" var="industry">
                            	<option value="${industry.id }" ${industry.id == requestScope.industry.id ? "selected":""}>${industry.industryName }</option>
                            </c:forEach>                                     
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="kv-label">生产经营范围</td>
                        <td class="kv-content">
                            <input type="text" name="bizScope" value="${requestScope.payer.bizScope }" placeholder="生产经营范围">
                        </td>
                        <td class="kv-label">票种核定</td>
                        <td class="kv-content">
                            <select name="invoiceType">
                                <option value="-1">请选择发票种类</option>
                                <option value="增值税普通发票" ${requestScope.payer.invoiceType == "增值税普通发票" ? "selected":"" }>增值税普通发票</option>
                                <option value="增值税专用发票" ${requestScope.payer.invoiceType == "增值税专用发票" ? "selected":"" }>增值税专用发票</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="kv-label">法人代表人</td>
                        <td class="kv-content">
                            <input type="text" name="legalPerson" value="${requestScope.payer.legalPerson }" placeholder="法人姓名">
                        </td>
                        <td class="kv-label">法人身份证号</td>
                        <td class="kv-content">
                            <input type="text" name="legalIdCard" value="${requestScope.payer.legalIdCard }" placeholder="法人代表身份证号码">
                        </td>
                    </tr>
                    <tr>
                        <td class="kv-label">主管财务</td>
                        <td class="kv-content">
                            <input type="text" name="finaceName" value="${requestScope.payer.finaceName }" placeholder="主管财务">
                        </td>
                        <td class="kv-label">财务身份证号</td>
                        <td class="kv-content">
                            <input type="text" name="finaceIdCard" value="${requestScope.payer.finaceIdCard }" placeholder="财务身份证号">
                        </td>
                    </tr>
                    <tr>
                        <td class="kv-label">办税人员</td>
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
    $("input[name=executeTime]").datebox({
        formatter: easyUIFormater,
        parser: easyUIparser
    });   
    $(function(){
    	$("#editPayer").on("click",function(){
    		var isValid = $('#editForm').form('validate');
			if(!isValid){
				return;
			}	
    		$.post("editTaxPayerServlet.do",$("#editForm").serialize(),function(data){
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
    		},"json")    	    	
    	})
    	$("#reset").on("click",function(){
			$("#editForm").form("reset")
		})           
    })
</script>
</html>
