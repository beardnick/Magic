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
   
    <base href="<%=basePath%>">
    <title>Primer</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="author" content="Daliu"/>
    <meta name="keywords" content=""/>
    <meta name="describe" content=""/>
    <link type="text/css" rel="stylesheet" href="Css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="Css/bootstrap-table.css"/>
    <link type="text/css" rel="stylesheet" href="Css/main.css"/>
    <link type="text/css" rel="stylesheet" href="Css/tableexport.css"/>
    <script type="text/javascript" src="Jscript/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="Jscript/bootstrap.min.js"></script>
    <script type="text/javascript" src="Jscript/bootstrap-table.min.js"></script>
    <script type="text/javascript" src="Jscript/tableExport.js"></script>
    <script type="text/javascript" src="Jscript/bootstrap-table-export.js"></script>
      <style type="text/css">
	.fixed-table-body{overflow-x:auto;overflow-y:auto;height:auto;}
	tr,td,th{
	border:0px solid transparent !important;
	}
	.pagination a:hover{
	background: linear-gradient(to bottom, #fff 0%, #dcdcdc 100%);border:1px solid #979797 !important;
	}
	.pagination > .active > a, .pagination > .active > span, .pagination > .active > a:hover, .pagination > .active > span:hover, .pagination > .active > a:focus, .pagination > .active > span:focus
	 {
    z-index: 2;
    color: #fff;
    cursor: default;
    background: linear-gradient(to bottom, #585858 0%, #111 100%);
    border-color: #428bca;
    }
    .table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td {
    padding: 10px;
    line-height: 2.42857143;
    vertical-align: top;
    border-top: 1px solid #ddd;
     }
     .btn{
     line-height:0.4;
     }
  </style>
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
    <div class="col-md-12">
    <div class="describe1" style="margin:50px;">

        <div class="left5" name="button" style="height: auto; width: 100%;">
            
            <table id='table' class="table blast-table"  data-toggle="table">
            
            <h4 id="mythead1" style = "color:blue;">ACCEPTABLE LEFT PRIMERS</h4>
            <hr/>
<!--                 <tr>
                    <td style="width: 50px; height: 20px"></td><td style="width: 280px; height: 45px"></td><td style="width: 80px; height: 45px">0-based</td><td style="width: 30px;height: 45px "></td><td style="width: 20px;height: 45px "></td><td style="width: 50px;height: 45px "></td><td style="width: 50px;height: 45px "></td><td style="width: 20px;height: 45px "></td><td style="width: 30px;height: 45px "></td><td style="width: 30px;height: 45px "></td>
                </tr>
                <tr>
                    <td style="width: 50px; height: 20px">#</td><td style="width: 300px; height: 45px">seqence</td><td style="width: 30px; height: 45px">start</td><td style="width: 30px;height: 45px ">in</td>
                    <td style="width: 20px;height: 45px ">#N</td><td style="width: 50px;height: 45px ">GC%</td><td style="width: 50px;height: 45px ">Tm</td><td style="width: 20px;height: 45px ">selfany</td>
                    <td style="width: 30px;height: 45px ">selfend</td><td style="width: 30px;height: 45px ">quallity</td>
                </tr> -->
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
			</table>
		</div>
    </div>
    </div>
    <div class="col-md-12">
    <div class="describe2" style="margin:50px;">
        <div class="left5" name="int" style="height: auto; width: 100%"> 
            <table id='table1' class="table blast-table"  data-toggle="table" >
            <h4  id="mythead2" style = "color:blue;">ACCEPTABLE INTERNAL OLIGOS</h4>
            <hr/>
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
            </table>
        </div>


    </div>
    </div>
    <div class="col-md-12">
    <div class="describe3" style="margin:50px;">
        <div class="left5" name="int" style="height: auto; width: 100%">
           

            <table id='table2' class="table blast-table"  data-toggle="table" >
			 <h4 id="mythead3"  style = "color:blue;">ACCEPTABLE RIGHT PRIMERS</h4>
			 <hr/>
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

            </table>
        </div>
    </div>
    </div>
    <div class="btns">
        <a href="tools.jsp"><button class="btn" id="back">Back</button></a>
    </div>
<%@ include file="../ListFooter.jsp"%>
</div>

<script type="text/javascript">

        //function hasRecords(table, col){
        //     	var x = $(table+ ' #no-records-found');
    	//if(x){
    	//	$(table).css("display","none");
    	//	var y=document.getElementById('mythead' + col);
        //    console.log(y);
    	//	var x= document.createElement("p");
    	//	var z= document.createTextNode("No matching records found");
    	//	x.appendChild(z);
    	//	y.appendChild(x);
        //    console.log(y);
    	//	$("h4 p").css({"text-align":"center","font-size":"14px"})
        //    return false;
    	//}
    	//else{
        //   return true;
        //}
        //}

    $(function(){
        $('#table').bootstrapTable({//'#table' 改为所用表的选择器
        url: "localhost:8080/Magic/Primer/Primersearch1.jsp",//改为当前网页的url，可通过鼠标右击网页 查看信息找出
        method: 'GET',                      //请求方式（*）
       	striped: true,                      //是否显示行间隔色
       	pagination: true,
       	pageSize: 5,
       	smartDisplay:false,
       	search: true,
        showExport: true,
        buttonsAlign:"left",
        exportTypes:['csv','excel'], 
         exportOptions:{  
          //ignoreColumn: [0,0],            //忽略某一列的索引  
          fileName: 'ACCEPTABLE_LEFT_PRIMERS',              //文件名称设置  
          worksheetName: 'Sheet1',          //表格工作区名称  
          tableName: 'ACCEPTABLE_LEFT_PRIMERS',  
      },
		 columns: [{//修改为所用表的信息 field填数据库中的 对应的标题，title为要显示的名称
        field: '#',
        title: '#',
        sortable:true
    }, {
        field: 'seqence',
        title: 'seqence',
        sortable:true
    }, {
        field: 'start',
        title: 'start',
        sortable:true
    },{
        field: 'in',
        title: 'in',
        sortable:true
    },{
        field: '#N',
        title: '#N',
        sortable:true
    },{
        field: 'GC%',
        title: 'GC%',
        sortable:true    
    },{
        field: 'Tm',
        title: 'Tm',
        sortable:true    
    },{
        field: 'selfany',
        title: 'selfany',
        sortable:true    
    },{
        field: 'selfend',
        title: 'selfend',
        sortable:true    
    },{
        field: 'quality',
        title: 'quality',
        sortable:true    
    }],  
        });
        });
</script>
<script type="text/javascript">
    $(function(){
        $('#table1').bootstrapTable({//'#table' 改为所用表的选择器
        url: "localhost:8080/Magic/Primer/Primersearch1.jsp",//改为当前网页的url，可通过鼠标右击网页 查看信息找出
        method: 'GET',                      //请求方式（*）
       	striped: true,                      //是否显示行间隔色
       	pagination: true,
       	pageSize: 5,
       	search: true,
       	smartDisplay:false,
        showExport: true,
        buttonsAlign:"left",
        exportTypes:['csv','excel'], 
         exportOptions:{  
          //ignoreColumn: [0,0],            //忽略某一列的索引  
          fileName: 'ACCEPTABLE_INTERNAL_PRIMERS',              //文件名称设置  
          worksheetName: 'Sheet1',          //表格工作区名称  
          tableName: 'ACCEPTABLE_INTERNAL_PRIMERS',  
      },
		 columns: [{//修改为所用表的信息 field填数据库中的 对应的标题，title为要显示的名称
        field: '#',
        title: '#',
        sortable:true
    }, {
        field: 'seqence',
        title: 'seqence',
        sortable:true
    }, {
        field: 'start',
        title: 'start',
        sortable:true
    },{
        field: 'in',
        title: 'in',
        sortable:true
    },{
        field: '#N',
        title: '#N',
        sortable:true
    },{
        field: 'GC%',
        title: 'GC%',
        sortable:true    
    },{
        field: 'Tm',
        title: 'Tm',
        sortable:true    
    },{
        field: 'selfany',
        title: 'selfany',
        sortable:true    
    },{
        field: 'selfend',
        title: 'selfend',
        sortable:true    
    },{
        field: 'quality',
        title: 'quality',
        sortable:true    
    }],  
        });
        });
</script>
<script type="text/javascript">

    $(function(){
        $('#table2').bootstrapTable({//'#table' 改为所用表的选择器
        url: "localhost:8080/Magic/Primer/Primersearch1.jsp",//改为当前网页的url，可通过鼠标右击网页 查看信息找出
        method: 'GET',                      //请求方式（*）
       	striped: true,                      //是否显示行间隔色
       	pagination: true,
       	pageSize: 5,
       	search: true,
       	smartDisplay:false,
        showExport: true,
        buttonsAlign:"left",
        exportTypes:['csv','excel'], 
        exportOptions:{  
          //ignoreColumn: [0,0],            //忽略某一列的索引  
          fileName: 'ACCEPTABLE_RIGHT_PRIMERS',              //文件名称设置  
          worksheetName: 'Sheet1',          //表格工作区名称  
          tableName: 'ACCEPTABLE_RIGHT_PRIMERS',  
      },
        
		 columns: [{//修改为所用表的信息 field填数据库中的 对应的标题，title为要显示的名称
        field: '#',
        title: '#',
        sortable:true
    }, {
        field: 'seqence',
        title: 'seqence',
        sortable:true
    }, {
        field: 'start',
        title: 'start',
        sortable:true
    },{
        field: 'in',
        title: 'in',
        sortable:true
    },{
        field: '#N',
        title: '#N',
        sortable:true
    },{
        field: 'GC%',
        title: 'GC%',
        sortable:true    
    },{
        field: 'Tm',
        title: 'Tm',
        sortable:true    
    },{
        field: 'selfany',
        title: 'selfany',
        sortable:true    
    },{
        field: 'selfend',
        title: 'selfend',
        sortable:true    
    },{
        field: 'quality',
        title: 'quality',
        sortable:true    
    }],  
 		});
        });
</script>
</body>
</html>
