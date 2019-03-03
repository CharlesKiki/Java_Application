<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link href="${pageContext.request.contextPath}/css/content.css"
			rel="stylesheet" type="text/css" />
	</head>
		<body>
			<div class="content_title">
			订单信息
			</div>
			<div class="content_div1">
					<table class="table_content">
					<tr>
							<td class="t3">
								订单ID
							</td>
							<td class="t3">
								是否删除
							</td>
							<td class="t3">
								订单状态
							</td>
							<td class="t3">&nbsp;&nbsp;</td>
						</tr>
					<c:forEach var="order" items="${orders }">
						<tr>
							<td class="t4">
								${order.id }
							</td>
							<td class="t4">
								<c:if test="${order.delete}" var="del">
									已删除
								</c:if>
								<c:if test="${!del }">
									未删除
								</c:if>
							</td>
							<td class="t4">
									<c:choose>
									<c:when test="${order.status eq 1}">
										未发货
									</c:when>
									<c:when test="${order.status eq 2}">
										已发货
									</c:when>
									<c:otherwise>
										已签收
									</c:otherwise>
								</c:choose>
							</td>
							<td class="t4">
								<a href="showOrder.do?orderId=${order.id }">查看具体信息</a>
							</td>
						</tr>
					</c:forEach>
					</table>
				</div>
			<br /><br/>
		<div class="content_foot"></div>
	</body>
</html>

