<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
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
        Map<String,Object> attributes=ActionContext.getContext().getSession();
        String search = attributes.get("search").toString();
        int len = Integer.parseInt(attributes.get("len").toString());
        HashMap<String,ArrayList<String>> data = (HashMap<String,ArrayList<String>>)attributes.get("data");
           
    %>
    <title>Tool three</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="author" content="Daliu"/>
    <meta name="keywords" content=""/>
    <meta name="describe" content=""/>
    
    <link type="text/css" rel="stylesheet" href="Css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="Css/bootstrap-table.min.css"/>
    <link type="text/css" rel="stylesheet" href="Css/main.css"/>
    <script type="text/javascript" src="Jscript/jquery.1.11.3.min.js"></script>
    <script type="text/javascript" src="Jscript/bootstrap-table.min.js"></script>
    
  </head>
  
  <body>
    <%@ include file="../ListHeader.jsp"%>
    <div class="content" style="">
    	<div class="describe">
        	<h3>Bin Map</h3>
            <br/>
            <p>The Visualisation of mosaic haplotypes for progenies in synthetic population, reflecting a high-resolution reshuffle across 24 founders genomes.</p>
        </div>
        <div class="steps">
            <image src="images/steps3.png">
        </div>
        <div class="search">
            <h3>Summary:</h3>
            <table class="table table-hover">
            <%
                if(search.equals("first")){
            %> 
            <thead>
                    <tr>
                        <th>Chromesome</th>
                        <th>Position</th>
                        <th>Trait</th>
                        <th>SNP</th>
                        <th>Pvalue</th>
                    </tr>
           </thead>
           
           <%}else{%>
              
            <thead>
                    <tr>
                        <th>SNP</th>
                        <th>Allele</th>
                        <th>Gene</th>
                        <th>Transcript</th>
                        <th>Annotation</th>
                    </tr>
           </thead>
                
                
           <%}%>
                
                
                
           <% 
                    int i;
              	    for(i=1;i<=len;i++){
            %>
            <tbody>
            	<tr>
                    <td><%=data.get(Integer.toString(i)).get(0)%></td>
                    <td><%=data.get(Integer.toString(i)).get(1)%></td>
                    <td><%=data.get(Integer.toString(i)).get(2)%></td>
                    <td><%=data.get(Integer.toString(i)).get(3)%></td>
                    <td><%=data.get(Integer.toString(i)).get(4)%></td>
                </tr>	
            </tbody>
            
            <%} %>
            </table>
            </div>
            <div class="btns">
               
                <button class="btn" style="height: 48px; width: 150px; ">DOWNLOAD</button>
            </div>
        </div>
        <%@ include file="../ListFooter.jsp"%>
  </body>
</html>
