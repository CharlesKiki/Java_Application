<%@ page language="java"  pageEncoding="GB18030"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>图书分类列表 </title>
<meta http-equiv="Content-Type"contect="text/html";charst=GBK">
</head>
<body align="center">
<ul type="circle">
<c:forEach items="${applicationScope.catalogs}" var="catalog">
<li>
<a href="servlet/ShowBooksServlet?catalogid=${catalog["id"]}"target="booksFrame">
${catalog["title"]}
</a>
</li>
</c:forEach>
</ul>
</body>
</html>