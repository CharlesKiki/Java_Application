<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
<script type="text/javascript">
	function checkForm() {
		checkName();
		checkPassword();
		checkEmail();
		checkTel();
		checkTrueName();
		checkProvince();
	}
	function checkName() {
 
		var username = document.getElementById("username").value;
		if (username.length<3 || username.lenth>5) {
			document.getElementById("name_Span").innerHTML = "<em style = 'color:#EF0000'>用户名由3-5个字符组成</em>";
			//document.getElementById("username").focus();
		} else
			document.getElementById("name_Span").innerHTML = "<em style = 'color:#008000'>用户名由3-5个字符组成</em>";
	}
 
	function checkPassword() {
 
		var password = document.getElementById("password").value;
		if (password.length<8 || password.lenth>12) {
			document.getElementById("password_Span").innerHTML = "<em style = 'color:#EF0000'>请输入8-12位密码</em>";
			//document.getElementById("password").focus();
		} else
			document.getElementById("password_Span").innerHTML = "<em style = 'color:#008000'>请输入8-12位密码</em>";
 
		var pwdRept = document.getElementById("pwdRept").value;
		if (pwdRept != password) {
			document.getElementById("pwdRept_Span").innerHTML = "<em style = 'color:#EF0000'>两次密码不一致</em>";
			//document.getElementById("pwdRept").focus();
		}
 
		else
			document.getElementById("pwdRept_Span").innerHTML = "<em style = 'color:#008000'>两次密码不一致</em>";
	}
 
	function checkEmail() {
 
		var email = document.getElementById("email").value;
 
		var pattern = /^[a-zA-Z0-9#_\^\$\.\+\-\?\=\!\|\:\\\/\(\)\[\]\{\}]+@[a-zA-Z0-9]+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
 
		if (email.length == 0 || !pattern.test(email)) {
			document.getElementById("email_Span").innerHTML = "<em style = 'color:#EF0000'>格式示例:xxxxxxxx@163.com</em>";
			//document.getElementById("email").focus();
		}
 
		else
			document.getElementById("email_Span").innerHTML = "<em style = 'color:#008000'>格式示例:xxxxxxxx@163.com</em>";
	}
 
	function checkTel() {
 
		var tel = document.getElementById("tel").value;
 
		var phone_reg = /^1[3|4|5|7|8]\d{9}$/; //正则表达式
 
		if (tel.length == 0 || !phone_reg.test(tel)) {
			document.getElementById("tel_Span").innerHTML = "<em style = 'color:#EF0000'>格式示例:13800154200</em>";
			//document.getElementById("tel").focus();
		} else
			document.getElementById("tel_Span").innerHTML = "<em style = 'color:#008000'>格式示例:13800154200</em>";
	}
 
	function checkTrueName() {
 
		var name = document.getElementById("trueName").value;
		var true_reg = /^[\u4e00-\u9fa5]{2,5}$/;
		if (!true_reg.test(name)) {
			document.getElementById("trueName_Span").innerHTML = "<em style = 'color:#EF0000'>由2-5个中文组成</em>";
			//document.getElementById("trueName").focus();
		}
 
		else
			document.getElementById("trueName_Span").innerHTML = "<em style = 'color:#008000'>由2-5个中文组成</em>";
	}
 
	function checkProvince() {
 
		var pve = document.getElementById("province").value;
		if (pve.length < 1 || pve == "0")
			document.getElementById("province_Span").innerHTML = "<em style = 'color:#EF0000'>请选择省份</em>";
		else
			document.getElementById("province_Span").innerHTML = "<em style = 'color:#008000'>请选择省份</em>";
	}
</script>
<style type="text/css">
#txtRight {
	width: 80px;
	float: left;
	text-align: right;
}
 
#txtInput {
	width: 100px;
	text-align: left;
}
 
#province {
	width: 100px;
}
 
#major {
	width: 400px
}
</style>
</head>
<body>
	<center>
 
		<form onSubmit="checkForm()">
			<table >
				<tr>
					<td class="required" id="txtRight"><font color='red'>*</font>用户名:</td>
					<td id="txtInput"><input type="text" id="username"
						onblur="checkName()" /></td>
					<td><span id="name_Span">用户名由3-5位字符组成</span></td>
				</tr>
 
				<tr>
					<td id="txtRight"><font color='red'>*</font>密码:</td>
					<td id="txtInput"><input type="password" id="password"
						onblur="checkPassword()" /></td>
					<td><span id="password_Span">请输入8-12位密码</span></td>
				</tr>
 
				<tr>
					<td id="txtRight"><font color='red'>*</font>确认密码:</td>
					<td id="txtInput"><input type="password" id="pwdRept"
						onblur="checkPassword()" /></td>
					<td><span id="pwdRept_Span">两次密码不一致</span></td>
				</tr>
 
				<tr>
					<td id="txtRight"><font color='red'>*</font>Email:</td>
					<td id="txtInput"><input type="email" id="email"
						onblur="checkEmail()" /></td>
					<td><span id="email_Span">格式示例:xxxxxxxx@163.com</span></td>
				</tr>
 
				<tr>
					<td id="txtRight"><font color='red'>*</font>手机号码:</td>
					<td id="txtInput"><input type="text" maxlength="11" id="tel"
						onblur="checkTel()" /></td>
					<td><span id="tel_Span">格式示例:13800154200</span></td>
				</tr>
 
				<tr>
					<td id="txtRight"><font color='red'>*</font>真实姓名:</td>
					<td id="txtInput"><input type="text" id="trueName"
						onblur="checkTrueName()" /></td>
					<td><span id="trueName_Span">由2-5个中文组成</span></td>
				</tr>
 
				<tr>
					<td id="txtRight"><font color='red'>*</font>省份:</td>
					<td colspan="2"><select id="province"
						onChange="checkProvince()">
							<option value="0">请选择</option>
							<option value="北京">北京</option>
							<option value="天津">天津</option>
							<option value="上海">上海</option>
							<option value="重庆">重庆</option>
					</select> <span id="province_Span">请选择省份</span></td>
				</tr>
 
				<tr>
					<td id="txtRight"><font color='red'>*</font>技术方向:</td>
					<td id="major" colspan="2"><input type="radio" name="major"
						value="Java" checked />Java <input type="radio" name="major"
						value=".Net" />.Net <input type="radio" name="major" value="PHP" />PHP
						<input type="radio" name="major" value="网页" />网页 <input
						type="radio" name="major" value="IOS" />IOS <input type="radio"
						name="major" value="Android" />Android</td>
				</tr>
 
				<tr>
					<td colspan="3" align="center"><input type="submit" value="注册">
						<input type="reset" value="重置"></td>
 
				</tr>
			</table>
		</form>
	</center>
</body>
</html>
