<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/common.js">
		</script>
	</head>
	<body>
	<div id=__bianjituijian/danpin>
			<h2>
			商家推荐
		 </h2>
	<div class=second_c_02>
		<c:forEach var="recommend" items="${recommends }" varStatus="sta">
		<div class=second_c_02_b1>
			<div class=second_c_02_b1_1>
				<a href='detail.do?pid=${recommend.product.id }' target='_blank'><img src="${pageContext.request.contextPath}/phone_pic/${recommend.product.product_pic }" width=70 border=0 /> </a>
			</div>
			<div class=second_c_02_b1_2>
				<h3>
					<a href='detail.do?pid=${recommend.product.id }' target='_blank'>${recommend.product.product_name }</a>
				</h3>
				<h4>
					销售商：${recommend.product.company} &nbsp;&nbsp;
					<br />
					生产厂商：${recommend.product.publishing }&nbsp;&nbsp;&nbsp;&nbsp;生产时间：${recommend.product.scDate }
				</h4>
				<h5>
					简介:<br/>
					${recommend.product.description }
				</h5>
				<h6>
					定价：￥${recommend.product.fixed_price }&nbsp;&nbsp;当当价：￥${recommend.product.dang_price }
				</h6>
					<div class=line_xx></div>
			</div>
		</div>
		</c:forEach>
		</div>
	</div>
	</body>
</html>


