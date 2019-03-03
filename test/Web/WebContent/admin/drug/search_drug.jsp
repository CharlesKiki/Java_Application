<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@  page import="team4.factory.DrugDAOFactory,team4.entity.Drug,java.util.*"%>
<%  String path = request.getContextPath();%>  
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>查询药品信息</title>
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
									<li><a href="<%=path%>/admin/person/search_person.jsp" id="people_info">个人基本信息</a></li>
									<li><a href="<%=path%>/admin/company/search_company.jsp" id="company_info">单位基本信息
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
									<li><a href="<%=path%>/admin/search_institution.jsp"
										id="institution_info">医疗机构信息</a></li>
									<li><a href="<%=path%>/admin/facility/search_facility.jsp" id="facility_info">服务设施信息</a></li>
									<li><a href="<%=path%>/admin/disease/search_disease.jsp" id="disease_info">病种信息</a></li>
									<li><a href="<%=path%>/admin/drug/search_drug.jsp" id="drug_info">药品信息
											<div class="glyphicon glyphicon-ok fr"></div>
									</a></li>
									<li><a href="<%=path%>/admin/zhenliao/search_zhenliao.jsp" id="zhenliao_info">诊疗项目信息</a></li>
									<li><a href="<%=path%>/admin/canshu/search_canshu.jsp" id="parameter_info">待遇参数信息</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								<a href="<%=path%>/admin/history.jsp">报销历史信息</a>
							</h3>
						</div>

					</div>
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								<a href="<%=path%>/admin/log/log.jsp">查看日志</a>
							</h3>
						</div>

					</div>
				</div>
			</div>
			<div class="information col-md-10">
				<div id="drug">
					<div class="menu" id="subnav_drug">
						<a href="<%=path%>/admin/drug/search_drug.jsp"><button type="submit"
								class="btn btn-primary mybutton active">查询信息</button></a> <a
							href="<%=path%>/admin/drug/add_drug.jsp"><button type="submit"
								class="btn btn-primary mybutton">增加信息</button></a> <a
							href="<%=path%>/admin/admin.jsp"><button type="submit"
								class="btn btn-primary mybutton fr" style="margin-right: 10px;">回到首页</button></a>
					</div>
					<div class="menu-context" id="search_drug">
						<div class="table-title">
							<h3>药品信息查询</h3>
						</div>
						<div class="search_drug">
							<div class="panel panel-default">
								<div class="panel-heading">

									<div class="row" style="margin-top: 10px;">
										<form action="<%=path%>/searchDrug" method="get"
											onsubmit="return false" id="searchDrug">
										<div class="col-md-2" style="padding-right: 0;">
											<label class="fr" style="margin-top: 7px;">查询方式：</label>
										</div>
										<div class="col-md-3" style="padding-left: 0;">
											<select class="selectpicker form-control " onchange="changeSelect()">
												<option selected value="allDrug">所有条目</option>
												<option value="DrugId">药品编号</option>
												<option value="DrugName">药品中文名称</option>
												<option value="DrugLevel">收费项目等级</option>
												<option value="InsLevel">医院等级</option>
												<option value="Factory">药厂名称</option>
												<option value="Coding">国家目录编码</option>
											</select>
										</div>
										<div class="col-md-2" style="padding-right: 0;">
											<label class="fr" style="margin-top: 7px;">输入项：</label>
										</div>
										<div class="col-md-5" style="padding-left: 0;">
											<div class="input-group">
												<input type="text" class="form-control"placeholder="请点击查找" style="margin-top: 0;" name="contextDrug"
														id="contextDrug">
												<span class="input-group-btn">
													<button type="submit" class="btn btn-primary fr" onclick="submitselect()">查找</button>
												</span>
											</div>
										</div>
										</form>
									</div>

								</div>
								<div class="panel-body">
									<div class="result">
										<form id="drugdel" action="<%=path%>/delDrug" method="get" onsubmit="return false">
										<table
											class="table table-condensed table-bordered table-hover result_table_drug">
											<thead>
												<tr>
													<th><input id="checkall" type="checkbox">
														<button class="btn btn-danger btn-xs" onclick="submitdel()">删除</button></th>
													<th>操作</th>
													<th>药品编号</th>
													<th>药品名称</th>
													<th>收费项目等级</th>
													<th>最高限价</th>
													<th>医院等级</th>
													<th>药厂名称</th>
													<th>国家目录编码</th>
													<th>英文名称</th>
													<th>处方药标志</th>
													<th>收费类别</th>
													<th>计量单位</th>
													<th>院内制剂标志</th>
													<th>剂型</th>
													<th>规格</th>
													<th>备注</th>
													<th>国药准字</th>
												</tr>
											</thead>
											<tbody>
											<%
											String pageNumber = request.getParameter("pageNumber");
											if (pageNumber == null || pageNumber.equals("")) {
												pageNumber = "1";
											}
											int number = Integer.parseInt(pageNumber);

											//当页面要显示的记录数
											int length = 5;
											int pagelength;

											//计算页面第一条记录的序号
											int start = (number - 1) * length;

											
											int count = DrugDAOFactory.getDrugInstance().getDrugCount();

											//计算总页数
											int total = 0;
											if (count % length == 0) {
												total = count / length;
											} else {
												total = count / length + 1;
											}
											
											
											if((start+length)<count){
												 pagelength=5;
											}else{
												 pagelength=count-start;
											}

											
											ArrayList<Drug> result = DrugDAOFactory.getDrugInstance().getAllDrugPage(start,pagelength);
													%>
													<div class="modal fade " data-backdrop="static"
						data-keyboard="false" tabindex="-1" role="dialog"
						aria-labelledby="myLargeModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
									</button>
									<h3 class="modal-title table-title">修改药品信息</h3>
								</div>
								<div class="modal-body">
									<div class="add_drugs">
										<div class="row"></div>
										<div class="row"></div>
										<form role="form">
											<div class="form-group">
												<div class="container">
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-3">药品编号：</label> <input type="text"
															class="col-md-6" placeholder="药品编号" />
														<div class="col-md-2"></div>
													</div>
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-3">药品名称：</label> <input type="text"
															class="col-md-6" placeholder="药品名称" />
														<div class="col-md-2"></div>
													</div>
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-3">英文名称：</label> <input type="text"
															class="col-md-6" placeholder="英文名称" />
														<div class="col-md-2"></div>
													</div>
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-3">处方药标志：</label> <input type="text"
															class="col-md-6" placeholder="处方药标志" />
														<div class="col-md-2"></div>
													</div>
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-3">收费类别：</label> <input type="text"
															class="col-md-2" placeholder="收费类别" /> <label
															class="col-md-2">最高限价：</label> <input type="text"
															class="col-md-2" placeholder="最高限价" />
														<div class="col-md-2"></div>
													</div>
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-3">收费项目等级：</label> <input type="text"
															class="col-md-2" placeholder="收费项目等级" /> <label
															class="col-md-2">计量单位：</label> <input type="text"
															class="col-md-2" placeholder="计量单位" />
														<div class="col-md-2"></div>
													</div>
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-3">院内制剂标志：</label> <input type="text"
															class="col-md-2" placeholder="院内制剂标志" /> <label
															class="col-md-2">医院等级：</label> <input type="text"
															class="col-md-2" placeholder="医院等级" />
														<div class="col-md-2"></div>
													</div>
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-3">剂型：</label> <input type="text"
															class="col-md-6" placeholder="剂型" />
														<div class="col-md-2"></div>
													</div>
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-3">单位：</label> <input type="text"
															class="col-md-6" placeholder="单位" />
														<div class="col-md-2"></div>
													</div>
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-3">规格：</label> <input type="text"
															class="col-md-6" placeholder="规格" />
														<div class="col-md-2"></div>
													</div>
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-3">备注：</label> <input type="text"
															class="col-md-6" placeholder="备注" />
														<div class="col-md-2"></div>
													</div>
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-3">药厂名称：</label> <input type="text"
															class="col-md-6" placeholder="药厂名称" />
														<div class="col-md-2"></div>
													</div>
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-3">国药准字：</label> <input type="text"
															class="col-md-6" placeholder="国药准字" />
														<div class="col-md-2"></div>
													</div>
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-3">国家目录编码：</label> <input type="text"
															class="col-md-6" placeholder="国家目录编码" />
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
					<%
														for(int i=0;i<pagelength;i++){
															Drug c=result.get(i);
													%>
												<tr>
													<td><input type="checkbox" name="chooseDrug" value="<%=c.getDrug_ID() %>"></td>
													<td><input type="image" src="<%=path %>/img/icn_edit.png"
														title="Edit" data-toggle="modal"
														data-target=".<%=i %>"></td>
													<td><%=c.getDrug_ID() %></td>
													<td><%=c.getName_ch() %></td>
													<td><%=c.getLevel() %></td>
													<td><%=c.getMax_price() %></td>
													<td><%=c.getIns_level() %></td>
													<td><%=c.getDrug_factory() %></td>
													<td><%=c.getNational_coding() %></td>
													<td><%=c.getName_en() %></td>
													<td><%=c.getFlag() %></td>
													<td>药品</td>
													<td><%=c.getMeasure()%></td>
													<td><%=c.getHos_level() %></td>
													<td><%=c.getForm() %></td>
													<td><%=c.getStandard()%></td>
													<td><%=c.getNotes()%></td>
													<td><%=c.getState()%></td>
												<div class="modal fade bs-example-modal-lg <%=i %>" data-backdrop="static"
						data-keyboard="false" tabindex="-1" role="dialog"
						aria-labelledby="myLargeModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
									</button>
									<h3 class="modal-title table-title">修改药品信息</h3>
								</div>
								<div class="modal-body">
									<div class="add_drugs">
										<div class="row"></div>
										<div class="row"></div>
										<form id="drug_upd<%=i%>" action="<%=path%>/updDrug"
											method="post" onsubmit="return false">
											<div class="form-group">
												<div class="container">
													<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">药品编号：</label> <input type="text" value="<%=c.getDrug_ID() %>"
												class="col-md-4 notice" name="upd_drug_ID<%=i %>" id="upd_drug_ID<%=i %>" />
											<label class="notice">编号不可修改</label>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">中文名称：</label> <input type="text"
												class="col-md-2" placeholder="<%=c.getName_ch() %>" value="<%=c.getName_ch() %>" name="upd_name_ch<%=i %>" id="upd_name_ch<%=i %>" onfocus='this.value=""'/> <label
												class="col-md-2">英文名称：</label> <input type="text"
												class="col-md-2" placeholder="<%=c.getName_en() %>" value="<%=c.getName_en() %>" name="upd_name_en<%=i %>" id="upd_name_en<%=i %>" onfocus='this.value=""'/>
											<div class="col-md-2"></div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">收费类别：</label> 
												<label class="col-md-2"
												style="text-align: left;">药品</label> <label class="col-md-2">处方药标志：</label>
											<div class="col-md-2 " style="padding-left: 0;" >
												<select style="margin-top: 5px;" name="upd_flag<%=i %>" id="upd_flag<%=i %>">
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
												<select style="margin-top: 5px;" name="upd_level<%=i %>" id="upd_level<%=i %>">
													<option value="甲">甲</option>
													<option value="乙">乙</option>
													<option value="丙">丙</option>
												</select>
											</div>
											<label class="col-md-2">医院等级：</label>
											<div class="col-md-2 " style="padding-left: 0;">
												<select style="margin-top: 5px;" name="upd_ins_level<%=i %>" id="upd_ins_level<%=i %>">
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
												<select style="margin-top: 5px;" name="upd_hos_level<%=i %>" id="upd_hos_level<%=i %>">
													<option value="是">是</option>
													<option value="否">否</option>
												</select>
											</div>
											<label class="col-md-2">是否需要审批：</label>
											<div class="col-md-2 " style="padding-left: 0;">
												<select style="margin-top: 5px;" name="upd_app_flag<%=i %>" id="upd_app_flag<%=i %>">
													<option value="是">是</option>
													<option value="否">否</option>
												</select>
											</div>
											<div class="col-md-2"></div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">最高限价：</label> <input type="text"
												class="col-md-2"placeholder="<%=c.getMax_price() %>" value="<%=c.getMax_price() %>" onfocus='this.value=""'  name="upd_max_price<%=i %>" id="upd_max_price<%=i %>"/>

											<div class="col-md-2"></div>
										</div>

										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">剂型：</label> <input type="text" 
												class="col-md-2" placeholder="<%=c.getForm() %>" value="<%=c.getForm() %>" onfocus='this.value=""'  name="upd_form<%=i %>" id="upd_form<%=i %>"/> <label
												class="col-md-2">剂量单位：</label> <input type="text"
												class="col-md-2" placeholder="<%=c.getMeasure() %>" value="<%=c.getMeasure() %>" onfocus='this.value=""' name="upd_measure<%=i %>" id="upd_measure<%=i %>"/>
											<div class="col-md-2"></div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">用法：</label> <input type="text"
												class="col-md-2" placeholder="<%=c.getUsage() %>" value="<%=c.getUsage() %>" onfocus='this.value=""' name="upd_usage<%=i %>" id="upd_usage<%=i %>" /> <label
												class="col-md-2">使用频次：</label> <input type="text"
												class="col-md-2" placeholder="<%=c.getTimes() %>" value="<%=c.getTimes() %>" onfocus='this.value=""' name="upd_times<%=i %>" id="upd_times<%=i %>" />
											<div class="col-md-2"></div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">规格：</label> <input type="text"
												class="col-md-2" placeholder="<%=c.getForm() %>" value="<%=c.getForm() %>" onfocus='this.value=""'  name="upd_standard<%=i %>" id="upd_standard<%=i %>"/> <label
												class="col-md-2">限定天数：</label> <input type="text"
												class="col-md-2" placeholder="<%=c.getDays() %>" value="<%=c.getDays() %>" onfocus='this.value=""' name="upd_days<%=i %>" id="upd_days<%=i %>" />
											<div class="col-md-2"></div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">药厂名称：</label> <input type="text"
												class="col-md-6" placeholder="<%=c.getDrug_factory() %>" value="<%=c.getDrug_factory() %>" onfocus='this.value=""' name="upd_drug_factory<%=i %>" id="upd_drug_factory<%=i %>" />
											<div class="col-md-2"></div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">国药准字：</label> <input type="text"
												class="col-md-6" placeholder="<%=c.getState() %>" value="<%=c.getState() %>" onfocus='this.value=""' name="upd_state<%=i %>" id="upd_state<%=i %>" />
											<div class="col-md-2"></div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">限定使用范围：</label> <input type="text"
												class="col-md-6" placeholder="<%=c.getUsable_range() %>" value="<%=c.getUsable_range() %>" onfocus='this.value=""' name="upd_usable_range<%=i %>" id="upd_usable_range<%=i %>" />
											<div class="col-md-2"></div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">国家目录编码：</label> <input type="text"
												class="col-md-2" placeholder="<%=c.getNational_coding() %>" value="<%=c.getNational_coding() %>" onfocus='this.value=""'  name="upd_national_coding<%=i %>" id="upd_national_coding<%=i %>"/> <label
												class="col-md-2">产地：</label> <input type="text"
												class="col-md-2" placeholder="<%=c.getOrigin() %>" value="<%=c.getOrigin() %>" onfocus='this.value=""'  name="upd_origin<%=i %>" id="upd_origin<%=i %>"/>
											<div class="col-md-2"></div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">备注：</label> <input type="text"
												class="col-md-6" placeholder="<%=c.getNotes() %>" value="<%=c.getNotes() %>" onfocus='this.value=""' name="upd_notes<%=i %>" id="upd_notes<%=i %>" />
											<div class="col-md-2"></div>
										</div>
												</div>
											</div>
										</form>
										<script type="text/javascript">
												document.getElementById("upd_flag<%=i%>").value="<%=c.getFlag()%>";
												document.getElementById("upd_level<%=i%>").value="<%=c.getLevel()%>";
												document.getElementById("upd_ins_level<%=i%>").value="<%=c.getIns_level()%>";
												document.getElementById("upd_hos_level<%=i%>").value="<%=c.getHos_level()%>";
												document.getElementById("upd_app_flag<%=i%>").value="<%=c.getApp_flag()%>";
												</script>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
									<button type="button" class="btn btn-primary"
										onclick="document.getElementById('drug_upd<%=i%>').submit();">保存</button>
								</div>
							</div>
						</div>
					</div>
												
<%} %>
											</tbody>
										</table>
