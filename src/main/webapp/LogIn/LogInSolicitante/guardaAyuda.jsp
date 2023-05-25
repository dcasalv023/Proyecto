<%@ page import="com.example.project.User" %>
<%@ page import="com.example.project.Help" %>
<%@ page import="com.example.project.HelloServlet" %>
<!-- Recoje la variable "SesionUsuario" que contiene el usuario previo con el que se ha iniciado sesión-->
<%  ServletContext context = request.getServletContext();   User u = (User) context.getAttribute("SesionUsuario");%>
<%--
  Created by IntelliJ IDEA.
  User: Daniel
  Date: 5/18/23
  Time: 12:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Title</title>
</head>
<body>
<%  //TakeParameters
    String titulo = request.getParameter("Titulo");
    String descripcion = request.getParameter("Descripcion");



    int idAyuda = Help.createHelp(u.getIdUsuario(), titulo, descripcion);
%>
<% out.print(Help.read(idAyuda));%>
</body>
</html>
