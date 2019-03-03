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
<title>增加个人信息</title>
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
									<li><a href="search_person.jsp" id="people_info">个人基本信息
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
								<a href="log.jsp">查看日志</a>
							</h3>
						</div>

					</div>
				</div>
			</div>
			<div class="information col-md-10">
				<div id="person">
					<div class="menu" name="subnav_person" id="subnav_person">
						<a href="search_person.jsp"><button type="submit"
								class="btn btn-primary mybutton ">查询信息</button></a> <a
							href="add_person.jsp"><button type="submit"
								class="btn btn-primary mybutton active">增加信息</button></a> <a
							href="admin.jsp"><button type="submit"
								class="btn btn-primary mybutton fr" style="margin-right: 10px;">回到首页</button></a>
					</div>
					<div class="menu-context" name="add_persons" id="add_persons">
						<div class="table-title">
							<h3>个人基本信息</h3>
						</div>
						<div class="add_persons">
							<div class="row" id="errorPerson"></div>
							<div class="row" ></div>
							<form id="addPer" method="post" action="<%=path %>/addPerson">
								<div class="form-group">
									<div class="container">
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">身份证编号：</label> <input type="text"
												class="col-md-4 must" placeholder="身份证号码" name="ID_number" id="ID_number" />
											<div class="col-md-2"></div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">姓名：</label> <input type="text"
												class="col-md-4 must" placeholder="姓名" name="per_name" id="per_name" /> 
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">出生日期：</label>
											<div class="col-md-4">
												<input type="date" style="margin-left: -15px;" name="birthday" id="birthday"/>
											</div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">性别：</label>
											<div class="col-md-2 " style="padding-left: 0;">
												<select style="margin-top: 5px;" name="sex" id="sex">
													<option value="男">男</option>
													<option value="女">女</option>
												</select>
											</div>
											<label class="col-md-2">民族：</label>
											<div class="col-md-2 " style="padding-left: 0;">
												<select style="margin-top: 5px;" name="nation" id="nation">
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
												<select style="margin-top: 5px;" name="reg_cha" id="reg_cha">
													<option value="城镇">城镇</option>
													<option value="乡村">乡村</option>
												</select>
											</div>
											<label class="col-md-2">户口所在地：</label> <input type="text"
												class="col-md-2" placeholder="户口所在地" name="reg_pla" id="reg_pla"/>
											<div class="col-md-2"></div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">文化程度：</label>
											<div class="col-md-2 " style="padding-left: 0;">
												<select style="margin-top: 5px;" name="cul_stan" id="cul_stan">
													<option value="大学">大学</option>
													<option value="高中">高中</option>
													<option value="初中">初中</option>
													<option value="小学">小学</option>
													<option value="文盲">文盲</option>
												</select>
											</div>
											<label class="col-md-2">政治面貌：</label>
											<div class="col-md-2 " style="padding-left: 0;">
												<select style="margin-top: 5px;" name="pol_sta" id="pol_sta">
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
												<select style="margin-top: 5px;" name="mar_sta" id="mar_sta">
													<option value="已婚">已婚</option>
													<option value="未婚">未婚</option>
												</select>
											</div>
											<label class="col-md-2">居民类别：</label>
											<div class="col-md-2 " style="padding-left: 0;">
												<select style="margin-top: 5px;" name="resident_f" id="resident_f">
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
											<label class="col-md-3">单位编号：</label> <input type="text"
												class="col-md-2 " placeholder="单位编号" name="dep_number" id="dep_number" /> <label
												class="col-md-2">离退休状态：</label>
											<div class="col-md-2 " style="padding-left: 0;">
												<select style="margin-top: 5px;"name="state" id="state">
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
												<select style="margin-top: 5px; height: 27px;" name="per_category" id="per_category">
													<option value="新农村合作医疗保险">新农村合作医疗保险</option>
													<option value="城镇居民医疗保险">城镇居民医疗保险</option>
													<option value="城镇职工医疗保险">城镇职工医疗保险</option>
												</select>
											</div>
											<div class="col-md-2"></div>
										</div>
										<div class="row">
											<div class="col-md-1"></div>
											<label class="col-md-3">医疗机构编号：</label> 
											<input type="text" class="col-md-4 must" placeholder="医疗机构编号"name="ins_number" id="ins_number" />
											
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
		$("#addPer").validate({
            rules: {
            	ID_number: {
					minlength: 18,
					maxlength: 18,
					remote:{
						url:"../checkPersonId",
						type:"POST",
						data:{
							ID_number:function(){return $("#ID_number").val();}
						}
					}
				}
            },
            messages:{
            	ID_number: {
					required: "必须填写身份证编号",
					minlength: "身份证编号为18位",
					maxlength: "身份证编号为18位",
					remote:"该人员信息已经添加至数据库"
				},
				per_name:{
					required: "必须填写人员姓名"
				},
				ins_number:{
					required: "必须填写医疗机构编号"
				}
            },
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
