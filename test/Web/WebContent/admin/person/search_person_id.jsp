<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@  page
	import="team4.factory.PersonDAOFactory,team4.entity.Person,java.util.*"%>
<%  String path = request.getContextPath();%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>查询个人信息</title>
<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/bootstrap.min.css" />
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
									<li><a href="<%=path%>/admin/search_person.jsp" id="people_info">个人基本信息
											<div class="glyphicon glyphicon-ok fr"></div>
									</a></li>
									<li><a href="search_company.html" id="company_info">单位基本信息</a></li>

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
									<li><a href="<%=path%>/admin/search_facility.jsp" id="facility_info">服务设施信息</a></li>
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
								<a href="<%=path%>/admin/log.jspl">查看日志</a>
							</h3>
						</div>

					</div>
				</div>
			</div>
			<div class="information col-md-10">
				<div id="person">
					<div class="menu" name="subnav_person" id="subnav_person">
						<a href="<%=path%>/admin/search_person.jsp"><button type="submit"
								class="btn btn-primary mybutton active">查询信息</button></a> <a
							href="<%=path%>/admin/add_person.jsp"><button type="submit"
								class="btn btn-primary mybutton">增加信息</button></a> <a
							href="<%=path%>/admin/admin.jsp"><button type="submit"
								class="btn btn-primary mybutton fr" style="margin-right: 10px;">回到首页</button></a>
					</div>
					<div class="menu-context" name="search_person" id="search_person">
						<div class="table-title">
							<h3>个人信息查询</h3>
						</div>
						<div class="search_person">
							<div class="panel panel-default">
								<div class="panel-heading">

									<div class="row" style="margin-top: 10px;">
										<form action="<%=path %>/searchPerson" method="get"
											onsubmit="return false" id="searchPerson">
											<div class="col-md-2" style="padding-right: 0;">
												<label class="fr" style="margin-top: 7px;">查询方式：</label>
											</div>
											<div class="col-md-3" style="padding-left: 0;">
												<select class="selectpicker form-control" id="selectPerson" onchange="changeSelect()"
													name="selectPerson">
													<option  value="allPerson">所有条目</option>
													<option selected value="personId">身份证编号</option>
													<option value="personName">姓名</option>
												</select>
											</div>
											<div class="col-md-2" style="padding-right: 0;">
												<label class="fr" style="margin-top: 7px;">输入项：</label>
											</div>
											<div class="col-md-5" style="padding-left: 0;">
												<div class="input-group">
													<input type="text" class="form-control" placeholder="请点击查找"
														style="margin-top: 0;" name="contextPerson"
														id="contextPerson" value="${selectedContext }" onfocus='this.value=""'> <span class="input-group-btn">
														<button type="submit" class="btn btn-primary fr"
															onclick="submitselect()">查找</button>
													</span>
												</div>
											</div>
										</form>
									</div>

								</div>
								<div class="panel-body">
									<div class="result">
										<form id="perdel" action="<%=path %>/delPerson" method="get"
											onsubmit="return false">
											<table
												class="table table-condensed table-bordered table-hover result_table_person">
												<thead>
													<tr>
														<th><input id="checkall" type="checkbox">
															<button class="btn btn-danger btn-xs"
																onclick="submitdel()">删除</button></th>
														<th>操作</th>
														<th>身份证编号</th>
														<th>姓名</th>
														<th>性别</th>
														<th>出生日期</th>
														<th>民族</th>
														<th>单位编号</th>
														<th>单位名称</th>
														<th>医疗人员类别</th>
														<th>社保卡号</th>
														<th>离退休状态</th>
														<th>医疗机构编号</th>
													</tr>
												</thead>
												<tbody>

													<div class="modal fade upd" data-backdrop="static"
														data-keyboard="false" tabindex="-1" role="dialog"
														aria-labelledby="myLargeModalLabel" aria-hidden="true">
														<div class="modal-dialog modal-lg">
															<div class="modal-content">
																<div class="modal-header">
																	<button type="button" class="close"
																		data-dismiss="modal">
																		<span aria-hidden="true">&times;</span><span
																			class="sr-only">Close</span>
																	</button>
																	<h3 class="modal-title table-title">修改个人基本信息</h3>
																</div>
																<div class="modal-body">
																	<div class="add_persons">
																		<div class="row"></div>
																		<div class="row"></div>
																		<form role="form">
																			<div class="form-group">
																				<div class="container">
																					<div class="row">
																						<div class="col-md-1"></div>
																						<label class="col-md-3">身份证编号：</label> <input
																							type="text" class="col-md-6" placeholder="身份证号码" />
																						<div class="col-md-2"></div>
																					</div>
																					<div class="row">
																						<div class="col-md-1"></div>
																						<label class="col-md-3">姓名：</label> <input
																							type="text" class="col-md-3" placeholder="姓名" />
																						<div class="col-md-4 ">
																							<label class="fl">性别：</label>
																							<div class="form-group" style="margin-bottom: 0;">
																								<label class="radio-inline "><input
																									type="radio" value="option1" name="sex">男</label>
																								<label class="radio-inline "
																									style="margin-top: 5px;"><input
																									type="radio" value="option2" name="sex">女</label>
																							</div>
																						</div>
																						<div class="col-md-1"></div>
																					</div>
																					<div class="row">
																						<div class="col-md-1"></div>
																						<label class="col-md-3">出生日期：</label>
																						<div class="col-md-3">
																							<input type="date" style="margin-left: -15px;" />
																						</div>
																						<div class="col-md-3 ">
																							<label class=" fl">民族：</label> <select
																								style="margin-top: 5px;">
																								<option>汉族</option>
																								<option>壮族</option>
																								<option>回族</option>
																								<option>满族</option>
																								<option>维吾尔族</option>
																								<option>苗族</option>
																								<option>彝族</option>
																								<option>土家族</option>
																								<option>藏族</option>
																								<option>蒙古族</option>
																								<option>侗族</option>
																								<option>布依族</option>
																								<option>瑶族</option>
																								<option>白族</option>
																								<option>朝鲜族</option>
																								<option>哈尼族</option>
																								<option>黎族</option>
																								<option>哈萨克族</option>
																								<option>傣族</option>
																								<option>畲族</option>
																								<option>傈僳族</option>
																								<option>东乡族</option>
																								<option>仡佬族</option>
																								<option>拉祜族</option>
																								<option>佤族</option>
																								<option>水族</option>
																								<option>纳西族</option>
																								<option>羌族</option>
																								<option>土族</option>
																								<option>仫佬族</option>
																								<option>锡伯族</option>
																								<option>柯尔克孜族</option>
																								<option>景颇族</option>
																								<option>达斡尔族</option>
																								<option>撒拉族</option>
																								<option>布朗族</option>
																								<option>毛南族</option>
																								<option>普米族</option>
																								<option>塔吉克族</option>
																								<option>阿昌族</option>
																								<option>怒族</option>
																								<option>鄂温克族</option>
																								<option>京族</option>
																								<option>基诺族</option>
																								<option>德昂族</option>
																								<option>保安族</option>
																								<option>俄罗斯族</option>
																								<option>裕固族</option>
																								<option>乌孜别克族</option>
																								<option>门巴族</option>
																								<option>鄂伦春族</option>
																								<option>独龙族</option>
																								<option>赫哲族</option>
																								<option>高山族</option>
																								<option>珞巴族</option>
																								<option>塔塔尔族</option>
																								<option>其他</option>
																							</select>
																						</div>
																						<div class="col-md-2"></div>
																					</div>
																					<div class="row">
																						<div class="col-md-1"></div>
																						<label class="col-md-3">单位编号：</label> <input
																							type="text" class="col-md-6" placeholder="单位编号" />
																						<div class="col-md-2"></div>
																					</div>
																					<div class="row">
																						<div class="col-md-1"></div>
																						<label class="col-md-3">单位名称：</label> <input
																							type="text" class="col-md-6" placeholder="单位名称" />
																						<div class="col-md-2"></div>
																					</div>
																					<div class="row">
																						<div class="col-md-1"></div>
																						<label class="col-md-3">医疗人员类别：</label>
																						<div class="col-md-6" style="padding-left: 0;">
																							<select style="margin-top: 5px; height: 27px;">
																								<option>新农村合作医疗保险</option>
																								<option>城镇居民医疗保险</option>
																								<option>城镇职工医疗保险</option>
																							</select>
																						</div>
																						<div class="col-md-2"></div>
																					</div>
																					<div class="row">
																						<div class="col-md-1"></div>
																						<label class="col-md-3">社保卡号：</label> <input
																							type="text" class="col-md-6" placeholder="社保卡号" />
																						<div class="col-md-2"></div>
																					</div>
																					<div class="row">
																						<div class="col-md-1"></div>
																						<label class="col-md-3">离退休状态：</label> <input
																							type="text" class="col-md-6" placeholder="离退休状态" />
																						<div class="col-md-2"></div>
																					</div>
																					<div class="row">
																						<div class="col-md-1"></div>
																						<label class="col-md-3">医疗机构编号：</label> <input
																							type="text" class="col-md-6" placeholder="医疗机构编号" />
																						<div class="col-md-2"></div>
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
																		data-dismiss="modal">保存</button>
																</div>
															</div>
														</div>
													</div>

													<tr>
														<td><input type="checkbox" name="choosePerson"
															value=${personById.ID_number }></td>
														<td><input type="image"
															src="<%=path %>/img/icn_edit.png" title="Edit"
															data-toggle="modal" data-target=".bs-example-modal-lg"></td>
														<td>${personById.ID_number }</td>
														<td>${personById.name}</td>
														<td>${personById.sex}</td>
														<td>${personById.birthday }</td>
														<td>${personById.nation }</td>
														<td>${personById.dep_number }</td>
														<td>大连理工大学 38</td>
														<td>${personById.per_category }</td>
														<td>${personById.ID_number }</td>
														<td>${personById.state }</td>
														<td>${personById.ins_number }</td>
													</tr>
													<div class="modal fade bs-example-modal-lg"
														data-backdrop="static" data-keyboard="false" tabindex="-1"
														role="dialog" aria-labelledby="myLargeModalLabel"
														aria-hidden="true">
														<div class="modal-dialog modal-lg">
															<div class="modal-content">
																<div class="modal-header">
																	<button type="button" class="close"
																		data-dismiss="modal">
																		<span aria-hidden="true">&times;</span><span
																			class="sr-only">Close</span>
																	</button>
																	<h3 class="modal-title table-title">修改个人基本信息</h3>
																</div>
																<div class="modal-body">
																	<div class="add_persons">
																		<div class="row"></div>
																		<div class="row"></div>
																		<form id="person_upd" action="<%=path %>/updPersonId"
																			method="post" onsubmit="return false">
																			<div class="form-group">
																				<div class="container">
																					<div class="row">
																						<div class="col-md-1"></div>
																						<label class="col-md-3">身份证编号：</label> <input
																							type="text" value=${personById.ID_number } 
																							class="col-md-4 notice" placeholder="身份证号码"
																							name="upd_ID_number" id="upd_ID_number" />
																						<label class="notice">身份证编号不可修改</label>
																					</div>
																					<div class="row">
																						<div class="col-md-1"></div>
																						<label class="col-md-3">姓名：</label> <input
																							type="text" value=${personById.name
																							} onfocus='this.value=""' class="col-md-4 "
																							placeholder="姓名" name="upd_per_name"
																							id="upd_per_name" />
																					</div>
																					<div class="row">
																						<div class="col-md-1"></div>
																						<label class="col-md-3">出生日期：</label>
																						<div class="col-md-4">
																							<input type="date" value=${personById.birthday }
																								onfocus='this.value=""'
																								style="margin-left: -15px;" name="upd_birthday"
																								id="upd_birthday" />
																						</div>
																					</div>
																					<div class="row">
																						<div class="col-md-1"></div>
																						<label class="col-md-3">性别：</label>
																						<div class="col-md-2 " style="padding-left: 0;">
																							<select style="margin-top: 5px;" name="upd_sex"
																								id="upd_sex" >
																								<option value="男">男</option>
																								<option value="女">女</option>
																							</select>
																						</div>
																						<label class="col-md-2">民族：</label>
																						<div class="col-md-2 " style="padding-left: 0;">
																							<select style="margin-top: 5px;"
																								name="upd_nation" id="upd_nation" >
																								<option value="汉族">汉族</option>
																								<option value="壮族">壮族</option>
																								<option value="回族">回族</option>
																								<option value="满族">满族</option>
																								<option value="维吾尔族">维吾尔族</option>
																								<option value="苗族">苗族</option>
																								<option value="彝族">彝族</option>
																								<option value="土家族">土家族</option>
																								<option value="藏族">藏族</option>
																								<option value="蒙古族">蒙古族</option>
																								<option value="侗族">侗族</option>
																								<option value="布依族">布依族</option>
																								<option value="瑶族">瑶族</option>
																								<option value="白族">白族</option>
																								<option value="朝鲜族">朝鲜族</option>
																								<option value="哈尼族">哈尼族</option>
																								<option value="黎族">黎族</option>
																								<option value="哈萨克族">哈萨克族</option>
																								<option value="傣族">傣族</option>
																								<option value="畲族">畲族</option>
																								<option value="傈僳族">傈僳族</option>
																								<option value="东乡族">东乡族</option>
																								<option value="仡佬族">仡佬族</option>
																								<option value="拉祜族">拉祜族</option>
																								<option value="佤族">佤族</option>
																								<option value="水族">水族</option>
																								<option value="纳西族">纳西族</option>
																								<option value="羌族">羌族</option>
																								<option value="土族">土族</option>
																								<option value="仫佬族">仫佬族</option>
																								<option value="锡伯族">锡伯族</option>
																								<option value="柯尔克孜族">柯尔克孜族</option>
																								<option value="景颇族">景颇族</option>
																								<option value="达斡尔族">达斡尔族</option>
																								<option value="撒拉族">撒拉族</option>
																								<option value="布朗族">布朗族</option>
																								<option value="毛南族">毛南族</option>
																								<option value="普米族">普米族</option>
																								<option value="塔吉克族">塔吉克族</option>
																								<option value="阿昌族">阿昌族</option>
																								<option value="怒族">怒族</option>
																								<option value="鄂温克族">鄂温克族</option>
																								<option value="京族">京族</option>
																								<option value="基诺族">基诺族</option>
																								<option value="德昂族">德昂族</option>
																								<option value="保安族">保安族</option>
																								<option value="俄罗斯族">俄罗斯族</option>
																								<option value="裕固族">裕固族</option>
																								<option value="乌孜别克族">乌孜别克族</option>
																								<option value="门巴族">门巴族</option>
																								<option value="鄂伦春族">鄂伦春族</option>
																								<option value="独龙族">独龙族</option>
																								<option value="赫哲族">赫哲族</option>
																								<option value="高山族">高山族</option>
																								<option value="珞巴族">珞巴族</option>
																								<option value="塔塔尔族">塔塔尔族</option>
																								<option value="其他">其他</option>
																							</select>
																						</div>
																						<div class="col-md-2"></div>
																					</div>
																					<div class="row">
																						<div class="col-md-1"></div>
																						<label class="col-md-3">户口性质：</label>
																						<div class="col-md-2 " style="padding-left: 0;">
																							<select style="margin-top: 5px;"
																								name="upd_reg_cha" id="upd_reg_cha">
																								<option value="城镇">城镇</option>
																								<option value="乡村">乡村</option>
																							</select>
																						</div>
																						<label class="col-md-2">户口所在地：</label> <input
																							type="text" class="col-md-2" placeholder="户口所在地"
																							name="upd_reg_pla" id="upd_reg_pla"
																							value=${personById.reg_pla }
																							onfocus='this.value=""' />
																						<div class="col-md-2"></div>
																					</div>
																					<div class="row">
																						<div class="col-md-1"></div>
																						<label class="col-md-3">文化程度：</label>
																						<div class="col-md-2 " style="padding-left: 0;">
																							<select style="margin-top: 5px;"
																								name="upd_cul_stan" id="upd_cul_stan">
																								<option value="大学">大学</option>
																								<option value="高中">高中</option>
																								<option value="初中">初中</option>
																								<option value="小学">小学</option>
																								<option value="文盲">文盲</option>
																							</select>
																						</div>
																						<label class="col-md-2">政治面貌：</label>
																						<div class="col-md-2 " style="padding-left: 0;">
																							<select style="margin-top: 5px;"
																								name="upd_pol_sta" id="upd_pol_sta">
																								<option value="团员">团员</option>
																								<option value="党员">党员</option>
																								<option value="其他">其他</option>
																							</select>
																						</div>
																						<div class="col-md-2"></div>
																					</div>
																					<div class="row">
																						<div class="col-md-1"></div>
																						<label class="col-md-3">婚姻状况：</label>
																						<div class="col-md-2 " style="padding-left: 0;">
																							<select style="margin-top: 5px;"
																								name="upd_mar_sta" id="upd_mar_sta">
																								<option value="已婚">已婚</option>
																								<option value="未婚">未婚</option>
																							</select>
																						</div>
																						<label class="col-md-2">居民类别：</label>
																						<div class="col-md-2 " style="padding-left: 0;">
																							<select style="margin-top: 5px;"
																								name="upd_resident_f"
																								id="upd_resident_f">
																								<option value="公务员">公务员</option>
																								<option value="企业职工">企业职工</option>
																								<option value="农民工">农民工</option>
																								<option value="灵活就业">灵活就业</option>
																								<option value="农民">农民</option>
																							</select>
																						</div>
																						<div class="col-md-2"></div>
																					</div>
																					<div class="row">
																						<div class="col-md-1"></div>
																						<label class="col-md-3">单位编号：</label> <input
																							type="text" class="col-md-2 " placeholder="单位编号"
																							name="upd_dep_number"
																							id="upd_dep_number"
																							value=${personById.dep_number }
																							onfocus='this.value=""' /> <label
																							class="col-md-2">离退休状态：</label>
																						<div class="col-md-2 " style="padding-left: 0;">
																							<select style="margin-top: 5px;"
																								name="upd_state" id="upd_state">
																								<option value="已退休">是</option>
																								<option value="还未退休">否</option>
																							</select>
																						</div>
																						<div class="col-md-2"></div>
																					</div>
																					<div class="row">
																						<div class="col-md-1"></div>
																						<label class="col-md-3">医疗人员类别：</label>
																						<div class="col-md-6" style="padding-left: 0;">
																							<select style="margin-top: 5px; height: 27px;"
																								name="upd_per_category"
																								id="upd_per_category">
																								<option value="新农村合作医疗保险">新农村合作医疗保险</option>
																								<option value="城镇居民医疗保险">城镇居民医疗保险</option>
																								<option value="城镇职工医疗保险">城镇职工医疗保险</option>
																							</select>
																						</div>
																						<div class="col-md-2"></div>
																					</div>
																					<div class="row">
																						<div class="col-md-1"></div>
																						<label class="col-md-3">医疗机构编号：</label> <input
																							type="text" class="col-md-4 must"
																							placeholder="医疗机构编号" name="upd_ins_number"
																							id="upd_ins_number"
																							value=${personById.ins_number }
																							onfocus='this.value=""' />

																					</div>

																				</div>
																			</div>
																		</form>
																		<script type="text/javascript">
												document.getElementById("upd_sex").value="${personById.sex }";
												document.getElementById("upd_nation").value="${personById.nation }";
												document.getElementById("upd_reg_cha").value="${personById.reg_cha }";
												document.getElementById("upd_cul_stan").value="${personById.cul_stan }";
												document.getElementById("upd_pol_sta").value="${personById.pol_sta }";
												document.getElementById("upd_mar_sta").value="${personById.mar_sta }";
												document.getElementById("upd_resident_f").value="${personById.resident_f }";
												document.getElementById("upd_state").value="${personById.state }";
												document.getElementById("upd_per_category").value="${personById.per_category }";
												</script>
																	</div>

																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-default"
																		data-dismiss="modal">关闭</button>
																	<button type="button" class="btn btn-primary"
																		onclick="document.getElementById('person_upd').submit();">保存</button>
																</div>
															</div>
														</div>
													</div>

												</tbody>
											</table>
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

	<script src="<%=path %>/js/jquery-2.2.0.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="<%=path %>/js/bootstrap.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="<%=path %>/js/index.js" type="text/javascript"
		charset="utf-8"></script>
	<script type="text/javascript">
	function changeSelect(){
		var sel=document.getElementById("selectPerson").value;	
		if(sel=="allperson"){
			document.getElementById("contextLog").value="";
			document.getElementById("contextLog").placeholder="请点击查找";	
		}else if(sel=="personId"){
			document.getElementById("contextLog").value="";
			document.getElementById("contextLog").placeholder="请输入搜索身份证编号";	
		}else if(sel=="personName"){
			document.getElementById("contextLog").value="";
			document.getElementById("contextLog").placeholder="请输入搜索人员名称";	
		}
	};
			function submitdel() {
				document.getElementById("perdel").submit();
			};
			function submitselect() {
				var sel=document.getElementById("selectPerson").value;			
				var con=document.getElementById("contextPerson").value;
				if(sel=="personId"&&con==""){
					document.getElementById("contextPerson").placeholder="请输入搜索身份证编号";
				}else if(sel=="personName"&&con==""){
					document.getElementById("contextPerson").placeholder="请输入搜索人员名称";
				}else if(sel=="allPerson"){
					document.getElementById("contextPerson").placeholder="请点击查找";
					document.getElementById("searchPerson").submit();
				}else{
					document.getElementById("searchPerson").submit();
				}
				
			};
	</script>
</body>

</html>
