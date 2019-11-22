<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>查询服务设施信息</title>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/css/style.css" />

</head>

<body>
	<div class="container-all">

		<div class="head">
			<div class="exit  fr">
				<a href="<%=path%>/login.jsp" target="_top"><h4>退出登录</h4></a>
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
									<li><a href="<%=path%>/admin/search_person.jsp" id="people_info">个人基本信息</a></li>
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
									<li><a href="<%=path%>/admin/search_facility.jsp" id="facility_info">服务设施信息
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
								<a href="<%=path%>/admin/log.jsp">查看日志</a>
							</h3>
						</div>

					</div>
				</div>
			</div>
			<div class="information col-md-10">
				<div id="facilitiy">
					<div class="menu" name="subnav_facility" id="subnav_facility">
						<a href="<%=path%>/admin/search_facility.jsp"><button type="button"
								class="btn btn-primary mybutton active">查询信息</button></a> <a
							href="<%=path%>/admin/add_facility.jsp"><button type="button"
								class="btn btn-primary mybutton">增加信息</button></a> <a
							href="<%=path%>/admin/admin.jsp"><button type="submit"
								class="btn btn-primary mybutton fr" style="margin-right: 10px;">回到首页</button></a>
					</div>
					<div class="menu-context" name="search_facility"
						id="search_facility">
						<div class="table-title">
							<h3>服务设施信息查询</h3>
						</div>
						<div class="search_facility">
							<div class="panel panel-default">
								<div class="panel-heading">

									<div class="row" style="margin-top: 10px;">
										<form action="<%=path%>/searchFacility" method="get"
											onsubmit="return false" id="searchFacility">
											<div class="col-md-2" style="padding-right: 0;">
												<label class="fr" style="margin-top: 7px;">查询方式：</label>
											</div>
											<div class="col-md-3" style="padding-left: 0;">
												<select class="selectpicker form-control " onchange="changeSelect()"
													id="selectFacility" name="selectFacility">
													<option  value="allFacility">所有条目</option>
													<option selected value="facilityId">服务设施编号</option>
													<option value="facilityName">服务设施名称</option>

												</select>
											</div>
											<div class="col-md-2" style="padding-right: 0;">
												<label class="fr" style="margin-top: 7px;">输入项：</label>
											</div>
											<div class="col-md-5" style="padding-left: 0;">
												<div class="input-group">
													<input type="text" class="form-control" placeholder="请点击查找"
														style="margin-top: 0;" name="contextFacility"
														id="contextFacility" value="${selectedContext }" onfocus='this.value=""'> <span
														class="input-group-btn">
														<button type="button" class="btn btn-primary fr"
															onclick="submitselect()">查找</button>
													</span>
												</div>
											</div>
										</form>
									</div>

								</div>
								<div class="panel-body">
									<div class="result">
									
										<form id="del" action="<%=path%>/delFacility" method="get"
											onsubmit="return false">
											<table
												class="table table-condensed table-bordered table-hover result_table_facility">
												<thead>
												<div class="modal fade "
												data-backdrop="static" data-keyboard="false" tabindex="-1"
												role="dialog" aria-labelledby="myLargeModalLabel"
												aria-hidden="true">
												<div class="modal-dialog modal-lg">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal">
																<span aria-hidden="true">&times;</span><span
																	class="sr-only">Close</span>
															</button>
															<h3 class="modal-title table-title">修改服务设施信息</h3>
														</div>
														<div class="modal-body">
															<div class="add_facilities">
																<div class="row"></div>
																<div class="row"></div>
																<form id="upd7" action="<%=path%>/updFaciliyId"
																	method="post" onsubmit="return false">
																	<div class="form-group">
																		<div class="container">
																			<div class="row">
																				<div class="col-md-1"></div>
																				<label class="col-md-3">服务设施编号：</label> <input
																					type="text" class="col-md-6"
																					value="${facilityById.ser_ID }" name="upd_ser_ID7"
																					id="upd_ser_ID7" />
																				<div class="col-md-2"></div>
																			</div>
																			<div class="row">
																				<div class="col-md-1"></div>
																				<label class="col-md-3">服务设施名称：</label> <input
																					type="text" class="col-md-6"
																					placeholder="${facilityById.name }" name="upd_name7"
																					id="upd_name7" />
																			</div>
																			<div class="row">
																				<div class="col-md-1"></div>
																				<label class="col-md-3">收费类别：</label> <label>服务设施</label>
																			</div>

																			<div class="row">
																				<div class="col-md-1"></div>
																				<label class="col-md-3">限制使用范围：</label> <input
																					type="text" class="col-md-6"
																					placeholder="${facilityById.usable_range }"
																					name="upd_usable_range7" id="upd_usable_range7" />
																			</div>
																			<div class="row">
																				<div class="col-md-1"></div>
																				<label class="col-md-3">备注：</label> <input
																					type="text" class="col-md-6"
																					placeholder="${facilityById.notes }"
																					name="upd_notes7" id="upd_notes7" />
																			</div>
																		</div>
																	</div>
																</form>
															</div>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default"
																data-dismiss="modal">关闭</button>
															<button type="button" class="btn btn-primary"
																onclick="document.getElementById('upd7').submit();">保存</button>
														</div>
													</div>
												</div>
											</div>
													<tr>
														<th><input id="checkall" type="checkbox">
															<button class="btn btn-danger btn-xs"
																onclick="submitdel()">删除</button></th>
														<th>操作</th>
														<th>服务设施编号</th>
														<th>服务设施名称</th>
														<th>限制适用范围</th>
														<th>备注</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td><input type="checkbox" name="chooseFacility"
															value=${facilityById.ser_ID }></td>
														<td><input type="image"
															src="<%=path%>/img/icn_edit.png" title="Edit"
															data-toggle="modal" data-target=".bs-example-modal-lg"></td>
														<td>${facilityById.ser_ID }</td>
														<td>${facilityById.name }</td>
														<td>${facilityById.usable_range }</td>
														<td>${facilityById.notes }</td>
													</tr>

												</tbody>
											</table>
											<div class="modal fade bs-example-modal-lg"
												data-backdrop="static" data-keyboard="false" tabindex="-1"
												role="dialog" aria-labelledby="myLargeModalLabel"
												aria-hidden="true">
												<div class="modal-dialog modal-lg">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal">
																<span aria-hidden="true">&times;</span><span
																	class="sr-only">Close</span>
															</button>
															<h3 class="modal-title table-title">修改服务设施信息</h3>
														</div>
														<div class="modal-body">
															<div class="add_facilities">
																<div class="row"></div>
																<div class="row"></div>
																<form id="upd6" action="<%=path%>/updFaciliyId" method="post" onsubmit="return false">
																	<div class="form-group">
																		<div class="container">
																			<div class="row">
																				<div class="col-md-1"></div>
																				<label class="col-md-3">服务设施编号：</label> <input 
																					type="text" class="col-md-4 notice"
																					value="${facilityById.ser_ID }" name="upd_ser_ID6"
																					id="upd_ser_ID6" />
																				<label class="notice">服务设施编号不可修改</label>
																			</div>
																			<div class="row">
																				<div class="col-md-1"></div>
																				<label class="col-md-3">服务设施名称：</label> <input
																					type="text" class="col-md-6"
																					placeholder="${facilityById.name }" value="${facilityById.name }" name="upd_name6"
																					id="upd_name6" onfocus='this.value=""' />
																			</div>
																			<div class="row">
																				<div class="col-md-1"></div>
																				<label class="col-md-3">收费类别：</label> <label>服务设施</label>
																			</div>

																			<div class="row">
																				<div class="col-md-1"></div>
																				<label class="col-md-3">限制使用范围：</label> <input
																					type="text" class="col-md-6"
																					placeholder="${facilityById.usable_range }" value="${facilityById.usable_range }"
																					name="upd_usable_range6" id="upd_usable_range6" onfocus='this.value=""'/>
																			</div>
																			<div class="row">
																				<div class="col-md-1"></div>
																				<label class="col-md-3">备注：</label> <input
																					type="text" class="col-md-6"
																					placeholder="${facilityById.notes }" value="${facilityById.notes }"
																					name="upd_notes6" id="upd_notes6" onfocus='this.value=""'/>
																			</div>
																		</div>
																	</div>
																</form>
															</div>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default"
																data-dismiss="modal">关闭</button>
															<button type="button" class="btn btn-primary"
																onclick="document.getElementById('upd6').submit();">保存</button>
														</div>
													</div>
												</div>
											</div>


										</form>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<div class="foot "></div>
	</div>

	<script src="<%=path%>/js/jquery-2.2.0.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="<%=path%>/js/bootstrap.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="<%=path%>/js/index.js" type="text/javascript"
		charset="utf-8"></script>
	<script type="text/javascript">
	function changeSelect(){
		var sel=document.getElementById("selectFacility").value;	
		if(sel=="allFacility"){
			document.getElementById("contextLog").value="";
			document.getElementById("contextLog").placeholder="请点击查找";	
		}else if(sel=="facilityId"){
			document.getElementById("contextLog").value="";
			document.getElementById("contextLog").placeholder="请输入搜索编号";	
		}else if(sel=="facilityName"){
			document.getElementById("contextLog").value="";
			document.getElementById("contextLog").placeholder="请输入搜索名称";	
		}
	};
		function submitdel() {
			document.getElementById("del").submit();
		};
		function submitselect() {
			var sel = document.getElementById("selectFacility").value;
			var con = document.getElementById("contextFacility").value;
			if (sel == "facilityId" && con == "") {
				document.getElementById("contextFacility").placeholder = "请输入搜索编号";
			} else if (sel == "facilityName" && con == "") {
				document.getElementById("contextFacility").placeholder = "请输入搜索名称";
			} else if (sel = "allFacility") {
				document.getElementById("contextFacility").placeholder = "请点击查找";
				document.getElementById("searchFacility").submit();
			} else {
				document.getElementById("searchFacility").submit();
			}

		};
	</script>

</body>

</html>