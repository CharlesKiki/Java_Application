<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../common/taglib.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link href="${pageContext.request.contextPath}/css/book.css"
			rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/second.css"
			rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/secBook_Show.css"
			rel="stylesheet" type="text/css" />
		<link
			href="${pageContext.request.contextPath}/css/shopping_vehicle.css"
			rel="stylesheet" type="text/css" />

		<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/common.js">
	
</script>
	</head>
	<body>
		<br />
		<br />
		<div class="my_shopping">
			<img class="pic_shop"
				src="${pageContext.request.contextPath }/images/pic_myshopping.gif" />
		</div>
		<div id="div_choice" class="choice_merch">
			<h2 id="cart_tips">
				您已选购以下商品
				
			</h2>
			<div class="choice_bord">
				<table class="tabl_buy" id="tbCartItemsNormal">
					<tr class="tabl_buy_title">
						<td class="buy_td_6">
							<span>&nbsp;</span>
						</td>
						<td>
							<span class="span_w1">商品名</span>
						</td>
						<td class="buy_td_5">
							<span class="span_w2">市场价</span>
						</td>
						<td class="buy_td_4">
							<span class="span_w3">当当价</span>
						</td>
						<td class="buy_td_1">
							<span class="span_w2">数量</span>
						</td>
						<td class="buy_td_2">
							<span>变更数量</span>
						</td>
						<td class="buy_td_1">
							<span>删除</span>
						</td>

					</tr>
					<tr class='objhide' over="no">
						<td colspan="8">
							&nbsp;
						</td>
					</tr>


					<c:forEach items="${sessionScope.cs.items}" var="it">
						<c:if test="${!it.value.drop }">
							<tr class='td_no_bord'>
								<td style='display: none'>
									9317290
								</td>
								<td class="buy_td_6">
									<span class="objhide"><img /> </span>
								</td>
								<td>
									<a href="../catalog/detail.do?pid=${it.value.product.id }" target="_block">${it.value.product.product_name}</a>
								</td>
								<td class="buy_td_5">
									<span class="c_gray">￥${it.value.product.fixed_price}</span>
								</td>
								<td class="buy_td_4">
									&nbsp;&nbsp;
									<span>￥${it.value.product.dang_price}</span>
								</td>
								<td class="buy_td_1">
									&nbsp;&nbsp;${it.value.num}
								</td>
	
								<td class="buy_td_1">
	
									<input class="del_num" type="text" size="3" maxlength="4"
										id="it_${it.value.product.id}" value='${it.value.num}' />
									<a href="javascript:;"
										onclick="window.location='updateCart.do?productId=${it.value.product.id}&num='+$F('it_${it.value.product.id}')">变更</a>
								</td>
								<td class="buy_td_1">
									<a href="javascript:;"
										onclick="location='dropCart.do?productId=${it.value.product.id}'">删除</a>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
				<div id="div_no_choice" class="objhide">
					<div class="choice_title"></div>
					<div class="no_select">
						您还没有挑选商品
					</div>
				</div>
				<div class="choice_balance">
					<div class="select_merch">
						<a href='../catalog/main.do'><html:errors property="error.cart.empty"/> 继续挑选商品>></a>
					</div>
					<div class="total_balance">
						<div class="save_total">
							您共节省：
							<span class="c_red"> ￥<span id="total_economy">${sessionScope.cs.totalPrice-sessionScope.cs.dangPrice}</span>
							</span>
							<span id='total_vip_economy' class='objhide'> ( 其中享有优惠： <span
								class="c_red"> ￥<span id='span_vip_economy'>0.00</span> </span>
								) </span>
							<span style="font-size: 14px">|</span>
							<span class="t_add">商品金额总计：</span>
							<span class="c_red_b"> ￥<span id='total_account'>${sessionScope.cs.dangPrice}</span>
							</span>
						</div>
						<div id="balance" class="balance">
							<a name='checkout' href='javascript:;' onclick="location='address.do'" > <img
									src="${pageContext.request.contextPath}/images/butt_balance.gif"
									alt="结算" border="0" title="结算" /> </a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 用户删除恢复区 -->
		<c:if test="${fn:length(cs.dropItems) gt 0 }">
			<div id="divCartItemsRemoved" class="del_merch">
				<div class="del_title">
					您已删除以下商品，如果想重新购买，请点击“恢复”
				</div>
				<table class=tabl_del id=del_table>
					<tbody>

						<c:forEach items="${cs.dropItems}" var="it"
							varStatus="status">
							<tr>
								<td width="58" class=buy_td_6>
									&nbsp;
								</td>
								<td width="365" class=t2>
									<a href="../catalog/detail.do?pid=${it.value.product.id }" target="_block">${it.value.product.product_name}</a>
								</td>
								<td width="106" class=buy_td_5>
									￥${it.value.product.fixed_price}
								</td>
								<td width="134" class=buy_td_4>
									<span>￥${it.value.product.dang_price}</span>
								</td>
								<td width="56" class=buy_td_1>
									<a href="javascript:;"
										onclick="location='recoveryItems.do?productId=${it.value.product.id}'">
										恢复 </a>
								</td>
								<td width="16" class=objhide>
									&nbsp;
								</td>
							</tr>

							<c:if test="${!status.last}">

								<tr class=td_add_bord>
									<td colspan=8>
										&nbsp;
									</td>
								</tr>
							</c:if>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</c:if>
		<br />
		<br />
		<br />
		<br />
		<!--页尾开始 -->
		<%@include file="../common/foot.jsp"%>
		<!--页尾结束 -->
	</body>
</html>



