<%@ page import="com.example.project.HelloServlet" %><%--
  Created by IntelliJ IDEA.
  User: Daniel
  Date: 5/23/23
  Time: 1:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>




<html>
  <head>
    <title>Title</title>
  </head>
  <body>
        <%
            int idUsuario = Integer.parseInt(request.getParameter("IdUsuario"));

            HelloServlet.borraUsuario(idUsuario);
          response.sendRedirect("indexAdmin.jsp");
        %>
  </body>
</html>
