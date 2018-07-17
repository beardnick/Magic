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
	<script type="text/javascript" src="Jscript/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="Jscript/bootstrap-table.min.js"></script>

  </head>
  
  <body>
    <%@ include file="../ListHeader.jsp"%>
    
    <div class="content" style="height:700px;width:1200px;">
            <div class="describe">
                <h3>Primer Design by Region</h3>
                <h4>You can choose one of the provided databases and input a genomic region to pick PCR-primers to validate genomic sequence or develop molecular markers. Here we use Primer3 as a backend engine.
</h4>
               <!-- lv 7-11 change p->h4 -->
           
                 </div>
            <div class="inputs" style="height: 150px; ">
             <form action="primer" method="post">
                <div class="leftp">
                    <div style="height:65px;"><!-- lv 7-11 change class=""->class="background1" 包括以下所有class="background"修改了style-->
                        <div class="background" style="float:left;width:45%;margin:5px;">
                            <h4>&nbsp;&nbsp;Chromosome:&nbsp;<select name="chromosome" id="chromosome1" class="input"  style="width: 58px; ">
                            	
                                <option value="1">1</option>
                                <option value="2">2</option>
                            </select></h4>
                            
                        </div><div class="background" style="float:right;width:45%;margin:5px;">
                            <h4>&nbsp;&nbsp;Database:&nbsp;&nbsp;&nbsp;&nbsp;<select name="database" id="database1" class="input"  style="width: 78px; ">
                            	<option style="width:150px" value="HZS">HZS</option>
                                <option style="width:150px" value="V3.25">V3.25</option>
                                <option style="width:150px" value="V4">V4</option>
                                <option style="width:150px" value="PAN">PAN</option>
                            </select>
							</h4>
                    		</div>
                    
                    </div>
                    <div style="height:50px;">
                        <div class="background" style="float:left;width:45%;margin:5px;">
                            <h4>&nbsp;&nbsp;Start position:&nbsp;<input type="text" name="sposition" id="sposition1"/></h4>
                            
                        </div><div class="background" style="float:right;width:45%;margin:5px;">
                            <h4>&nbsp;&nbsp;End position:&nbsp;<input type="text" name="eposition" id="eposition1"/></h4>
                        </div>
                    </div>   
                </div>
                <form action="blast" method="post" >
                <div class="leftp2" style="height: 350px;">
                                <h3>Parameter Selection</h3><!-- lv 7-11 change 套用的primersearch2 -->
                    <div style="height:65px;text-align:right;">
                        <div class="background" style="float:left;width:33%;margin:10px;">
                            <h4>Optimal primer size:&nbsp;<input type="text" name="opsize" id="opsize1" value="20"/>&nbsp;</h4>
                      	</div><div class="background" style="float:left;width:30%;margin:10px;">
                            <h4>Max primer size:&nbsp;<input type="text" name="maxsize" id="maxsize1" value="27"/>&nbsp;</h4>
                    	</div><div class="background" style="float:left;width:30%;margin:10px;">
                            <h4>Min primer size:&nbsp;<input type="text" name="minsize" id="maxsize1" value="18"/>&nbsp;</h4>
                    	</div>
                    </div>
                    <div style="height:65px;text-align:right;">
                        <div class="background" style="float:left;width:33%;margin:10px;">
                            <h4>Optimal primer TM:&nbsp;<input type="text" name="opttm" id="opttm1" value="60.0"/>&nbsp;</h4>
                      	</div><div class="background" style="float:left;width:30%;margin:10px;">
                            <h4>Max primer TM:&nbsp;<input type="text" name="maxtm" id="maxtm1" value="63.0"/>&nbsp;</h4>
                    	</div><div class="background" style="float:left;width:30%;margin:10px;">
                            <h4>Min primer TM:&nbsp;<input type="text" name="mintm" id="mintm1" value="57.0"/>&nbsp;</h4>
                    	</div>
                    </div>
                    <div style="height:65px;text-align:right;">
                        <div class="background" style="float:left;width:33%;margin:10px;">
                            <h4>Optimal GC percent:&nbsp;<input type="text" name="optgc" id="optgc1" value="50.0"/>&nbsp;</h4>
                      	</div><div class="background" style="float:left;width:30%;margin:10px;">
                            <h4>Max GC percent:&nbsp;<input type="text" name="maxgc" id="maxgc1" value="80.0"/>&nbsp;</h4>
                    	</div><div class="background" style="float:left;width:30%;margin:10px;">
                            <h4>Min GC percent:&nbsp;<input type="text" name="mingc" id="mingc1" value="20.0"/>&nbsp;</h4>
                    	</div>
                    </div>
                    <div style="height:65px;text-align:right;">
                        <div class="background" style="float:left;width:33%;margin:10px;">
                            <h4>Default product:&nbsp;<input type="text" name="defaultproduct" id="defaultproduct" value="100-300"/>&nbsp;</h4>
                      	</div><div class="background" style="float:left;width:30%;margin:10px;">
                            <h4>Max Poly-X:&nbsp;<input type="text" name="maxployx" id="maxployx1" value="5"/>&nbsp;</h4>
                    	</div><div class="background" style="float:left;width:30%;margin:10px;">
                            <h4>Max Self Any:&nbsp;<input type="text" name="selfany" id="selfany1" value="8"/>&nbsp;</h4>
                    	</div>
                    </div>
                </div>
                <div style="position:absolute;left:500px;top:590px;"><!-- lv 7-11 change new -->
				 <button class="btn" id="next1">Submit</button>
				 </div>
                </form>
                
            </div>
        </div>
    
    
    
    <%@ include file="../ListFooter.jsp"%>
  </body>
</html>
