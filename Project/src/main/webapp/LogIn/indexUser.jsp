<%@ page import="com.example.project.HelloServlet" %>
<%@ page import="com.example.project.User" %>
<%//Guardamos en variables ambos parámetros (usuario, contraseña)
    String nameUsuario = request.getParameter("takeNameUsuario");   String contrasena = request.getParameter("takeContrasena");
  //Introducimos las variables en la función, la cual nos devolverá un objeto User, acorde al nombre de usuario y la contraseña, sino el objeto será null
    User u = HelloServlet.takeUserPassword(nameUsuario, contrasena);
  //Guardamos en context al usuario que inicia sesión
    ServletContext context = request.getServletContext();   context.setAttribute("SesionUsuario", u);
%>
<%--
  Created by IntelliJ IDEA.
  com.example.project.User: Daniel
  Date: 09/05/2023
  Time: 20:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>




<html>
  <head>
      <title>IndexUser</title>
  </head>
  <body>
        <h1>Bienvenido <%= u.getNameUsuario()%></h1>

        <% //Se declara una variable llamada 'jsp' y se inicializa como una cadena vacia
             String jsp = "";
           //Evaluamos el valor  de la categoria del usuario ('u.getCategoria()') y se asigna un valor especifico a la variable 'jsp' segun la categoria del usuario
             if(u.getCategoria().equals("Admin")) { jsp = "LogInAdmin/indexAdmin.jsp"; }
             if(u.getCategoria().equals("Contribuyente")) { jsp = "LogInContribuyente/indexContribuyente.jsp"; }
             if(u.getCategoria().equals("Solicitante")) { jsp = "LogInSolicitante/indexSolicitante.jsp"; }

           response.sendRedirect(jsp);
        %>
  </body>
</html>
