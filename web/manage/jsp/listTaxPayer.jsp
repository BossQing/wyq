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
    <title>纳税人管理</title>

    <link href="static/css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="static/easyui/uimaker/easyui.css">
    <link rel="stylesheet" type="text/css" href="static/easyui/uimaker/icon.css">
    <link rel="stylesheet" href="static/css/taxpayer.css">

  </head>
  <script type="text/javascript">
 
  </script>
  
  <body>
      <div class="container">
      	<table id="dg">
      	
      	</table>
      <div id="tb" style="padding:0 30px;">
        纳税人识别号: <input type="text" name="payerCode" id="payerCode" style="width:166px;height:35px;line-height:35px;"/>
        纳税人名称: <input type="text" name="payerName" id="payerName" style="width:166px;height:35px;line-height:35px;"/>
        <a href="javascript:void(0);" id="searchBtn" class="easyui-linkbutton" iconCls="icon-search" data-options="selected:true">查询</a>
        <a href="javascript:void(0);" id="setBtn" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
        <a href="javascript:void(0);" id="addBtn" class="easyui-linkbutton" iconCls="icon-add">添加纳税人</a>
      </div>
    </div>
    <script type="text/javascript" src="static/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="static/easyui/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript">
         /**
            *打开在父窗口中打开window
            */
           function openTopWindow(options){
               options = !options ? {} :options;
               options.width = !options.width ? 500 : options.width;
               options.height = !options.height ? 400 : options.height;
               options.url = !options.url ? "404.html" : options.url;
               options.title = !options.title ? "" : options.title;

               parent.$("#topWindow").window({
                   title : options.title,
                   width: options.width,
                   height: options.height,
                   content : "<iframe scrolling='no' frameborder='0' border='0' height='100%' width='100%' src='"+options.url+"'></iframe>",
                   modal:true,
                   resizable:true,
                   collapsible:false
               });
           }
           //查询
       	   function doSearch(){     	   
			   $("#dg").datagrid("load",{		
					"payerCode": $("#payerCode").val(),
					"payerName": $("#payerName").val()
				});
			}
           //删除
           function removeTaxPayer(id){
        	   $.messager.confirm('操作提示', '确定要删除吗?', function(r){
	  				if (r){
	  					$.post("deleteTaxPayerServlet.do",{"id":id},function(data){
			           		if(data.success){
			           			alert(data.msg)
			           			doSearch()	
			           		}else{
			           			alert(data.msg)
			           		}
			           	},"json")
			           	doSearch()	     
	  				}
	   		   });
	           	
           }
           //详情
           function detail(id){	          
	           	openTopWindow({"url":"getTaxPayerInfoServlet.do?id="+id,
	   		 	"title":"纳税人信息",	   		 	
	   		 	 width : 750,
                 height : 500,
				})
	           	doSearch()	           	          
           }
           //更新
    		function edit(id){
	   		 	openTopWindow({url:"editTaxPayerServlet.do?id="+id,
	   		 	title:"修改纳税人信息",	   		 	
	   		 	 width : 750,
                 height : 600,
				})
				doSearch()      	          
     		}         
           //新建任务
           function addTask(id){ 
           		parent.addTab("调查任务录入","addTaskServlet.do?id="+id)
           }
                   
    </script>
    <script type="text/javascript">
        //为搜索按钮添加事件处理函数
        //为重置按钮添加事件处理函数
        //为添加纳税人添加事件处理函数
       
       //分页展示 吃石化页面
       $(function(){
       	   $("#dg").datagrid({
       	   title:"纳税人信息",
       	   url:"listTaxPayerServlet.do",
       	   toolbar:"#tb",
       	   coolapsible:true,
       	   method:"POST",
       	   loadMsg:"数据加载中..",
       	   pagination:true,
       	   striped:true,  
       	   columns:[[
       	   	  		{field:"payerCode","title":"纳税人识别号"},
                    {field:"payerName","title":"纳税人名称"},
                    {field:"organName","title":"所属税务机关"},
                    {field:"industryName","title":"所属行业"},
                    {field:"legalPerson","title":"法人代表"},
                    {field:"legalIdCard","title":"法人身份证号码"},
                    {field:"finaceName","title":"主管财务"},
                    {field:"finaceIdCard","title":"财务身份证号码"},
                    {field:"recordDate","title":"录入日期"},  
                    {field:"opreation","title":"操作",formatter:function(value,rowData,index){
                    return "<a href='javascript:void(0)' onclick='detail("+rowData.id+")'>详情   </a>"
                    +"<a href='javascript:void(0)' onclick='removeTaxPayer("+rowData.id+")'>删除   </a>"
                    +"<a href='javascript:void(0)' onclick='edit("+rowData.id+")'>修改   </a>"
                    +"<a href='javascript:void(0)' id='addTask' onclick='addTask("+rowData.id+")'>新建任务 </a>"                               
                    }}   
       	   ]]

       	   })

       	   
		   //查询事件
       	   $("#searchBtn").on("click",function(){      	   
       	     doSearch()
       	   })
       	   
       	   //添加页面事件
       	  $("#addBtn").on("click",function(e){
              openTopWindow({
                  width : 750,
                  height : 600,
                  title : "新增纳税人",
                  url : "toAddTaxPayerServlet.do"
              });
              doSearch()
           });
          //重置 
          $("#setBtn").on("click",function(e){
          //文本框的内容清空
          	$("#payerCode").val("");           
          	$("#payerName").val("");           
          })
                
       });
    </script>
  </body>
</html>
