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
			<span class="red_bold">1.填写送货地址</span>>2.送货方式 >3.确认订单信息 > 4.生成订单
		</div>
		<br />
		<div class="fill_message">
			<a href="address.do?flag=true">新建送货地址</a>
			<c:if test="${!(defaultAddress eq null)}">
				<select onchange="var addressId=$('addId').value;location='address.do?addressId='+addressId"
					class="text_input" id="addId" name="addId">
					<c:if test="${address.id eq defaultAddress.id}" var="adds1">
							<option value="${defaultAddress.id }">--  默认地址    --</option>
						</c:if>
						<c:if test="${!adds1 }">
						<option value="${defaultAddress.id }">--  默认地址    --</option>
						</c:if>		
					
					<c:forEach var="add" items="${addresss }"  varStatus="sta">
						<c:if test="${add.id eq address.id}" var="adds">
							<option value="${add.id }" selected="selected">-- 地址${sta.index+1 }  -- </option>
						</c:if>
						<c:if test="${!adds }">
						<option value="${add.id }">--  地址${sta.index+1}   --</option>
						</c:if>					
					</c:forEach>
				</select>
			</c:if>
			
			<br />
			<br />
				<table class="tab_login">
					<tr>
						<td valign="top" class="w1">
							收货人姓名：
						</td>
						<td>
							<div class="text_left" id="emailValidMsg">
								<p>
									${address.name }
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
									${address.fullAddress }
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
									${address.postalCode }
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
									${address.mobile }
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
									${address.phone }
								</p>
							</div>
						</td>
					</tr>
				</table>
				<div class="login_in">
					<input type="button" id="btnClientRegister" class="button_1"
						value="下一步"  onclick="var addressId=$('addId').value;location='sendway1.do?addressId='+addressId"/>
				</div>
		</div>
		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

