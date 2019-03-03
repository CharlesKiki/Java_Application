<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>用户注册 - 易售手机网</title>
		<link href="${pageContext.request.contextPath}/css/login.css"
			rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/page_bottom.css"
			rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			function formSubmit(){
				var f1 = document.forms['ct200'];
      f1.submit();
			}	
		</script>
	</head>
	<body>
		<%@include file="../common/head1.jsp"%>
		
			<div class="login_step">
				注册步骤: 1.填写信息 >
				<span class="red_bold">2.验证邮箱</span> > 3.注册成功
			</div>
			<form name="ct200" method="post" action="registerOk.do" id="ct200">
			<div class="validate_email">
				<h2>
					感谢您注册当当网！现在请按以下步骤完成您的注册!
				</h2>
				<div class="look_email">
					<h4>
						第一步：查看您的电子邮箱
					</h4>
					<div class="mess reduce_h">
						我们给您发送了验证邮件，邮件地址为：
						<span class="red"><span id="lblEmail">${sessionScope.user.email}</span>
						</span>
						<span class="t1"> （<a href="registerOne.do">上一步</a> </span>），
						请登录您的邮箱收信。
					</div>
					<h4>
						第二步：输入验证码
					</h4>
					<div class="mess">
						<span class="write_in">输入您收到邮件中的验证码：</span>
						<input name="validatecode" type="text" id="validatecode"
							class="yzm_text" />

						<input class="finsh" type="button" value="完 成" id="Button1"
							onclick="javascript:formSubmit();" />
						<span id="register1_validatenull" class="no_right">请输入验证码！</span>
						<html:errors property="validateerror"/>
						<html:errors property="validateCode"/>
					</div>
				</div>
			</div>
		</form>
		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

