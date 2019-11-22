<%@ page language="java" contentType="text/html; charset=UTF-8" import="" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 备注：仅仅是观察几个逻辑的实现逻辑，没有测试。	 -->
<head>
	<%
	/*
		request相当于一次Http的通信信息，不具备记忆通信状态
		session可以维持一次长通话，关闭当前页面后也可以记忆该用户的信息。但是这个特性可能会
		因为用户的关闭浏览器行为而失效
	*/
	//当首次请求时，字段初始化为null
	{
	if(request.getAttribute("user")==null){
		String username=null;
		String password=null;
		
		//初始化Cookie
		Cookie[] cookies=request.getCookies();

		//Cookie检索用户名和登陆信息
		for(int i=0;cookies!=null && i<cookies.length;i++){
			if(cookies[i].getName().equals("user")){
				username=URLDecoder.decode(cookies[i].getValue().split("-")[0],"UTF-8");
				password=URLDecoder.decode(cookies[i].getValue().split("-")[1],"UTF-8");
		 }
		if(username==null){
			username="";
		}
		
		if(password==null){
			password="";
		}
		//pageContext是关于JSP页面的作用于，作用域是page，它的有效范围只在当前jsp页面里。
		//从把变量放到pageContext开始，到jsp页面结束，都可以使用这个变量。

		pageContext.setAttribute("username", username);
		pageContext.setAttribute("password", password);
	}
%>



<body>
	<div>
		<form class="form-signin" action="login" method="post" onSubmit="return check()">
			<h2 class="form-signin-heading">管理员登录</h2>
			<hr>
			<table>
				<tr>
					<td></td>
					<td>
						<font color="red">${error }</font>
					</td>
					<td></td>
				</tr>

				<tr>
					<td align="right">用户名：</td>
					<td><input type="text" name="username" id="username" class="input" value="${username} "></td>
					<td><label class="labelError" id="usernameError"></label></td>
				</tr>

				<tr>
					<td align="right">密码：</td>
					<td><input type="password" name="password" id="password" class="input" value="${password }"></td>
					<td><label class="labelError" id="passwordError"></label></td>
				</tr>

				<tr>
					<td align="right">验证码：</td>
					<td><input type="text" name="imageValue" size="50px" id="imageValue" class="input"
							value="${verifyCode }"></td>
					<td><label class="labelError" id="imageValueError"></label></td>
				</tr>


				<tr>
					<td></td>
					<td>
						<img onClick="javascript:loadImage();" title="换一张试试" id="randImage"
							src="${pageContext.request.contextPath}/image.jsp" width="100" height="2" border="1"
							align="left"></td>
					<td> </td>
				</tr>
				<tr>
					<td></td>
					<td colspan="2"><label class="checkbox"><input id="remember" name="remember" type="checkbox"
								value="remember-me">记住我一周 &nbsp;&nbsp;&nbsp;&nbsp; </label></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td><button type="submit" class="btn btn-primary">登陆</button> <input type="reset"
							class="btn btn-primary" value="重写" /></td>
					<td></td>
				</tr>
			</table>
		</form>
	</div>
</body>

</html>