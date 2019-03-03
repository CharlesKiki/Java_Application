<%@ page language="java"  pageEncoding="GB18030"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>图书选购列表</title>
<meta http-equiv="Content-Type" contect="text/html";charst=GBK">
<script type="text/javascript">
function showCart(){
window.location="/ShopCart/servlet/ShowCartServlet"
}
function addToCart(){
var isbns=document.getElementsByName("isbn");
var checked=0;
if(isbns.length>=1){
for(var i=0;i<isbns.length;i++){
if(isbns[i].checked){
checked=checked+1;
}
}
}
if(checked>0){
return ture;
}else{
alert("抱歉,在提交之前,您需要选择至少一项物品!");
return false;
}
}
</script>
</head>
<body>
<form action="<%=request.getContextPath()%>/servlet/NewOrderServlet"method="post">
<table cellpadding="10" border="1" align="center">
<caption><h2>最新图书</h2></caption>
<thead>
<tr>
<th>isbn</th>
<th>图书名称</th>
<th>出版日期</th>
<th>作者</th>
<th>价格</th>
</tr>
</thead>
<tbody>
<c:forEach items="${sessionScope.books}" var="book">
<tr>
<td>
<input type="checkbox" name="isbn" value='${book["isbn"]}'>${book["isbn"] }
</td>
<td>${book["title"]}</td>
<td>${book["pubDate"]}</td>
<td>${book["author"]}</td>
<td>
<fmt:formatNumber value="${book['price']}"type="currency"/>
</td>
</tr>
</c:forEach>
</tbody>
</table>
<div align="right">
<input type="submit" value="添加购物车"onclick="return addToCart()">
&nbsp;&nbsp;
<input type="button" value="查看购物车"onclick="showCart()">
</div>
</form>
</body>
</html>

