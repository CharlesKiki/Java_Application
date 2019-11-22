<%@ page language="java" pageEncoding="GB18030"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>我的购物车</title>
		<meta http-equiv="Content-Type" contect="text/html" ;charst=GBK">
	</head>
	<body align="center">
		<table cellpadding="10" border="1" align="center">
			<caption>
				<h2>
					我的购物车
				</h2>
			</caption>
			<thead>
				<tr>
					<th>
						品名
					</th>
					<th>
						数量
					</th>
					<th>
						单价
					</th>
					<th>
						合计
					</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${sessionScope.shopCart.cart}" var="order">
					<tr>
						<td>
							${order.book.title}
						</td>
						<td>
							${order["nums"]}
						</td>
						<td>
							${order.book["price"]}
						</td>
						<td>
							${order["sum"]}
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</body>
</html>