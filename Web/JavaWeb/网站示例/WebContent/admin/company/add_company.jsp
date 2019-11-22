<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%  String path = request.getContextPath();%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>增加单位信息</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/style.css" />

</head>

<body>
	<div class="container-all">

		<div class="head">
			<div class="exit  fr">
				<a href="<%=path %>/login.jsp" target="_top"><h4>退出登录</h4></a>
			</div>
			<div class="user  fr ">
				<h4>当前管理员：${adminname }</h4>
			</div>
		</div>
		<div class="context">
			<div class="navigation col-md-2">
				<div class="function "></div>
				<div class="panel-group" id="accordion">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseOne">个人&单位信息
									<div class="glyphicon glyphicon-chevron-down fr"></div>
								</a>
							</h3>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in">
							<div class="panel-body">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="<%=path %>/admin/person/search_person.jsp" id="people_info">个人基本信息</a></li>
									<li><a href="<%=path %>/admin/company/search_company.jsp" id="company_info">单位基本信息
											<div class="glyphicon glyphicon-ok fr"></div>
									</a>
								</ul>
							</div>
						</div>
					</div>
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseTwo">医疗项目信息
									<div class="glyphicon glyphicon-chevron-down fr"></div>
								</a>
							</h3>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse">
							<div class="panel-body">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="search_institution.html"
										id="institution_info">医疗机构信息</a></li>
									<li><a href="<%=path %>/admin/facility/search_facility.jsp" id="facility_info">服务设施信息</a></li>
									<li><a href="<%=path %>/admin/disease/search_disease.jsp" id="disease_info">病种信息</a></li>
									<li><a href="<%=path %>/admin/drug/search_drug.jsp" id="drug_info">药品信息</a></li>
									<li><a href="<%=path %>/admin/zhenliao/search_zhenliao.jsp" id="zhenliao_info">诊疗项目信息</a></li>
									<li><a href="<%=path %>/admin/canshu/search_canshu.jsp" id="parameter_info">待遇参数信息</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								<a href="<%=path %>/admin/history.jsp">报销历史信息</a>
							</h3>
						</div>

					</div>
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								<a href="<%=path %>/admin/log/log.jsp">查看日志</a>
							</h3>
						</div>

					</div>
				</div>
			</div>
			<div class="information col-md-10">
				<div id="company">
					<div class="menu" name="subnav_company" id="subnav_company">
						<a href="<%=path %>/admin/company/search_company.jsp"><button type="submit"
								class="btn btn-primary mybutton ">查询信息</button></a> <a
							href="<%=path %>/admin/company/add_company.jsp"><button type="submit"
								class="btn btn-primary mybutton active">增加信息</button></a> <a
							href="<%=path %>/admin/admin.jsp"><button type="submit"
								class="btn btn-primary mybutton fr" style="margin-right: 10px;">回到首页</button></a>
					</div>
					<div class="menu-context" name="add_companies" id="add_companies">
						<div class="table-title">
							<h3>单位基本信息</h3>
						</div>
						<div class="add_companies">
							<div class="row"></div>
							<div class="row"></div>
							<form id="addCon" method="post" action="<%=path %>/addCompany">
								<div class="form-group">
									<div class="container">
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">单位编号：</label> <input type="text"
												class="col-md-4" placeholder="单位编号" name="con_ID" id="con_ID"/>
											
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">单位名称：</label> <input type="text"
												class="col-md-4" placeholder="单位名称" name="name" id="name"/>
											
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">地址：</label> <input type="text"
												class="col-md-6" placeholder="地址" name="address" id="address"/>
											<div class="col-md-2"></div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">联系电话：</label> <input type="text"
												class="col-md-2" placeholder="联系电话" name="contact" id="contact"/> <label
												class="col-md-2">邮编：</label> <input type="text"
												class="col-md-2" placeholder="邮编" name="postcode" id="postcode"/>
											<div class="col-md-2"></div>
										</div>

										<div class="row"></div>
										<div class="row">
											<div class="col-md-7"></div>
											<div class="col-md-3">
												<button type="submit" class="btn btn-primary ">保存</button>
												<button type="reset" class="btn btn-primary fr">清空</button>
											</div>
											<div class="col-md-2"></div>
										</div>

									</div>
								</div>
							</form>
						</div>
					</div>

				</div>

			</div>
		</div>
		<div class="foot "></div>
	</div>

	<script src="<%=path %>/js/jquery-2.2.0.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="<%=path %>/js/bootstrap.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="<%=path %>/js/index.js" type="text/javascript" charset="utf-8"></script>
	<script src="<%=path %>/js/jquery.validate-1.13.1.js" type="text/javascript"
		charset="utf-8"></script>
	<script type="text/javascript">
	$(document).ready(function () {
		$("#addCon").validate({
            rules: {
            	con_ID: {
            		required:true,
					remote:{
						url:"../../checkCompanyId",
						type:"POST",
						data:{
							ser_ID:function(){return $("#con_ID").val();}
						}
					}
				},
				name:{
					required:true
				}
            },
            messages:{
            	con_ID: {
					required: "必须填写单位编号",
					remote:"该编号已经存在"
				},
				name:{
					required: "必须填写名称"
				}
            }
		});
		
	})
	
	</script>
</body>

</html>
