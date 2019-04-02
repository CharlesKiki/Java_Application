<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>用户信息- 易售手机网</title>
		<link href="${pageContext.request.contextPath}/css/login.css"
			rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/book.css"
			rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/page_bottom.css"
			rel="stylesheet" type="text/css" />
		<link
			href="${pageContext.request.contextPath}/css/shopping_vehicle.css"
			rel="stylesheet" type="text/css" />
	</head>
	<body>
		<%@include file="../common/head1.jsp"%>
		<br/>
		<br />
		<div class="book">
		<div class="fill_message">
		<div style="position: relative">
			<div align="left" style="position:absolute"><h1><strong>用户资料</strong></h1></div><div align="right" style="position:absolute;margin-left: 700px"><a href="showInfo.do"><strong>更改资料</strong></a></div>
		</div><br />
			<table class="tab_login">
					<tr>
					<td class="w1">
						用户ID：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
						${sessionScope.user.id }
					</td>
					<td class="w1">
						积分：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
						${sessionScope.user.user_integral }
					</td>
				</tr>	
				<tr>
					<td class="w1">
						昵称：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
						${sessionScope.user.nickname }
					</td>
					<td class="w1">
						上次登录时间：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
						${sessionScope.user.llDate }
					</td>
				</tr>
				<tr>
					<td class="w1">
						EMAIL：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
						${sessionScope.user.email }
					</td>
					<td class="w1">
						上次登录IP：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
						${sessionScope.user.last_login_ip }
					</td>
					</tr>
			</table>
			<div style="position: relative">
			<div align="left" style="position:absolute"><h1><strong>用户订单信息</strong></h1></div>
		</div><br />
		<table class="tab_login">
			<c:forEach var="order" items="${orders }">
				<tr>
					<td class="w1">
						订单ID：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
						${order.id }
					</td>
					<td class="w1">
						订单状态：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
						${order.state }
					</td>
					<td style="background-color: #aaaaaa">
						<a href="order.do?orderId=${order.id }">查看具体信息</a>
					</td>
				</tr>
			</c:forEach>
			</table>
		<div style="position: relative">
			<div align="left" style="position:absolute"><h1><strong>用户送货地址信息</strong></h1></div>
		</div><br />
		<table class="tab_login">
			<c:forEach var="address1" items="${addresss1}">
				<tr>
					<td class="w1">
						收货人姓名：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
						${address1.name }
					</td>
					<td class="w1">
						收货人地址：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
						${address1.fullAddress }
					</td>
					<td style="background-color: #aaaaaa">
						<a href="address.do?addressId=${address1.id }">查看具体信息</a>
					</td>
				</tr>
			</c:forEach>
			<c:forEach var="address2" items="${addresss2}">
				<tr>
					<td class="w1">
						收货人姓名：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
						${address2.name }
					</td>
					<td class="w1">
						收货人地址：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
						${address2.fullAddress }
					</td>
					<td style="background-color: #aaaaaa">
						<a href="address.do?addressId=${address2.id }">查看具体信息</a>
					</td>
				</tr>
			</c:forEach>
			</table>
			<br />
			<div class="login_in">
					<input type="button" id="btnClientRegister" class="button_1"
						value="返回"  onclick="location='../catalog/main.do'" style="text-align: center"/>
				</div>
			</div>
		</div>
		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

