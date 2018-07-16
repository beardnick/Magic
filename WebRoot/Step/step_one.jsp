<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
        <base href="<%=basePath%>">
        <title>GWAS Search</title>
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="author" content="Daliu"/>
        <meta name="keywords" content=""/>
        <meta name="describe" content=""/>
        <link type="text/css" rel="stylesheet" href="Css/bootstrap.min.css" />
        <link type="text/css" rel="stylesheet" href="Css/bootstrap-table.min.css"/>
        <link type="text/css" rel="stylesheet" href="Css/main.css"/>
        <script type="text/javascript" src="Jscript/jquery-3.1.0.min.js"></script>
        <script type="text/javascript" src="Jscript/bootstrap-table.min.js"></script>
  </head>
  
  <body>
    <%@ include file="../ListHeader.jsp"%>
    <div class="content" style="height:auto;">
            <div class="describe">
                <h3>GWAS Search</h3>
                <br/>
                <p>Search the significant SNPs (2.79x10-8) in GWAS results in a number of ways, including by trait, SNP identifier, study and gene. </p>
            </div>
            <div class="steps">
                <image src="images/steps1.png">
            </div>
            <form action="showTwo" method="post" onsubmit="return check();">
            <div class="search">
                <table id="table-methods-table" data-toggle="table" data="data" data-height="520">
                <!-- data-height="246" -->
                    <thead>
                        <tr>
                            <th data-field="state" data-checkbox="true"></th>
                            <th data-field="id" data-align="center" data-sortable="true">trait Name</th>
                            <th data-field="name" data-align="center" data-sortable="true">Full Name</th>
                        </tr>
                    </thead>
                </table>
            </div>
            <input type="hidden"  id="sead" name="trait" />
            <div class="btns2">
                <button class="btn" text-algin="right" id="next1" float="right">NEXT</button>
            </div>
            </form>
        </div>
        <%@ include file="../ListFooter.jsp"%>
        <script src="Jscript/data.js" type="text/javascript"></script>
		<script type="text/javascript">
			/*
			$ajax({
	        	type:"get",
    			url:"showTrait",
				success:function(result){
    				alert("success");
    				var result = [{"id": 2,"name": "sb"}]; 
					jQuery.fn.bootstrapTable.defaults.data = result;
				},
				error:function(){
					alert("系统异常，请稍后重试");
					var result = [{"id": 1,"name": "bb"}]; 
					jQuery.fn.bootstrapTable.defaults.data = result;
				}
			});
			*/ 
    		jQuery.fn.bootstrapTable.defaults.data = data;
    			
    		function check() {
			    var myData = $('#table-methods-table').bootstrapTable('getAllSelections');
			    //alert(JSON.stringify(myData));
			    //alert(myData.length);
			   
				var num = myData.length;
				var tas = new Array();
				for(var i=0;i<num;i++){
				    
					tas[i]= myData[i].id;
					//alert(tas[i]);
				} 
				//alert(tas);
				//var name = myData[0].name;
				//$('#sead').val(name);
				$('#sead').val(tas);
				if(num == 0){
					alert("You must choose at least one trait！");
					return false;
				}else{
					//alert(name);
					return true;
			    } 	
			}
			//加载自己的数据时将data.js文件里的值修改了就是
			//jQuery.fn.bootstrapTable.defaults.data = data;
		</script>
  </body>
</html>
