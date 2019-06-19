<%@ page language="java" pageEncoding="gb2312" %>
  <%
    String path= request.getContextPath();
    String basePath= request.getScheme()+" ://" +request.getServerName()+" :"
    +request.getServerPort()+path+" /" ;
    %>
    <%@ page language="java" import="java.sql.*" %>
    <!-- jsp:useBean???JSP?????????????JSP??????JavaBean?jsp:useBean????????? -->
    <!-- ????JavaBean?????????????????????????????? -->  
    <jsp:useBean id="connDbBean" scope="page" class="db.db" />
        <!DOCTYPE HTML PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN">
        <html>

          <head>
            <base href="<%=basePath%>">

            <title>My JSP 'adminyanzheng.jsp' starting page</title>


          </head>

          <body>
            <%

              //??HTTP????
              String id=request.getParameter(" id" );
              String tablename=request.getParameter(" tablename" );

              //??Sql??
              String sql="delete from"+tablename+" where id="+id+"";

              //JavaBean????????
              connDbBean.executeUpdate(sql);
              //?????????HTML??
              out.print("<script>alert('Success');location.href='"+request.getHeader("Referer")+"';</script>");
            %>
          </body>

        </html>