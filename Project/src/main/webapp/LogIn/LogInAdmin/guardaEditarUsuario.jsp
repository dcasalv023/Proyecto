<%@ page import="com.example.project.HelloServlet" %><%--
  Created by IntelliJ IDEA.
  User: daniel14__gr
  Date: 23/05/2023
  Time: 23:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>




<html>
  <head>
      <title>Title</title>
  </head>
  <body>
        <h1>AAAA</h1>

        <%//Parameters
            int idUsuario = Integer.parseInt(request.getParameter("IdUsuario"));
            String nameUsuario = request.getParameter("NameUsuario");
            String email = request.getParameter("Email");
            String contrasena = request.getParameter("Contrasena");
            String habilidad = request.getParameter("Habilidad");
            String imagen = request.getParameter("Imagen");
            String nombre = request.getParameter("Nombre");
            String apellido = request.getParameter("Apellido");
            String telefono = request.getParameter("Telefono");
            int edad = Integer.parseInt(request.getParameter("Edad"));

            HelloServlet.modificaUsuario(idUsuario, nameUsuario, email, contrasena, habilidad, imagen, nombre, apellido, telefono, edad);

            response.sendRedirect("indexAdmin.jsp");
        %>
  </body>
</html>