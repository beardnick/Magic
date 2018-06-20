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
    <link href="Css/mycss.css" rel="stylesheet"/>
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
    
    <div class="content" style="height:850px;">
            <div class="describe">
                <h3>BLASTN/Primer-BLASTN</h3>
                <h4>You can use BLASTN program comparing nucleotide sequence to our databases and calculates the statistical significance. If you query sequence is Less than 50 bp, please use Primer-BLASTN. Here we use <u><b>Basic Local Alignment Search Tool (BLAST) </b></u>as a backend engine.</h4>
                 </div>
            <div class="inputs">
             <form action="blast" method="post" onsubmit="return check1()">
                <div class="left">
                    <div style="height:100px;">
                        <div class="myinput" style="float:left;width:45%;margin:5px;">
                            <h4>BLAST programe</h4>
                            <select name="blastprograme" id="blastprograme1"  onchange="checkdata()">
                                <option value="blastn">blastn</option>
                                <option value="primer-blast">primer-blast</option>
                            </select>
                        </div>
                        <div class="myinput"  style="float:left;width:45%;margin:5px;">
                            <h4>Database</h4>
                            <select  name="database" id="Database">
                                <option style="width:150px" value="HZS">HZS</option>
                                <option style="width:150px" value="V3.25">V3.25</option>
                                <option style="width:150px" value="V4">V4</option>
                                <option style="width:150px" value="PAN">PAN</option>
                            </select>
                        </div>
                    </div>
                    <div class="myinput" style="height:180px;padding:5px;padding-right:7%;">
                        <h4>Enter FASTA sequence</h4>
                        <textarea class="form-control" rows="5" name="inputtext" id="inputtext" type="text" onblur='javascript:$("#auto")'></textarea>
                    </div>
                    <div class="" style="padding-top:5px;">
                        <h4>Or input file</h4>
                        <input type="file"  type="text" onblur='javascript:$("#auto")' id="inputfile1" name="inputfile"/>
                    </div>
                </div>
                <div class="right">
                    <h4>Parameter selection</h4>
                    <table class="table last-table" style="height: 98px; width: 400px">
                  
                        <tr class="myinput" >
                            <td  style="height: 41px"><span>Evalue</span></td>
                            <td><input class="form-control" id="Eralue"  type="text" name="inputeralue" onblur='javascript:$("#auto")' value="0.00001" style="height:41px"/></td>
                        </tr>
                        
                        <tr class="myinput">
                            <td style="height: 41px"><span>Percent Identity</span></td>
                            <td><input class="form-control" style="height:41px" id="percent" type="text"  name="inputpercent" onblur='javascript:$("#auto")' value="5"/></td>
                        </tr>

                        <tr class="myinput">
                            <td style="height: 41px"><span>Max target seqences</span></td>
							<td><input class="form-control" style="height:41px" id="maxtar" type="text"  name="inputmaxtarget" onblur='javascript:$("#auto")' value="50" /></td>
                        </tr>
                        
                    </table>
                </div>
                <div class="btns">
                <button class="btn" id="next1">NEXT</button></form>
                </div>
                
          		
                

            </div>
        </div>
    
    
    
    <%@ include file="../ListFooter.jsp"%>
  </body>
</html>
