<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>欢迎您，用户</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/default.css" />
<script src="<%=path %>/js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=path %>/js/mobilyblocks.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript">
			$(function() {
				$('.socials').mobilyblocks({
					trigger: 'hover',
					direction: 'counter',
					duration: 300,
					zIndex: 50,
					widthMultiplier: 1.2
				});
			});
		</script>
</head>

<body>
	<div class="container-all">

		<div class="head">
			<div class="exit  fr">
				<a href="<%=path %>/login.jsp" target="_top"><h4>退出登录</h4></a>
			</div>
			<div class="user  fr ">
				<h4>当前用户：${username }</h4>
			</div>
		</div>
		<div class="context">
			<div class="user">
				<div class="link fl">
					<a href="baoxiao.html">
						<div class="search">
							<img src="<%=path %>/img/user/Bigcircle2.png" />
						</div>

					</a>
				</div>
				<div class="link fl">
					<div class="socials">
						<ul class="reset">
							<li><a href="search_person.html"><img
									src="<%=path %>/img/user/1.png" alt="" /></a></li>
							<li><a href="search_history.html"><img
									src="<%=path %>/img/user/4.png" alt="" /></a></li>
							<li><a href="search_company.html"><img
									src="<%=path %>/img/user/2.png" alt="" /></a></li>
							<li><a href="search_institution.html"><img
									src="<%=path %>/img/user/7.png" alt="" /></a></li>
							<li><a href="search_facility.html"><img
									src="<%=path %>/img/user/5.png" alt="" /></a></li>
							<li><a href="search_disease.html"><img
									src="<%=path %>/img/user/9.png" alt="" /></a></li>
							<li><a href="search_drug.html"><img
									src="<%=path %>/img/user/6.png" alt="" /></a></li>
							<li><a href="search_zhenliao.html"><img
									src="<%=path %>/img/user/3.png" alt="" /></a></li>
							<li><a href="search_canshu.html"><img
									src="<%=path %>/img/user/8.png" alt="" /></a></li>
						</ul>
					</div>
				</div>
				<div class="link fl">
					<a href="cancel.html">
						<div class="search">
							<img src="<%=path %>/img/user/Bigcircle3.png" />
						</div>
					</a>
				</div>
			</div>
		</div>
		<div class="foot "></div>
	</div>
</body>
</html>