<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page import="org.hibernate.HibernateException"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="java.io.*" %>

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
    <title>Primer</title>
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
        Map<String, String[]> formap=new HashMap<String, String[]>();
        formap=(Map<String, String[]>)attribute.get("formap");

        Set<String> forname=formap.keySet();
        Iterator<String> it1=forname.iterator();

        Map<String, String> fornummap=new HashMap<String, String>();
        fornummap=(Map<String, String>)attribute.get("fornummap");

        Set<String> fornumname=fornummap.keySet();
        Iterator<String> itfornum=fornumname.iterator();

        Map<String, String[]> intmap=new HashMap<String, String[]>();
        intmap=(Map<String, String[]>)attribute.get("intmap");

        Set<String> intname=intmap.keySet();
        Iterator<String> it2=intname.iterator();

        Map<String, String> intnummap=new HashMap<String, String>();
        intnummap=(Map<String, String>)attribute.get("intnummap");

        Set<String> intnumname=intnummap.keySet();
        Iterator<String> itintnum=intnumname.iterator();

        Map<String, String[]> revmap=new HashMap<String, String[]>();
        revmap=(Map<String, String[]>)attribute.get("revmap");

        Set<String> revname=revmap.keySet();
        Iterator<String> it3=revname.iterator();

        Map<String, String> revnummap=new HashMap<String, String>();
        revnummap=(Map<String, String>)attribute.get("revnummap");

        Set<String> revnumname=revnummap.keySet();
        Iterator<String> itrevnum=revnumname.iterator();
    %>

</head>

<body>
<%@ include file="../ListHeader.jsp"%>

