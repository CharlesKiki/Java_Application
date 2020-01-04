<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../common/taglib.jsp"%> 
<div class="book_l_border1" id="__FenLeiLiuLan">
	<div class="book_sort_tushu">
		<h2>
			分类浏览
		</h2>
		<c:forEach var="c1" items="${requestScope.category.subcategory }">
		<div class="bg_old" onmouseover="this.className = 'bg_white';" 
		onmouseout="this.className = 'bg_old';">
			<h3>
				[		
				<a href="list.do?id=${c1.id }&cid=${c1.subcategory[0].id}">${c1.cn_name }</a>]
			</h3>
			<ul class="ul_left_list">
			<c:forEach var="c2" items="${c1.subcategory }">
			<li>
					<a href="list.do?id=${c1.id }&cid=${c2.id }">${c2.cn_name }</a>
				</li>
			</c:forEach>
			</ul>
			<div class="empty_left">
			</div>
		</div>

		<div class="more2">
		</div>
		</c:forEach>
	</div>
</div>
<div class="book_l_border1" id="__FenLeiLiuLan">
	<div class="book_sort_tushu">
		<h2>
			夏新最新热销手机
		</h2>
		<span><a href="#" name="backtobook"><img
						src="${pageContext.request.contextPath}/images/booksaleimg/phone-04.jpg" style="width:178px"/>
			</a> </span>
	</div>
</div>