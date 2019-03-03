<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
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
		<div class="login_step">
			生成订单步骤:
			1.填写送货地址 ><span class="red_bold">2.送货方式</span> >3.确认订单信息 > 4.生成订单
		</div>
		<br />
		<div class="fill_message">
				<table class="tab_login">
					<tr>
						<td valign="top" class="w1">
							请选择送货方式:
						</td>
						<td>
							<select onchange="var send=$('sendWayId').value;location='sendway2.do?sendwayId='+send" id="sendWayId" name="sendWayId" class="text_input">
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
						value="下一步"  onclick="var sendwayId=$('sendWayId').value;location='sure.do?sendwayId='+sendwayId"/>
				</div>
		</div>
		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

