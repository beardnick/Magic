<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>Phenotype Data</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="author" content="Daliu" />
<meta name="keywords" content="" />
<meta name="describe" content="" />
<script type="text/javascript" src="./js/jquery.min.js"></script>
<script type="text/javascript" src="./js/jquery-jvectormap.js"></script>
<link href="Css/bootstrap.min.css" rel="stylesheet" />
<link href="Css/main.css" rel="stylesheet" />
<script type="text/JavaScript" src="Jscript/echarts.js"></script>
<script src="Jscript/china.js"></script>
</head>

<body>
	<%@ include file="../ListHeader.jsp"%>
	<div class="content" float="left">
		<div style="width:100% height:300px">
			<div class="lefttool" width="30%" float="left">
				<div class="my-panel">
					<div class="title" style="width:100%;color:#4381be;">
						<h3 style="color:#4381be;">Phenotype Data</h3>
					</div>
					<p>All 1404 inbreds were planted in a completely randomized
						block design in 2014 at five locations (N43°42′, E125°18′, Yushu
						City, Jilin Provence; N42°03′, E123°33′, Shenyang City, Liaoning
						Provence; N40°10′, E116°21′, Changping District, Beijing City;
						N38°39′, E115°51, Baoding City, Hebei Provence; N35°27′, E114°01′,
						Xinxiang City, Henan Provence) of Northern China, where the 24
						elite founders that served as the parents of the population are
						the most adapted. About 16 individual plants were planted for each
						line, and the line Chang7-2 was planted after every 50th entry.</p>
				</div>
                <image src="images\china_map.png" style="width:100%;display:inline-block;margin-top:20px;"></image>
				<div id="myTable"
					style="width:100%;display:inline-block;margin-top:20px;">
					<div class="my-panel">
						<p style="margin-top:20px;">
							The population was planted in five different provinces in the
							summer of 2014, as shown in the map and 20 traits were
							investigated. <br>Phenotype data in 5 locations
							respectivelyDownload <br>Blup phenotype dataDownload
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<image style="margin-left:55%;margin-top:-100px;" src="images/phenotype2.png"> <image style="margin-left:10%;margin-top:400px;" src="images/phenotype3.png"> </div>
	</div>
	<%@ include file="../ListFooter.jsp"%>
</body>
<!--  <script type="text/javascript">
        var myChart = echarts.init(document.getElementById('main'));
        option = {
        tooltip: {
          trigger: 'item',
          formatter: '{b}'
        },
        dataRange: {
              x: 'left',
              y: 'bottom',
              splitList: [
                  {start:1, end:1, label: 'Beijing', color: 'red'},
                  {start:2, end:2, label: 'Heibei', color: '#00FFFF'},
                  {start:3, end:3, label: 'Henan', color: 'pink'},
                  {start:4, end:4, label: 'Liaoning', color: 'blue'},
                  {start:5, end:5, label: 'Jilin', color: 'purple'}
              ]
          },
        series: [{
          name: '中国',
          type: 'map',
          mapType: 'china',
          selectedMode : 'multiple',
          label: {
            normal: {
              show: true
            },
            emphasis: {
              show: true
            }
          },
                    data:[
            {name:'Henan',selected:false,value:3},
            {name:'Hebei',selected:false,value:2},
            {name:'Beijing',selected:false,value:1},
            {name:'Liaoning',selected:false,value:4},
            {name:'Jilin',selected:false,value:5}
                ]         
        }]
      };
      myChart.setOption(option);
      myChart.on('click',function(params){
        var city = params.name;
        if(city == 'Henan' || city == 'Hebei' || city == 'Beijing' || city == 'Liaoning' || city == 'Jilin'){
          window.location.href="tools.jsp";
        }
      });
</script>-->
</html>
