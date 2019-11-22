<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%  String path = request.getContextPath();%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>增加服务设施信息</title>
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
						<div id="collapseOne" class="panel-collapse collapse">
							<div class="panel-body">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="search_person.jsp" id="people_info">个人基本信息</a></li>
									<li><a href="search_company.html" id="company_info">单位基本信息
									</a></li>

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
						<div id="collapseTwo" class="panel-collapse collapse in">
							<div class="panel-body">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="search_institution.html"
										id="institution_info">医疗机构信息</a></li>
									<li><a href="search_facility.jsp" id="facility_info">服务设施信息
											<div class="glyphicon glyphicon-ok fr"></div>
									</a></li>
									<li><a href="search_disease.html" id="disease_info">病种信息</a></li>
									<li><a href="search_drug.html" id="drug_info">药品信息</a></li>
									<li><a href="search_zhenliao.html" id="zhenliao_info">诊疗项目信息</a></li>
									<li><a href="search_canshu.html" id="parameter_info">待遇参数信息</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								<a href="history.html">报销历史信息</a>
							</h3>
						</div>

					</div>
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								<a href="log.jsp">查看日志</a>
							</h3>
						</div>

					</div>
				</div>
			</div>
			<div class="information col-md-10">
				<div id="facilitiy">
					<div class="menu" name="subnav_facility" id="subnav_facility">
						<a href="search_facility.jsp"><button type="submit"
								class="btn btn-primary mybutton">查询信息</button></a> <a
							href="add_facility.jsp"><button type="submit"
								class="btn btn-primary mybutton active">增加信息</button></a> <a
							href="admin.jsp"><button type="submit"
								class="btn btn-primary mybutton fr" style="margin-right: 10px;">回到首页</button></a>
					</div>
					<div class="menu-context" name="add_facilities" id="add_facilities">
						<div class="table-title">
							<h3>服务设施信息</h3>
						</div>
						<div class="add_facilities">
							<div class="row"></div>
							<div class="row"></div>
							<form id="addFac" method="post" action="<%=path %>/addFacility">
								<div class="form-group">
									<div class="container">
										<div class="row">
											<div class="col-md-1"></div>
											<label for="ser_ID" class="col-md-3">服务设施编号：</label> <input
												type="text" class="col-md-4 must" placeholder="服务设施编号"
												name="ser_ID" id="ser_ID" />
											<div class="col-md-3"></div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label for="name" class="col-md-3">服务设施名称：</label> <input
												type="text" class="col-md-4 must" placeholder="服务设施名称"
												name="name" id="name" />
											<div class="col-md-3"></div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">收费类别：</label> <label>服务设施</label>
										</div>

										<div class="row">
											<div class="col-md-1"></div>
											<label for="usable_range" class="col-md-3">限制使用范围：</label> <input
												type="text" class="col-md-4" placeholder="限制使用范围"
												name="usable_range" id="usable_range" />
											<div class="col-md-3"></div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label for="notes" class="col-md-3">备注：</label> <input
												type="text" class="col-md-4" placeholder="备注" name="notes"
												id="notes" />
											<div class="col-md-3"></div>
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
		$("#addFac").validate({
            rules: {
            	ser_ID: {
					minlength: 8,
					maxlength: 8,
					remote:{
						url:"../checkFacilityId",
						type:"POST",
						data:{
							ser_ID:function(){return $("#ser_ID").val();}
						}
					}
				}
            },
            messages:{
            	ser_ID: {
					required: "必须填写编号",
					minlength: "编号为8位，例如“fac00001”",
					maxlength: "编号为8位，例如“fac00001”",
					remote:"编号已被注册"
				},
				name:{
					required: "必须填写名称"
				}
            }
		});
		
		$.validator.addClassRules({
			must:{
				required:true
			}
		})
	})
	
	</script>



</body>

</html>