<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link href="${pageContext.request.contextPath}/css/content.css"
			rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div class="content_title">显示客户信息</div>
		<div class="content_div1">
			<table class="table_content">
			<tr>
					<td class="t1" style="text-align: center;">
						ID：
					</td>
					<td class="t1">
						昵称：
					</td>
					<td class="t1">
						EMAIL：
					</td>
					<td class="t1">&nbsp;&nbsp;</td>
					<td class="t1">&nbsp;&nbsp;</td>
				</tr>
				<c:forEach var="user" items="${users }">
					<tr>
					<td class="t2">
						${user.id }
					</td>
					<td class="t2">
						${user.nickname }
					</td>
					<td class="t2">
						${user.email }
					</td>
					<td class="t2">
						<a href="showUserInfo.do?userId=${user.id }">查看具体信息</a>
					</td>
					<td class="t2">
						<a href="deleteUser.do?userId=${user.id }">删除</a>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</body>
</html>

