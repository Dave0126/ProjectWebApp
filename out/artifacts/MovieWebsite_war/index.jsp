<%@page import="domain.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Language" content="zh-CN" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="author" content="PP" />
<meta name="robots" content="all" />
<meta name="renderer" content="webkit" />
<meta name="full-screen" content="yes" />
<meta name="browsermode" content="application">
<meta name="x5-orientation" content="portrait">
<meta name="x5-fullscreen" content="true">
<meta name="x5-page-mode" content="app">
<meta name="HandheldFriendly" content="true">
<meta name="MobileOptimized" content="320">
<meta name="viewport"
	content="width=device-width,minimum-scale=1,initial-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes" />
<link rel="apple-touch-icon"
	href="http://www.mvcat.com/img/logo_1024_white.png">
<meta name="msapplication-TileColor" content="#000" />
<meta name="msapplication-TileImage"
	content="http://www.mvcat.com/img/logo_1024_white.png" />
<link rel="shortcut icon"
	href="http://www.mvcat.com/img/logo_1024_white.png">
<link rel="stylesheet" type="text/css" href="css/css.css?v201910231200" />
<script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
<script src="http://msite.baidu.com/sdk/c.js?appid=1593277122932015"></script>
<link rel="canonical" href="http://coupon.mvcat.com/" />
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-41365219-1"></script>
<title>MOVIE CAT</title>
<script type="text/javascript" src="js/main.js"></script>

