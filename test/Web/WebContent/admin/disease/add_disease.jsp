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
						<div id="collapseOne" class="panel-collapse collapse">
							<div class="panel-body">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="<%=path %>/admin/person/search_person.jsp" id="people_info">个人基本信息</a></li>
									<li><a href="<%=path %>/admin/company/search_company.jsp" id="company_info">单位基本信息
											
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
						<div id="collapseTwo" class="panel-collapse collapse in">
							<div class="panel-body">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="<%=path %>/admin/institution/search_institution.jsp"
										id="institution_info">医疗机构信息</a></li>
									<li><a href="<%=path %>/admin/facility/search_facility.jsp" id="facility_info">服务设施信息</a></li>
									<li><a href="<%=path %>/admin/disease/search_disease.jsp" id="disease_info">病种信息
									<div class="glyphicon glyphicon-ok fr"></div></a></li>
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
			<div id="disease">
					<div class="menu" id="subnav_disease">
						<a href="<%=path %>/admin/disease/search_disease.jsp"><button type="submit"
								class="btn btn-primary mybutton">查询信息</button></a> <a
							href="<%=path %>/admin/disease/add_disease.jsp"><button type="submit"
								class="btn btn-primary mybutton  active">增加信息</button></a> <a
							href="<%=path %>/admin/admin.jsp"><button type="submit"
								class="btn btn-primary mybutton fr" style="margin-right: 10px;">回到首页</button></a>
					</div>
					<div class="menu-context" id="add_disease">
						<div class="table-title">
							<h3>病种信息</h3>
						</div>
						<div class="add_disease">
							<div class="row"></div>
							<div class="row"></div>
							<form id="addDis" method="post" action="<%=path %>/addDisease">
								<div class="form-group">
									<div class="container">
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">疾病编号：</label> <input type="text"
												class="col-md-4"  placeholder="疾病编号"  name="dis_ID" id="dis_ID"/>
											
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">病种名称：</label> <input type="text"
												class="col-md-4"  placeholder="病种名称" name="name" id="name" />
											
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">病种报销：</label>
											<div class="col-md-2 " style="padding-left: 0;">
												<select style="margin-top: 5px;" name="flag" id="flag">
													<option value="是">是</option>
													<option value="否">否</option>
												</select>
											</div>
											<div class="col-md-6"></div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">备注：</label> <input type="text"
												class="col-md-6" placeholder="备注" name="notes" id="notes">
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
		$("#addDis").validate({
            rules: {
            	dis_ID: {
            		required:true,
					remote:{
						url:"../../checkDiseaseId",
						type:"POST",
						data:{
							ser_ID:function(){return $("#dis_ID").val();}
						}
					}
				},
				name:{
					required:true
				}
            },
            messages:{
            	dis_ID: {
					required: "必须填写编号",
					remote:"编号已被注册"
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