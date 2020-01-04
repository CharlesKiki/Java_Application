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
	<div class="content_title">查找订单</div>
	<div class="content_div1">
	<div class="content_div2">
			请选择查找类型：
		<select id="search_type" name="search_type">
			<option value="id">订单ID</option>
			<option value="userId">客户ID</option>
		</select>
		<input type="text" id="search_value" name="search_value"></input><input type="button" value="搜索"  class="content_button1" onclick="var search_type=$('search_type').value;var search_value=$('search_value').value;location='searchOrder.do?search_type='+search_type+'&search_value='+search_value;$('search_value').value=''"></input>
	</div>
	</div>
		<div class="content_div1">
			<div id="user_info"></div>
		</div>
		<br /><br/>
		<div class="content_foot"></div>
	</body>
</html>

