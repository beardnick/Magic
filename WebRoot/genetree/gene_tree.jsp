<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page import="org.hibernate.HibernateException"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="java.io.*" %> 
<%@ page import="java.util.Map.Entry" %>
<%@ page trimDirectiveWhitespaces="true" %> 
<%@ page import="net.sf.json.JSONObject"%>
<%@ page import="net.sf.json.JSONArray"%>
<%@ page import="net.sf.json.JSONObject"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
    <body>
    <s:action name="genetree.action" executeResult="true" />
    	 <%@ include file="../ListHeader.jsp"%>
    	 <div class="describe" style="margin-left:50px;">
                <h3>GWAS Diagram</h3>
                <br/>
                <p>The Visualisation of all SNP-trait associations with genome-wide significance (2.79x10-8).</p>
            </div>
      <div class="content" style="height:1450px;width:100%" >
        <div class="content" style="margin-top:60px;">
            <div style="text-align:right;">
                <button onclick="zoom('zoomin')" class="btn" style="padding:2px 10px;margin:15px;font-size:16px;">Enlarge</button>
                <button onclick="zoom('zoomout')" class="btn" style="padding:2px 10px;margin:15px;font-size:16px;">Narrow</button>
                <button onclick="zoom('reset')" class="btn" style="padding:2px 10px;margin:15px;font-size:16px;">Reset</button>
                <input type="text" id="filter" value="">
                <button id="filterBtn" class="btn" style="padding:2px 10px;margin:15px;font-size:16px;">Filter</button>
            </div>
            <div>
                <div style="width:180px;height:1237px;float:left;display:inline-block;box-shadow:0 0 1px grey;">
                    <div style="width:180px;font-size:16px;padding:4px 0;background:#4381be;color:white;text-align:center;">Data Filter</div>
                    <div id="filterlist" style="width:180px;height:1230px;overflow-y:auto;">
                        
                    </div>
                </div>
                <svg id="treeNode" xmlns="http://www.w3.org/2000/svg" version="1.1" height="1240" width="1000" viewBox="0 0 2000 580" style="box-shadow:0 0 1px grey;"></svg>
            </div>
        </div>
        <input type="text" name="tree1" style="display: none;" id="tree1" value=<%=tree%>></input>  
        </div>
        <%@ include file="../ListFooter.jsp"%>
        
        <style>
            .filter-item{width:100%;height:55px;border-bottom:solid 1px #eee;padding:8px 4px;}
            .filter-item:hover{background:#eee;cursor:pointer;}
            .filter-item-selected{background:#eee;cursor:pointer;}
        </style>
    </body>
    <script src="genetree/gene_tree.js"></script>
</html>
