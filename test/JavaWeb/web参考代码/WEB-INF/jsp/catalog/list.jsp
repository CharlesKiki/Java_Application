<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../common/taglib.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>易售手机网</title>	
		<link href="${pageContext.request.contextPath}/css/book.css"
			rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/second.css"
			rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/secBook_Show.css"
			rel="stylesheet" type="text/css" />
			<link href="${pageContext.request.contextPath}/css/list.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/common.js">
		</script>
	</head>
	<body style="background-color: #FFEBCD">
		&nbsp;

		<!-- 头部开始 -->
		<%@include file="../common/head.jsp"%>
		<!-- 头部结束 -->

		<div style="width: 962px; margin: auto;">
			<a href="#" target="_blank"><img
					src="${pageContext.request.contextPath}/images/default/phone-01.gif"
					border="0" style="width: 960px"/> </a>
		</div>
		<div class='your_position' style="background-color: #FAEBD7">
			您现在的位置:&nbsp;
			<a href='main.do'>${category.parentCategory.cn_name }</a> &gt;&gt;
			<font style='color: #cc3300'><strong>${category.cn_name }</strong></font>
		</div>
		<div class="book" style="background-color: #FAEBD7">

			<!--左栏开始-->
			<div id="left" class="book_left">
			</div>
			<script type="text/javascript">load('category.do?id=${param.id}&cid=${param.cid}','left');</script>
			<!--左栏结束-->

			<!--中栏开始-->
			<div class="book_center">

				<!--图书列表开始-->
				<div id="divRight" class="list_right"></div>
				<script type="text/javascript">load('bookList.do?cid=${param.cid}&page=${param.num}','divRight');</script>
				<!--图书列表结束-->

			</div>
			<!--中栏结束-->
			<div class="clear"></div>
		</div>

		<!--页尾开始 -->
		<%@include file="../common/foot.jsp"%>
		<!--页尾结束 -->
	</body>
</html>
