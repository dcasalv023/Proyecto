<%--
  Created by IntelliJ IDEA.
  com.example.project.User: Daniel
  Date: 9/5/23
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>




<html>
  <head>
      <link rel="stylesheet" type="text/css" href="../CSS/styleLogin.css">
      <title>Log In</title>
  </head>
  <body>
  <div class="container">
        <form method="post" action="indexUser.jsp">
            <input type="text" name="takeNameUsuario" placeholder="Usuario">
            <br>

            <input type="password" name="takeContrasena" placeholder="Contraseña">
            <br>

            <input type="submit" value="Iniciar Sesión"> <br>
        </form>

        <a href="../CrearCuenta/seleccionCategoria.jsp">Crear Cuenta</a>
  </div>
  </body>
</html>
