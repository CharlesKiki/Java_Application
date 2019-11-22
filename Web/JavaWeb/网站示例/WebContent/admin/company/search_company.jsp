<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@  page import="team4.factory.CompanyDAOFactory,team4.entity.Company,java.util.*"%>
<%  String path = request.getContextPath();%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>查询单位信息</title>
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
									<li><a href="<%=path%>/admin/person/search_person.jsp" id="people_info">个人基本信息</a></li>
									<li><a href="<%=path%>/admin/company/search_company.jsp" id="company_info">单位基本信息
											<div class="glyphicon glyphicon-ok fr"></div>
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
						<div id="collapseTwo" class="panel-collapse collapse">
							<div class="panel-body">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="<%=path%>/admin/search_institution.jsp"
										id="institution_info">医疗机构信息</a></li>
									<li><a href="<%=path%>/admin/facility/search_facility.jsp" id="facility_info">服务设施信息</a></li>
									<li><a href="<%=path%>/admin/disease/search_disease.jsp" id="disease_info">病种信息</a></li>
									<li><a href="<%=path%>/admin/drug/search_drug.jsp" id="drug_info">药品信息</a></li>
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
				<div class="company">
					<div class="menu"  id="subnav_person">
						<a href="<%=path%>/admin/company/search_company.jsp"><button type="submit"
								class="btn btn-primary mybutton active">查询信息</button></a> <a
							href="<%=path%>/admin/company/add_company.jsp"><button type="submit"
								class="btn btn-primary mybutton">增加信息</button></a> <a
							href="<%=path%>/admin/admin.jsp"><button type="submit"
								class="btn btn-primary mybutton fr" style="margin-right: 10px;">回到首页</button></a>
					</div>
					<div class="menu-context"  id="search_company">
						<div class="table-title">
							<h3>单位信息查询</h3>
						</div>
						<div class="search_company">
							<div class="panel panel-default">
								<div class="panel-heading">

									<div class="row" style="margin-top: 10px;">
									<form action="<%=path%>/searchCompany" method="get"
											onsubmit="return false" id="searchCompany">
										<div class="col-md-2" style="padding-right: 0;">
											<label class="fr" style="margin-top: 7px;">查询方式：</label>
										</div>
										<div class="col-md-3" style="padding-left: 0;">
											<select class="selectpicker form-control " onchange="changeSelect()"
											id="selectCompany" name="selectCompany">
												<option selected value="allCompany">所有条目</option>
												<option value="companyId">单位编号</option>
												<option value="companyName">单位名称</option>
											</select>
										</div>
										<div class="col-md-2" style="padding-right: 0;">
											<label class="fr" style="margin-top: 7px;">输入项：</label>
										</div>
										<div class="col-md-5" style="padding-left: 0;">
											<div class="input-group">
												<input type="text" class="form-control" placeholder="请点击查找" style="margin-top: 0;" name="contextCompany"
														id="contextCompany">
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
									<form id="comdel" action="<%=path%>/delCompany" method="get" onsubmit="return false">
										<table
											class="table table-condensed table-bordered table-hover result_table_company">
											<thead>
												<tr>
													<th><input id="checkall" type="checkbox">
														<button class="btn btn-danger btn-xs" onclick="submitdel()">删除</button></th>
													<th>操作</th>
													<th>单位编号</th>
													<th>单位名称</th>
													<th>地址</th>
													<th>邮编</th>
													<th>联系电话</th>
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

											
											int count = CompanyDAOFactory.getCompanyInstance().getCompanyCount();

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

											
											ArrayList<Company> result = CompanyDAOFactory.getCompanyInstance().getAllCompanyPage(start,pagelength);
													%>
													<div class="modal fade bs-example-modal-lg" data-backdrop="static"
						data-keyboard="false" tabindex="-1" role="dialog"
						aria-labelledby="myLargeModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
									</button>
									<h3 class="modal-title table-title">修改单位基本信息</h3>
								</div>
								<div class="modal-body">
									<div class="add_companies">
										<div class="row"></div>
										<div class="row"></div>
										<form role="form">
											<div class="form-group">
												<div class="container">
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-3">单位编号：</label> <input type="text"
															class="col-md-6" placeholder="" />
														<div class="col-md-2"></div>
													</div>
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-3">单位名称：</label> <input type="text"
															class="col-md-6" placeholder="" />
														<div class="col-md-2"></div>
													</div>
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-3">地址：</label> <input type="text"
															class="col-md-6" placeholder="" />
														<div class="col-md-2"></div>
													</div>
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-3">邮编：</label> <input type="text"
															class="col-md-6" placeholder="" />
														<div class="col-md-2"></div>
													</div>
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-3">联系电话：</label> <input type="text"
															class="col-md-6" placeholder="" />
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
															Company c=result.get(i);
													%>
												<tr>
													<td><input type="checkbox" name="chooseCompany" value="<%=c.getCon_ID() %>"></td>
													<td><input type="image" src="<%=path %>/img/icn_edit.png"
														title="Edit" data-toggle="modal"
														data-target=".<%=i %>"></td>
													<td><%=c.getCon_ID() %></td>
													<td><%=c.getName() %></td>
													<td><%=c.getAddress() %></td>
													<td><%=c.getContact() %></td>
													<td><%=c.getPostcode() %></td>
												</tr>
												<div class="modal fade bs-example-modal-lg <%=i %>" data-backdrop="static"
						data-keyboard="false" tabindex="-1" role="dialog"
						aria-labelledby="myLargeModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
									</button>
									<h3 class="modal-title table-title">修改单位基本信息</h3>
								</div>
								<div class="modal-body">
									<div class="add_companies">
										<div class="row"></div>
										<div class="row"></div>
										<form id="company_upd<%=i%>" action="<%=path%>/updCompany"
											method="post" onsubmit="return false">
											<div class="form-group">
												<div class="container">
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-3">单位编号：</label> <input type="text" 
															class="col-md-4 notice" value="<%=c.getCon_ID() %>"
															name="upd_con_ID<%=i %>" id="upd_con_ID<%=i %>"/>
														<label class="notice">单位编号不可修改</label>
													</div>
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-3">单位名称：</label> <input type="text"
															class="col-md-6" placeholder="<%=c.getName() %>" 
															value="<%=c.getName() %>" onfocus='this.value=""'
															name="upd_name<%=i%>" id="upd_name<%=i%>"/>
														<div class="col-md-2"></div>
													</div>
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-3">地址：</label> <input type="text"
															class="col-md-6" placeholder="<%=c.getAddress() %>" 
															value="<%=c.getAddress() %>" onfocus='this.value=""'
															name="upd_address<%=i%>" id="upd_address<%=i%>"/>
														<div class="col-md-2"></div>
													</div>
													<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">联系电话：</label> <input type="text"
															class="col-md-2" placeholder="<%=c.getContact() %>" 
															value="<%=c.getContact() %>" onfocus='this.value=""'
															name="upd_contact<%=i%>" id="upd_contact<%=i%>"/> <label
												class="col-md-2">邮编：</label> <input type="text"
															class="col-md-2" placeholder="<%=c.getPostcode() %>" 
															value="<%=c.getPostcode() %>" onfocus='this.value=""'
															name="upd_postcode<%=i%>" id="upd_postcode<%=i%>"/>
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
										onclick='document.getElementById("company_upd<%=i%>").submit();'>保存</button>
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
										<a href="<%=path %>/admin/company/search_company.jsp?pageNumber=<%=n%>"><%=n%></a>
										<%
											}
										}else{
											if(number==1||number==2){
												for (int n = 1; n <= 5; n++) {
													%>
														<a href="<%=path %>/admin/company/search_company.jsp?pageNumber=<%=n%>"><%=n%></a>
													<%}
											}else if(number==(total-1)||number==total){
												for (int n = total-4; n <= total; n++) {
													%>
														<a href="<%=path %>/admin/company/search_company.jsp?pageNumber=<%=n%>"><%=n%></a>
													<%}
											}else if(number>2&&number<total-1){
												%>
												<a href="<%=path %>/admin/company/search_company.jsp?pageNumber=<%=number-2%>"><%=number-2%></a>
												<a href="<%=path %>/admin/company/search_company.jsp?pageNumber=<%=number-1%>"><%=number-1%></a>
												<a href="<%=path %>/admin/company/search_company.jsp?pageNumber=<%=number%>"><%=number%></a>
												<a href="<%=path %>/admin/company/search_company.jsp?pageNumber=<%=number+1%>"><%=number+1%></a>
												<a href="<%=path %>/admin/company/search_company.jsp?pageNumber=<%=number+2%>"><%=number+2%></a>
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
		var sel=document.getElementById("selectCompany").value;	
		if(sel=="allCompany"){
			document.getElementById("contextCompany").value="";
			document.getElementById("contextCompany").placeholder="请点击查找";	
		}else if(sel=="companyId"){
			document.getElementById("contextCompany").value="";
			document.getElementById("contextCompany").placeholder="请输入搜索编号";	
		}else if(sel=="companyName"){
			document.getElementById("contextCompany").value="";
			document.getElementById("contextCompany").placeholder="请输入搜索名称";	
		}
	};
		function submitdel() {
			document.getElementById("comdel").submit();
		};
		function submitselect() {
			var sel = document.getElementById("selectCompany").value;
			var con = document.getElementById("contextCompany").value;
			if (sel == "companyId" && con == "") {
				document.getElementById("contextCompany").placeholder = "请输入搜索编号";
			} else if (sel == "companyName" && con == "") {
				document.getElementById("contextCompany").placeholder = "请输入搜索名称";
			} else if (sel = "allCompany") {
				document.getElementById("contextCompany").placeholder = "请点击查找";
				document.getElementById("searchCompany").submit();
			} else {
				document.getElementById("searchCompany").submit();
			}

		};
	</script>
</body>

</html>
