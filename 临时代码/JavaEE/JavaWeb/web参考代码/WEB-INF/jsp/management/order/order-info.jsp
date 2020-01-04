<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link href="${pageContext.request.contextPath}/css/content.css"
			rel="stylesheet" type="text/css" />
	</head>
	<body>
			<div class="content_title">详细订单信息</div>
			<div class="content_div1">
				<div class="content_div3">订单信息</div>
				<div>
				<table class="table_content">
						<tr>
							<td class="t3">
								订单时间：
							</td>
							<td class="t4">
								${order.ctDate }
							</td>
							<td class="t3">
								是否删除：
							</td>
							<td class="t4">
							<c:if test="${order.delete }" var="del">
								是
							</c:if>
							<c:if test="${!del }">
								否
							</c:if>
							</td>
						</tr>
						<tr>
							<td class="t3">
								收货时间：
							</td>
							<td class="t4">
								${order.stDate }
							</td>
							<td class="t3">
								运费：
							</td>
							<td class="t4">
								￥${order.sendFee }
							</td>
						</tr>
						<tr>
							<td class="t3">
								收货状态：
							</td>
							<td class="t4">
							<c:choose>
								<c:when test="${order.status eq 1 }">
										未发货
								</c:when>
								<c:when test="${order.status eq 2 }">
										已发货
								</c:when>
								<c:otherwise>
										已签收
								</c:otherwise>
							</c:choose>
							</td>
							<td class="t3">
								商品费用：
							</td>
							<td class="t4">
								￥${order.totalPrice }
							</td>
							</tr>
							<tr>
							<td class="t3">
								订单总额：
							</td>
							<td class="t4">
								￥${order.orderPrice }
							</td>
							<td class="t3">
								订单说明：
							</td>
							<td class="t4">
								${order.desc }
							</td>
						</tr>
					</table>
				<div>
				<div class="content_div3">送货地址信息</div>
				<div>
				<table class="table_content">
					<tr>
					<td class="t3">
						收件人姓名：
					</td>
					<td class="t4">
						${order.address.name }
					</td>
					<td class="t3">
						固定电话：
					</td>
					<td class="t4">
						${order.address.phone }
					</td>
				</tr>
				<tr>
					<td class="t3">
						收件人地址：
					</td>
					<td class="t4">
						${order.address.fullAddress }
					</td>
					<td class="t3">
						移动电话：
					</td>
					<td class="t4">
						${order.address.mobile }
					</td>
				</tr>
				<tr>
					<td class="t3">
						邮编：
					</td>
					<td class="t4">
						${order.address.postalCode }
					</td>
					<td class="t3">
						是否为默认地址：
					</td>
					<td class="t4">
						${order.address.defaultAddress }
					</td>
					</tr>
			</table>
			</div>
			<div class="content_div3">送货方式信息</div>
			<div>
			<table class="table_content">
					<tr>
					<td class="t3">
						送货方式：
					</td>
					<td class="t4">
						${order.sendWay.sendWay }
					</td>
					<td class="t3">
						运费：
					</td>
					<td class="t4">
						${order.sendWay.sendFee }
					</td>
				</tr>
				<tr>
					<td class="t3">
						是否关闭：
					</td>
					<td class="t4">
						<c:if test="order.close " var="clo">
						是
					</c:if>
					<c:if test="${!clo }"></c:if>
						否
					</td>
					<td class="t3">
						送货方式说明：
					</td>
					<td class="t4">
						${order.sendWay.sendDesc }
					</td>
				</tr>
			</table>
			</div>
			<div class="content_div3">商品信息</div>
			<div>
			<table class="table_content">
				<tr>
					<td class="t3">
						商品名：
					</td>
					<td class="t3">
						当当价：
					</td>
					<td class="t3">
						数量：
					</td>
					<td class="t3">
						折扣：
					</td>
				</tr>
				<c:forEach var="item" items="${order.items }">
					<tr>
					<td class="t4">
						${item.productName }
					</td>
					<td class="t4">
						${item.dangPrice }
					</td>
					<td class="t4" >
						${item.num }
					</td>
					<td class="t4" >
						${item.amount }
					</td>
				</tr>
				</c:forEach>
			</table>
			</div>
			</div>
			<div class="content_div2">
				<c:choose>
					<c:when test="${order.status eq 1}">
							<input type="button" id="btnClientRegister" class="content_button"
										value="发货"  onclick="location='sureOrder.do?orderId=${order.id }&option=2'"/>
					</c:when>
					<c:when test="${order.status eq 2}">
							<input type="button" id="btnClientRegister" class="content_button"
									value="确认签收"  onclick="location='sureOrder.do?orderId=${order.id }&option=3'"/>
					</c:when>
			</c:choose>
				<input type="button" id="btnClientRegister" class="content_button"
						value="返回"  onclick="location='showAllOrder.do'"/>
		</div>
		<br /><br/>
		<div class="content_foot"></div>
	</body>
</html>

