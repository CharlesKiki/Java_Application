<%@ page language="java" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<LINK id=css href="${pageContext.request.contextPath}/css/style.css" type=text/css rel=stylesheet>
		<SCRIPT>
var menus = new Array('student','resource','clazz');
function togglemenu(id) {
	if(parent.menu) {  // parent 
		for(i=0;i<menus.length;i++) {	
		    var k = menus[i];
			if(parent.menu.document.getElementById(k)) {
				parent.menu.document.getElementById(k).style.display = (k == id ? '' : 'none');
			}
		}
	}
}

function sethighlight(n) {
	var lis = document.getElementsByTagName('li');
	for(var i = 0; i < lis.length; i++) {
		lis[i].id = '';
	}
	lis[n].id = 'menuon';
}

</SCRIPT>

		<META content="MSHTML 6.00.6001.18203" name=GENERATOR>
	</HEAD>
	<BODY>
		<TABLE class=topmenubg cellSpacing=0 cellPadding=0 width="100%"
			border=0>
			<TBODY>
				<TR>
					<TD width=160 rowSpan=2>
						<DIV class=logo>
							<SPAN class=editiontext>手机市场<SPAN
								class=editionnumber>1.0.0</SPAN> <BR>管理系统</SPAN>
						</DIV>
					</TD>
					<TD>
						<DIV class="topmenu">
							<UL>
								<LI id="menuon">
									<SPAN><A
										onclick="sethighlight(0); togglemenu('student'); parent.main.location='showmain.do';return false;"
										href="#">客户管理</A> </SPAN>
								</LI>
								<LI>
									<SPAN><A
										onclick="sethighlight(1); togglemenu('resource'); parent.main.location='showmain.do';return false;"
										href="#">产品管理</A> </SPAN>
								</LI>
								<LI>
									<SPAN><A
										onclick="sethighlight(2); togglemenu('clazz'); parent.main.location='showmain.do';return false;"
										href="#">订单管理</A> </SPAN>
								</LI>
							</UL>
						</DIV>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</BODY>
</html>
