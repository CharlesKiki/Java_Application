<%@ page language="java" pageEncoding="GB18030"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>购物车</title>
		<meta http-equiv="content-Type" content="text/html" ;charset=GBK">
	</head>
	<frameset rows="80,*" frameborder="yes" framespacing="1" border=1>
		<frame src="title.jsp" name="titleFrame" scrolling="No"
			noresize="noresize">
		<frameset cols="200,*" frameborder="yes" framespacing="1">
			<frame src="catalog.jsp" name="catalogFrame" scrolling="No"
				noresize="noresize" />
			<frame src="bookList.jsp" name="booksFrame" />
		</frameset>
	</frameset>
	<noframes>
		<body>
		</body>
	</noframes>
</html>
