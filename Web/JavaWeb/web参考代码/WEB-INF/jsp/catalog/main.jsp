<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../common/taglib.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>易售手机网 </title>	
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
	<body>
		<!-- 头部开始 -->
		<%@include file="../common/head.jsp"%>
		<!-- 头部结束 -->

		<div style="width: 962px; margin: auto;">
			<a href="#"><img
					src="${pageContext.request.contextPath}/images/default/phone-01.gif"
					border="0" style="width: 960px"/> </a>
		</div>
		<div class='your_position' style="background-color: #FAEBD7">
			您现在的位置:&nbsp;
			<font style='color: #cc3300'><strong>${category.cn_name }</strong></font>
		</div>
		<div class="book" style="background-color: #FAEBD7">

			<!--左栏开始-->
			<div id="left" class="book_left">
			</div>
			<script type="text/javascript">load('allCategory.do?id=1','left');</script>
			<!--左栏结束-->

			<!--中栏开始-->
			<div class="book_center">

				<!--推荐图书开始-->
				<div class=second_c_border1 id="recommend">
				</div>
				<script type="text/javascript">load('recommend.do','recommend');</script>
				<!--推荐图书结束-->
				<div class="book_c_border4">
					<span><a href="#" name="backtobook"><img
						src="${pageContext.request.contextPath}/images/booksaleimg/phone-02.gif" style="width:520px"/>
					</a> </span>
				</div>
				<!--热销图书开始-->
				<div class="book_c_border2" id="tejia">
				</div>
				<script type="text/javascript">load('tejia.do','tejia');</script>
				<!--热销图书结束-->

				<!--最新上架图书开始-->
				<div class="book_c_border2" id="new">
				</div>
				<script type="text/javascript">load('new.do','new');</script>
				<!--最新上架图书结束-->

				<div class="clear">
				</div>
			</div>
			<!--中栏结束-->



			<!--右栏开始-->
			<div class="book_right">
				<div class="book_r_border2" id="__XinShuReMai">
					<div class="book_r_b2_1x" id="new_bang">
						<h2 class="t_xsrm">
							五一特别推荐
						</h2>
						<div id="NewProduct_1_o_t" onmouseover="">
							<span><a href="#" name="backtobook"><img
						src="${pageContext.request.contextPath}/images/booksaleimg/phone-07.jpg" style="width:218px"/>
			</a> </span>
						</div>
					</div>
				</div>
			</div>
			
			<div class="book_right">
				<div class="book_r_border2" id="__XinShuReMai">
					<div class="book_r_b2_1x" id="new_bang">
						<h2 class="t_xsrm">
							三星回报新老客户
						</h2>
						<div id="NewProduct_1_o_t" onmouseover="">
					<span><a href="#" name="backtobook"><img
						src="${pageContext.request.contextPath}/images/booksaleimg/phone-06.jpg" style="width:218px"/>
			</a> </span>
						</div>
					</div>
				</div>
			</div>
			
			<div class="book_right">
				<div class="book_r_border2" id="__XinShuReMai">
					<div class="book_r_b2_1x" id="new_bang">
						<h2 class="t_xsrm">
							广告招商中
						</h2>
					</div>
				</div>
			</div>
			<!--右栏结束-->
			<div class="clear"></div>
		</div>

		<!--页尾开始 -->
		<%@include file="../common/foot.jsp"%>
		<!--页尾结束 -->
	</body>
</html>
