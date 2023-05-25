<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>




<!DOCTYPE html>
<html>
  <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link rel="stylesheet" type="text/css" href="../CSS/styleCrearUsuario.css">
      <title>Formulario</title>
  </head>
  <body class="Formulario">
        <h1 class="Usuario">Formulario de los Usuarios</h1>

        <form class="Forma" method="post" action="guardaUsuario.jsp">

            <!-- NameUsuario -->
            <label for="UserName">UserName</label>              <input id="UserName" type="text" name="NameUsuario" required>
            <br><br>

            <!-- Email -->
            <label for="Email">Email</label>                    <input id="Email" type="email" name="Email" required>
            <br><br>

            <!-- Contraseña -->
            <label for="Contrasena">Contraseña</label>          <input id="Contrasena" type="password" name="Contrasena" required>
            <br><br>

            <!-- Categoría-->
            <% String categoria = request.getParameter("Categoria"); %>
            <input type="hidden" name="Categoria" value="<%= categoria%>">

            <!-- Habilidad-->
            <%  if ( (categoria.equals("Contribuyente")) ) {
                out.println("<label for=\"Habilidad\">Habilidad </label> <input id=\"Habilidad\" type=\"text\" name=\"Habilidad\">"
                        +   "<br><br>");}   %>

            <!-- Imagen -->
            <label for="Imagen">Imagen</label>                  <input id="Imagen" type="image" name="Imagen" required>
            <br><br>

            <!-- Nombre -->
            <label for="Nombre">Nombre</label>                  <input id="Nombre" type="text" name="Nombre" required>
            <br><br>

            <!-- Apellido -->
            <label for="Apellido">Apellido</label>              <input id="Apellido" type="text" name="Apellido" required>
            <br><br>

            <!-- Teléfono -->
            <label for="Telefono">Teléfono</label>              <input id="Telefono" type="text" maxlength="9" name="Telefono" required>
            <br><br>

            <!-- Edad -->
            <label for="Edad">Edad</label>                      <input id="Edad" type="number" name="Edad" min="18" required>
            <br><br>

            <!-- Botón CrearUsuario -->
            <input type="submit" value="Crear cuenta">
        </form>
  </body>
</html>
