<%@ page import="com.example.project.HelloServlet" %>
<%@ page import="com.example.project.User" %>
<!-- Recoje la variable "SesionUsuario" que contiene el usuario previo con el que se ha iniciado sesión-->
<%  ServletContext context = request.getServletContext();   User u = (User) context.getAttribute("SesionUsuario");%>

<%--
  Created by IntelliJ IDEA.
  User: daniel14__gr
  Date: 23/05/2023
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>




<html>
  <head>
    <title>Title</title>
  </head>
  <body>
        <%
          int idAyuda = Integer.parseInt(request.getParameter("IdAyuda"));

          HelloServlet.borraAyuda(idAyuda);
          if (u.getCategoria().equals("Admin")) {
              response.sendRedirect("indexAdmin.jsp");
          }
          else {
              response.sendRedirect("../");
          }

        %>
  </body>
</html>