</form>
									</div>
<div id="pageCode">
										<label>页码：
										<%
										if(total<=5){
										for (int n = 1; n <= total; n++) {
									%>
										<a href="<%=path %>/admin/drug/search_drug.jsp.jsp?pageNumber=<%=n%>"><%=n%></a>
										<%
											}
										}else{
											if(number==1||number==2){
												for (int n = 1; n <= 5; n++) {
													%>
														<a href="<%=path %>/admin/drug/search_drug.jsp?pageNumber=<%=n%>"><%=n%></a>
													<%}
											}else if(number==(total-1)||number==total){
												for (int n = total-4; n <= total; n++) {
													%>
														<a href="<%=path %>/admin/drug/search_drug.jsp?pageNumber=<%=n%>"><%=n%></a>
													<%}
											}else if(number>2&&number<total-1){
												%>
												<a href="<%=path %>/admin/drug/search_drug.jsp?pageNumber=<%=number-2%>"><%=number-2%></a>
												<a href="<%=path %>/admin/drug/search_drug.jsp?pageNumber=<%=number-1%>"><%=number-1%></a>
												<a href="<%=path %>/admin/drug/search_drug.jsp?pageNumber=<%=number%>"><%=number%></a>
												<a href="<%=path %>/admin/drug/search_drug.jsp?pageNumber=<%=number+1%>"><%=number+1%></a>
												<a href="<%=path %>/admin/drug/search_drug.jsp?pageNumber=<%=number+2%>"><%=number+2%></a>
											<%
											}
										}
										%>&nbsp;&nbsp;&nbsp;&nbsp;当前页：<%=number %>&nbsp;&nbsp;&nbsp;&nbsp;总计：<%=total %>页 </label>
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
	<script src="<%=path %>/js/index.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
