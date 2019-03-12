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
		<script type="text/javascript">
			function checkSendTime(f){
					$('errorSendTime').innerHTML = "";
       	var re = /^[1-9][0-9]{3}-[1-9][1-9]?-[1-9][0-9]?$/;
       	var value = f.value.strip();
       if(!re.test(value)){
       		$('errorSendTime').innerHTML = "你输入的日期不合法！！(xxxx-xx-xx)";
         f.focur();
         return false;
               		}
       return true;
			
			}
			
			
		</script>
	</head>
	<body>
		<%@include file="../common/head1.jsp"%>
		<div class="login_step">
			生成订单步骤:
			1.填写送货地址>2.送货方式 >3.确认订单信息 ><span class="red_bold">4.生成订单</span>
		</div>
		<br />
		<div class="fill_message">
			<form method="post" action="orderok.do" id="ctl00">
				<table class="tab_login">
					<tr>
						<td valign="top" class="w1">
							订单说明：
						</td>
						<td>
							<input type="text" name="desc" id="desc" class="text_input" />
							<div class="text_left" id="emailValidMsg">
								<p>
									请填写该订单的需求说明：
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							订单送货日期：
						</td>
						<td>
							<input type="text" name="sendTime" id="sendTime" class="text_input" onblur="checkSendTime(this);"/>
							<div class="text_left" id="nickNameValidMsg">
								<p>
									请填写订单送货日期
								</p>
								<p style="color: red">
									<span id="errorSendTime"></span>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							订单费用：
						</td>
						<td>
							<div class="text_left" id="nickNameValidMsg">
								<p>
									￥${sessionScope.os.order.orderPrice }
								</p>
							</div>
						</td>
					</tr>
				</table>

				<div class="login_in">
					<input type="submit" id="btnClientRegister" class="button_1"
						value="确定" />
				</div>
			</form>
		</div>
		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

