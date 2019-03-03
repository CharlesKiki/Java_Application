<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>用户注册 - 易售手机网</title>
		<link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/page_bottom.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/common.js">
		</script>	
		<script type="text/javascript">
			function checkEmai(f){
					var re = /^[a-z]([a-z0-9]*[-_]?[a-z0-9]+)*@([a-z0-9]*[-_]?[a-z0-9]+)+[\.][a-z]{2,3}([\.][a-z]{2})?$/i;
       	$('emailError').innerHTML = "";
       	var value = f.value.strip();
       	if (!re.test(value)) {
       		$('emailError').innerHTML = "必须填入有效的Email！！";
         return false;
                	}
					validatorEmail();
       			
			}
			
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
			function checkPasswd(f){
					var re = /^[A-Za-z0-9]*$/;
					$('errorpasswd').innerHTML = "";
       	var value = f.value.strip();
       	if (value.length<6 || value.length>20) {
       		$('errorpasswd').innerHTML = "用户密码过短或太长，不符合要求！";
         return false;
                	}
       if (!re.test(value)) {
       		$('errorpasswd').innerHTML = "必须填入有效的密码！！";
         f.focus();
         return false;
                	}
       return true;
			}
			
			function checkRepeatPass(f){
					$('errorpasswd2').innerHTML = "";
					if(!checkPasswd($('passwd'))){
					$('passwd').focus();
					f.blur();
					return false;
					}
       	var value = f.value.strip();
       	var passwd=$('passwd').value;
       	if(value!=passwd){
       		$('errorpasswd2').innerHTML = "两次输入密码不同，请重新输入！！";
       		f.value="";
         return false;
       				}
       return true;
			}
			
			function formSubmit(){
				var f1 = document.forms['ctl00'];
      f1.submit();
			}
			function validatorEmail(){
				var url='${pageContext.request.contextPath}/authorize/validatoremail.do?email='+$F('email');
				new Ajax.Request(url,{method:'get',onSuccess:function(request){
					var str=request.responseText;
					if(str==0){
						$('emailError').innerHTML = "该用户可以使用！！";
					}else{
						$('emailError').innerHTML = "该用户已经存在！！，请重新填写.....";
         $('email').focus();
					}
				}});
			}
			
			function changImage(){
			var m=Math.random();
				$('imgVcode').src="image.do?m="+m;
			}
		</script>

	</head>
	<body>
		<%@include file="../common/head1.jsp"%>
		<div class="login_step">
			注册步骤:
			<span class="red_bold">1.填写信息</span> > 2.验证邮箱 > 3.注册成功
		</div>
		<div class="fill_message">
			<form name="ctl00" method="post" action="registerTwo.do" id="ctl00">
				<h2>
					以下均为必填项
				</h2>
				<table class="tab_login">
					<tr>
						<td valign="top" class="w1">
							请填写您的Email地址：
						</td>
						<td>
							<input name="email" type="text" id="email"
								class="text_input" onblur="checkEmai(this)" /><html:errors property="email"/>
							
							<div class="text_left" id="emailValidMsg">
								<p>
								请填写有效的Email地址，在下一步中您将用此邮箱接收验证邮件。<br />
									<span id="emailError" style="color:red" ></span>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							设置您在当当网的昵称：
						</td>
						<td>
							<input name="nickname" type="text" id="nickname"
								class="text_input" onblur="checkNickName(this);" /><html:errors property="nickname"/><html:errors property="jsp.name"/>
								
							<div class="text_left" id="nickNameValidMsg">
								<p>
									您的昵称可以由小写英文字母、中文、数字组成，<br />长度4－20个字符，一个汉字为两个字符。<br />
									<span id="errorNickName" style="color:red"></span>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							设置密码：
						</td>
						<td>
							<input name="passwd" type="password" id="passwd"
								class="text_input" onblur="checkPasswd(this);"/>
							<div class="text_left" id="passwordValidMsg">
								<p>您的密码可以由大小写英文字母、数字组成，长度6－20位。<br />
									<span id="errorpasswd" style="color:red"></span>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							再次输入您设置的密码：
						</td>
						<td>
							<input name="repeatPass" type="password" id="repeatPass"
								class="text_input" onblur="checkRepeatPass(this);" />
							<div class="text_left" id="repeatPassValidMsg">
								<p>
									<span id="errorpasswd2" style="color:red"></span>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							验证码：
						</td>
						<td>
							<img class="yzm_img" id='imgVcode' src="image.do"/>
							<input name="txtVerifyCode" type="text" id="txtVerifyCode"
								class="yzm_input" onblur="" />
							<div class="text_left t1">
								<p class="t1">
									<span id="vcodeValidMsg">请输入图片中的四个字母。</span><a
										href="javascript:changImage();">看不清楚？换个图片</a><br /><span style="color:red"><html:errors property="validateerror"/></span>
								</p>
							</div>
						</td>
					</tr>
				</table>

				<div class="login_in">
					<input id="btnClientRegister" class="button_1" onclick="javascript:formSubmit();"
						type="button" value="注 册" />
				</div>
			</form>
		</div>
		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

