<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link href="${pageContext.request.contextPath}/css/content.css"
			rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			function checkName(f){
					var re = /^[a-zA-Z]([a-zA-Z0-9]*[_-]?[a-zA-Z][a-zA-Z0-9]*)*$/;
       	$('errorName').innerHTML = "";
       	var value = f.value.strip();
       	if (!re.test(value)) {
       		$('errorName').innerHTML = "必须填入有效的姓名！！";
         f.focur();
         return false;
                	}
       if(value.length<6 && value.length>12){
       		$('errorName').innerHTML = "输入的姓名长度不合法！！";
         f.focur();
         return false;
               		}
       return true;
			}
			function checkAddress(f){
       	$('errorAddress').innerHTML = "";
       
       	var value = f.value.strip();
       if(value.length<6){
       		$('errorAddress').innerHTML = "你输入的地址不够详细！！";
         f.focur();
         return false;
               		}
       return true;
			}
			function checkPostCode(f){
       	$('errorPostCode').innerHTML = "";
       	var re = /^[1-9][0-9]{5}$/;
       	var value = f.value.strip();
       if(!re.test(value)){
       		$('errorPostCode').innerHTML = "你输入的邮编不合法！！(必须是6位不是0开头的数字)";
         f.focur();
         return false;
               		}
       return true;
			}
			function checkMobile(f){
       	$('errorMobile').innerHTML = "";
       	var re = /^[0-9]{11}$/;
       	var value = f.value.strip();
       if(!re.test(value)){
       		$('errorMobile').innerHTML = "你输入的号码不合法！！(必须是11位的数字)";
         f.focur();
         return false;
               		}
       return true;
			}
			function checkPhone(f){
       	$('errorPhone').innerHTML = "";
       	var re = /^[0-9]{3}[0-9]?-[0-9]{7}[0-9]?$/;
       	var value = f.value.strip();
       if(!re.test(value) && value.length!=12){
       		$('errorPhone').innerHTML = "你输入的号码不合法！！(0315-7696199  或者 010-84541587)";
         f.focur();
         return false;
               		}
       return true;
			}
		</script>
	</head>
	<body style="width:280px;background-color:#FAEBD7">
			<div class="content_title"></div>
			<div class="content_div1">
				<form method="post" action="addproduct.do" id="ctl00" enctype="multipart/form-data">
				<table class="table_content">
					<tr>
						<td class="t3	">
							产品图片：
						</td>
						<td  class="input">
							<input type="file" name="product_pic" id="product_pic" class="text_input" value="${address.mobile }" onblur="checkMobile(this);"/>
						</td>
						<td class="t5">
							请填写产品图片
						</td>
					</tr>
				</table>
				<div class="content_div2">
					<input type="submit" id="btnClientRegister" class="content_button"
						value="提交" />&nbsp;&nbsp;
					<input type="button" id="btnClientRegister" class="content_button"
						value="取消"  onclick="location='showmain.do'"/>
				</div>
			</form>
			</div>
			<br /><br/>
		<div class="content_foot"></div>
	</body>
</html>

