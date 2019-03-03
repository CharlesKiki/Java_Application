<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link href="${pageContext.request.contextPath}/css/content.css"
			rel="stylesheet" type="text/css" />
			<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/common.js">
		</script>
	</head>
	<body>	
	<div class="content_title">查找客户</div>
	<div class="content_div1">
	<div class="content_div2">
			请选择查找类型：
		<select id="search_type" name="search_type">
			<option value="id">ID</option>
			<option value="email">帐号</option>
			<option value="nickname">昵称</option>
		</select>
		<input type="text" id="search_value" name="search_value"></input><input type="button" value="搜索"  class="content_button1" onclick="var search_type=$('search_type').value;var search_value=$('search_value').value;location='searchUser.do?search_type='+search_type+'&search_value='+search_value;$('search_value').value=''"></input>
	</div>
	<div class="content_div3">
		<input type="button" class="content_button" value="查找全部" onclick="location='showAllUser.do'"/>
	</div>
		<br /><br/>
		<div class="content_foot"></div>
	</body>
</html>

