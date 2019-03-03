<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>易售手机网管理系统</TITLE>
	</HEAD>
	<BODY style="MARGIN: 0px">
		<DIV
			style="Z-INDEX: 2; LEFT: 0px; WIDTH: 100%; POSITION: absolute; TOP: 0px; HEIGHT: 65px">
			<IFRAME id=header
				style="Z-INDEX: 1; VISIBILITY: inherit; WIDTH: 100%; HEIGHT: 65px"
				name=header src="showhead.do" frameBorder=0 scrolling=no></IFRAME>
		</DIV>
		<TABLE style="TABLE-LAYOUT: fixed" height="100%" cellSpacing=0
			cellPadding=0 width="100%" border=0>
			<TBODY>
				<TR>
					<TD width=165 height=65></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD>
						<IFRAME id=menu
							style="Z-INDEX: 1; VISIBILITY: inherit; OVERFLOW: auto; WIDTH: 100%; HEIGHT: 100%"
							name=menu src="showmenu.do" frameBorder=0 scrolling=yes></IFRAME>
					</TD>
					<TD>
						<IFRAME id=main
							style="Z-INDEX: 1; VISIBILITY: inherit; OVERFLOW: auto; WIDTH: 100%; HEIGHT: 100%"
							name=main src="showmain.do" frameBorder=0 scrolling=yes></IFRAME>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</BODY>
</HTML>