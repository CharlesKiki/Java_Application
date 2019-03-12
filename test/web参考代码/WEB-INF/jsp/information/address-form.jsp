<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>更改送货地址表单- 易售手机网</title>
		<link href="${pageContext.request.contextPath}/css/login.css"
			rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/page_bottom.css"
			rel="stylesheet" type="text/css" />
			<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/common.js">
		</script>
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
	<body>
		<%@include file="../common/head1.jsp"%>
		<br/>
		<br />
		<div class="fill_message">
			<form method="post" action="changeAddress.do?orderId=${param.orderId }&addressId=${address.id }&option=${param.option }" id="ctl00">
				<table class="tab_login">
					<tr>
						<td valign="top" class="w1">
							收货人姓名：
						</td>
						<td>
							<input type="text" name="name" id="name" class="text_input" value="${address.name }" onblur="checkName(this);"/>
							<div class="text_left" id="emailValidMsg">
								<p>
									请填写收货人姓名
								</p>
								<p style="color: red">
									<span id="errorName"></span>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							详细送货地址：
						</td>
						<td>
							<input type="text" name="fullAddress" id="fullAddress" class="text_input" value="${address.fullAddress }" onblur="checkAddress(this);"/>
							<div class="text_left" id="nickNameValidMsg">
								<p>
									请填写详细送货地址说明
								</p>
								<p style="color: red">
										<span id="errorAddress"></span>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							邮政编码：
						</td>
						<td>
							<input type="text" name="postalCode" id="postalCode" class="text_input" value="${address.postalCode }" onblur="checkPostCode(this);"/>
							<div class="text_left" id="emailValidMsg">
								<p>
									请填写送货地址的邮政编码
								</p>
								<p style="color: red">
									<span id="errorPostCode"></span>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							收货人移动电话号码：
						</td>
						<td>
							<input type="text" name="mobile" id="mobile" class="text_input" value="${address.mobile }" onblur="checkMobile(this);"/>
							<div class="text_left" id="emailValidMsg">
								<p>
									请填写收货人移动电话号码
								</p>
								<p style="color: red">
									<span id="errorMobile"></span>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							收货人固定电话号码：
						</td>
						<td>
							<input type="text" name="phone" id="phone" class="text_input" value="${address.phone }" onblur="checkPhone(this);"/>
							<div class="text_left" id="emailValidMsg">
								<p>
									请填写收货人固定电话号码
								</p>
								<p style="color: red">
									<span id="errorPhone"></span>
								</p>
							</div>
						</td>
					</tr>
				</table>
				<div class="login_in">
					<input type="submit" id="btnClientRegister" class="button_1"
						value="更改" />&nbsp;&nbsp;
					<input type="button" id="btnClientRegister" class="button_1"
						value="返回"  onclick="location='${param.option }.do?orderId=${param.orderId }&addressId=${param.addressId }'"/>
				</div>
			</form>
			
		</div>
		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

