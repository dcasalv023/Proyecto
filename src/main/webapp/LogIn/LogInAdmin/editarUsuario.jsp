<%@ page import="com.example.project.User" %>
<%@ page import="com.example.project.HelloServlet" %>
<% int idUsuario = Integer.parseInt(request.getParameter("IdUsuario"));     User u = HelloServlet.takeUserId(idUsuario);%>
<%--
  Created by IntelliJ IDEA.
  User: daniel14__gr
  Date: 23/05/2023
  Time: 21:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>




<html>
  <head>
    <title>Title</title>
  </head>
  <body class="Formulario">
        <h1 class="Usuario">Modificación del usuario <%= u.getNameUsuario()%></h1>

        <form class="Forma" method="post" action="guardaEditarUsuario.jsp">

          <!-- IdUsuario -->
          <input type="hidden" value="<%= u.getIdUsuario()%>" name="IdUsuario">

          <!-- NameUsuario -->
          <label for="UserName">Antiguo UserName: <%= u.getNameUsuario()%></label>              <input id="UserName" type="text" name="NameUsuario" required>
          <br><br>

          <!-- Email -->
          <label for="Email">Antiguo email: <%= u.getEmail()%></label>                    <input id="Email" type="email" name="Email" required>
          <br><br>

          <!-- Contraseña -->
          <label for="Contrasena">Antigua contraseña: <%= u.getContrasena()%></label>          <input id="Contrasena" type="password" name="Contrasena" required>
          <br><br>

          <!-- Habilidad-->
          <%  if ( (u.getCategoria().equals("Contribuyente")) ) {
            out.println("<label for=\"Habilidad\">Antigua habilidad: " + u.getHabilidad() + "</label> <input id=\"Habilidad\" type=\"text\" name=\"Habilidad\">"
                    +   "<br><br>");} %>

          <!-- Imagen -->
          <label for="Imagen">Antigua imagen: <%= u.getImagen()%></label>                  <input id="Imagen" type="image" name="Imagen" required>
          <br><br>

          <!-- Nombre -->
          <label for="Nombre">Antiguo nombre: <%= u.getNombre()%></label>                  <input id="Nombre" type="text" name="Nombre" required>
          <br><br>

          <!-- Apellido -->
          <label for="Apellido">Antiguo apellido: <%= u.getApellido()%></label>              <input id="Apellido" type="text" name="Apellido" required>
          <br><br>

          <!-- Teléfono -->
          <label for="Telefono">Antiguo teléfono: <%= u.getTelefono()%></label>              <input id="Telefono" type="text" maxlength="9" name="Telefono" required>
          <br><br>

          <!-- Edad -->
          <label for="Edad">Antigua edad: <%= u.getEdad()%></label>                      <input id="Edad" type="number" name="Edad" min="18" required>
          <br><br>

          <!-- Botón CrearUsuario -->
          <input type="submit" value="Modificar cuenta">
        </form>
  </body>
</html>
