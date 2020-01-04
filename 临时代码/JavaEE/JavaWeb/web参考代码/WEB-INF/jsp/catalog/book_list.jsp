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
	<div id="book_list" class="list_r_title">
	<div class="list_r_title_text">
		排序方式
	</div>
	<select onchange="var id=$('book_list').parentNode;var order=$('select_order').value;load('../catalog/bookList.do?cid=${requestScope.cid }&num=1&order='+order,id);" name='select_order' size='1'
		class='list_r_title_ml' id="select_order" >
		<option style='color: #c3c3c3' value='1'>
			--------------
		</option>
		<c:if test="${sessionScope.select eq 1}" var="id">
		<option selected="selected" value='1'>
			按销量 降序
		</option>
		</c:if>
		<c:if test="${!id}">
		<option value='1'>
			按销量 降序
		</option>
	</c:if>
		<option style='color: #c3c3c3' value='2'>
			--------------
		</option>
		<c:if test="${sessionScope.select eq 2}" var="price1">
		<option selected="selected" value='2'>
			按价格 升序
		</option>
		</c:if>
		<c:if test="${!price1}">
		<option value='2'>
			按价格 升序
		</option>
	</c:if>
	<c:if test="${sessionScope.select eq 3}" var="price2">
		<option selected="selected" value='3'>
		按价格 降序
		</option>
		</c:if>
		<c:if test="${!price2}">
		<option value='3'>
			按价格 降序
		</option>
	</c:if>
		<option style='color: #c3c3c3' value='4'>
			--------------
		</option>
	<c:if test="${sessionScope.select eq 4}" var="publish1">
		<option selected="selected" value='4'>
			按生产时间 升序
		</option>
		</c:if>
		<c:if test="${!publish1}">
		<option value='4'>
			按生产时间 升序
		</option>
	</c:if>
	<c:if test="${sessionScope.select eq 5}" var="publish2">
		<option selected="selected" value='5'>
			按生产时间 降序
		</option>
		</c:if>
		<c:if test="${!publish2}">
		<option value='5'>
			按生产时间 降序
		</option>
	</c:if>
		<option style='color: #c3c3c3' value='6'>
			--------------
		</option>
		<c:if test="${sessionScope.select eq 6}" var="add1">
		<option selected="selected" value='6'>
			按上市时间 升序
		</option>
		</c:if>
		<c:if test="${!add1}">
		<option value='6'>
			按上市时间 升序
		</option>
	</c:if>
	<c:if test="${sessionScope.select eq 7}" var="add2">
		<option selected="selected" value='7'>
			按上市时间 降序
		</option>
		</c:if>
		<c:if test="${!add2}">
		<option value='7'>
			按上市时间 降序
		</option>
	</c:if>
	</select>
	<div id="divTopPageNavi" class="list_r_title_text3">
		<div class='list_r_title_text3a' >
			<c:choose>
				<c:when test="${requestScope.page-1 ge 1 }">
					<a name=link_page_up href="javascript: var id=$('book_list').parentNode;load('../catalog/bookList.do?cid=${requestScope.cid }&num=${requestScope.page-1 }',id);"> <img
					src='${pageContext.request.contextPath}/images/page_up_mouseover.gif' onclick="check_Page_Up();"/>
				</a>
				</c:when>
				<c:otherwise>
					<img  src='${pageContext.request.contextPath}/images/page_up_gray.gif' onclick="check_Page_Up();"/>
				</c:otherwise>
			</c:choose>
			
		</div>
		<div class='list_r_title_text3b' >
			第${requestScope.page }页/共${requestScope.totalPage }页
		</div>
		<div class='list_r_title_text3a' >
		<c:choose>
				<c:when test="${requestScope.totalPage ge requestScope.page+1}">
					<a id="downpage" name=link_page_next href="javascript: var id=$('book_list').parentNode;load('../catalog/bookList.do?cid=${requestScope.cid }&num=${requestScope.page+1 }',id);t();" onclick='t();'> <img
					onmouseover='this.src="${pageContext.request.contextPath}/images/page_down_mouseover.gif"'
					onmouseout='this.src="${pageContext.request.contextPath}/images/page_down.gif"'
					src='${pageContext.request.contextPath}/images/page_down.gif'/>
				</a>
				</c:when>
				<c:otherwise>
					<img src='${pageContext.request.contextPath}/images/page_down_gray.gif' onclick="check_Page_Up();"/>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>

				<div class="list_r_line"></div>
				<div class="clear"></div>
	<c:forEach var="book" items="${requestScope.books }">
<%--	商品显示开始--%>
				<div class="list_r_list" style="background-color: #F5F5DC">
					<span class="list_r_list_book"><a name="link_prd_img" href='detail.do?pid=${book.id }'
						target="_blank"><img   src='${pageContext.request.contextPath}/phone_pic/${book.product_pic }' alt='${book.product_name }' /> </a> </span>
					<h2>
						<a name="link_prd_name" href="detail.do?pid=${book.id }" target="_blank">${book.product_name }</a>
					</h2>
					<h3>
						顾客评分：100
					</h3>
					<h4 class="list_r_list_h4">
						商家：
						<a target='_blank' href='#' name='作者'>${book.company }</a> ，
					</h4>
					<h4>
						生产厂商：
						<a target='_blank' href='#' name='出版社'>${book.publishing }</a>
					</h4>
					<h4>
						生产时间：${book.scDate }
					</h4>
					<h5>
					简介：<br/>
							${book.description }
					</h5>
					<div class="clear"></div>
					<h6>
						定价：<span class="del">￥${book.fixed_price }</span>
						<span class="red">当当价：￥${book.dang_price }</span> 节省：￥${book.fixed_price - book.dang_price } 
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
</body>
</html>
