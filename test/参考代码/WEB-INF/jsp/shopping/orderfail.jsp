<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link href="${pageContext.request.contextPath}/css/login.css"
			rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/page_bottom.css"
			rel="stylesheet" type="text/css" />
	</head>
	<body>	
		<%@include file="../common/head1.jsp"%>
		<div class="login_success">
			<div class="login_bj">
				<h6>
					购物车中没有商品，请确认！！！！！！！！
				</h6>
				<ul>
				<li class="nobj">
						您现在可以：
					</li>
					<li>
						进入“
						<a href="../information/information.do">我的易售网</a>”查看并管理您的个人信息
					</li>
					<li>
						<a href="../information/showInfo.do">编辑您的个人档案</a>
					</li>
					<li>
						<a href="../catalog/main.do">继续浏览并选购商品</a>
					</li>
				</ul>
			</div>
		</div>

		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

