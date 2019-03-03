<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@  page
	import="team4.factory.LogDAOFactory,team4.entity.AdminLog,java.util.*"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>查看系统日志</title>
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
									<li><a href="search_person.jsp" id="people_info">个人基本信息</a></li>
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
									<li><a href="search_facility.jsp" id="facility_info">服务设施信息</a></li>
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
								<a href="<%=path %>/admin/log/log.jsp">查看日志</a>
							</h3>
						</div>

					</div>
				</div>
			</div>
			<div class="information col-md-10">
				<div id="log">
					<div class="menu" id="subnav_log">
						<a href="admin.html"><button type="submit"
								class="btn btn-primary mybutton fr" style="margin-right: 10px;">回到首页</button></a>
					</div>
					<div class="menu-context" id="search_log">
						<div class="table-title">
							<h3>日志信息查询</h3>
						</div>
						<div class="search_log">
							<div class="panel panel-default">
								<div class="panel-heading">
									<form action="<%=path%>/searchLog" method="get"
										onsubmit="return false" id="searchLog">
										<div class="row" style="margin-top: 10px;">
											<div class="col-md-4">
												<div class="row">
													<div class="col-md-1"></div>
													<div class="col-md-4"
														style="padding: 0; margin-right: -20px;">
														<label>查询方式：</label>
													</div>
													<div class="col-md-6" style="padding: 0; margin: 0;">
														<select  class=" selectpicker form-control" onchange="changeSelect()"
															id="selectLog" name="selectLog"
															style="padding: 0; margin: 0;">
															<option  value="allLog" >所有条目</option>
															<option  value="LogUser">操作员用户名</option>
															<option selected value="LogAction">操作类型</option>
															<option value="LogTime">操作日期</option>
														</select>

													</div>
												</div>
											</div>
											<div class="col-md-4">
												<div class="row">
													<div class="col-md-4"
														style="padding: 0; margin-left: -20px; margin-right: -20px;">
														<label>起始时间：</label>
													</div>
													<div class="col-md-8" style="padding: 0; margin: 0;">
														<input type="date" class="form-control" id="fromtime" 
															name="fromtime" style="margin-top: 0;"value="${from }" onfocus='this.value=""'>
													</div>
												</div>
											</div>
											<div class="col-md-4">
												<div class="row">
													<div class="col-md-4"
														style="padding: 0; margin-left: -20px; margin-right: -20px;">
														<label>结束时间：</label>
													</div>
													<div class="col-md-8" style="padding: 0; margin: 0;">
														<input type="date" class="form-control" id="totime" 
															name="totime" style="margin-top: 0;"value="${to }" onfocus='this.value=""'>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-2">
												<div class="row">
													<div class="col-md-1"></div>
													<div class="col-md-10"
														style="padding: 0; margin-right: -20px;">
														<label>输入信息：</label>
													</div>
												</div>
											</div>
											<div class="col-md-10">
												<div class="row">
													<div class="col-md-12">
														<div class="input-group" style="padding: 0; margin-left: -50px; margin-right: 25px;">
															<input type="text" class="form-control" name="contextLog" value="${selectedContext }" onfocus='this.value=""'
																id="contextLog" style="margin-top: 0;"
																placeholder="请输入操作类型，如“添加”、“更新”、“删除”"> 
															<span class="input-group-btn">
																<button type="submit" class="btn btn-primary fr" onclick="submitselect()">查找</button>
															</span>
														</div>
													</div>
												</div>
											</div>
										</div>
								</form></div>
								<div class="panel-body">
									<div class="result">

										<table
											class="table table-condensed table-bordered table-hover result_table_log">
											<thead>
												<tr>
													<th>操作员用户名</th>
													<th>操作类型</th>
													<th>操作对象</th>
													<th>记录ID</th>
													<th>记录name</th>
													<th>操作日期</th>

												</tr>
											</thead>
											<tbody>
												<%
												String condition=(String)request.getSession().getAttribute("condition");
												String from=(String)request.getSession().getAttribute("from");
												String to=(String)request.getSession().getAttribute("to");
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
	
												int count = LogDAOFactory.getLogInstance().getLogByActionFromToCount(condition,from,to);
	
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

												ArrayList<AdminLog> result = LogDAOFactory.getLogInstance().getLogByActionFromToPage(condition,from,to,start,pagelength);
												
												for (int j = 0; j < pagelength; j++) {
													AdminLog l = result.get(j);
												%>

												<tr>

													<td><%=l.getUsername()%></td>
													<td><%=l.getAction()%></td>
													<td><%=l.getTable_name()%></td>
													<td><%=l.getRecord_ID()%></td>
													<td><%=l.getRecord_name()%></td>
													<td><%=l.getTime()%></td>
												</tr>
												<%
													}
												%>
											</tbody>
										</table>

									</div>

									<div id="pageCode">
										<label>页码：
										<%
										if(total<=5){
										for (int n = 1; n <= total; n++) {
									%>
										<a href="<%=path %>/admin/log/search_log_action_fromto.jsp?pageNumber=<%=n%>"><%=n%></a>
										<%
											}
										}else{
											if(number==1||number==2){
												for (int n = 1; n <= 5; n++) {
													%>
														<a href="<%=path %>/admin/log/search_log_action_fromto.jsp?pageNumber=<%=n%>"><%=n%></a>
													<%}
											}else if(number==(total-1)||number==total){
												for (int n = total-4; n <= total; n++) {
													%>
														<a href="<%=path %>/admin/log/search_log_action_fromto.jsp?pageNumber=<%=n%>"><%=n%></a>
													<%}
											}else if(number>2&&number<total-1){
												%>
												<a href="<%=path %>/admin/log/search_log_action_fromto.jsp?pageNumber=<%=number-2%>"><%=number-2%></a>
												<a href="<%=path %>/admin/log/search_log_action_fromto.jsp?pageNumber=<%=number-1%>"><%=number-1%></a>
												<a href="<%=path %>/admin/log/search_log_action_fromto.jsp?pageNumber=<%=number%>"><%=number%></a>
												<a href="<%=path %>/admin/log/search_log_action_fromto.jsp?pageNumber=<%=number+1%>"><%=number+1%></a>
												<a href="<%=path %>/admin/log/search_log_action_fromto.jsp?pageNumber=<%=number+2%>"><%=number+2%></a>
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

	<script src="<%=path%>/js/jquery-2.2.0.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="<%=path%>/js/bootstrap.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="<%=path%>/js/index.js" type="text/javascript"
		charset="utf-8"></script>
	<script type="text/javascript">
	function changeSelect(){
		var sel=document.getElementById("selectLog").value;	
		if(sel=="allLog"){
			document.getElementById("contextLog").value="";
			document.getElementById("contextLog").placeholder="请点击查找";	
		}else if(sel=="LogUser"){
			document.getElementById("contextLog").value="";
			document.getElementById("contextLog").placeholder="请输入操作员用户名";	
		}else if(sel=="LogAction"){
			document.getElementById("contextLog").value="";
			document.getElementById("contextLog").placeholder="请输入操作类型，如“添加”、“更新”、“删除”";	
		}else {
			document.getElementById("contextLog").value="";
			document.getElementById("contextLog").placeholder="请选择时间";	
		}
	}
		function submitselect() {
			var sel=document.getElementById("selectLog").value;	
			var from=document.getElementById("fromtime").value;	
			var to=document.getElementById("totime").value;	
			var con=document.getElementById("contextLog").value;
			
			if(from!=""&&to!=""&&from>to){
				document.getElementById("contextLog").value="";
				document.getElementById("contextLog").placeholder="起始时间不能小于结束时间，请重新选择";
				document.getElementById("totime").value="";
			}else{
			
			if(sel=="LogUser"&&con==""){
				document.getElementById("contextLog").placeholder="请输入操作员用户名";	
			}else if(sel=="LogAction"&&con==""){
				document.getElementById("contextLog").placeholder="请输入操作类型，如“添加”、“更新”、“删除”";	
			}else if(sel=="LogTime"&&from==""&&to==""){
				document.getElementById("contextLog").placeholder="请选择时间";	
			}else if(sel=="allLog"){
				document.getElementById("contextLog").placeholder="请点击查找";	
				document.getElementById("searchLog").submit();
			}else{
				document.getElementById("searchLog").submit();
			}
			}
		};
	</script>

</body>

</html>
