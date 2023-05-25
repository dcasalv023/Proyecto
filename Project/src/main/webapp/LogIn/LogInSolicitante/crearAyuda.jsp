<%@ page import="com.example.project.User" %>
<!-- Recoje la variable "SesionUsuario" que contiene el usuario previo con el que se ha iniciado sesión-->
<%  ServletContext context = request.getServletContext();   User u = (User) context.getAttribute("SesionUsuario");%>
<%--
  Created by IntelliJ IDEA.
  User: Daniel
  Date: 5/18/23
  Time: 12:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>




<html>
  <head>
      <link rel="stylesheet" type="text/css" href="../../CSS/styleCrearAyuda.css">
      <title class="Titulo2">Ayuda</title>
  </head>
  <body class="body">
        <form method="post" action="guardaAyuda.jsp">
            <label for="Titulo">TITULO</label>    <br>         <input id="Titulo" type="text" name="Titulo" required>
            <br><br>

            <label for="Descripcion">DESCRIPCION</label> <br> <textarea id="Descripcion" name="Descripcion" cols="40" rows="5"></textarea>
            <br><br>

            <input type="submit" name="Solicitar ayuda">
        </form>
        <p>
            Su email y número de teléfono serán proporcionados para que el contribuyente, el cual le prestará la ayuda, pueda contactar con usted.
        </p>
        <p>
            Por favor, verifique que sus datos están correctos, si no es así cambielos.
        </p>
        <p>
            email: <%= u.getEmail()%> <a href="../Modificaciones/cambiaContacto.jsp?cambia=Email" title="cambiaEmail"> <input type="button" name="changeEmail" value="Modificar Email"> </a>
        </p>
        <p>
            Teléfono: <%= u.getTelefono()%> <a href="../Modificaciones/cambiaContacto.jsp?cambia=Telefono" title="cambiaTelefono"> <input type="button" name="changeTelefono" value="Modificar Teléfono"> </a>
        </p>
  </body>
</html>