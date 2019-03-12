<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>易售手机网  -查看图书信息</title>
	
		<link href="${pageContext.request.contextPath}/css/book1.css"
			rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/comm_answer.css"
			rel="stylesheet" type="text/css" />
			<link
			href="${pageContext.request.contextPath}/public/css/book_head090107.css"
			rel="stylesheet" type="text/css" />
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/common.js"></script>
		<script type="text/javascript">
			funtion pingFen(){
			
			}
		</script>
	</head>

	<body style="background-color: #F0F8FF">

		<%@include file="../common/head.jsp"%>
		<div class="wrap" style="background-color: #FAEBD7">
			<!--left end-->
			<div class="right">
				<div class="right_wai">

					<div class="shuming">
						<div class="shuming_left">
							<span class="black000"><a name="top_bk"></a><b>${book.product_name }</b> </span>
						</div>
						<div class="empty_box"></div>
						<div class="empty_box"></div>
					</div>

					<div class="book_left">
						<a href="#" name="bigpicture_bk"><img
								src="${pageContext.request.contextPath}/phone_pic/${book.product_pic }"
								width="150" id="img_show_prd" /> </a>
					</div>
					<div class="book_right">
						<div id='author_'>
							销售商： ${book.company }
						</div>
						<div id='publisher_'>
							生产商：${book.publishing }
						</div>
						<ul class="nostyle">
							<li>
								生产时间： ${book.scDate }
							</li>
							<li>
								上市时间： ${book.ssDate }
							</li>
							
							<li>
								产品编号 ： ${book.isbn }
							</li>
						</ul>

						<div id="__categroy_bk">
							所属分类：
							<a target="_blank" class="blue12a"
								href="main.do">${category.parentCategory.parentCategory.cn_name }</a>
							&gt;&gt;
							<a target="_blank" class="blue12a"
								href="list.do?id=${category.parentCategory.id }&cid=${category.id }">${category.parentCategory.cn_name }</a>
							&gt;&gt;
							<a target="_blank" class="blue12a"
								href="list.do?id=${category.parentCategory.id }&cid=${category.id }">${category.cn_name }</a>
						</div>
						<div class="jiage">
							<div align="left" style="position: absolute">
								<span class="del">定价：￥${book.fixed_price }</span>
								<span class="redc30">当当价：<b>￥${book.dang_price }</b> </span>
							</div>
							<div align="right" style="position: absolute;margin-left: 300px">
								<span class="list_r_list_button"><a name='link_sale' href='javascript:;' onclick="
								var b=sendRequest('../shopping/addItems.do?productId=${book.id }');if(b==1){alert('${book.product_name }成功加入购物车！！');}else{alert('${book.product_name }已经加入购物车！！')}">
							<img
								src='${pageContext.request.contextPath}/images/buttom_goumai.gif'
								onmouseover="this.src= '${pageContext.request.contextPath}/images/buttom_goumai_over.gif';"
								onmouseout="this.src= '${pageContext.request.contextPath}/images/buttom_goumai.gif';"
								onmousedown="this.src = '${pageContext.request.contextPath}/images/buttom_goumai_click.gif;'" />
								</a> </span>
							</div><br /><br /><br /><br />
							<div>
							<span class="comm_star" id="spn_average_score"></span> 共有商品评论
							<span id="spn_rev_cnt">${number }</span>条	
							</div>
							
						</div>
					</div>
					<div id="dvTPUrls"></div>
					<div id="__zhinengbiaozhu_bk">
						<h2 class="right_title1">
							&nbsp;
						</h2>
						<h2 class="right_title1">
							<img
								src="${pageContext.request.contextPath}/images/bg_point1.gif" />
							商品简介
						</h2>
						<div class="right_content">
							${book.description }
							<br/>
						</div>
						<div class="dashed"></div>
						<h2 class="right_title1">
							<img
								src="${pageContext.request.contextPath}/images/bg_point1.gif" />
							生产厂商简介
						</h2>
						<div class="right_content">
							${book.publish_summary }
						</div>
						<div class="dashed"></div>
						<h2 class="right_title1">
							<img
								src="${pageContext.request.contextPath}/images/bg_point1.gif" />
							目录
						</h2>
						<div class="right_content">
							自序
							<br/>
							<br/>
						</div>
					</div>


					<br />
					<br />
					<div class="comm_answer">

						<!-- 顾客评论开始 -->
						<div id="ctl03_Ucprdcomm1_div_product_reviews">
							<div class="total_comm">
								<div class="comm_title">
									<h2>
										商品评论 共
										<em>${number }</em>&nbsp;条
										<span class="look_comm">(<a
											href='detail.do?pid=${book.id }&option=${number}'
											name='reviewList'>查看所有评论</a>)</span>
									</h2>
									<div class="message"></div>
								</div>
<%--								<div class="total_body">--%>
<%--									<div id="ctl03_Ucprdcomm1_div_product_summary"></div>--%>
<%--									<div class="write_comm">--%>
<%--										<a id="reviewTipa" href=""> <img--%>
<%--												src="images/button_write_comm.gif" border="0" title="写评论" />--%>
<%--										</a>--%>
<%--									</div>--%>
<%--								</div>--%>
							</div>
						</div>

						<c:forEach var="comment" items="${comments }" varStatus="stat">
							<div class="comm_list">
							<div class="comm_list_bg">
								<div class="buyer" id="buyer_1791429">
								<div class="buyer_comm">
									<div class="center_border">
										<div class="appear_time" align="left" style="position: relative">
										<div align="left" style="position: absolute">${comment.user.nickname } 发表于${comment.ctDate }</div><div align="right" style="position: absolute;margin-left: 500px"><h1 style="color:blue">${stat.index+1 }&nbsp;楼</h1></div>
										</div>		
										${comment.comment_content }
									</div>
									<div class="already" id="VoteText1791429"></div>
									<div class="reading">
										<div class="reply" align="left">
											<a href='javascript:;' onclick="load('c_form.do?productId=${book.id }&commentId=${comment.id }&num=${stat.index+1 }','commond');$('comment_title').focus();"  name="reviewDetail">回复</a>
										</div>
										<div class="replay" align="right" style="margin-right: 20px"><a href="javascript:;" onclick="
												var b=sendRequest('pingFen.do?userId=${comment.user.id }&option=sh');if(b==1){alert('评分成功！！！');}else{alert('不能给自己评分！！！')}">送花</a>&nbsp;|&nbsp;&nbsp;<a href="javascript:;" onclick="
												var b=sendRequest('pingFen.do?userId=${comment.user.id }&option=zz');if(b==1){alert('评分成功！！！');}else{alert('不能给自己评分！！！')}">砸砖</a></div>
									</div>
								</div>
								<div class="empty_clear_left"></div>
							</div>
							</div>
						</div>
						</c:forEach>
						
						<div class="look_all">
							<span class="ff"> <a
								href='javascript:;'
								name='reviewList'  onclick="load('c_form.do?productId=${book.id }','commond');$('comment_title').focus();">发评论</a>
							</span>|
							<span class="ff"> <a
								href='detail.do?pid=${book.id }&option=${number}'
								name='reviewList'>查看所有&nbsp;<strong>${number }</strong>&nbsp;条评论</a>
							</span>
						</div>
					<div class="buyer_comm" id="commond" style="background-color: #FAEBD7"></div>
					<script type="text/javascript">load('c_form.do?productId=${book.id}','commond');</script>
				</div>
				<!--right_wai end-->
			</div>
			<!--right end-->
			<div class="clear"></div>
		</div>
		<!--wrap end-->
		<%@include file="../common/foot.jsp"%>
	</body>

</html>