<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>送货地址信息- 易售手机网</title>
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
		<div class="fill_message">
			<div style="position: relative">
			<div align="left" style="position:absolute"><h2><strong>送货地址信息</strong></h2></div><div align="right" style="position:absolute;margin-left: 700px"><a href="changeAddressform.do?addressId=${address.id }&option=address"><strong>更改资料</strong></a></div>
			</div><br />
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
						value="返回"  onclick="location='information.do'"/>
				</div>
		</div>
		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

