<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>	
		<title>登录 - 易售手机网</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="${pageContext.request.contextPath}/css/login.css"
			rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/page_bottom.css"
			rel="stylesheet" type="text/css" />
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/common.js">
		</script>
		<script type="text/javascript">
			function checkEmai(f){
					var re = /^[a-z]([a-z0-9]*[-_]?[a-z0-9]+)*@([a-z0-9]*[-_]?[a-z0-9]+)+[\.][a-z]{2,3}([\.][a-z]{2})?$/i;
       	$('divErrorMssage').innerHTML = "";
       	var value = f.value.strip();
       	if (!re.test(value)) {
       		$('divErrorMssage').innerHTML = "必须填入有效的Email！！";
         f.focur();
         return false;
                	}
       return true;
			}
			
			function checkPasswd(f){
					$('divErrorMssage').innerHTML = "";
       	var value = f.value.strip();
       	if (value.length<6) {
       		$('divErrorMssage').innerHTML = "用户密码太短，不符合要求！";
         f.focur();
         return false;
                	}
       return true;
			}
			
			function checkOnSubmit(){
					var f=document.forms['ctl00'];
					f.submit();
			}
		</script>
	</head>
	<body>


		<%@include file="../common/head1.jsp"%>

		<div class="enter_part">

			<%@include file="../common/introduce.jsp"%>

			<div class="enter_in">
				<div class="bj_top"></div>
				<div class="center">
					<div style="height: 30px; padding: 5px; color: red"
						id="divErrorMssage">
						<html:errors property="emailotpasswd"/>
						<html:errors property="email"/>
					</div>
					<div class="main">
						<h3>
							登录当当网
						</h3>
						<form name="ctl00" method="post" action="login.do" id="ctl00">
							<ul>
								<li>
									<span>请输入Email地址：</span>
									<input name="txtUsername" type="text" id="txtUsername"
										class="textbox" onblur="checkEmai(this);"/>
								</li>
								<li>
									<span class="blank">密码：</span>
									<input name="txtPassword" type="password" id="txtPassword"
										class="textbox" onkeydown="" onblur="checkPasswd(this)"/>
								</li>
								<li>
									<input id="btnSignCheck" class="button_enter" onclick="javascript:checkOnSubmit();"
										type="button" value="登 录" />
									<input type="submit" name="btnSign" value="" id="btnSign"
										style="display: none;" />
								</li>
							</ul>
						</form>
					</div>
					<div class="user_new">
						<p>
							您还不是当当网用户？
						</p>
						<p class="set_up">
							<a href="registerOne.do">创建一个新用户&gt;&gt;</a>
						</p>
					</div>
				</div>
			</div>
		</div>

		<%@include file="../common/foot1.jsp"%>

	</body>
</html>

