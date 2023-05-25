<%@ page import="com.example.project.HelloServlet" %>
<%@ page import="com.example.project.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Recoje la variable "SesionUsuario" que contiene el usuario previo con el que se ha iniciado sesión-->
<%  ServletContext context = request.getServletContext();   User u = (User) context.getAttribute("SesionUsuario");%>




<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Base de datos</title>
  </head>
  <body>
        <%//TakeParameters
            String nameUsuario = request.getParameter("NameUsuario");
            String email = request.getParameter("Email");
            String contrasena = request.getParameter("Contrasena");
            String categoria = request.getParameter("Categoria");
            String habilidad = request.getParameter("Habilidad");
            String imagen = request.getParameter("Imagen");
            String nombre = request.getParameter("Nombre");
            String apellido = request.getParameter("Apellido");
            String telefono = request.getParameter("Telefono");
            int edad = Integer.parseInt(request.getParameter("Edad"));
            String fechaCreacion = HelloServlet.getDate();
          //Inserta los valores del usuario en la base de datos
            User.createUser(nameUsuario, email, contrasena, categoria, habilidad, imagen, nombre, apellido, telefono, edad);

            if (u != null) {
                if (u.getCategoria().equals("Admin")) {
                    response.sendRedirect("../LogIn/LogInAdmin/indexAdmin.jsp");
                }
            }
            else {
                response.sendRedirect("muestraNuevaCuenta.jsp");
            }
        %>
  </body>
</html>
