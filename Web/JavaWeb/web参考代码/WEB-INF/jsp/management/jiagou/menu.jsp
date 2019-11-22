<%@ page language="java" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=utf-8">
		<LINK id=css href="${pageContext.request.contextPath}/css/style.css" type=text/css rel=stylesheet>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/common.js">
		</script>
		<script type="text/javascript">
	function collapse_change(menucount) {	
		if ($('menu_' + menucount).style.display == 'none') {
			$('menu_' + menucount).style.display = '';
			$('menuimg_' + menucount).src = '../css/menu_reduce.gif';
		} else {
			$('menu_' + menucount).style.display = 'none';
			$('menuimg_' + menucount).src = '../css/menu_add.gif';
		}
			
	}
</SCRIPT>

		<META content="MSHTML 6.00.6001.18203" name=GENERATOR>
	</HEAD>
	<BODY style="MARGIN: 5px">
		<TABLE class=leftmenulist style="MARGIN-BOTTOM: 5px" cellSpacing=0
			cellPadding=0 width=146 align=center border=0>
			<TBODY>
				<TR class=leftmenutext>
					<TD>
						<DIV align=center>
							<A href="../catalog/main.do" target="_block">首页</A>&nbsp;&nbsp;
						</DIV>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		
		<DIV id="student">
			<TABLE class=leftmenulist style="MARGIN-BOTTOM: 5px" cellSpacing=0
				cellPadding=0 width=146 align=center border=0>
				<TBODY>
					<TR class=leftmenutext>
						<TD>
							<IMG id="menuimg_11" src="../css/menu_reduce.gif" border=0>&nbsp;
							<A onclick="collapse_change(11);return false;" href="#">客户管理</A>
						</TD>
					</TR>
				</TBODY>
				<TBODY id=menu_11>
					<TR class=leftmenutd>
						<TD>
							<TABLE class=leftmenuinfo cellSpacing=0 cellPadding=0 border=0>
								<TBODY>
									<TR>
										<TD>
											<A
												href="showSearch.do"
												target=main>查找客户</A>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</DIV>
		
		<DIV id="resource" style="display:none">
			<TABLE class=leftmenulist style="MARGIN-BOTTOM: 5px" cellSpacing=0
				cellPadding=0 width=146 align=center border=0>
				<TBODY>
					<TR class=leftmenutext>
						<TD>
							<IMG id="menuimg_21" src="../css/menu_reduce.gif" border=0>&nbsp;
							<A onclick="collapse_change(21);return false;" href="#">产品管理</A>
						</TD>
					</TR>
				</TBODY>
				<TBODY id=menu_21>
					<TR class=leftmenutd>
						<TD>
							<TABLE class=leftmenuinfo cellSpacing=0 cellPadding=0 border=0>
								<TBODY>
									<TR>
										<TD>
											<A
												href="showform1.do"
												target=main>添加产品</A>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
					<TR class=leftmenutd>
						<TD>
							<TABLE class=leftmenuinfo cellSpacing=0 cellPadding=0 border=0>
								<TBODY>
									<TR>
										<TD>
											<A
												href="showsearch.do"
												target=main>产品信息</A>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</DIV>
		
		<DIV id="clazz" style="display:none">
			<TABLE class=leftmenulist style="MARGIN-BOTTOM: 5px" cellSpacing=0
				cellPadding=0 width=146 align=center border=0>
				<TBODY>
					<TR class=leftmenutext>
						<TD>
							<IMG id="menuimg_31" src="../css/menu_reduce.gif" border=0>&nbsp;
							<A onclick="collapse_change(31);return false;" href="#">订单管理</A>
						</TD>
					</TR>
				</TBODY>
				<TBODY id=menu_31>
					<TR class=leftmenutd>
						<TD>
							<TABLE class=leftmenuinfo cellSpacing=0 cellPadding=0 border=0>
								<TBODY>
									<TR>
										<TD>
											<A
												href="searchOrderForm.do"
												target=main>查找订单</A>
										</TD>
									</TR>
									<TR>
										<TD>
											<A
												href="showAllOrder.do"
												target=main>查看订单信息</A>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			
		</DIV>


		<TABLE class=leftmenulist cellSpacing=0 cellPadding=0 width=146
			align=center border=0>
			<TBODY>
				<TR class=leftmenutext>
					<TD>
						<DIV style="MARGIN-LEFT: 48px">
							<A href="#"
								target=_top>退出</A>
						</DIV>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</BODY>
</HTML>