<link rel="stylesheet" type="text/css" href="css/style.css" />
<style>
li {
	list-style: none;
}
</style>
</head>
<body class="channel root mvcat swipeLeft scrollTop loading">
	<div style="float:right; position: relative; ">
		<%
			User user = (User) session.getAttribute("user");
			if(user == null){
		 %>
		<nav class="main_nav">
			<ul>
				<li><a class="cd-signin" href="loginAndRegister.jsp">?????? /
						??????</a></li>
			</ul>
		</nav>
		<%
			}else{
		 %>
		 <span style="color: #808080; font-size: 1em;">${user.username}</span>
		 <%
		 	}
		  %>
	</div>
	<div class="right">
		<div class="insearch" id="insearch">
			<form method="get"
				onSubmit="insearch($(this).find('#searchword').val());return false;"
				autocomplete="off">
				<input type="text" id="searchword" value=""
					placeholder="???????????? / ?????? / ??????" autocomplete="off" /><input
					id="submit" type="submit" value="???" />
			</form>
		</div>
		<div class="echarts desktop" id="echarts"></div>
		<script src="js/echarts-tree.js"></script>
		<script type="text/javascript">
			// ???????????????
			$(document).ready(function() {
				function setData() {
					echarts.dispose($('#echarts')[0]);
					$('#echarts').width($('#echarts').parent().width());
					$('#echarts').height($(window).height() - $('#echarts').prev('.insearch').stop(true, true)
							.outerHeight(true));
					myChart = echarts.init($('#echarts')[0]);
					option = {
						series : [ {
							type : "tree",
							data : [ {
								name : "MVCAT",
								children : [ {
									name : "??????",
									isShow : false,
									value : "http://www.mvcat.com/life/",
								},
		
									{
										name : "??????",
										isShow : false,
										value : "http://www.mvcat.com/emotion/",
										children : [
		
											{
												name : "??????",
												value : "http://www.mvcat.com/emotion/happy/",
											},
		
											{
												name : "??????",
												value : "http://www.mvcat.com/emotion/anger/",
											},
		
											{
												name : "??????",
												value : "http://www.mvcat.com/emotion/sorrow/",
											},
		
											{
												name : "??????",
												value : "http://www.mvcat.com/emotion/fear/",
											},
		
											{
												name : "??????",
												value : "http://www.mvcat.com/emotion/loving/",
											},
		
											{
												name : "??????",
												value : "http://www.mvcat.com/emotion/hate/",
											},
		
											{
												name : "??????",
												value : "http://www.mvcat.com/emotion/lust/",
											},
		
										]
									},
		
									{
										name : "??????",
										isShow : false,
										value : "http://www.mvcat.com/people/",
										children : [
		
											{
												name : "??????",
												value : "http://www.mvcat.com/people/man/",
											},
		
											{
												name : "??????",
												value : "http://www.mvcat.com/people/woman/",
											},
		
											{
												name : "??????",
												value : "http://www.mvcat.com/people/friend/",
											},
		
											{
												name : "??????",
												value : "http://www.mvcat.com/people/lover/",
											},
		
											{
												name : "??????",
												value : "http://www.mvcat.com/people/LGBT/",
											},
		
											{
												name : "??????",
												value : "http://www.mvcat.com/people/family/",
											},
		
											{
												name : "??????",
												value : "http://www.mvcat.com/people/kid/",
											},
		
										]
									},
		
									{
										name : "??????",
										isShow : false,
										value : "http://www.mvcat.com/movie/",
										children : [
		
											{
												name : "??????",
												value : "http://www.mvcat.com/movie/action/",
											},
		
											{
												name : "??????",
												value : "http://www.mvcat.com/movie/war/",
											},
		
											{
												name : "??????",
												value : "http://www.mvcat.com/movie/sf/",
											},
		
											{
												name : "??????",
												value : "http://www.mvcat.com/movie/suspense/",
											},
		
											{
												name : "??????",
												value : "http://www.mvcat.com/movie/comedy/",
											},
		
											{
												name : "??????",
												value : "http://www.mvcat.com/movie/love/",
											},
		
											{
												name : "??????",
												value : "http://www.mvcat.com/movie/spirit/",
											},
		
											{
												name : "??????",
												value : "http://www.mvcat.com/movie/cartoon/",
											},
		
											{
												name : "??????",
												value : "http://www.mvcat.com/movie/horror/",
											},
		
											{
												name : "??????",
												value : "http://www.mvcat.com/movie/crime/",
											},
		
											{
												name : "??????",
												value : "http://www.mvcat.com/movie/documentary/",
											},
		
											{
												name : "??????",
												value : "http://www.mvcat.com/movie/drama/",
											},
		
		
										]
									},
		
									{
										name : "??????",
										isShow : false,
										value : "http://www.mvcat.com/occasion/",
										children : [
		
											{
												name : "??????",
												value : "http://www.mvcat.com/occasion/weekend/",
											},
		
											{
												name : "??????",
												value : "http://www.mvcat.com/occasion/festival/",
											},
		
											{
												name : "??????",
												value : "http://www.mvcat.com/occasion/morning/",
											},
		
											{
												name : "??????",
												value : "http://www.mvcat.com/occasion/afternoon/",
											},
		
											{
												name : "??????",
												value : "http://www.mvcat.com/occasion/night/",
											},
		
											{
												name : "??????",
												value : "http://www.mvcat.com/occasion/quiet/",
											},
		
											{
												name : "??????",
												value : "http://www.mvcat.com/occasion/lively/",
											},
		
										]
									},
		
									{
										name : "??????",
										isShow : false,
										value : "http://www.mvcat.com/award/",
										children : [
		
											{
												name : "?????????",
												value : "http://www.mvcat.com/award/oscar/",
											},
		
											{
												name : "?????????",
												value : "http://www.mvcat.com/award/golden-palm/",
											},
		
											{
												name : "?????????",
												value : "http://www.mvcat.com/award/golden-bear/",
											},
		
											{
												name : "?????????",
												value : "http://www.mvcat.com/award/golden-lion/",
											},
		
											{
												name : "?????????",
												value : "http://www.mvcat.com/award/golden-horse/",
											},
		
											{
												name : "?????????",
												value : "http://www.mvcat.com/award/HKFA/",
											},
		
											{
												name : "?????????",
												value : "http://www.mvcat.com/award/golden-rooster/",
											},
		
										]
									},
		
									{
										name : "??????",
										isShow : false,
										value : "http://www.mvcat.com/hot/",
									}
								]
							} ],
		
							itemStyle : { //????????????
								normal : {
									color : "#333333",
									borderWidth : 0
								}
							},
							label : { //?????????????????????
								normal : {
									verticalAlign : 'middle',
									align : 'center',
									fontSize : parseFloat($("html").css('font-size')) * 0.85,
									color : "#ffffff"
								}
							},
							lineStyle : { //????????????
								normal : {
									color : 'rgba(0,0,0,0.25)',
									width : 0.5,
									curveness : 0.75
								}
							},
							leaves : {
								label : {
									show : true
								}
							},
							top : "-15%",
							left : "2%",
							bottom : 100,
							right : "2%",
							symbolSize : parseFloat($("html").css('font-size')) * 2.8,
							animationDuration : 0,
							animationDurationUpdate : 0,
							orient : "vertical",
							symbol : "circle",
							expandAndCollapse : true,
							initialTreeDepth : 2,
						} ]
					}; //end option
		
					if ($("body").width() < 768) {
						option.series[0].symbolSize = 36;
						option.series[0].label.normal.fontSize = 12;
					}
		
					if ($("body").height() < 600) {
						option.series[0].top = "-50%";
						option.series[0].bottom = 40;
						option.series[0].expandAndCollapse = false
					} else {
						option.series[0].data[0].children[3].isShow = true;
					}
		
					myChart.setOption(option);
					//window.onresize = myChart.resize();
		
					//????????????
					myChart.on('click', function(params) {
						//console.log(params);
						//alert(params.data.children)
						if (params.data.children && option.series[0].expandAndCollapse) { //????????????
							//return true;
						} else {
							if (/.jpg|.jpeg|.gif|.png|.bmp|.pic/.test(params.data.value.substring(params
									.data.value.lastIndexOf('.')).toLowerCase())) {
								popImg(params.data.value);
							} else {
								if (isHtml5Plus) {
									popIframe(params.data.value, '_blank');
								} else {
									popIframe(params.data.value);
								}
							}
						}
					})
					//end ????????????
					$("body").removeClass("loading").addClass("loaded");
				} //end setDate
		
				if ($("body").width() >= 768) {
					setData();
				}
		
				$(window).resize(function() {
					setData();
				});
			})
		</script>
	</div>
	<script src="js/js.js?v201910230948"></script>
	<script src="js/plugin.js?v201909290908"></script>
</body>

</html>