<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <%
    	int sta;
    	int end;
    	Map<String,Object> attributes=ActionContext.getContext().getSession();
    	String [] theName = (String[])attributes.get("names");
    	String [] theChr = (String[])attributes.get("chrs");
    	String na;
    	String chr;
    	String[]colors = {"#ffc0cb","#dc143c","#ff1493","#c71585","#da70d6","#dda0dd","#4b0082","#9370db","#0000ff","#1e90ff","#4682b4","#00ffff","#008b8b","#3cb371",
 	    "#98fb98","#7fff00","#556b2f","#ffd700","#ff8c00","#fa8072","#b22222","#800000","#a9a9a9","#ffff00","#00ff00"};	
 	    String color = "";
 	    String[] color_name = {"unknown","5237","E28","Q1261","CHANG7-2","DAN340","HUANGC","HYS","HZS","TY4","ZI330","ZONG3","LX9801","XI502","81515","F349","H21","JI853",
 	    "JI53","LV28","YUANFH","SHUANG741","K12","NX110","ZONG31"};
 	    HashMap<String,ArrayList<String>> table_data = (HashMap<String,ArrayList<String>>)attributes.get("table");
    %>
    <title>Result</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="author" content="Daliu"/>
    <meta name="keywords" content=""/>
    <meta name="describe" content=""/>
    <link href="Css/bootstrap.min.css" rel="stylesheet"/>
    <link href="Css/main.css" rel="stylesheet"/>
    <script type="text/javascript" src="Jscript/jquery-3.1.0.min.js"></script>
	<style type="text/css">
		table{		    
			border:1px solid #ddd;
			border-collapse: collapse;
			border-radius: 1px;
		}
		td, th{
			text-align: center;
			border:1px solid #ddd;
			padding:10px 5px;
		}
	</style>


  </head>
  
  <body>
    <%@ include file="../ListHeader.jsp"%>
     <div class="content" style="width:95%;">
    <div class="content" style="width:100%;">
    
    <%for(int i=0;i<25;i++){
    	color = colors[i];
    %>
     <div  style="height:40px;width:95px;display:inline-block;text-align:center;">
     	<canvas id="<%=color %>" width="55" height="40" ></canvas>
     	<script>
     		var c = document.getElementById("<%=color %>");
    	  	var ctx=c.getContext("2d");
    	  	ctx.fillStyle = "<%= color%>";
    	  	ctx.fillRect(0,20,40,10);
    	  	ctx.stroke();
     	</script>
     	<span style="width:80px;height:10px;text-align:center;display:inline-block; float:left ;font-size:10px; "><%=color_name[i] %></span>
     </div>
    <%} %> 
   
    <br></br><br></br>
    <% if(theChr.length == 1){
       		for(int i=0;i<theName.length;i++){
       			chr = theChr[0];
    	    	na = theName[i];
    	    	ArrayList<ArrayList<Integer>> my = (ArrayList<ArrayList<Integer>>)attributes.get(na);
    	    	ArrayList<Integer> parent_all = (ArrayList<Integer>)my.get(0);
    	    	ArrayList<Integer> sta_all = (ArrayList<Integer>)my.get(1);
    	    	ArrayList<Integer> end_all = (ArrayList<Integer>)my.get(2);
    	    	double sta1=(Double)attributes.get("sta1");
    	    	double end1=(Double)attributes.get("end1");
    %>
    <div style="height:50px;">
    	<span style="width:100px;font-size: 25px; color: black;margin-left:-100px;">
    	    <b><%= na%>:</b>
    	    <!-- <span></span> -->
    	</span>
    	<div style="width:100%;height:50px;margin-left:150px;margin-top:-45px;vertical-align:middle;">
    	  	<canvas id="<%= na %>" width="100%" height="50" ></canvas>
    		<% for(int j=0;j<parent_all.size();j++){
    				color = colors[parent_all.get(j)];
    		%>
    		   <script type="text/javascript">
    	  			var c = document.getElementById("<%= na %>");
    	  			var ctx=c.getContext("2d");
    	  			var chr="<%=chr%>";
    	  			var sta = <%=(Integer)sta_all.get(j)%>/270000;
    	  	        var end = <%=(Integer)end_all.get(j)%>/270000;
    	  	        if((sta*270000)<(<%=sta1%>))
  	  	            {
  	  	        		sta=<%=sta1%>;
  	  	        		sta=sta/270000;
  	  	        		
  	  	            }
  	  	   		   	if((end*270000)>(<%=end1%>))
	  	   	   	    {
	  	      		  	end=<%=end1%>;
	  	      		  	end=end/270000;
		  	        }
	  	  	   		if((<%=sta1%>!=1)||(<%=end1%>!=301354135))
		  	      	{
	  	  	   		if(chr=="1")
    	  	      	{
	  	  				end=end*301354135/(<%=end1%>-<%=sta1%>);
    	  	      		sta=sta*301354135/(<%=end1%>-<%=sta1%>);
    	  	      	}
	  	  			else if(chr=="2")
	  				{
	  	  				end=end*237068873/(<%=end1%>-<%=sta1%>);
    	  	   		    end=end*237068873/(<%=end1%>-<%=sta1%>);
	  				}
	  	  			else if(chr=="3")
	  	  			{
	  	  				end=end*232140174/(<%=end1%>-<%=sta1%>);
    	  	      		sta=sta*232140174/(<%=end1%>-<%=sta1%>);
	  	      		}
	  	  			else if(chr=="4")
	  	  			{
	  	  				end=end*241473504/(<%=end1%>-<%=sta1%>);
    	  	    	    sta=sta*241473504/(<%=end1%>-<%=sta1%>);
					}
	  	  			else if(chr=="5")
	  	  			{
    	  	  			end=end*217872852/(<%=end1%>-<%=sta1%>);
    	  	            sta=sta*217872852/(<%=end1%>-<%=sta1%>);
	  	  			}
	    	  	  	else if(chr=="6")
	    	  	  	{
    	  	  			end=end*169174353/(<%=end1%>-<%=sta1%>);
    	  	            sta=sta*169174353/(<%=end1%>-<%=sta1%>);
	    	  	  	}
    	  	  		else if(chr=="7")
    	  	  		{
    	  	  			end=end*176764762/(<%=end1%>-<%=sta1%>);
    	  	     	    sta=sta*176764762/(<%=end1%>-<%=sta1%>);
    	  	  		}
    	  	  		else if(chr=="8")
    	  	  		{
    	  	  			end=end*175793759/(<%=end1%>-<%=sta1%>);
    	  	    	    sta=sta*175793759/(<%=end1%>-<%=sta1%>);
    	  	  		}
    	  	  		else if(chr=="9")
    	  	  		{
    	  	  			end=end*156750706/(<%=end1%>-<%=sta1%>);
    	  	  		    sta=sta*156750706/(<%=end1%>-<%=sta1%>);
    	  	  		}
    	  	  		else if(chr=="10")
    	  	  		{
    	  	  			end=end*150189435/(<%=end1%>-<%=sta1%>);
    	  	     	    sta=sta*150189435/(<%=end1%>-<%=sta1%>);
    	  	  		}
		  	  			
		  	      	}
    	  			ctx.fillStyle = "<%= color%>";
    	  	        ctx.fillRect(sta+20,11,end-sta+5,20);
    	  	        ctx.stroke();
    	  	        
    	  	        var cd = new Object();
    	  	        cd.par = "<%= (String)color_name[parent_all.get(j)]%>";
    	  	        cd.sta = <%=(Integer)sta_all.get(j)%>;
    	  	        cd.end = <%=(Integer)end_all.get(j)%>;
    	  	        $(c).data("<%= color%>",cd);
    			</script>
    		<%}%>
    		
    	</div>
    </div>
    <%} 
    }else{
    	for(int i=0;i<theChr.length;i++){
    		chr = theChr[i];
    	    ArrayList<ArrayList<Integer>> my = (ArrayList<ArrayList<Integer>>)attributes.get(chr);
    	    ArrayList<Integer> parent_all = (ArrayList<Integer>)my.get(0);
    	    ArrayList<Integer> sta_all = (ArrayList<Integer>)my.get(1);
    	    ArrayList<Integer> end_all = (ArrayList<Integer>)my.get(2);
    	    double sta1=(Double)attributes.get("sta1");
	    	double end1=(Double)attributes.get("end1");
    %>
     <div style="height:50px;">
    	<span style="width:70px;display:inline-block;font-size: 25px; color: black;">
    	    <b>Chr<%= chr%>:</b>
    	    <!-- <span></span> -->
    	</span>
    	<div style="width:1200px;height:50px;display:inline-block;vertical-align:middle;">
    	  	<canvas id="<%= chr %>" width="1200" height="50" ></canvas>
    		<% for(int j=0;j<parent_all.size();j++){
    				color = colors[parent_all.get(j)];
    		%>
    		<script type="text/javascript">
    	  			var c = document.getElementById("<%= chr %>");
    	  			var ctx=c.getContext("2d");
    	  			var sta = <%=(Integer)sta_all.get(j)%>/270000;
    	  	        var end = <%=(Integer)end_all.get(j)%>/270000;
    	  	        if((sta*270000)<(<%=sta1%>))
    	  	        {
    	  	        	sta=<%=sta1%>;
    	  	        	sta=sta/270000;
    	  	        	
    	  	        }
    	  	      	if((end*270000)>(<%=end1%>))
  	  	      	    {
  	  	      		  	end=<%=end1%>;
  	  	      		  	end=end/270000;
  	  	     	    }
    	  	      	if((<%=sta1%>!=1)||(<%=end1%>!=301354135))
    	  	      	{
	    	  	      	if(chr=="1")
	    	  	      	{
		  	  				end=end*301354135/(<%=end1%>-<%=sta1%>);
	    	  	      		sta=sta*301354135/(<%=end1%>-<%=sta1%>);
	    	  	      	}
		  	  			else if(chr=="2")
		  				{
		  	  				end=end*237068873/(<%=end1%>-<%=sta1%>);
	    	  	   		    end=end*237068873/(<%=end1%>-<%=sta1%>);
		  				}
		  	  			else if(chr=="3")
		  	  			{
		  	  				end=end*232140174/(<%=end1%>-<%=sta1%>);
	    	  	      		sta=sta*232140174/(<%=end1%>-<%=sta1%>);
		  	      		}
		  	  			else if(chr=="4")
		  	  			{
		  	  				end=end*241473504/(<%=end1%>-<%=sta1%>);
	    	  	    	    sta=sta*241473504/(<%=end1%>-<%=sta1%>);
						}
		  	  			else if(chr=="5")
		  	  			{
	    	  	  			end=end*217872852/(<%=end1%>-<%=sta1%>);
	    	  	            sta=sta*217872852/(<%=end1%>-<%=sta1%>);
		  	  			}
		    	  	  	else if(chr=="6")
		    	  	  	{
	    	  	  			end=end*169174353/(<%=end1%>-<%=sta1%>);
	    	  	            sta=sta*169174353/(<%=end1%>-<%=sta1%>);
		    	  	  	}
	    	  	  		else if(chr=="7")
	    	  	  		{
	    	  	  			end=end*176764762/(<%=end1%>-<%=sta1%>);
	    	  	     	    sta=sta*176764762/(<%=end1%>-<%=sta1%>);
	    	  	  		}
	    	  	  		else if(chr=="8")
	    	  	  		{
	    	  	  			end=end*175793759/(<%=end1%>-<%=sta1%>);
	    	  	    	    sta=sta*175793759/(<%=end1%>-<%=sta1%>);
	    	  	  		}
	    	  	  		else if(chr=="9")
	    	  	  		{
	    	  	  			end=end*156750706/(<%=end1%>-<%=sta1%>);
	    	  	  		    sta=sta*156750706/(<%=end1%>-<%=sta1%>);
	    	  	  		}
	    	  	  		else if(chr=="10")
	    	  	  		{
	    	  	  			end=end*150189435/(<%=end1%>-<%=sta1%>);
	    	  	     	    sta=sta*150189435/(<%=end1%>-<%=sta1%>);
	    	  	  		}
    	  	      	}
    	  			ctx.fillStyle = "<%= color%>";
    	  	        ctx.fillRect(sta+20,11,end-sta+5,20);
    	  	        ctx.stroke();
    	  	        
    	  	        var cd = new Object();
    	  	        cd.par = "<%= (String)color_name[parent_all.get(j)]%>";
    	  	        cd.sta = <%=(Integer)sta_all.get(j)%>;
    	  	        cd.end = <%=(Integer)end_all.get(j)%>;
    	  	        $(c).data("<%= color%>",cd);
    			</script>
    		<%}%>
    	</div>
     </div>
    <%}
    
    }%>
    </div>
    
    <div class="content" style="overflow-X: scroll;margin-top:140px;margin-bottom:40px;    border-radius: 5px;">	
    <table>
      <thead>
    	<tr>
    		<th>name</th>
    		<th>count</th>
    		<th>min</th>
    		<th>mid</th>
    		<th>sizeAve</th>
    		<th>sizesd</th>
    		<th>covline</th>
    		<th>p0</th>
    		<th>p1</th>
    		<th>p2</th>
    		<th>p3</th>
    		<th>p4</th>
    		<th>p5</th>
    		<th>p6</th>
    		<th>p7</th>
    		<th>p8</th>
    		<th>p9</th>
    		<th>p10</th>
    		<th>p11</th>
    		<th>p12</th>
    		<th>p13</th>
    		<th>p14</th>
    		<th>p15</th>
    		<th>p16</th>
    		<th>p17</th>
    		<th>p18</th>
    		<th>p19</th>
    		<th>p20</th>
    		<th>p21</th>
    		<th>p22</th>
    		<th>p23</th>
    		<th>p24</th>
    	</tr>
    	</thead>
    	
    	<tbody>
    	<%for(int i=0;i<theName.length;i++){
    		ArrayList<String> theLine = (ArrayList<String>)table_data.get(theName[i]);
    	%>
    		<tr>
    		    <td><span style="font-size: 10pt;"><%=theName[i] %></span></td>
    			<%for(int k=0;k<theLine.size();k++){%>
    				<td><span style="font-size: 10pt;"><%=theLine.get(k) %></span></td>
    			<%}%>
    	    </tr>
    	<%}%>
    	</tbody>
    </table>    
    </div>	
    </div>    
    <%@ include file="../ListFooter.jsp"%>
  </body>
  <script type="text/javascript">
	$(document).ready(function() {
		$('canvas').mouseover(function(){
			var this_id = $(this).attr('id');
            this_id = "#"+this_id;
            var c = $(this_id);
            c.mousemove(function(e){
                var bbox = c[0].getBoundingClientRect(); 
                var x = e.clientX - bbox.left * (c[0].width / bbox.width);  
                var y = e.clientY - bbox.top * (c[0].height / bbox.height); 

                var imgData=c[0].getContext('2d').getImageData(x,y,1,1);
                var color = getColor(imgData.data[0],imgData.data[1],imgData.data[2]);

                if(color != "#000000"){
                    $(this_id).attr("title","parent is :   "+$(this_id).data(color).par +"     the length : "+$(this_id).data(color).sta+"~~~"+$(this_id).data(color).end);
                }else
                    $(this_id).removeAttr("title");
            });
		});
	});

	function getS16(mydata){
        var s = mydata.toString(16);
        if(mydata<16){
            s = "0"+s;
        }
        return s;
    } 

    function getColor(data1,data2,data3){
        return "#"+getS16(data1)+getS16(data2)+getS16(data3);
    }
 </script>
</html>
