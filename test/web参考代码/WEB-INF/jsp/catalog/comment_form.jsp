<%@page contentType="text/html;charset=utf-8"%>
<form action="${action }.do?productId=${productId }&commentId=${commentId }" method="post">
			<div class="center_border">
					<div id="title" class="appear_time" >
								标题：<input style="width:250px" height="50px" width="500px" id="comment_title" type="text" name="comment_title" value="${title}" />
					</div>
					<br />
						<textarea id="comment_content" name="comment_content" rows="10" cols="55"></textarea>
			</div>
					<input type="submit" value="发表评论"/>
</form>