<%@ page import="com.example.project.Help" %>
<%@ page import="com.example.project.HelloServlet" %>
<%@ page import="com.example.project.User" %>
<!-- Recoje la variable "SesionUsuario" que contiene el usuario previo con el que se ha iniciado sesión-->
<%  ServletContext context = request.getServletContext();   User u = (User) context.getAttribute("SesionUsuario");%>
<%--
  Created by IntelliJ IDEA.
  User: Daniel
  Date: 20/05/2023
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
  </head>
  <body>
        <%
            int idAyuda = Integer.parseInt(request.getParameter("takeIdAyuda"));
            HelloServlet.estadoAyuda(idAyuda, u.getIdUsuario());
            response.sendRedirect("indexContribuyente.jsp");
        %>
  </body>
</html>
