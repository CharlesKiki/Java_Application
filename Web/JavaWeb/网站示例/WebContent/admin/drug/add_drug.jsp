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
						<div id="collapseTwo" class="panel-collapse collapse  in">
							<div class="panel-body">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="<%=path %>/admin/institution/search_institution.jsp"
										id="institution_info">医疗机构信息</a></li>
									<li><a href="<%=path %>/admin/facility/search_facility.jsp" id="facility_info">服务设施信息</a></li>
									<li><a href="<%=path %>/admin/disease/search_disease.jsp" id="disease_info">病种信息</a></li>
									<li><a href="<%=path %>/admin/drug/search_drug.jsp" id="drug_info">药品信息
									<div class="glyphicon glyphicon-ok fr"></div></a></li>
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
			
			<div id="drug">
					<div class="menu" id="subnav_drug">
						<a href="<%=path %>/admin/drug/search_drug.jsp"><button type="submit"
								class="btn btn-primary mybutton">查询信息</button></a> <a
							href="<%=path %>/admin/drug/add_drug.jsp"><button type="submit"
								class="btn btn-primary mybutton active">增加信息</button></a> <a
							href="<%=path %>/admin/admin.jsp"><button type="submit"
								class="btn btn-primary mybutton fr" style="margin-right: 10px;">回到首页</button></a>
					</div>
					<div class="menu-context" id="add_drugs">
						<div class="table-title">
							<h3>药品信息</h3>
						</div>
						<div class="add_drugs">
							<div class="row"></div>
							<div class="row"></div>
							<form id="addDrug" method="post" action="<%=path %>/addDrug">
								<div class="form-group">
									<div class="container">
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">药品编号：</label> <input type="text"
												class="col-md-6" placeholder="药品编号" name="drug_ID" id="drug_ID" />
											<div class="col-md-2"></div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">中文名称：</label> <input type="text"
												class="col-md-2" placeholder="药品中文名称" name="name_ch" id="name_ch" /> <label
												class="col-md-2">英文名称：</label> <input type="text"
												class="col-md-2" placeholder="药品英文名称" name="name_en" id="name_en" />
											<div class="col-md-2"></div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">收费类别：</label> 
												<label class="col-md-2"
												style="text-align: left;">药品</label> <label class="col-md-2">处方药标志：</label>
											<div class="col-md-2 " style="padding-left: 0;" >
												<select style="margin-top: 5px;" name="flag" id="flag">
													<option value="是">是</option>
													<option value="否">否</option>
												</select>
											</div>
											<div class="col-md-1"></div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">收费项目等级：</label>
											<div class="col-md-2 " style="padding-left: 0;">
												<select style="margin-top: 5px;" name="level" id="level">
													<option value="甲">甲</option>
													<option value="乙">乙</option>
													<option value="丙">丙</option>
												</select>
											</div>
											<label class="col-md-2">医院等级：</label>
											<div class="col-md-2 " style="padding-left: 0;">
												<select style="margin-top: 5px;" name="ins_level" id="ins_level">
													<option value="一级医院">一级医院</option>
													<option value="二级医院">二级医院</option>
													<option value="三级医院">三级医院</option>
													<option value="社区医院">社区医院</option>
													<option value="全部医院">全部医院</option>
												</select>
											</div>
											<div class="col-md-2"></div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">院内制剂：</label>
											<div class="col-md-2 " style="padding-left: 0;">
												<select style="margin-top: 5px;" name="hos_level" id="hos_level">
													<option value="是">是</option>
													<option value="否">否</option>
												</select>
											</div>
											<label class="col-md-2">是否需要审批：</label>
											<div class="col-md-2 " style="padding-left: 0;">
												<select style="margin-top: 5px;" name="app_flag" id="app_flag">
													<option value="是">是</option>
													<option value="否">否</option>
												</select>
											</div>
											<div class="col-md-2"></div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">最高限价：</label> <input type="text"
												class="col-md-2" placeholder="最高限价"  name="max_price" id="max_price"/>

											<div class="col-md-2"></div>
										</div>

										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">剂型：</label> <input type="text"
												class="col-md-2" placeholder="剂型"  name="form" id="form"/> <label
												class="col-md-2">剂量单位：</label> <input type="text"
												class="col-md-2" placeholder="剂量单位" name="measure" id="measure"/>
											<div class="col-md-2"></div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">用法：</label> <input type="text"
												class="col-md-2" placeholder="用法" name="usage" id="usage" /> <label
												class="col-md-2">使用频次：</label> <input type="text"
												class="col-md-2" placeholder="使用频次" name="times" id="times" />
											<div class="col-md-2"></div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">规格：</label> <input type="text"
												class="col-md-2" placeholder="规格"  name="standard" id="standard"/> <label
												class="col-md-2">限定天数：</label> <input type="text"
												class="col-md-2" placeholder="限定天数" name="days" id="days" />
											<div class="col-md-2"></div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">药厂名称：</label> <input type="text"
												class="col-md-6" placeholder="药厂名称" name="drug_factory" id="drug_factory" />
											<div class="col-md-2"></div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">国药准字：</label> <input type="text"
												class="col-md-6" placeholder="国药准字" name="state" id="state" />
											<div class="col-md-2"></div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">限定使用范围：</label> <input type="text"
												class="col-md-6" placeholder="限定使用范围" name="usable_range" id="usable_range" />
											<div class="col-md-2"></div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">国家目录编码：</label> <input type="text"
												class="col-md-2" placeholder="国家目录编码"  name="national_coding" id="national_coding"/> <label
												class="col-md-2">产地：</label> <input type="text"
												class="col-md-2" placeholder="产地"  name="origin" id="origin"/>
											<div class="col-md-2"></div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">备注：</label> <input type="text"
												class="col-md-6" placeholder="备注" name="notes" id="notes" />
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
		$("#addDrug").validate({
            rules: {
            	ser_ID: {
            		required:true,
					remote:{
						url:"../checkDrugId",
						type:"POST",
						data:{
							ser_ID:function(){return $("#drug_ID").val();}
						}
					}
				}
            },
            messages:{
            	ser_ID: {
					required: "必须填写编号",
					remote:"编号已被注册"
				},
            }
		});
	})
	</script>

</body>
</html>