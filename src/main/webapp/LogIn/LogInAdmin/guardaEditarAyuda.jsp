<%@ page import="com.example.project.HelloServlet" %><%--
  Created by IntelliJ IDEA.
  User: daniel14__gr
  Date: 23/05/2023
  Time: 23:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
  </head>
  <body>
        <h1>dsd</h1>
        <%//Parameters
            int idAyuda = Integer.parseInt(request.getParameter("IdAyuda"));
            String titulo = request.getParameter("Titulo");
            String descripcion = request.getParameter("Descripcion");
            HelloServlet.modificaAyuda(idAyuda, titulo, descripcion);

            response.sendRedirect("indexAdmin.jsp");
        %>

  </body>
</html>
