<%@ page import="com.example.project.HelloServlet" %>
<%@ page import="com.example.project.User" %>
<!-- Recoje la variable "SesionUsuario" que contiene el usuario previo con el que se ha iniciado sesión-->
<%  ServletContext context = request.getServletContext();   User u = (User) context.getAttribute("SesionUsuario");%>
<%--
  Created by IntelliJ IDEA.
  User: Daniel
  Date: 22/05/2023
  Time: 21:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>




<html>
  <head>
      <title>Title</title>
  </head>
  <body>
        <%
            String email = request.getParameter("Email");
            String telefono = request.getParameter("Telefono");

            if(email != null) {
                User userNew = HelloServlet.cambioEmail(u.getIdUsuario(), email);
                context.setAttribute("SesionUsuario", userNew);
                out.print("Email cambiado con éxito");
            }

            if(telefono != null) {
                User userNew = HelloServlet.cambioTelefono(u.getIdUsuario(), telefono);
                context.setAttribute("SesionUsuario", userNew);
                out.print("Telefono cambiado con éxito");
            }


            if(u.getCategoria().equals("Contribuyente")) {}
            if(u.getCategoria().equals("Solicitante")) {
                response.sendRedirect("../LogInSolicitante/crearAyuda.jsp");
            }
        %>
  </body>
</html>
