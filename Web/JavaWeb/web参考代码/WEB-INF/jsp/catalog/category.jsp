<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../common/taglib.jsp"%>
<div id="__fenleiliulan">
	<div class=second_l_border2>
		<h2>
			分类浏览
		</h2>
		<ul>
		<c:forEach var="cu" items="${requestScope.list }" varStatus="sta1">
			<li>
				<div>
					<div class=second_fenlei>
						&middot;
					</div>
					<c:choose>
						<c:when test="${param.cid eq cu.category.id }">
						<div 	class=second_fenlei3>
						<a href='list.do?id=${param.id }&cid=${cu.category.id }'>${cu.category.cn_name }&nbsp;(${cu.count })</a>
					</div>
						</c:when>
						<c:otherwise>
						<div 	class=second_fenlei2>
						<a href='list.do?id=${param.id }&cid=${cu.category.id }'>${cu.category.cn_name }&nbsp;(${cu.count })</a>
					</div>
						</c:otherwise>
					</c:choose>
				</div>
			</li>
			<div class=clear></div>
		</c:forEach>
		</ul>
	</div>
</div>