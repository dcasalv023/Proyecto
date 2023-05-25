<%@ page import="com.example.project.User" %>
<!-- Recoje la variable "SesionUsuario" que contiene el usuario previo con el que se ha iniciado sesión-->
<%  ServletContext context = request.getServletContext();   User u = (User) context.getAttribute("SesionUsuario");%>
<%--
  Created by IntelliJ IDEA.
  User: Daniel
  Date: 17/05/2023
  Time: 22:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>




<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Solicitante</title>
  </head>
  <body>
        <a href="crearAyuda.jsp">Crear Ayuda</a>
        <a href="verAyuda.jsp">Ver mis solicitudes</a>
  </body>
</html>
