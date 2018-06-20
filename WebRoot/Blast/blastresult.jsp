<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page import="org.hibernate.HibernateException"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="java.io.*" %> 
<%@ page import="com.sun.rowset.CachedRowSetImpl" %>
<%@ page import="java.util.Map.Entry" %>
<%@ page trimDirectiveWhitespaces="true" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<style type="text/css">
	h1 {text-align: center}
	</style>
    <base href="<%=basePath%>">
    <title>Last</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="author" content="Daliu"/>
    <meta name="keywords" content=""/>
    <meta name="describe" content=""/>
    <link href="Css/bootstrap.min.css" rel="stylesheet"/>
    <link href="Css/main.css" rel="stylesheet"/>
	<script type="text/javascript" src="Jscript/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="Jscript/bootstrap-table.min.js"></script>
<%
	Map attribute = ActionContext.getContext().getSession();
	String queryid=(String)attribute.get("queryid");
	String programe=(String)attribute.get("programe");
	String inputid=(String)attribute.get("inputid");
	String querylength=(String)attribute.get("querylength");
	String blastdatabase=(String)attribute.get("blastdatabase");
	String evalue=(String)attribute.get("evalue");
	String identity=(String)attribute.get("identity");
	String gap=(String)attribute.get("gap");
	String score=(String)attribute.get("score");
	String blastprograme=(String)attribute.get("blastprograme");
	String trait=(String)attribute.get("trait");
	String database=(String)attribute.get("database");
	/*String qseq=(String)attribute.get("qseq");
	String midline=(String)attribute.get("midline");
	String hseq=(String)attribute.get("hseq");*/
	String qseq,midline,hseq;

	Map<String, String> queryfrommap=new HashMap<String, String>();
	queryfrommap=(Map<String, String>)attribute.get("queryfrommap");
	
	Map<String, String> querytomap=new HashMap<String, String>();
	querytomap=(Map<String, String>)attribute.get("querytomap");
	
	Map<String, String> hitfrommap=new HashMap<String, String>();
	hitfrommap=(Map<String, String>)attribute.get("hitfrommap");
	
	Map<String, String> hittomap=new HashMap<String, String>();
	hittomap=(Map<String, String>)attribute.get("hittomap");
	
	Map<String, String> gapmap=new HashMap<String, String>();
	gapmap=(Map<String, String>)attribute.get("gapmap");
	
	Map<String, String> identitymap=new HashMap<String, String>();
	identitymap=(Map<String, String>)attribute.get("identitymap");
	
	Map<String, String> chrmap=new HashMap<String, String>();
	String chrvalue=null;
	chrmap=(Map<String,String>)attribute.get("chrmap");
	
	Map<String, String> hseqmap=new HashMap<String, String>();
	hseqmap=(Map<String, String>)attribute.get("hseqmap");
	
	Map<String, String> qseqmap=new HashMap<String, String>();
	qseqmap=(Map<String, String>)attribute.get("qseqmap");
	
	Map<String, String> midlinemap=new HashMap<String, String>();
	midlinemap=(Map<String, String>)attribute.get("midlinemap");
	
	Map<String, String> evaluemap=new HashMap<String, String>();
	evaluemap=(Map<String, String>)attribute.get("evaluemap");
	
	Map<String, String> scoremap=new HashMap<String, String>();
	scoremap=(Map<String, String>)attribute.get("scoremap");
	
	Map<String, String> totalscoremap=new HashMap<String, String>();
	totalscoremap=(Map<String, String>)attribute.get("totalscoremap");
	
	Set<String> qseqname=qseqmap.keySet();
	Iterator<String> it1=qseqname.iterator();
	
	Set<String> hseqname=hseqmap.keySet();
	Iterator<String> it3=hseqname.iterator();
	
	Set<String> midlinename=midlinemap.keySet();
	Iterator<String> it2=midlinename.iterator();
	
	Set<String> evaluename=evaluemap.keySet();
	Iterator<String> itevalue=evaluename.iterator();
	
	Set<String> scorename=scoremap.keySet();
	Iterator<String> itscore=scorename.iterator();
	
	Set<String> totalscorename=totalscoremap.keySet();
	Iterator<String> ittotalscore=totalscorename.iterator();
	
	Set<String> chrname=chrmap.keySet();
	Iterator<String> itchr=chrname.iterator();
	Iterator<String> itchr1=chrname.iterator();
	char[] qseq2;
	char[] midline1;
	char[] hseq1;
	
 %>
 <script type="text/javascript"> 
