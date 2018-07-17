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
    <title>Blastn</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="author" content="Daliu"/>
    <meta name="keywords" content=""/>
    <meta name="describe" content=""/>
    <link href="Css/bootstrap.min.css" rel="stylesheet"/>
    <link href="Css/main.css" rel="stylesheet"/>
	<script type="text/javascript" src="Jscript/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="Jscript/bootstrap-table.min.js"></script>
<script type="text/javascript"> 
  function check1()
{ 
	var eralue=$("#Eralue").val();//用户名
	var maxtar=$("#maxtar").val();//用户名
 	var percent=$("#percent").val();
 	var database1=$("#Database").val();
 	var blastprograme1=$("#blastprograme1").val();
 	var inputfile1=$("#inputfile1").val();
 	var inputtext1=$("#inputtext").val();
   if(eralue=="" || maxtar=="" ||percent==""||database1=="Choose database")
   {
     alert("Error: Please put in eralue,maxtarget,percent!");
     return false;
   }
   if(inputtext1=="")
   {
     alert("Error: Please put in FASTA sequence!");
     return false;
   }
  return true;
 }	
 </script>
<script type="text/javascript"> 
  function checkdata()
{ 
	var blastprograme1=$("#blastprograme1").val();//用户名
	if(blastprograme1=="primer-blast")
    {
		document.getElementById("Eralue").value="0.1";
    }
	if(blastprograme1=="blastn")
    {
		document.getElementById("Eralue").value="0.00001";
    }
  return true;
 }	
 </script>
  </head>
  
  <body>
    <%@ include file="../ListHeader.jsp"%>
    
    <div class="content" style="height:600px;"><!--lv 7-11-11：16 change  850->600-->
            <div class="describe">
                <h3>BLASTN/Primer-BLASTN</h3>
                <h4>You can use BLASTN program comparing nucleotide sequence to our databases and calculates the statistical significance. If you query sequence is Less than 50 bp, please use Primer-BLASTN. Here we use Basic Local Alignment Search Tool (BLAST) as a backend engine.</h4>
                 </div>
            <div class="inputs">
             <form action="blast" method="post" onsubmit="return check1()">
                <div class="left">
                    <div style="height:10%;">
                        <div class="background" style="width:49%;height:auto;float:left;margin-right:2%"><!-- lv 7-11-10：01 change -->
                            <span style="padding-left:8px;display:inline-block;height:30px;line-height:30px;width:60%"> <h4>BLAST programe:&nbsp;&nbsp;</h4></span><!-- lv 7-11-10：49 change -->
                            <select name="blastprograme" id="blastprograme1" class="input"  onchange="checkdata()"style="width:30%;">
                            	
                                <option value="blastn">blastn</option>
                                <option value="primer-blast">primer-blast</option>
                            </select>
                        </div>
                        <div class="background" style="width:49%;height:auto;float:left;"><!-- lv 7-11-10：01 change -->
                            <span style="padding-left:8px;display:inline-block;height:30px;line-height:30px;width:60%"><h4> Database:&nbsp;&nbsp;&nbsp;&nbsp;</h4></span><!-- lv 7-11-10：49 change -->
                            <select  class="input" name="database" id="Database" style="width:30%;"> 
                                <option style="width:150px" value="HZS">HZS</option>
                                <option style="width:150px" value="V3.25">V3.25</option>
                                <option style="width:150px" value="V4">V4</option>
                                <option style="width:150px" value="PAN">PAN</option>
                            </select>
                        </div>
                    </div>
                    <div class="background" style="height:260px;padding:5px;padding-right:7%;clear:both"><!-- lv 7-11-10：01 change class=""->class="background" 180px->280px-->
                        <span style="padding-left:8px;display:inline-block;height:30px;line-height:30px;"><h4>Enter FASTA sequence</h4></span><!-- lv 7-11-10：49 change -->
                        <textarea style="resize:none" class="form-control" rows="8" name="inputtext" id="inputtext" type="text" onblur='javascript:$("#auto")'></textarea><!-- lv 7-11-10：49 change rows8->12-->
                    </div>
                    <div class="background" style="padding-top:5px;"><!-- lv 7-11-10：01 change class=""->class="background"-->
                        <span style="padding-left:8px;display:inline-block;height:30px;line-height:30px;margin-top:10px;"><h4>Or input file</h4></span><!-- lv 7-11-10：49 change -->
                        <input type="file"  type="text" onblur='javascript:$("#auto")' id="inputfile1" name="inputfile"/>
                    </div>
                </div>
                <div class="right">
                    <h4>Parameter selection</h4>
                    <table class="table last-table" style="height: 88px; width: 500px"><!-- lv 7-11 change 98->88 400->500 -->
                    <br/>
                        <tr>
                            
                            <td style="width: 300px; height: 55px"><h4>Evalue</h4></td>  <!-- lv 7-11 change 200->300 45->55 -->                 
                            <td><input id="Eralue" class="form-control" type="text" name="inputeralue" style="width:150px;" onblur='javascript:$("#auto")' value="0.00001"/></td><!-- lv 7-11 change add style-->
                        </tr>
                        <tr>
                            <td style="width: 300px;height: 51px "><h4>Percent Identity</h4></td><!-- lv 7-11 change 200->300 41->51 -->
                            <td><input id="percent" type="text" class="form-control" name="inputpercent" style="width:150px;" onblur='javascript:$("#auto")' value="5"/></td><!-- lv 7-11 change add style-->
                        </tr>
                        <tr>
                            <td style="width: 300px;height: 51px "><h4>Max target seqences</h4></td><!-- lv 7-11 change 200->300 41->51 -->
                         		 <td><input id="maxtar" type="text" class="form-control" name="inputmaxtarget" style="width:150px;" onblur='javascript:$("#auto")' value="50" /></td><!-- lv 7-11 change add style-->
                        </tr>
                        
                    </table>
                </div>
                <div class="btns">
                <button class="btn" id="next1">Submit</button></form>
                </div>
                
          		
                

            </div>
        </div>
    
    
    
    <%@ include file="../ListFooter.jsp"%>
  </body>
</html>
