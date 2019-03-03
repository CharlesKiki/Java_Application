<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link href="${pageContext.request.contextPath}/css/content.css"
			rel="stylesheet" type="text/css" />
	</head>
		<body>	
			<div class="content_title" >客户详细信息</div>
					<div class="content_div1">
						<table class="table_content">
						<tr>
						<td class="t3" width="25%">
							用户ID：
						</td>
						<td class="t4" width="25%">
							${user.id }
						</td>
						<td class="t3" width="25%">
							积分：
						</td>
						<td class="t4" width="25%">
							${user.user_integral }
						</td>
					</tr>
					<tr>
						<td class="t3" width="25%">
							昵称：
						</td>
						<td class="t4" width="25%">
							${user.nickname }
						</td>
						<td class="t3" width="25%">
							上次登录时间：
						</td>	
						<td class="t4" width="25%">
							${user.last_login_time }
						</td>
					</tr>
					<tr>
						<td class="t3" width="25%">
							EMAIL：
						</td>
						<td class="t4" width="25%">
							${user.email }
						</td>
						<td class="t3" width="25%">
							上次登录IP：
						</td>
						<td class="t4" width="25%">
							${user.last_login_ip }
						</td>
						</tr>
					</table>
				</div>
<%--			<div style="position: relative">--%>
<%--			<div align="left" style="position:absolute"><h1><strong>用户订单信息</strong></h1></div>--%>
<%--		</div><br />--%>
<%--		<table class="table_content">--%>
<%--			<c:forEach var="order" items="${orders }">--%>
<%--				<tr>--%>
<%--					<td class="t1">--%>
<%--						订单ID：--%>
<%--					</td>--%>
<%--					<td class="t2">--%>
<%--						${order.id }--%>
<%--					</td>--%>
<%--					<td class="t1">--%>
<%--						订单状态：--%>
<%--					</td>--%>
<%--					<td class="t2">--%>
<%--						${order.status }--%>
<%--					</td>--%>
<%--					<td style="background-color: #aaaaaa">--%>
<%--						<a href="order.do?orderId=${order.id }">查看具体信息</a>--%>
<%--					</td>--%>
<%--				</tr>--%>
<%--			</c:forEach>--%>
<%--			</table>--%>
<%--		<div style="position: relative">--%>
<%--			<div align="left" style="position:absolute"><h1><strong>用户送货地址信息</strong></h1></div>--%>
<%--		</div><br />--%>
<%--		<table class="table_content">--%>
<%--			<c:forEach var="address1" items="${addresss1}">--%>
<%--				<tr>--%>
<%--					<td class="t1">--%>
<%--						收货人姓名：--%>
<%--					</td>--%>
<%--					<td class="t2">--%>
<%--						${address1.name }--%>
<%--					</td>--%>
<%--					<td class="t1">--%>
<%--						收货人地址：--%>
<%--					</td>--%>
<%--					<td class="t2">--%>
<%--						${address1.fullAddress }--%>
<%--					</td>--%>
<%--					<td style="background-color: #aaaaaa">--%>
<%--						<a href="address.do?addressId=${address1.id }">查看具体信息</a>--%>
<%--					</td>--%>
<%--				</tr>--%>
<%--			</c:forEach>--%>
<%--			<c:forEach var="address2" items="${addresss2}">--%>
<%--				<tr>--%>
<%--					<td class="t1">--%>
<%--						收货人姓名：--%>
<%--					</td>--%>
<%--					<td class="t2">--%>
<%--						${address2.name }--%>
<%--					</td>--%>
<%--					<td class="t1">--%>
<%--						收货人地址：--%>
<%--					</td>--%>
<%--					<td class="t2">--%>
<%--						${address2.fullAddress }--%>
<%--					</td>--%>
<%--					<td style="background-color: #aaaaaa">--%>
<%--						<a href="address.do?addressId=${address2.id }">查看具体信息</a>--%>
<%--					</td>--%>
<%--				</tr>--%>
<%--			</c:forEach>--%>
<%--			</table>--%>
			<div class="content_div1">
					<input type="button" id="btnClientRegister" class="content_button"
						value="取消"  onclick="location='showmain.do'" style="text-align: center"/>
				</div>
		<div class="content_foot"></div>
	</body>
</html>

