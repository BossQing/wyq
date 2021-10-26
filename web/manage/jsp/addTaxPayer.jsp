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
    <title>添加纳税人</title>
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
            <div title="纳税人信息" data-options="closable:false" class="basic-info">
                <div class="column"><span class="current">添加纳税人信息</span></div>
                <form id="addForm">
                <table class="kv-table" id="addPayer">
                    <tbody>
                    <tr>
                        <td class="kv-label">纳税人识别号</td>
                        <td class="kv-content"><input type="text" name="payerCode" class="easyui-validatebox" data-options="required:true" placeholder="纳税人识别号"></td>
                        <td class="kv-label">纳税人名称</td>
                        <td class="kv-content"><input type="text" name="payerName" class="easyui-validatebox" data-options="required:true" placeholder="纳税人名称"></td>
                    </tr>
                    <tr>
                        <td class="kv-label">生产经营地址</td>
                        <td class="kv-content"><input type="text" name="bizAddress" class="easyui-validatebox" data-options="required:true" placeholder="生产经营地址"></td>
                        <td class="kv-label">经营地电话</td>
                        <td class="kv-content"><input type="text" name="bizAddressPhone" placeholder="生产经营地电话"></td>
                    </tr>
                    <tr>
                        <td class="kv-label">所属税务机关</td>
                        <td class="kv-content">
                            <select name="taxOrganId" id="selectOrgan" > 
                            <option value="-1">请选择税务机关</option>
                            <c:forEach items="${requestScope.organs }" var="organ">
                            	<option value="${organ.id }">${organ.organName }</option>
                            </c:forEach>                                             
                            </select>
                        </td>
                        <td class="kv-label">行业</td>
                        <td class="kv-content">
                            <select name="industryId" id="selectIndustry">
                            <option value="-1">请选择行业</option> 
                            <c:forEach items="${requestScope.industrys }" var="industry">
                            	<option value="${industry.id }">${industry.industryName }</option>
                            </c:forEach>                                     
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="kv-label">生产应用技能</td>
                        <td class="kv-content">
                            <select name="bizScope" >
                                <option value="-1">请选择技能</option>
                                <c:forEach items="${requestScope.industrys }" var="industry">
                                    <option value="${industry.industryName }">${industry.industryName }</option>
                                </c:forEach>
                            </select>
                        </td>
                        <td class="kv-label">票种核定</td>
                        <td class="kv-content">
                            <select id="billType" name="invoiceType">
                                <option value="-1">请选择发票种类</option>
                                <option value="增值税普通发票">增值税普通发票</option>
                                <option value="增值税专用发票">增值税专用发票</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="kv-label">法人代表人</td>
                        <td class="kv-content">
                            <input type="text" name="legalPerson" placeholder="法人姓名">
                        </td>
                        <td class="kv-label">法人身份证号</td>
                        <td class="kv-content">
                            <input type="text" name="legalIdCard" placeholder="法人代表身份证号码">
                        </td>
                    </tr>
                    <tr>
                        <td class="kv-label">主管财务</td>
                        <td class="kv-content">
                            <input type="text" name="finaceName" placeholder="主管财务">
                        </td>
                        <td class="kv-label">财务身份证号</td>
                        <td class="kv-content">
                            <input type="text" name="finaceIdCard" placeholder="财务身份证号">
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="kv-label">法人身份证照片</td>
                        <td class="kv-content">
                        	<img id="chooseLegalIdCardPreview" alt="" src=""/>
                        	<div id="chooseLegalIdCard">选择文件</div>
                        	<input type="hidden" name="legalIdCardImageURL" id="legalIdCardUrl"/>
                        </td>
                        <td class="kv-label">财务身份证照片</td>
                        <td class="kv-content">
                        	<img id="chooseFinaceIdCardPreview" alt="" src=""/>
                            <div id="chooseFinaceIdCard">选择文件</div>
                            <input type="hidden" name="finaceIdCardImageURL" id="finaceIdCardUrl"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="kv-label">录入人员</td>
                        <td class="kv-content">
                            <select name="taxerName" id="selectTaxer" >
                                <option value="-1">请选择录入人员</option>
                                <c:forEach items="${requestScope.user }" var="user">
                                    <option value="${user.id }">${user.taxerName }</option>
                                </c:forEach>
                            </select>
<%--                           <label>${requestScope.user.taxerName }</label>--%>
                        </td>
                        <td class="kv-label">当前时间</td>
                        <td class="kv-content"><input type="text" name="recordDate"></td>
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
	//添加纳税人
		$("#savePayer").on("click",function(){
			var isValid = $('#addForm').form('validate');
			if(!isValid){
				return;
			}	
			$.post("toAddTaxPayerServlet.do",$("#addForm").serialize(),function(data){
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
	
	<script type="text/javascript">
		//上传处理
		var chooseLegalIdCardUploader = WebUploader.create({
			// 选完文件后，是否自动上传。
		    auto: true,
		    // swf文件路径
		    swf: 'https://cdn.bootcss.com/webuploader/0.1.1/Uploader.swf',		
		    // 文件接收服务端。
		    server: 'http://localhost:8080/uploadImg.do',
		    // 选择文件的按钮。可选。
		    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
		    pick: '#chooseLegalIdCard',		
		    // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
		    resize: false,
		    // 只允许选择图片文件。
		    accept: {
		        title: 'Images',
		        extensions: 'gif,jpg,jpeg,bmp,png',
		        mimeTypes: 'image/*'
		    }
		});
		chooseLegalIdCardUploader.on('fileQueued', function( file ) {
			chooseLegalIdCardUploader.makeThumb( file, function( error, src ) {
		        if (error) {
		            $("#chooseLegalIdCardPreview").replaceWith('<span>不能预览</span>');
		            return;
		        }
		        $("#chooseLegalIdCardPreview").attr( 'src', src );
		    }, 100, 100 );
		});
		//文件上传成功接受回调信息
		chooseLegalIdCardUploader.on('uploadSuccess', function (file,response) {
			 alert('文件上传成功');
			 $("#legalIdCardUrl").val(response.url);
	    });
		
		//上传处理
		var chooseFinaceIdCardUploader = WebUploader.create({	
			// 选完文件后，是否自动上传。
		    auto: true,
		    // swf文件路径
		    swf: 'https://cdn.bootcss.com/webuploader/0.1.1/Uploader.swf',		
		    // 文件接收服务端。
		    server: '/uploadImg.do',
		    // 选择文件的按钮。可选。
		    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
		    pick: '#chooseFinaceIdCard',		
		    // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
		    resize: false,
		    // 只允许选择图片文件。
		    accept: {
		        title: 'Images',
		        extensions: 'gif,jpg,jpeg,bmp,png',
		        mimeTypes: 'image/*'
		    }
		});
		
		chooseFinaceIdCardUploader.on('fileQueued', function( file ) {
			chooseFinaceIdCardUploader.makeThumb( file, function( error, src ) {
		        if (error) {
		            $("#chooseFinaceIdCardPreview").replaceWith('<span>不能预览</span>');
		            return;
		        }
		        $("#chooseFinaceIdCardPreview").attr( 'src', src );
		    }, 100, 100 );
		});
		//文件上传成功接受回调信息
		chooseFinaceIdCardUploader.on('uploadSuccess', function (file,response) {
			 alert('文件上传成功');
			 $("#finaceIdCardUrl").val(response.url);
	    });
	</script>
	
</html>