function check1()
{ 
	var trait=$("#trait1").val();//用户名
	if(trait=="Please choose chr")
	{
		alert("please choose chr!");
		return false;
	}
 	 return true;
 }	
 </script>
  </head>
  
  <body>
    <%@ include file="../ListHeader.jsp"%>
    
    <div class="content" style="height:auto;">
            <div class="describe">
                <h3>BLASTN/Primer-BLASTN</h3>
                
                <p><div class="left3">
                    <h4>Blast Summary</h4>
                    <table class="table blast-table"style="height: auto; width: 1200px" >
                        
                        <tr>
                            <td style="width: 130px; height: 31px" >Query ID</td><td align="left" style="height: 36px; width: 400px; " ><%=queryid%></td>
                            <td style="width: 130px;height: 41px ">Database</td><td align="left"><%=database%></td>
                        </tr>
                        
                        <tr>
                            <td style="width: 80px;height: 41px " >Molecule type</td><td align="left">null</td>
                            <td style="width: 130px;height: 41px ">Program</td><td align="left"><%=blastprograme%></td>
                        </tr>
                        <tr>
                            <td style="width: 130px; height: 45px">Query Length</td><td align="left"><%=querylength%></td>
                        </tr>
                    </table>
                    </div>
                    <form action="blast" method="post" onsubmit="return check1()">
                    <div class="left4" name="button">
                    <h4>Descriptions</h4>
                    <table class="table blast-table"   style="height: auto; width: 1200px">
                        
                        <tr>
                            <td style="width: 250px; height: 45px">Description<td style="width: 250px; height: 45px">Max score<td style="width: 250px; height: 45px">Total score<td style="width: 250px;height: 45px ">Query cover</td>
                            <td style="width: 250px;height: 45px ">E&nbsp;value</td><td style="width: 147px;height: 45px ">Ident</td>
                        </tr>
                        <%int sum=0;
						if(!itchr.hasNext())
						{%>
							<tr><td><h3>No matching data!</h3></td></tr>
						<%}
                        while(itchr.hasNext())
                        {
                        	String evaluekey=itevalue.next();
							String scorekey=itscore.next();
							String chrkey=itchr.next();
							String totalscorekey=ittotalscore.next();
  							String evaluevalue=evaluemap.get(evaluekey);
   				 			String scorevalue=scoremap.get(scorekey);
   				 			chrvalue=chrmap.get(chrkey);
   							String totalscorevalue=totalscoremap.get(totalscorekey);
   							float maxscore=Float.parseFloat(scorevalue);
   							float totalscore=Float.parseFloat(totalscorevalue);
   							float querycover=maxscore/totalscore;
   							
   							identity=identitymap.get(chrkey);
                        	
                        	float identityfloat=Float.parseFloat(identity);
                        	float querylenfloat=Float.parseFloat(querylength);
                      	    float identities=(identityfloat/querylenfloat)*100;
                        %>
                        	<tr>
                        	
                        	<td align="left"><font color=blue><%=chrvalue %></font></td>
                        	
                        	<td align="left"><%=scorevalue %></td><td align="left"><%=totalscorevalue %></td><td align="left"><%=querycover %></td><td align="left"><%=evaluevalue %></td><td align="left"><%=identities %>%</td>
                        	</tr>
                        <%} %>
                        
                        
                        
                    </table>
                    </div>
                    <div class="left2">
                     <h4>Please choose chr</h4>
                    <form action="blast" method="post" onsubmit="return check1()">
                    <select class="select" name="trait" id="trait1" style="width: 145px; height: 50px" > 
				          
				           <%while(itchr1.hasNext()) 
				           {
				           String chrkey=itchr1.next();
				           chrvalue=chrmap.get(chrkey);%>
				          <option style="width:150px"><%=chrvalue%></option>
				          <%} %>
				          </select><button class="btn" id="next1">Choose</button> <input id="percent" type="hidden" class="form-control" name="blastprograme" onblur='javascript:$("#auto")' value=<%=blastprograme%>><input id="database1" type="hidden" class="form-control" name="database" onblur='javascript:$("#auto")' value=<%=database%>>
				          
                
                </form>
               
                </div>
                	<div class="left2">
                    <h4>Alignments</h4>
                    <table class="table blast-table"   style="height: auto; width:1200px">
                        
                        <tr>
                       	<td style="width: 150px; height: 45px">Score<td style="width: 150px; height: 45px">Expect<td style="width: 150px; height: 45px">Identities<td style="width: 150px;height: 45px ">Gaps</td>   <td style="width: 200px;height: 45px ">Query From-To</td>  <td style="width: 200px;height: 45px ">Hit From-To</td>  
                        </tr>
						<%if(!itchr.hasNext())
						{%>
							<tr><td><h3>No matching data!</h3></td></tr>
						<%}%>
                        <tr>
                        <%
                        score=null;
                        identity=null;
                        String gap1=null;
                        String evaluevalue=null;
                        String hitto1=null;
                        String queryto1=null;
                        String queryfrom1=null;
                        String hitfrom1=null;
                        if(trait!=null)
                        {
                        	queryfrom1=queryfrommap.get(trait);
                        	queryto1=querytomap.get(trait);
                        	hitfrom1=hitfrommap.get(trait);
                        	hitto1=hittomap.get(trait);
                        	score=scoremap.get(trait);
                        	gap1=gapmap.get(trait);
                        	identity=identitymap.get(trait);
                        	evaluevalue=evaluemap.get(trait);
                        	float identityfloat=Float.parseFloat(identity);
                        	float querylenfloat=Float.parseFloat(querylength);
                      	    float identities=(identityfloat/querylenfloat)*100;
                        	 %>
                        <td align="left"><%=score%></td>
                        <td align="left"><%=evaluevalue %></td>
                        <td align="left"><%=identities%>%</td>
                        <td align="left"><%=gap1%></td>
                        <td align="left"><%=queryfrom1 %>-<%=queryto1 %></td>
                        <td align="left"><%=hitfrom1 %>-<%=hitto1 %></td>
                        <% }%>
						</tr>
                        
                    </table>
                    </div>
                    <div class="leftblast" >
                    
                    <h4>Alignment</h4>
                    <table class="table blast-table" style="height:auto;">
                     <td style="font-family:Simsun">
               		<%  int t1=0;
               			int t2=0;
               			int t3=0;
               			
               			//chrvalue=request.getParameter("chr1");%>
               			
               			
               			<%
               			if(trait!=null)
               			{
               			 String chr1=trait;
               			 qseq=qseqmap.get(chr1);
  						 hseq=hseqmap.get(chr1);
  						 midline=midlinemap.get(chr1);
  						 
  						 qseq2= qseq.toCharArray();
  						 midline1= midline.toCharArray();
  						 hseq1=hseq.toCharArray();
               			 int qseqlen=qseq.length();
  						 int midlinelen=midline.length();
  						 int hseqlen=hseq.length();%>
                    	<h3><%=chr1 %>:</h3>
                    	<br>
                    	<%while(t1<qseqlen-1&&t2<midlinelen-1&&t3<hseqlen-1)
                   		 {%>
                   		
                    			<%for(int s=0;s<130;s++,t1++)
                    			{	
                    				if(midline.charAt(t1)==' ' )
                    				{ %>
                    					<% out.print("<font color=#EE1100><b>" + qseq.charAt(t1) + "</b></font>");%>
                    				<%} %>
                 			 	  	 <%else %>
                    				<%{%>
                    					<%=qseq.charAt(t1) %>
                    				<%} %> 
                    	 
                    	<%if(t1==qseqlen-1) 
                    		break;%>
                    	<%}%>
						&nbsp&nbsp<%out.print("Query&nbsp&nbsp"+t1+"   "); %>
                    	<br>
                    	<%for(int s=0;s<130;s++,t2++)
                    	{%>	
                    	<%if(t2==midlinelen)
                    		break; %>
                    	<%if(midline.charAt(t2)==' ')%>
                    	<%{ %>
                    		<% out.print("<font color=#EE1100><b>" + "X" + "</b></font>");%>
                    	<%} %>
                    	<%else%>
                    	<%{ %>
                    		<%=midline.charAt(t2)%>
                    	<%} %>
                    	<%}%>
                    	<br>
                    	
                    	<%for(int s=0;s<130;s++,t3++)
                    	{
                    	if(midline.charAt(t3)==' ')
                    	{ %>
                    	<% out.print("<font color=#EE1100><b>" + hseq.charAt(t3) + "</b></font>");%>
                    	<%} %>
                    	<%else %>
                    	<%{%>
                    	<%=hseq.charAt(t3) %>
                    	<%} %> 
                    	<%if(t3==hseqlen-1) 
                    		break;%>
                    	<%}%>
                    	&nbsp&nbsp<%out.print("Subject&nbsp"+t1+"   "); %>
                    	<br></br>
                    <% }}%>
                    <br></br>

                    </td>
                    </table>
                    </div>
            </div>
            <div class="inputs">
                
                
                <div class="btns">
                <button class="btn" id="next1" href="tools.jsp"><a href="Last/Last.jsp">Back</a></button>
                </div>
                
                

            </div>
        </div>
    
    
    
    <%@ include file="../ListFooter.jsp"%>
  </body>
</html>
