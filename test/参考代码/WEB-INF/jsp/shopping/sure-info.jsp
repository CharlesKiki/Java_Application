<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link href="${pageContext.request.contextPath}/css/login.css"
			rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/page_bottom.css"
			rel="stylesheet" type="text/css" />
		<link
			href="${pageContext.request.contextPath}/css/shopping_vehicle.css"
			rel="stylesheet" type="text/css" />
	</head>
	<body>
		<%@include file="../common/head1.jsp"%>
		<div class="login_step">
			生成订单步骤:
			1.填写送货地址>2.送货方式 ><span class="red_bold">3.确认订单信息 </span>  >4.生成订单
		</div>
		<br />
		<div class="fill_message">
			<h2>地址信息：</h2>
					<table class="tab_login">
					<tr>
						<td valign="top" class="w1">
							收货人姓名：
						</td>
						<td>
							<div class="text_left" id="emailValidMsg">
								<p>
									${sessionScope.os.order.address.name }
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							详细送货地址：
						</td>
						<td>
							<div class="text_left" id="nickNameValidMsg">
								<p>
									${sessionScope.os.order.address.fullAddress }
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							邮政编码：
						</td>
						<td>
							<div class="text_left" id="emailValidMsg">
								<p>
									${sessionScope.os.order.address.postalCode}
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							收货人移动电话号码：
						</td>
						<td>
							<div class="text_left" id="emailValidMsg">
								<p>
									${sessionScope.os.order.address.mobile}
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							收货人固定电话号码：
						</td>
						<td>
							<div class="text_left" id="emailValidMsg">
								<p>
									${sessionScope.os.order.address.phone}
								</p>
							</div>
						</td>
					</tr>
			</table>
			<h2>送货方式信息：</h2>
			<table class="tab_login">
					<tr>
						<td valign="top" class="w1">
							送货方式名称：
						</td>
						<td>
							<div class="text_left" id="emailValidMsg">
								<p>
									${sessionScope.os.order.sendWay.sendWay}
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							送货说明：
						</td>
						<td>
							<div class="text_left" id="emailValidMsg">
								<p>
									${sessionScope.os.order.sendWay.sendDesc}
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							送货费用：
						</td>
						<td>
							<div class="text_left" id="emailValidMsg">
								<p>
									￥${sessionScope.os.order.sendWay.sendFee}
								</p>
							</div>
						</td>
					</tr>
				</table>
			<h2>
				商品信息：
			</h2>
				<table class="tabl_buy" id="tbCartItemsNormal">
					<tr class="tabl_buy_title">
						<td class="buy_td_6">
							<span>&nbsp;</span>
						</td>
						<td>
							<span class="span_w1">商品名</span>
						</td>
						<td class="buy_td_4">
							<span class="span_w3">当当价</span>
						</td>
						<td class="buy_td_1">
							<span class="span_w2">数量</span>
						</td>
						<td class="buy_td_1">
							<span class="span_w2">折扣</span>
						</td>
					</tr>
					<c:forEach items="${sessionScope.os.order.items}" var="it">
							<tr class='td_no_bord'>
								<td class="buy_td_6">
									<span class="objhide"><img /> </span>
								</td>
								<td>
									<a href="../catalog/detail.do?pid=${it.productId }" target="_block">${it.productName}</a>
								</td>
								<td class="buy_td_5">
									<span>￥${it.dangPrice}</span>
								</td>
								<td class="buy_td_4">
									&nbsp;&nbsp;
									<span>${it.num}</span>
								</td>
								<td class="buy_td_1">
									&nbsp;&nbsp;${it.amount}
								</td>
							</tr>
					</c:forEach>
				</table>
				<div class="save_total">
							<span class="t_add">商品金额总计：</span>
							<span class="c_red_b"> ￥<span id='total_account'>${sessionScope.cs.dangPrice}</span>
							</span>
							<input type="button" id="btnClientRegister" class="button_1"
						value="下一步"  onclick="location='order.do'"/>
						</div>
				<div class="login_in" align="center">
				</div>
		</div>
		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

