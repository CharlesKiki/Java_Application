<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%  String path = request.getContextPath();%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>找回密码</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
}

.box {
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#6699FF',
		endColorstr='#6699FF');
	background-image: linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image: -o-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image: -moz-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image: -webkit-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image: -ms-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	margin: 0 auto;
	width: 100%;
	height: 95%;
	`
}

.find_box {
	width: 500px;
	height: 400px;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -200px;
	margin-left: -250px;
}

.title_box {
	height: 80px;
	background-color: rgba(0, 0, 0, .6);
	margin: 0px;
}

.title {
	margin: 0px;
	padding-top: 10px;
}

.sma {
	color: white;
	padding-top: 20px;
}

.find_content {
	height: 320px;
	background-color: rgba(255, 250, 2550, .6);
}

.img {
	margin: 0px;
	width: 80px;
	height: 80px;
	padding: 0px;
}

.h {
	border: solid 1px red;
}
</style>
</head>

<body>
	<div class="box">
		<div class="find_box">
			<div class="title_box" style="text-align: center;">
				<img src="img/login.jpg" class="img" align="left">
				<h1 class="title sma">找回密码</h1>
			</div>
			<div class="find_content">
				<form action="#" method="post" id="form1" name="form1">
					<div class="row">
						<div class="col-md-5 col-md-offset-1" style="margin-top: 30px;">
							<label for="User" style="color: #666666">用户名：</label>
						</div>
					</div>
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<input type="text" class="form-control" id="User" name="username"
								placeholder="用户名">
						</div>
					</div>
					<div class="row" style="margin-top: 10px;">
						<div class="col-md-5 col-md-offset-1">
							<label for="Email" style="color: #666666">邮箱：</label>
						</div>
					</div>
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<input type="email" class="form-control" id="Email" name="email"
								placeholder="邮箱">
						</div>
					</div>
					<div class="row" style="margin-top: 30px;">
						<div class="col-md-4 col-md-offset-4">
							<button type="submit" class="btn btn-sm btn-info"
								style="margin-left: 30px; width: 80px; height: 40px;"
								onClick="findpass()">
								<span class="glyphicon glyphicon-menu-right"></span> 找回
							</button>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
	<script src="js/jquery-2.2.0.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="js/index.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>
