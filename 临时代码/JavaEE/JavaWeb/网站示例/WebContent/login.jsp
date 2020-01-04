<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%  String path = request.getContextPath();%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>医疗保险登录</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<style type="text/css">
html, body {
	height: 100%;
}

.box {
	filter: progid: DXImageTransform.Microsoft.gradient(startColorstr='#6699FF',
		endColorstr='#6699FF');
	background-image: linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image: -o-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image: -moz-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image: -webkit-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image: -ms-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	margin: 0 auto;
	position: relative;
	width: 100%;
	height: 95%;
}

.login-box {
	width: 100%;
	max-width: 500px;
	height: 400px;
	position: absolute;
	top: 50%;
	margin-top: -200px;
	/*设置负值，为要定位子盒子的一半高度*/
}

@media screen and (min-width:500px) {
	.login-box {
		left: 50%;
		/*设置负值，为要定位子盒子的一半宽度*/
		margin-left: -250px;
	}
}

.form {
	width: 100%;
	max-width: 500px;
	height: 275px;
	margin: 25px auto 0px auto;

}

.login-content {
	height: 265px;
	width: 100%;
	max-width: 500px;
	background-color: rgba(255, 250, 2550, .6);
	float: left;
}

.input-group {
	margin: 0px 0px 20px 0px !important;
}

.form-control, .input-group {
	height: 40px;
}

.form-group {
	margin-bottom: 0px !important;
}

.login-title {
	padding: 20px 10px;
	background-color: rgba(0, 0, 0, .6);
}

.login-title h1 {
	margin-top: 10px !important;
}

.login-title small {
	color: #fff;
}

.link p {
	line-height: 20px;
	margin-top: 30px;
}

.btn-sm {
	padding: 8px 24px !important;
	font-size: 16px !important;
}

.img {
	margin: 0px;
	width: 100px;
	height: 100px;
	padding: 0px;
}
input.error {
	border: 1px solid red;
}

label.error {
	padding-left: 16px;
	font-weight: bold;
	color: red;
}

usertype{
	height:20px;
}

</style>
</head>

<body>
	<div class="box">
		<div class="login-box">
			<div class="login-title" style="padding: 0px; height: 100px">
				<img src="<%=path %>/img/login.jpg" class="img" align="left">
				<h1 style="color: white; padding-top: 30px; margin-left: 120px">医疗报销系统登录</h1>
			</div>
			<div class="login-content ">
				<div class="form">
					<form action="<%=path %>/login" method="post" id="login">
					<div class="form-group" style="margin-bottom:-10px;">
							<div class="col-xs-12  ">
								<div style="height:40px;">
								<label style="float:left;">用户类型: &nbsp;&nbsp;</label>
										<div class="input-group"  id="userType" style="floa:left;">
									<input name="radiobutton" type="radio" value="user" 
										checked="checked" style="color: #666666"> 报销人员 <input
										name="radiobutton" type="radio" value="admin"
										style="color: #666666"> 管理员
								</div>
								</div>
							</div>
						</div>
					
						<div class="form-group">
							<div class="col-xs-12  ">
								<div class="input-group" >
									<span class="input-group-addon"><span
										class="glyphicon glyphicon-user"></span></span> <input type="text"
										id="username" name="username" class="form-control must"
										placeholder="用户名">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-12  ">
								<div class="input-group">
									<span class="input-group-addon"><span
										class="glyphicon glyphicon-lock"></span></span> <input
										type="password" class="form-control must" id="password"
										name="password" placeholder="密码">
								</div>
							</div>
						</div>
						
						<div class="form-group form-actions">
							<div class="col-xs-4 col-xs-offset-4" style="margin-top: 10px;">
								<button type="submit" class="btn btn-sm btn-info"
									onClick="login()">
									<span class="glyphicon glyphicon-off"></span> 登录
								</button>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-4 link">
								<p class="text-center remove-margin">
									<small>忘记密码？</small> <a href="find_pass.jsp" target=_top><small>找回</small></a>
								</p>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script src="js/jquery-2.2.0.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="js/index.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/jquery.validate-1.13.1.js" type="text/javascript"
		charset="utf-8"></script>
	<script type="text/javascript">
	$(document).ready(function () {
		$("#login").validate({
            rules: {
            	username: {
					minlength: 8,
					maxlength: 8,
					remote:{
						url:"checkLogin",
						type:"POST",
						data:{
							username:function(){return $("#username").val();}
						}
					}
				},
				password:{
					remote:{
						url:"checkPassword",
						type:"POST",
						data:{
							username:function(){return $("#username").val();},
							password:function(){return $("#password").val();},
							radiobutton:function(){return $('#userType input[name="radiobutton"]:checked').val();}
						}
					}
				}		
            },
            messages:{
            	username: {
					required: "必须填写用户名",
					minlength: "用户名为8位",
					maxlength: "用户名为8位",
					remote:"用户名不存在"
				},
				password:{
					required: "必须填写密码",
					remote:"密码错误或者用户类型不正确，请检查后重新输入密码"
				}
            }
		});
		
		$.validator.addClassRules({
			must:{
				required:true
			}
		})
	})
	
	</script>
</body>

</html>