<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>订单信息- 易售手机网</title>
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
			<div align="left" style="position:absolute"><h2><strong>订单信息</strong></h2></div><div align="right" style="position:absolute;margin-left: 700px"><a href="changeOrderInfoform.do?orderId=${order.id }"><strong>更改资料</strong></a></div>
			</div><br />
			<table class="tab_login">
					<tr>
					<td class="w1">
						订单时间：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
						${order.ctDate }
					</td>
					<td class="w1">
						是否删除：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
					<c:if test="${order.delete }" var="del">
						是
					</c:if>
					<c:if test="${!del }">
						否
					</c:if>
					</td>
				</tr>
				<tr>
					<td class="w1">
						收货时间：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
						${order.stDate }
					</td>
					<td class="w1">
						运费：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
						￥${order.sendFee }
					</td>
				</tr>
				<tr>
					<td class="w1">
						收货状态：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
						${order.state }
					</td>
					<td class="w1">
						商品费用：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
						￥${order.totalPrice }
					</td>
					</tr>
					<tr>
					<td class="w1">
						订单总额：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
						￥${order.orderPrice }
					</td>
					<td class="w1">
						订单说明：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
						${order.desc }
					</td>
					</tr>
			</table>
			<div style="position: relative">
			<div align="left" style="position:absolute"><h2><strong>送货地址信息</strong></h2></div><div align="right" style="position:absolute;margin-left: 700px"><a href="changeAddressform.do?orderId=${order.id }&addressId=${order.address.id }&option=order"><strong>更改资料</strong></a></div>
			</div><br />
			<table class="tab_login">
					<tr>
					<td class="w1">
						收件人姓名：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
						${order.address.name }
					</td>
					<td class="w1">
						固定电话：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
						${order.address.phone }
					</td>
				</tr>
				<tr>
					<td class="w1">
						收件人地址：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
						${order.address.fullAddress }
					</td>
					<td class="w1">
						移动电话：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
						${order.address.mobile }
					</td>
				</tr>
				<tr>
					<td class="w1">
						邮编：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
						${order.address.postalCode }
					</td>
					<td class="w1">
						是否为默认地址：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
						${order.address.defaultAddress }
					</td>
					</tr>
			</table>
			<div style="position: relative">
			<div align="left" style="position:absolute"><h2><strong>送货方式信息</strong></h2></div><div align="right" style="position:absolute;margin-left: 700px"><a href="changeOrderSendWayform.do?orderId=${order.id }&sendwayId=${order.sendWay.id }"><strong>更改资料</strong></a></div>
		</div><br />
			<table class="tab_login">
					<tr>
					<td class="w1">
						送货方式：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
						${order.sendWay.sendWay }
					</td>
					<td class="w1">
						运费：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
						${order.sendWay.sendFee }
					</td>
				</tr>
				<tr>
					<td class="w1">
						是否关闭：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
						<c:if test="order.close " var="clo">
						是
					</c:if>
					<c:if test="${!clo }"></c:if>
						否
					</td>
					<td class="w1">
						送货方式说明：
					</td>
					<td class="w1" style="background-color: white;text-align: left">
						${order.sendWay.sendDesc }
					</td>
				</tr>
			</table>
			<div style="position: relative">
				<div align="left" style="position:absolute"><h2><strong>商品信息</strong></h2></div>
			</div><br />
			<table class="tab_login">
				<tr>
					<td class="w1" style="text-align: center">
						商品名：
					</td>
					<td class="w1" style="text-align: center">
						当当价：
					</td>
					<td class="w1" style="text-align: center">
						数量：
					</td>
					<td class="w1" style="text-align: center">
						折扣：
					</td>
				</tr>
				<c:forEach var="item" items="${order.items }">
					<tr>
					<td class="w1" style="background-color: white;text-align: center">
						${item.productName }
					</td>
					<td class="w1" style="background-color: white;text-align: center">
						${item.dangPrice }
					</td>
					<td class="w1" style="background-color: white;text-align: center">
						${item.num }
					</td>
					<td class="w1" style="background-color: white;text-align: center">
						${item.amount }
					</td>
				</tr>
				</c:forEach>
			</table>
			</div>
			<div class="login_in" style="margin-left:440px;position:relative">
					<input type="button" id="btnClientRegister" class="button_1"
						value="返回"  onclick="location='information.do'" style="text-align: center"/>
				</div>
		</div>
		
		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