function changeSelect(){
	var sel=document.getElementById("selectDrug").value;	
	if(sel=="allDrug"){
		document.getElementById("contextDrug").value="";
		document.getElementById("contextDrug").placeholder="请点击查找";	
	}else if(sel=="DrugId"){
		document.getElementById("contextDrug").value="";
		document.getElementById("contextDrug").placeholder="请输入搜索编号";	
	}else if(sel=="DrugName"){
		document.getElementById("contextDrug").value="";
		document.getElementById("contextDrug").placeholder="请输入搜索中文名称";	
	}else if(sel=="DrugLevel"){
		document.getElementById("contextDrug").value="";
		document.getElementById("contextDrug").placeholder="请输入收费项目等级，如“甲”、“乙”、“丙”";	
	}else if(sel=="InsLevel"){
		document.getElementById("contextDrug").value="";
		document.getElementById("contextDrug").placeholder="请输入医院等级，如“一级医院”";	
	}else if(sel=="Factory"){
		document.getElementById("contextDrug").value="";
		document.getElementById("contextDrug").placeholder="请输入制药厂名称";	
	}else if(sel=="Coding"){
		document.getElementById("contextDrug").value="";
		document.getElementById("contextDrug").placeholder="请输入国家目录编码";	
	}
};
		function submitdel() {
			document.getElementById("drugdel").submit();
		};
		function submitselect() {
			var sel=document.getElementById("selectDrug").value;			
			var con=document.getElementById("contextDrug").value;
			if(sel=="DrugId"&&con==""){
				document.getElementById("contextDrug").placeholder="请输入搜索编号";
			}else if(sel=="DrugName"&&con==""){
				document.getElementById("contextDrug").placeholder="请输入搜索名称";
			}else if(sel=="DrugLevel"&&con==""){
				document.getElementById("contextDrug").placeholder="请输入收费项目等级，如“甲”、“乙”、“丙”";
			}else if(sel=="InsLevel"&&con==""){
				document.getElementById("contextDrug").placeholder="请输入医院等级，如“一级医院”";
			}else if(sel=="Factory"&&con==""){
				document.getElementById("contextDrug").placeholder="请输入制药厂名称";
			}else if(sel=="Coding"&&con==""){
				document.getElementById("contextDrug").placeholder="请输入国家目录编码";
			}else if(sel=="allDrug"){
				document.getElementById("contextDrug").placeholder="请点击查找";
				document.getElementById("searchDrug").submit();
			}else{
				document.getElementById("searchDrug").submit();
			}
			
		};
	</script>

</body>

</html>