<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Primer Design by Region</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="author" content="Daliu"/>
    <meta name="keywords" content=""/>
    <meta name="describe" content=""/>
    <link href="Css/bootstrap.min.css" rel="stylesheet"/>
    <link href="Css/main.css" rel="stylesheet"/>
    <link href="Css/mycss.css" rel="stylesheet"/>
	<script type="text/javascript" src="Jscript/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="Jscript/bootstrap-table.min.js"></script>

  </head>
  
  <body>
    <%@ include file="../ListHeader.jsp"%>
    
    <div class="content" style="height:700px;width:1200px;">
            <div class="describe">
                <h3>Primer Design by Region</h3>
                <p>You can input your sequences directly to pick PCR-primers or develop molecular markers. Here we use  Primer3 as a backend engine.</p>
           
                 </div>
            <div class="inputs" style="height: 150px; ">
             <form action="primer" method="post">
                <div class="leftp">
                    <div style="height:65px;">
                        <div class="myinput" style="float:left;width:45%;">
                            <h4>Chromosome:&nbsp;<select name="chromosome" id="chromosome1" class="input"  style="width: 58px; ">
                            	
                                <option value="1">1</option>
                                <option value="2">2</option>
                            </select></h4>
                            
                        </div><div class="myinput" style="float:right;width:45%;">
                            <h4>Database:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="database" id="database1" class="input"  style="width: 78px; ">
                            	<option style="width:150px" value="H2S">HZS</option>
                                <option style="width:150px" value="V3.25">V3.25</option>
                                <option style="width:150px" value="V4">V4</option>
                                <option style="width:150px" value="PAN">PAN</option>
                            </select>
							</h4>
                    		</div>
                    
                    </div>
                    <div style="height:50px;">
                        <div class="myinput" style="float:left;width:45%;">
                            <h4>Start position:&nbsp;<input type="text" name="sposition" id="sposition1"/></h4>
                            
                        </div><div class="myinput" style="float:right;width:45%;">
                            <h4>End position:&nbsp;<input type="text" name="eposition" id="eposition1"/></h4>
                        </div>
                    </div>   
                </div>
                <form action="blast" method="post" >
                <div class="leftp2" style="height: 350px; ">
                <h3>Parameter Selection:</h3>
                    <div style="height:65px;text-align:right;">
                        <div class="myinput" style="float:left;width:33%;">
                            <h4>Optimal primer size:<input type="text" name="opsize" id="opsize1" value="20"/></h4>
                      	</div><div class="myinput" style="float:left;width:33%;">
                            <h4>Max primer size:<input type="text" name="maxsize" id="maxsize1" value="27"/></h4>
                    	</div><div class="myinput" style="float:left;width:33%;">
                            <h4>Min primer size:<input type="text" name="minsize" id="maxsize1" value="18"/></h4>
                    	</div>
                    </div>
                    <div style="height:65px;text-align:right;">
                        <div class="myinput" style="float:left;width:33%;">
                            <h4>Optimal primer TM:<input type="text" name="opttm" id="opttm1" value="60.0"/></h4>
                      	</div><div class="myinput" style="float:left;width:33%;">
                            <h4>Max primer TM:<input type="text" name="maxtm" id="maxtm1" value="63.0"/></h4>
                    	</div><div class="myinput" style="float:left;width:33%;">
                            <h4>Min primer TM:<input type="text" name="mintm" id="mintm1" value="57.0"/></h4>
                    	</div>
                    </div>
                    <div style="height:65px;text-align:right;">
                        <div class="myinput" style="float:left;width:33%;">
                            <h4>Optimal GC percent:<input type="text" name="optgc" id="optgc1" value="50.0"/></h4>
                      	</div><div class="myinput" style="float:left;width:33%;">
                            <h4>Max GC percent:<input type="text" name="maxgc" id="maxgc1" value="80.0"/></h4>
                    	</div><div class="myinput" style="float:left;width:33%;">
                            <h4>Min GC percent:<input type="text" name="mingc" id="mingc1" value="20.0"/></h4>
                    	</div>
                    </div>
                    <div style="height:65px;text-align:right;">
                        <div class="myinput" style="float:left;width:33%;">
                            <h4>Default product:<input type="text" name="defaultproduct" id="defaultproduct" value="100-300"/></h4>
                      	</div><div class="myinput" style="float:left;width:33%;">
                            <h4>Max Poly-X:<input type="text" name="maxployx" id="maxployx1" value="5"/></h4>
                    	</div><div class="myinput" style="float:left;width:33%;">
                            <h4>Max Self Any:<input type="text" name="selfany" id="selfany1" value="8"/></h4>
                    	</div>
                    </div>
                </div>
				 <button class="btn" id="next1">NEXT</button>
                </form>
                
            </div>
        </div>
    
    
    
    <%@ include file="../ListFooter.jsp"%>
  </body>
</html>
