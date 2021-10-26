<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>任务录入</title>
    <link rel="stylesheet" type="text/css" href="../../static/css/base.css" >
    <link rel="stylesheet" type="text/css" href="../../static/easyui/uimaker/easyui.css">
    <link rel="stylesheet" type="text/css" href="../../static/easyui/uimaker/icon.css">
    <link rel="stylesheet" type="text/css" href="../../static/css/edit.css">
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
                    <td class="kv-content"><input type="text" name="payerCode" id="payerCode" value="${requestScope.payer.payerCode }" ></td>
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
                  </tr>
                <tr>                   
                    <td class="kv-label">录入日期</td>
                    <td class="kv-content">${requestScope.payer.recordDate }</td>
                    <td class="kv-label">录入人员</td>
                    <td class="kv-content">${requestScope.user.username }</td>
                </tr>
                </tbody>
            </table>
            <div class="column"><span class="current">任务信息</span></div>
            <form id="addTask">
            <input type="hidden" name="payerId" value=${requestScope.payer.id }>
            <table class="kv-table">
                <tbody>
                <tr>                	
                    <td class="kv-label">任务名称</td>
                    <td class="kv-content"><input type="text" name="taskName" placeholder="请输入任务名称"></td>
                    <td class="kv-label">下达部门</td>
                    <td class="kv-content">
                      <select name="subOrganId" id="selectOrgan">
                      <option value="-1">请选择下达部门必选项</option> 
                            <c:forEach items="${requestScope.organs }" var="organ">
                            	<option value="${organ.id }">${organ.organName }</option>
                            </c:forEach>                                             
                      </select>
					</td>
                    <td class="kv-label">批准人</td>
                    <td class="kv-content">    	
	                    <select name="approverId">
	                    <option value="-1">请选择批准人</option>
	                      <c:forEach items="${requestScope.taxers}" var="taxer">
                             <option value="${taxer.id }">${taxer.taxerName }</option>
                          </c:forEach> 
	                    </select>
                    </td>
                </tr>
                <tr>
                  <td class="kv-label">执行人</td>
                  	<td class="kv-content">    	
                    <select name="executeId">
                    <option value="-1">请选择执行人</option>
                      <c:forEach items="${requestScope.taxers }" var="taxer">
                            <option value="${taxer.id }">${taxer.taxerName }</option>
                         </c:forEach> 
                    </select>
                  </td>
                  <td class="kv-label">执行时间</td>
                    <td class="kv-content"><input type="text" name="executeTime"></td>
                    <td class="kv-label">任务执行情况</td>
                    <td class="kv-content">
                        <textarea rows="3" name="taskState" style="width: 90%;"></textarea>
                    </td>
                </tr>
                </tbody>        
            </table>
             </form>
        </div> 
        <div class="btn-selection">
            <a href="javascript:void(0);" class="easyui-linkbutton save-btn" id="saveBtn" data-options="selected:true">保存</a>
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
</script>
<script type="text/javascript">
	$(function(){
	//保存添加任务
		$("#saveBtn").on("click",function(){
			var isValid = $('#addForm').form('validate');
			if(!isValid){
				return;
			}	
		//发送ajax请求完成添加操作			
			$.post("addTaskServlet.do",
					$("#addTask").serialize(),
					function(data){	
						$.messager.alert({
		           			title:"提示",
		           			msg:data.msg,
	        			})			
					},"json")
		})
		
		//重置
		$("#reset").on("click",function(){
			$("#addTask").form("reset")
		})
		
		//查询
		$("#payerCode").on("blur",function(){
			window.location.href = "toAddTaskServlet.do?payerCode="+$("#payerCode").val()		
		})
	})
	

</script>
</html>
