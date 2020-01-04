<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../common/taglib.jsp"%>
<span id="login_info">
<b>${sessionScope.user.nickname }&nbsp;&nbsp;您好，欢迎光临易售手机网</b>
<c:choose>
	<c:when test="${sessionScope.is_login}">
		<a href="javascript: var id = $('login_info').parentNode ; load('../authorize/logout.do',id);" class="b">登出</a>
	</c:when>
	<c:otherwise>
	[&nbsp;<a href="../authorize/loginForm.do" class="b">登录</a> | <a href="../authorize/registerOne.do" class="b">注册</a>&nbsp;]
	</c:otherwise>
</c:choose>
</span>
