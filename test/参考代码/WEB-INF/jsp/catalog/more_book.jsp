<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
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
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/common.js">
		</script>
	</head>
	<body>
		<div class="book_center">
				<!--图书列表开始-->
			<div id="divRight" class="list_right">
					<div class="list_r_line"></div>
					<div class="clear"></div>
					<c:forEach var="rhn" items="${requestScope.rhns }">
					<%--	商品显示开始--%>
					<div class="list_r_list">
						<span class="list_r_list_book"><a name="link_prd_img" href='detail.do?pid=${rhn.product.id }'
							target="_blank"><img src='${pageContext.request.contextPath}/res/${rhn.product.product_pic }' alt='${rhn.product.product_name }' /> </a> </span>
						<h2>
							<a name="link_prd_name" href="detail.do?pid=${rhn.product.id }" target="_blank">${rhn.product.product_name }</a>
						</h2>
						<h3>
							顾客评分：100
						</h3>
						<h4 class="list_r_list_h4">
							作 者：
							<a target='_blank' href='#' name='作者'>${rhn.product.author }</a> 著，
						</h4>
						<h4>
							出版社：
							<a target='_blank' href='#' name='出版社'>${rhn.product.publishing }</a>
						</h4>
						<h4>
							出版时间：${rhn.product.cbDate }
						</h4>
						<h5>
						简介：<br/>
							${rhn.product.description }
						</h5>
					<div class="clear"></div>
						<h6>
							定价：<span class="del">￥${rhn.product.fixed_price }</span>
							<span class="red">当当价：￥${rhn.product.dang_price }</span> 节省：￥${rhn.product.fixed_price - book.dang_price } 
						</h6>
						<span class="list_r_list_button"><a name='link_sale' href='javascript:;' onclick="
								var b=sendRequest('../shopping/addItems.do?productId=${book.id }');if(b==1){alert('${book.product_name }成功加入购物车！！');}else{alert('${book.product_name }已经加入购物车！！')}">
							<img
								src='${pageContext.request.contextPath}/images/buttom_goumai.gif'
								onmouseover="this.src= '${pageContext.request.contextPath}/images/buttom_goumai_over.gif';"
								onmouseout="this.src= '${pageContext.request.contextPath}/images/buttom_goumai.gif';"
								onmousedown="this.src = '${pageContext.request.contextPath}/images/buttom_goumai_click.gif;'" />
					  </a> </span>
				</div>
				<div class="clear"></div>
				
<%--	商品显示结束--%>
	</c:forEach>

<div class="list_r_line"></div>
<div class="clear"></div>
<div class="clear"></div>
<div id="divBottomPageNavi" class="fanye_bottom">

</div>
				</div>
			</div>
				
</body>
</html>
