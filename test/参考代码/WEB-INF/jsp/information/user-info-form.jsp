<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>修改用户资料-易售手机网</title>
		<link href="${pageContext.request.contextPath}/css/login.css"
			rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/book.css"
			rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/page_bottom.css"
			rel="stylesheet" type="text/css" />
		<link
			href="${pageContext.request.contextPath}/css/shopping_vehicle.css"
			rel="stylesheet" type="text/css" />
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/common.js">
		</script>
		<script type="text/javascript">
		function checkNickName(f){
					var re = /^[A-Za-z]([A-Za-z0-9]*[-_]?[A-Za-z0-9]+)*$/;
       	$('errorNickName').innerHTML = "";
       	var value = f.value.strip();
       	if (!re.test(value)) {
       		$('errorNickName').innerHTML = "必须填入有效的昵称！！";
         f.focus();
         return false;
                	}
        if(!(value.length>=4 && value.length<=20)){
       			$('errorNickName').innerHTML = "昵称长度不合法，请确认！！";
	         f.focus();
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
		<div class="book">
		<div class="fill_message">
		<div style="position: relative">
			<div align="left" style="position:absolute"><h1><strong>修改用户资料</strong></h1></div>
		</div><br />
		<form method="post" action="changeInfo.do" id="ctl00">
			<table class="tab_login">
				<tr>
						<td class="w1">
							用户帐号：
						</td>
						<td>
							${sessionScope.user.email }
						</td>
				</tr>
				<tr>
					<td class="w1">
						昵称：
					</td>
					<td>
						<input id="nickname" name="nickname" type="text" style="margin-left: 0" class="text_input"  value="${sessionScope.user.nickname }" onblur="checkNickName(this);"/>
						<div class="text_left" id="nickNameValidMsg">
								<p>
									您的昵称可以由小写英文字母、中文、数字组成，<br />长度4－20个字符，一个汉字为两个字符。<br />
								</p>
								<p style="color:red">
									<span id="errorNickName"></span>
								</p>
							</div>
					</td>
				</tr>
				<tr>
						<td class="w1">
							积分：
						</td>
						<td>
							${sessionScope.user.user_integral }
						</td>
				</tr>
				<tr>
						<td class="w1">
							上次登录时间：
						</td>
						<td>
							${sessionScope.user.last_login_time }
						</td>
				</tr>
				<tr>
						<td class="w1">
							上次登录地址：
						</td>
						<td>
							${sessionScope.user.last_login_ip }
						</td>
				</tr>
			</table>
			<div class="login_in">
					<input type="submit" id="btnClientRegister" class="button_1"
						value="更改" style="text-align: center" />&nbsp;&nbsp;
					<input type="button" id="btnClientRegister" class="button_1"
						value="返回"  onclick="location='information.do'" style="text-align: center"/>
				</div>
		</form>
			
			</div>
	 	</div>
		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

