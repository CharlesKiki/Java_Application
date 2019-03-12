<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>修改订单信息- 易售手机网</title>
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
       	var re = /^[0-9]{4}(-[0-9][0-9]?){2}$/;
       	var value = f.value.strip();
       if(!re.test(value)){
       		$('errorSendTime').innerHTML = "你输入的日期不合法！！(yyyy-MM-dd)";
         f.focur();
         return false;
               		}
       return true;
			}
			function checkDesc(f){
       	$('errorDesc').innerHTML = "";
       	var value = f.value.strip();
       if(value.length<6){
       		$('errorDesc').innerHTML = "你的说明不够详细！！";
         f.focur();
         return false;
               		}
       return true;
			}
		</script>
	</head>
	<body>
		<%@include file="../common/head1.jsp"%>
		<br/>
		<br />
			<div class="login_step">
				<h2><strong>修改订单信息</strong></h2>
			</div>
 		<br />
		<br />
		<div class="fill_message">
			<form method="post" action="changeOrderInfo.do?orderId=${order.id }" id="ctl00">
				<table class="tab_login">
					<tr>
						<td valign="top" class="w1">
							收货时间：
						</td>
						<td>
							<input type="text" name="sendTime" id="sendTime" class="text_input" value="${order.stDate1 }" style="margin-left: 0" onblur="checkSendTime(this)"/>
							<div class="text_left" id="nickNameValidMsg">
								<p>
									请填写收货时间
								</p>
								<p style="color: red">
									<span id="errorSendTime"></span>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							是否删除：
						</td>
						<td>
							是<input type="radio" name="delete" value="true"/>&nbsp;&nbsp;&nbsp;		否<input type="radio" name="delete" checked="	checked" value="false"/>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							订单说明：
						</td>
						<td>
							<input type="text" name="desc" id="desc" class="text_input" value="${order.desc }" style="margin-left: 0" onblur="checkDesc(this);"/>
							<div class="text_left" id="emailValidMsg">
								<p>
									请填写订单说明
								</p>
								<p style="color: red">
									<span id="errorDesc"></span>
								</p>
							</div>
						</td>
					</tr>
				</table>
				<div class="login_in">
					<input type="submit" id="btnClientRegister" class="button_1"
						value="更改" />&nbsp;&nbsp;
					<input type="button" id="btnClientRegister" class="button_1"
						value="返回"  onclick="location='order.do?orderId=${order.id }'"/>
				</div>
			</form>
		</div>
		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

