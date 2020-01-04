<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link href="${pageContext.request.contextPath}/css/content.css"
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
			function select_3p(category){
					obj=category.evalJSON();
					var subcate=$('select_3');
					subcate.length=0;
					for( i=0;i<obj.length;i++){
						subcate.options[i]=new Option(obj[i].cn_name,obj[i].id);
					}
			}
		</script>
	</head>
	<body>
		<div class="content_title"></div>
		<div class="content_div1">
			<form method="post" action="showform2.do" id="ctl00">
				<div style="margin-left: 20px;">
				第一级分类：
				<select>
					<option value="${category.id }">${category.cn_name }</option>
				</select>
				第二级分类：
				<select id="select_2" name="select_2" onchange="var categ=$('select_2').value;var subString=sendRequest('JSONCategory.do?cid='+categ);select_3p(subString);">
					<c:forEach var="cate" items="${category.subcategory }">
						<option value="${cate.id }">${cate.cn_name }</option>
					</c:forEach>
				</select>
				第三级分类：
				<select id="select_3" name="category_id">
						<c:forEach var="cate1" items="${subcategory }">
							<option value="${cate1.id }">${cate1.cn_name }</option>
						</c:forEach>
				</select>
				</div><br />
				<div>
				<table class="table_content">
					<tr>
						<td  class="t3">
							产品名：
						</td>
						<td class="input">
							<input type="text" name="product_name" id="product_name" class="text_input" value="${address.name }" onblur="checkName(this);"/>
						</td>
						<td class="t5">
							请填写产品名
						</td>
					</tr>
					<tr>
						<td class="t3">
							产品说明：
						</td>
						<td class="input">
							<input type="text" name="description" id="description" class="text_input" value="${address.fullAddress }" onblur="checkAddress(this);"/>
						</td>
						<td class="t5">
							请填写产品说明
						</td>
					</tr>
					<tr>
						<td class="t3">
							定价：
						</td>
						<td class="input">
							<input type="text" name="fixed_price" id="fixed_price" class="text_input" value="${address.postalCode }" onblur="checkPostCode(this);"/>
						</td>
						<td class="t5">
							请填写产品定价
						</td>
					</tr>
					<tr>
						<td class="t3	">
							当当价：
						</td>
						<td  class="input">
							<input type="text" name="dang_price" id="dang_price" class="text_input" value="${address.mobile }" onblur="checkMobile(this);"/>
						</td>
						<td class="t5">
							请填写当当价
						</td>
					</tr>
					<tr>
						<td class="t3">
							产品重量：
						</td>
						<td  class="input">
							<input type="text" name="weight" id="weight" class="text_input" value="${address.phone }" onblur="checkPhone(this);"/>
						</td>
						<td class="t5">
							请填产品重量
						</td>
					</tr>
					<tr>
						<td class="t3">
							关键字：
						</td>
						<td  class="input">
							<input type="text" name="keywords" id="keywords" class="text_input" value="${address.phone }" onblur="checkPhone(this);"/>
						</td>
						<td class="t5">
							请填写关键字
						</td>
					</tr>
				</table>
				<div>
		</div>
				<div class="content_div1" align="center">
					<input type="submit" id="btnClientRegister" class="content_button"
						value="下一步" />&nbsp;&nbsp;
					<input type="button" id="btnClientRegister" class="content_button"
						value="取消"  onclick="location='showmain.do'"/>
				</div>
			</form>
			<br /><br/>
		<div class="content_foot"></div>
	</body>
</html>

