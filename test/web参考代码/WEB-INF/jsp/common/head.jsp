<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../common/taglib.jsp"%>
<script type="text/javascrip" src="${pageContext.request.contextPath}/js/common.js"></script>
<link href="${pageContext.request.contextPath}/css/book_head090107.css"
	rel="stylesheet" type="text/css" />
<div class="head_container" >
	<div class="head_welcome" style="background-color: #F5DEB3">
		<div class="head_welcome_right">
			<span class="head_welcome_text"> </span>
			<span class="head_welcome_text"> <span class="little_n">
					| <a href="../information/information.do" name="mydangdang" class="head_black12a">我的资料</a> | <a
					href="../help.do" name="helpcenter" class="head_black12a" target="_blank">帮助</a>
					| </span> </span>	
			<div class="cart gray4012">
				<a href="../shopping/showCart.do">购物车</a>
			</div>
		</div>
		<span class="head_toutext" id="nickname"></span>
		<script type="text/javascript">load('../authorize/loginInfo.do','nickname');</script>
	</div>
	<div class="head_head_list">
		<div class="head_head_list_left">
			<span><a href="${pageContext.request.contextPath}/catalog/main.do" name="backtobook"><img
						src="${pageContext.request.contextPath}/images/booksaleimg/phone-03.gif" style="width: 959px;height: 72px"/>
			</a> </span>
		</div>
		<div class="head_head_list_right">

			<div class="head_head_list_right_b">
			</div>
		</div>
	</div>
	<div class="head_search_div">
	</div>
	<div class="head_search_bg"></div>
</div>