<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>生成订单- 易售手机网</title>
		<link href="${pageContext.request.contextPath}/css/login.css"
			rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/page_bottom.css"
			rel="stylesheet" type="text/css" />
			<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/common.js">
		</script>
	</head>
	<body>
	<%@include file="../common/head1.jsp"%>
		<br/>
		<br />
		<div class="login_step">
			<span class="red_bold">更改送货方式</span>
		</div>
		<br />
		<div class="fill_message">
				<table class="tab_login">
					<tr>
						<td valign="top" class="w1">
							请选择送货方式:
						</td>
						<td>
							<select onchange="var send=$('sendWayId').value;location='changeOrderSendWayform2.do?orderId=${param.orderId }&sendwayId='+send" id="sendWayId" name="sendWayId" class="text_input">
								<c:forEach var="sw" items="${requestScope.list_sw }">
									<c:if test="${sw.id eq requestScope.sendway.id}" var="t_sw">
										<option value="${sw.id }" selected="selected">
											${sw.sendWay } 
										</option>
									</c:if>
									<c:if test="${!t_sw}">
										<option value="${sw.id }">
											${sw.sendWay }	
										</option>
									</c:if>
								</c:forEach>
							</select>
						</td>
					</tr>
					</table>
					<table class="tab_login">
					<tr>
						<td valign="top" class="w1">
							送货方式：
						</td>
						<td>
							<div class="text_left" id="emailValidMsg">
								<p>
									${requestScope.sendway.sendWay }
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							送货方式说明：
						</td>
						<td>
							<div class="text_left" id="emailValidMsg">
								<p>
									${requestScope.sendway.sendDesc }
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
									${requestScope.sendway.sendFee }
								</p>
							</div>
						</td>
					</tr>
				</table>
				<div class="login_in">
					<input type="button" id="btnClientRegister" class="button_1"
						value="修改"  onclick="var sendwayId=$('sendWayId').value;location='changeOrderSendWay.do?orderId=${param.orderId }&sendwayId='+sendwayId"/>
						&nbsp;&nbsp;<input type="button" id="btnClientRegister" class="button_1"
						value="返回"  onclick="location='order.do?orderId=${param.orderId }'"/>
				</div>
		</div>
		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

