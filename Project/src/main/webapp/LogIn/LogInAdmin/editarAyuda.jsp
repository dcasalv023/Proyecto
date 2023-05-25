<%@ page import="com.example.project.Help" %>
<%@ page import="com.example.project.HelloServlet" %>
<% int idAyuda = Integer.parseInt(request.getParameter("IdAyuda"));     Help h = HelloServlet.takeAyudaId(idAyuda);%>
<%--
  Created by IntelliJ IDEA.
  User: daniel14__gr
  Date: 23/05/2023
  Time: 23:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>




<html>
  <head>
    <title>Title</title>
  </head>
  <body class="body">
        <form method="post" action="guardaEditarAyuda.jsp">

          <input type="hidden" value="<%= h.getIdAyuda()%>" name="IdAyuda">

          <label for="Titulo">Antiguo titulo: <%= h.getTitulo()%></label>    <br>         <input id="Titulo" type="text" name="Titulo" required>
          <br><br>

          <label for="Descripcion">Antigua descripcion <%= h.getDescripcion()%></label> <br> <textarea id="Descripcion" name="Descripcion" cols="40" rows="5"></textarea>
          <br><br>

          <input type="submit" name="Solicitar ayuda">
        </form>
  </body>
</html>
