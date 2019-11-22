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
		<div class="content_title"></div>
		<div class="content_div1">
			<table class="table_content">
				<tr>
					<td class="t1" >
						商品 名
					</td>
					<td class="t1"> 
						当当价
					</td>
					<td class="t1">
						厂商
					</td><td class="t1"></td ><td class="t1"></td>
				</tr>
				<c:forEach var="product" items="${products}">
					<tr>
							<td class="t2">
								${product.product_name }
							</td>
							<td class="t2">
								${product.dang_price }
							</td>
							<td class="t2">
								${product.publishing }
							</td>
							<td class="t2">
								<a href="deleteProduct.do?pid=${product.id }">删除</a>
							</td>
							<td class="t2">
								<a href="#">详细信息</a>
							</td>
						</tr>
				</c:forEach>
			</table>
		</div>
		<div class="content_div2">
			<input type="button" id="btnClientRegister" class="content_button"
				value="返回"  onclick="location='information.do'"/>
		</div>
		<br /><br/>
		<div class="content_foot"></div>
	</body>
</html>