<div  style="height:auto;">
    <div class="describe1">

        <div class="left5" name="button" style="height: auto; width: 95%;">
            <h4>ACCEPTABLE LEFT PRIMERS</h4>
            <table class="table blast-table"   style="height: auto; width: auto">
                <tr>
                    <td style="width: 50px; height: 20px"></td><td style="width: 280px; height: 45px"></td><td style="width: 80px; height: 45px">0-based</td><td style="width: 30px;height: 45px "></td><td style="width: 20px;height: 45px "></td><td style="width: 50px;height: 45px "></td><td style="width: 50px;height: 45px "></td><td style="width: 20px;height: 45px "></td><td style="width: 30px;height: 45px "></td><td style="width: 30px;height: 45px "></td>
                </tr>
                <tr>
                    <td style="width: 50px; height: 20px">#</td><td style="width: 300px; height: 45px">seqence</td><td style="width: 30px; height: 45px">start</td><td style="width: 30px;height: 45px ">in</td>
                    <td style="width: 20px;height: 45px ">#N</td><td style="width: 50px;height: 45px ">GC%</td><td style="width: 50px;height: 45px ">Tm</td><td style="width: 20px;height: 45px ">selfany</td>
                    <td style="width: 30px;height: 45px ">selfend</td><td style="width: 30px;height: 45px ">quallity</td>
                </tr>
                <%int sum=0;
                    while(itfornum.hasNext())
                    {
                        String numkey=itfornum.next();
                        String numvalue=fornummap.get(numkey);
                        String num=Integer.toString(sum);
                        sum++;
                        String[] str=formap.get(num);
                        String snum=str[0];
                        String sseq=str[1];
                        String sstart=str[2];
                        String sin=str[3];
                        String sN=str[4];
                        String sgc=str[5];
                        String sTm=str[6];
                        String sany=str[7];
                        String send=str[8];
                        String slity=str[9];


                %>
                <tr>

                    <td align="left"><font color=blue><%=snum %></font></td>

                    <td align="left"><%=sseq %></td><td align="left"><%=sstart %></td><td align="left"><%=sin %></td><td align="left"><%=sN %></td><td align="left"><%=sgc %>%</td>
                    <td align="left"><%=sTm %></td><td align="left"><%=sany %></td><td align="left"><%=send %></td><td align="left"><%=slity %></td>
                </tr>
                <%} %>
                <div class="download"></div>


            </table><button class="btn" id="back"><a href="download/primerexample.for" target="_blank">Download</a></button>


        </div>


    </div>
    <div class="describe2">
        <div class="left5" name="int" style="height: auto; width: 95%">
            <h4>ACCEPTABLE INTERNAL OLIGOS</h4>
            <table class="table blast-table"   style="height: auto; width: auto">
                <tr>
                    <td style="width: 50px; height: 20px"></td><td style="width: 280px; height: 45px"></td><td style="width: 80px; height: 45px">0-based</td><td style="width: 30px;height: 45px "></td><td style="width: 20px;height: 45px "></td><td style="width: 50px;height: 45px "></td><td style="width: 50px;height: 45px "></td><td style="width: 20px;height: 45px "></td><td style="width: 30px;height: 45px "></td><td style="width: 30px;height: 45px "></td>
                </tr>
                <tr>
                    <td style="width: 50px; height: 20px">#</td><td style="width: 300px; height: 45px">seqence</td><td style="width: 30px; height: 45px">start</td><td style="width: 30px;height: 45px ">in</td>
                    <td style="width: 20px;height: 45px ">#N</td><td style="width: 50px;height: 45px ">GC%</td><td style="width: 50px;height: 45px ">Tm</td><td style="width: 30px;height: 45px ">selfany</td>
                    <td style="width: 30px;height: 45px ">selfend</td><td style="width: 30px;height: 45px ">quallity</td>
                </tr>
                <%sum=0;
                    while(itintnum.hasNext())
                    {
                        String numkey=itintnum.next();
                        String numvalue=intnummap.get(numkey);
                        String num=Integer.toString(sum);
                        sum++;
                        String[] str=intmap.get(num);
                        String snum=str[0];
                        String sseq=str[1];
                        String sstart=str[2];
                        String sin=str[3];
                        String sN=str[4];
                        String sgc=str[5];
                        String sTm=str[6];
                        String sany=str[7];
                        String send=str[8];
                        String slity=str[9];


                %>
                <tr>

                    <td align="left"><font color=blue><%=snum %></font></td>

                    <td align="left"><%=sseq %></td><td align="left"><%=sstart %></td><td align="left"><%=sin %></td><td align="left"><%=sN %></td><td align="left"><%=sgc %>%</td>
                    <td align="left"><%=sTm %></td><td align="left"><%=sany %></td><td align="left"><%=send %></td><td align="left"><%=slity %></td>
                </tr>
                <%} %>



            </table><div class="download">
            <button class="btn" id="back"><a href ="download/primerexample.int" target="_blank">Download</a></button>
        </div>


        </div>


    </div>
    <div class="describe3">
        <div class="left5" name="int" style="height: auto; width: 95%">
            <h4>ACCEPTABLE RIGHT PRIMERS</h4>

            <table class="table blast-table"   style="height: auto; width: auto">

                <tr>
                    <td style="width: 50px; height: 20px"></td><td style="width: 280px; height: 45px"></td><td style="width: 80px; height: 45px">0-based</td><td style="width: 30px;height: 45px "></td><td style="width: 20px;height: 45px "></td><td style="width: 50px;height: 45px "></td><td style="width: 50px;height: 45px "></td><td style="width: 20px;height: 45px "></td><td style="width: 30px;height: 45px "></td><td style="width: 30px;height: 45px "></td>
                </tr>
                <tr>
                    <td style="width: 50px; height: 20px">#</td><td style="width: 300px; height: 45px">seqence</td><td style="width: 30px; height: 45px">start</td><td style="width: 30px;height: 45px ">in</td>
                    <td style="width: 20px;height: 45px ">#N</td><td style="width: 50px;height: 45px ">GC%</td><td style="width: 50px;height: 45px ">Tm</td><td style="width: 20px;height: 45px ">selfany</td>
                    <td style="width: 30px;height: 45px ">selfend</td><td style="width: 30px;height: 45px ">quallity</td>
                </tr>
                <%sum=0;
                    while(itrevnum.hasNext())
                    {
                        String numkey=itrevnum.next();
                        String numvalue=revnummap.get(numkey);
                        String num=Integer.toString(sum);
                        sum++;
                        String[] str=revmap.get(num);
                        String snum=str[0];
                        String sseq=str[1];
                        String sstart=str[2];
                        String sin=str[3];
                        String sN=str[4];
                        String sgc=str[5];
                        String sTm=str[6];
                        String sany=str[7];
                        String send=str[8];
                        String slity=str[9];


                %>
                <tr>

                    <td align="left"><font color=blue><%=snum %></font></td>

                    <td align="left"><%=sseq %></td><td align="left"><%=sstart %></td><td align="left"><%=sin %></td><td align="left"><%=sN %></td><td align="left"><%=sgc %>%</td>
                    <td align="left"><%=sTm %></td><td align="left"><%=sany %></td><td align="left"><%=send %></td><td align="left"><%=slity %></td>
                </tr>
                <%} %>



            </table><div class="download">
            <button class="btn" id="back"><a href ="download/primerexample.rev" target="_blank">Download</a></button>
        </div>


        </div>


    </div>
    <div class="btns">
        <button class="btn" id="back"><a href="tools.jsp">Back</a></button>
    </div>
<%@ include file="../ListFooter.jsp"%>
</div>


</body>
</html>
