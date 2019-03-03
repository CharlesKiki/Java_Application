<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>登录成功 - 易售手机网</title>
		<link href="${pageContext.request.contextPath}/css/login.css"
			rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/page_bottom.css"
			rel="stylesheet" type="text/css" />
	</head>
	<body>
		<%@include file="../common/head.jsp"%>
		<div class="login_step">
			 <span class="red_bold">修改资料成功！！</span>
		</div>
		<div class="login_success">
			<div class="login_bj">
				<input type="button" value="确定" onclick="location='${url }'"/>
			</div>
		</div>

		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

