<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Variation Browser</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="author" content="Daliu"/>
    <meta name="keywords" content=""/>
    <meta name="describe" content=""/>
    <script type="text/javascript" src="Jscript/jquery.1.11.3.min.js"></script>
    <link type="text/css" rel="stylesheet" href="Css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="Css/main.css"/>
    
    <script type="text/javascript">
    //window.location.href = "/Magic/index.jsp";
    	$(document).ready(function(){
    	    
    	    $('input:radio[name="search"]').click(function(){
				var val=$('input:radio[name="search"]:checked').val();
				//alert(val);
				if(val == "first"){
					$("#sh1").removeAttr("readonly");
					$("#sh2").removeAttr("readonly");
					$("#sh3").attr("readonly","readonly");
					$("#sh3").val("");
				}else{
					$("#sh3").removeAttr("readonly");
					$("#sh1").attr("readonly","readonly");
					$("#sh2").attr("readonly","readonly");
					$("#sh1").val("");
					$("#sh2").val("");
				}
    	    });
    	    
    	    
    		$("#next").click(function(){
    		    var val=$('input:radio[name="search"]:checked').val();
    		    if(val=="first")
    		    {
    		    	var str;
    		    	var start=$("#sh1").val();
    		    	var end=$("#sh2").val();
    		    	var start0=start;
    		    	var start1=0,end1=0;
    		    	start=start-100000;
    		    	while(start>=0)
    		    	{
    		    		start1=start1+100000;
    		    		start=start-100000;
    		    	}
    		    	while(end>start1)
    		    	{
    		    		end1=end1+1;
    		    		end=end-100000;
    		    	}
    		    	alert(end1);
    		    	while(end1>0)
    		    	{
    		    		end1=end1-1;
    		    		end=start1;
    		    		start1=start1+100000;
    		    		if(str!=null)
    		    		{
    		    			str=str+"%2Cchr"+$("#chr").val()+"_"+end+"_"+start1;//chr1_100000_200000
    		    		}
    		    		else
    		    		{
    		    			str="chr"+$("#chr").val()+"_"+end+"_"+start1;//chr1_100000_200000
    		    		}
    		    	}
    		    
    		   		window.location.href = "http://localhost:8080/Magic/JBrowse/jbrowse.jsp?loc="+$("#chr").val()+"%3A"+$("#sh1").val()+".."+$("#sh2").val()+"&tracks="+str+"%2CGFF3%2CDNA&highlight=";
    		    }
    		    else if(val=="second")
    		    {
    		    	var sh3 = $("#sh3");
    		    	$.ajax({
    		    		type:"post",
    		    		url:"jbrowse",
    		    		data:{geneid:sh3.val()},
    		    		success:function(result){
    		    			console.log(result);
    		                var array = result.split(",");
    		                console.log(array);
    		                var str;
		    		    	var start=array[1];
		    		    	var end=array[2];
		    		    	var start0=start;
		    		    	var chrr=array[0];
		    		    	var start1=0,end1=0;
		    		    	start=start-100000;
		    		    	while(start>=0)
		    		    	{
		    		    		start1=start1+100000;
		    		    		start=start-100000;
		    		    	}
		    		    	while(end>start0)
		    		    	{
		    		    		end1=end1+1;
		    		    		end=end-100000;
		    		    	}
		    		    	while(end1>0)
		    		    	{
		    		    		end1=end1-1;
		    		    		end=start1;
		    		    		start1=start1+100000;
		    		    		if(str!=null)
		    		    		{
		    		    			str=str+"%2Cchr"+chrr+"_"+end+"_"+start1;//chr1_100000_200000
		    		    		}
		    		    		else
		    		    		{
		    		    			str="chr"+chrr+"_"+end+"_"+start1;//chr1_100000_200000
		    		    		}
		    		    	}
    		                window.location.href = "http://localhost:8080/Magic/JBrowse/jbrowse.jsp?loc="+array[0]+"%3A"+array[1]+".."+array[2]+"&tracks="+str+"%2CGFF3%2CDNA&highlight=";
    		    		},
    		    		error:function(error){
    		              console.log("jbrowse    "+error);
    		            }
    		    	});
    		   	}
    			else{
    				alert("please choice one chance");
    			}
    		    
    		});
    	});
    	
    	
    </script>
  </head>
  
  <body>
    <%@ include file="../ListHeader.jsp"%>
    <div class="content">
            <div class="describe">
                <h3>Variation Browser</h3>
              
            </div>
            <div class="search">
                <p class="bold">Select one or more loci. Specify gene identifiers (e.g. GRMZM2G040380) or regions (e.g. Chr1 147 6782830).</p>
                <div class="row">
                    <input type="radio" name="search" value="first"> Search By Region
                </div>
                <div class="row">  
                    <!-- <input type="text" placeholder="Chr" class="input"> -->
                    <select  class="input" name="chr" id="chr">
                        
                    	<option value="1">Chr1</option>
						<option value="2">Chr2</option>
						<option value="3">Chr3</option>
						<option value="4">Chr4</option>
						<option value="5">Chr5</option>
					    <option value="6">Chr6</option>
					    <option value="7">Chr7</option>
					    <option value="8">Chr8</option>
					    <option value="9">Chr9</option>
					    <option value="10">Chr10</option>
                    </select>
                    <input type="text" placeholder="Start" class="input" name="start" readonly="readonly" id="sh1">
                    <span style="color:gray">------</span>
                    <input type="text" placeholder="End" class="input" name="end" readonly="readonly" id="sh2">
                    <span style="color:gray;">(eg: Chr1 147 67828030 )</span>
                </div>
                <br>
                <div class="row">
                    <input type="radio" name="search" value="second" > Search By Gene ID
                </div>
                <div class="row">
                    <input type="text" placeholder="Gene" class="input" name="gene" readonly="readonly" id="sh3">
                    <span style="color:gray;">(eg: GRMZM2G040389 )</span>
                </div>
            </div>
            
            <div class="btns">
                <button class="btn" id="next">NEXT</button>
            </div>
            
            
    </div>
    <%@ include file="../ListFooter.jsp"%>
  </body>
</html>
