<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<title>特价手机-易售手机网</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="${pageContext.request.contextPath}/css/book.css"
			rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/second.css"
			rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/secBook_Show.css"
			rel="stylesheet" type="text/css" />
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/common.js">
		</script>
	</head>	
	<body style="background-color: #AFEEEE">
	<div id="tejia_list"></div>
		<h2>
			<c:if test="${!param.more eq true }">
				<span class="more"><a href="tejia.do?more=true" target="_blank" >更多&gt;&gt;</a> </span>特价手机
			</c:if>
		</h2>
		<div class="book_c_04">
			<c:forEach var="hot" items="${hots }">
					<!--特价手机A开始-->
			<div class="second_d_wai">
				<div class="img">
					<a name="link_prd_img" href='detail.do?pid=${hot.product.id }'
						target="_blank"><img style="height:50px" src='${pageContext.request.contextPath}/phone_pic/${hot.product.product_pic }' alt='${hot.product.product_name }' /> </a> 
				</div>
				<div class="shuming">
					<a href="detail.do?pid=${hot.product.id }" target="_blank">${hot.product.product_name }</a>
				</div>
				<div class="price">
					定价：￥${ hot.product.fixed_price}
				</div>
				<div class="price">
					当当价：￥${hot.product.dang_price }
				</div>
			</div>
				
			<!--特价手机A结束-->
			</c:forEach>
		
		</div>
		<div class="clear"></div>
</body>
</html>