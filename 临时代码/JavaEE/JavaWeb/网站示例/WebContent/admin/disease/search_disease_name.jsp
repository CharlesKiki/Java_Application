<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@  page import="team4.factory.DiseaseDAOFactory,team4.entity.Disease,java.util.*"%>
<%  String path = request.getContextPath();%>  
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>查询病种信息</title>
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
									<li><a href="<%=path%>/admin/disease/search_disease.jsp" id="disease_info">病种信息
									<div class="glyphicon glyphicon-ok fr"></div></a></li>
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
				<div id="disease">
					<div class="menu" name="subnav_disease" id="subnav_disease">
						<a href="<%=path%>/admin/disease/search_disease.jsp"><button type="submit"
								class="btn btn-primary mybutton active">查询信息</button></a> <a
							href="<%=path%>/admin/disease/add_disease.jsp"><button type="submit"
								class="btn btn-primary mybutton">增加信息</button></a> <a
							href="<%=path%>/admin/admin.jsp"><button type="submit"
								class="btn btn-primary mybutton fr" style="margin-right: 10px;">回到首页</button></a>
					</div>
					<div class="menu-context" name="search_disease" id="search_disease">
						<div class="table-title">
							<h3>病种信息查询</h3>
						</div>
						<div class="search_disease">
							<div class="panel panel-default">
								<div class="panel-heading">

									<div class="row" style="margin-top: 10px;">
										<form action="<%=path%>/searchDisease" method="get"
											onsubmit="return false" id="searchDisease">
										<div class="col-md-2" style="padding-right: 0;">
											<label class="fr" style="margin-top: 7px;">查询方式：</label>
										</div>
										<div class="col-md-3" style="padding-left: 0;">
											<select class="selectpicker form-control " onchange="changeSelect()" name="selectDisease" id="selectDisease">
												<option value="allDisease">所有条目</option>
												<option value="DiseaseId">病种编号</option>
												<option selected value="DiseaseName">病种名称</option>
											</select>
										</div>
										<div class="col-md-2" style="padding-right: 0;">
											<label class="fr" style="margin-top: 7px;">输入项：</label>
										</div>
										<div class="col-md-5" style="padding-left: 0;">
											<div class="input-group">
												<input type="text" class="form-control"placeholder="请点击查找" style="margin-top: 0;" name="contextDisease"
														id="contextDisease"><span class="input-group-btn">
													<button type="submit" class="btn btn-primary fr">查找</button>
												</span>
											</div>
										</div>
										</form>
									</div>

								</div>
								<div class="panel-body">
									<div class="result">
                                          <form id="disdel" action="<%=path%>/delDisease" method="get" onsubmit="return false">
										<table
											class="table table-condensed table-bordered table-hover result_table_disease">
											<thead>
												<tr>
													<th><input id="checkall" type="checkbox">
														<button class="btn btn-danger btn-xs" onclick="submitdel()">删除</button></th>
													<th>操作</th>
													<th>疾病编码</th>
													<th>病种名称</th>
													<th>病种报销标志</th>
													<th>备注</th>
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

											String selectedContext=(String)request.getSession().getAttribute("selectedContext");
											int count = DiseaseDAOFactory.getDiseaseInstance().getDiseaseByNameCount(selectedContext);

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

											
											ArrayList<Disease> result = DiseaseDAOFactory.getDiseaseInstance().getDiseaseByNamePage(selectedContext,start,pagelength);
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
									<h3 class="modal-title table-title">修改病种信息</h3>
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
														<label class="col-md-3">疾病编号：</label> <input type="text"
															class="col-md-6" placeholder="" />
														<div class="col-md-2"></div>
													</div>
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-3">病种名称：</label> <input type="text"
															class="col-md-6" placeholder="" />
														<div class="col-md-2"></div>
													</div>
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-3">病种报销标志：</label> <input type="text"
															class="col-md-6" placeholder="" />
														<div class="col-md-2"></div>
													</div>
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-3">备注：</label> <input type="text"
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
															Disease c=result.get(i);
													%>
													<tr>
													<td><input type="checkbox" name="chooseDisease" value="<%=c.getDis_ID() %>"></td>
													<td><input type="image" src="<%=path %>/img/icn_edit.png"
														title="Edit" data-toggle="modal"
														data-target=".<%=i %>"></td>
													<td><%=c.getDis_ID() %></td>
													<td><%=c.getName() %></td>
													<td><%=c.getFlag() %></td>
													<td><%=c.getNotes() %></td>
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
									<h3 class="modal-title table-title">修改病种信息</h3>
								</div>
								<div class="modal-body">
									<div class="add_companies">
										<div class="row"></div>
										<div class="row"></div>
										<form id="disease_upd<%=i%>" action="<%=path%>/updDisease"
											method="post" onsubmit="return false">
											<div class="form-group">
												<div class="container">
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-3">疾病编号：</label> <input type="text" 
															class="col-md-4 notice" value="<%=c.getDis_ID() %>"
															name="upd_dis_ID<%=i %>" id="upd_dis_ID<%=i %>"/>
														<label class="notice">编号不可修改</label>
													</div>
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-3">病种名称：</label> <input type="text"
															class="col-md-6"  placeholder="<%=c.getName() %>" 
															value="<%=c.getName() %>" onfocus='this.value=""'
															name="upd_name<%=i%>" id="upd_name<%=i%>"/>
														<div class="col-md-2"></div>
													</div>
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-3">病种报销标志：</label> <div class="col-md-2 " style="padding-left: 0;">
												<select style="margin-top: 5px;" name="upd_flag<%=i %>" id="upd_flag<%=i %>">
													<option value="是">是</option>
													<option value="否">否</option>
												</select>
												<script type="text/javascript">
												document.getElementById("upd_flag<%=i%>").value="<%=c.getFlag()%>";
												</script>
											</div>
													</div>
													<div class="row">
														<div class="col-md-1"></div>
														<label class="col-md-3">备注：</label> <input type="text"
															class="col-md-6" placeholder="<%=c.getNotes() %>" 
															value="<%=c.getNotes() %>" onfocus='this.value=""'
															name="upd_notes<%=i%>" id="upd_notes<%=i%>"/>
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
										onclick='document.getElementById("disease_upd<%=i%>").submit();'>保存</button>
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
										<a href="<%=path %>/admin/disease/search_disease.jsp?pageNumber=<%=n%>"><%=n%></a>
										<%
											}
										}else{
											if(number==1||number==2){
												for (int n = 1; n <= 5; n++) {
													%>
														<a href="<%=path %>/admin/disease/search_disease.jsp?pageNumber=<%=n%>"><%=n%></a>
													<%}
											}else if(number==(total-1)||number==total){
												for (int n = total-4; n <= total; n++) {
													%>
														<a href="<%=path %>/admin/disease/search_disease.jsp?pageNumber=<%=n%>"><%=n%></a>
													<%}
											}else if(number>2&&number<total-1){
												%>
												<a href="<%=path %>/admin/disease/search_disease.jsp?pageNumber=<%=number-2%>"><%=number-2%></a>
												<a href="<%=path %>/admin/disease/search_disease.jsp?pageNumber=<%=number-1%>"><%=number-1%></a>
												<a href="<%=path %>/admin/disease/search_disease.jsp?pageNumber=<%=number%>"><%=number%></a>
												<a href="<%=path %>/admin/disease/search_disease.jsp?pageNumber=<%=number+1%>"><%=number+1%></a>
												<a href="<%=path %>/admin/disease/search_disease.jsp?pageNumber=<%=number+2%>"><%=number+2%></a>
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
		var sel=document.getElementById("selectDisease").value;	
		if(sel=="allDisease"){
			document.getElementById("contextDisease").value="";
			document.getElementById("contextDisease").placeholder="请点击查找";	
		}else if(sel=="DiseaseId"){
			document.getElementById("contextDisease").value="";
			document.getElementById("contextDisease").placeholder="请输入搜索编号";	
		}else if(sel=="DiseaseName"){
			document.getElementById("contextDisease").value="";
			document.getElementById("contextDisease").placeholder="请输入搜索名称";	
		}
	};
		function submitdel() {
			document.getElementById("disdel").submit();
		};
		function submitselect() {
			var sel = document.getElementById("selectDisease").value;
			var con = document.getElementById("contextDisease").value;
			if (sel == "DiseaseId" && con == "") {
				document.getElementById("contextDisease").placeholder = "请输入搜索编号";
			} else if (sel == "DiseaseName" && con == "") {
				document.getElementById("contextDisease").placeholder = "请输入搜索名称";
			} else if (sel = "allDisease") {
				document.getElementById("contextDisease").placeholder = "请点击查找";
				document.getElementById("searchDisease").submit();
			} else {
				document.getElementById("searchDisease").submit();
			}

		};
	</script>
</body>

</html>