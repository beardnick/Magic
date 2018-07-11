<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"   >
<html>
<head>
<base href="<%=basePath%>">

<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="author" content="Daliu" />
<meta name="keywords" content="" />
<meta name="describe" content="" />
<link href="Css/bootstrap.min.css" rel="stylesheet" />
<link href="Css/main.css" rel="stylesheet" />
<script type="text/javascript" src="Jscript/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="Jscript/bootstrap-table.min.js"></script>

<title>Home</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no" />
<meta name="author" content="Daliu" />
<meta name="keywords" content="" />
<meta name="describe" content="" />


<link href="Css/main1.css" rel="stylesheet" />
<script src="jquery.1.11.3.min.js" type="text/javascript"></script>


<script type="text/javascript">
	$(document).ready(function() {
		var width = $('#carousel').width();
		$('.img').width(width);
		// 图片左右翻滚
		var size = $('.slidebtn-01>ul>li').length;
		var frist = 0;
		var datetime;
		$('.slidebtn-01 li').mouseover(function() {
			frist = $('.slidebtn-01 li').index(this);
			showpic(frist);
		}).eq(0).mouseover();

		$('.slidebox-01').hover(function() {
			clearInterval(datetime);
		}, function() {
			datetime = setInterval(function() {
				showpic(frist)
				frist++;
				if (frist == size) {
					frist = 0;
				}
			}, 4000);
		}).trigger('mouseleave');

		function showpic(frist) {
			var imgheight = $('.slidebox-01 li').width();
			$('.slidepic-01').stop(true, false).animate({
				left : -imgheight * frist
			}, 600)
			$('.slidebtn-01 li').removeClass('current').eq(frist).addClass('current');
		}
		;
	});
</script>
</head>
<body>
	<%@ include file="../ListHeader.jsp"%>
	<div class="content" style="height:1300px;margin-top:20px;">
		<div id="carousel">
			<div class="slidebox-01">
				<ul style="left:0px;" class="slidepic-01">
					<a href="/Magic/Dataintroduction/genotypedata.jsp" target="_blank">
						<!--ie浏览器解析图片的时候有时会默认给它加一个边框-->
						<li><image class="img" alt="" src="images/index1.png" /></li>
					</a>
					<a href="/Magic/Dataintroduction/phenotypedata.jsp" target="_blank">
						<li><image class="img" alt="" src="images/index2.png" /></li>
					</a>
					<a href="/Magic/contact.jsp" target="_blank">
						<li><image class="img" alt="" src="images/index3.png" /></li>
					</a>
				</ul>
				<div class="slidebtn-01">
					<!--这里是1234小图标-->
					<ul>
						<li class="current"></li>
						<li class=""></li>
						<li class=""></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-2">
				<div class="panel panel-primary">
					<div class="panel-heading">Navigation</div>
					<div class="panel-body">
						<ul class="list-group">
							<li class="list-group-item">Cras justo odio</li>
							<li class="list-group-item">Dapibus ac facilisis in</li>
							<li class="list-group-item">Morbi leo risus</li>
							<li class="list-group-item">Porta ac consectetur ac</li>
							<li class="list-group-item">Vestibulum at eros</li>
						</ul>
					</div>
					<div class="panel-footer"></div>
				</div>
			</div>

			<div class="col-md-10" style="text-align:justify;">
				<div class="my-panel">
					<div class="title" style="text-align: center;">
						<h1>Welcome to Maize CUBIC Variation Database</h1>
						<div class="title">
							<h2>Database Overview</h2>
						</div>
					</div>
					<div class="panel-body">
						<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A maize Complete-diallel
							plus Unbalanced Breeding-like Inter-Cross population (CUBIC)
							population consist of 1404 individuals derived from twenty-four
							elite lines that have been widely applied in Chinese breeding
							programs has been developed.</h3>
						<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;•30 F1s with best agronomic
							performance were selected to futher cross in NCII,and the other
							110 F1s were randomly selected to cross with open pollinated in
							isolated region.</h4>
						<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;•The seed from above F1s
							were mixed together with the amount of 2:1 with an expectation to
							improve the population performance.</h4>
						<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;•All harvest individuals
							were next planted under open pollination within isolated region
							for totally 6 generations.</h4>
						<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;•Following,the population
							was self-pollinated for another 6 generations.</h4>
						<h3>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;All progenies and founders have
							been sequenced at low coverage (1x and 11x, respectively). DNA
							libraries were sequenced with Illumina HiSeq 2500 with 125-bp
							paired-end reads using V4 reagents, generating generations. All
							progenies and founders have been sequenced at low coverage (1x
							and 11x, respectively). DNA libraries were sequenced with
							Illumina HiSeq 2500 with 125-bp paired-end reads using V4
							reagents, generating almost 2000x genome coverage. Sequences data
							are available in
							<div class="class0" style="display:inline;">
								<a href="http://bigd.big.ac.cn/">BIG Data Center (BIGD)</a>, and
								GSA project accession number is <u><b>PRJCA000346</u></b>.
						</h3>
						<h3>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;An integrated strategy in variant
							calling and imputation was applied to the population, and over
							53M SNPs, 2.8M InDels, 660K SVs, 600M novel sequences were
							finally obtained, which constituted the highest density and the
							most diverse maize variant map to date. The SNP set was found
							>99% consistency compared with genotypes derived from array- and
							assembly- based methods, while the percent of validated large
							structural variants was considered as ~60%. This variant map,
							together with the methodological practices, would be a great
							valuable resource for the plant community.
							<div class="class0">
								<a href="/Magic/Dataintroduction/genotypedata.jsp">Read
									more……</a>
							</div>
						</h3>
					</div>
				</div>
			</div>
		</div>
		<div style="height:50px;"></div>
	</div>

	<%@ include file="../ListFooter.jsp"%>
</body>
</html>
