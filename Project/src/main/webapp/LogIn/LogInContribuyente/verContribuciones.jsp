<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.project.Help" %>
<%@ page import="com.example.project.User" %>
<!-- Recoje la variable "SesionUsuario" que contiene el usuario previo con el que se ha iniciado sesión-->
<%  ServletContext context = request.getServletContext();   User u = (User) context.getAttribute("SesionUsuario");%>

<%--
  Created by IntelliJ IDEA.
  User: daniel14__gr
  Date: 24/05/2023
  Time: 0:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
  </head>
  <body>
        <h1>dsadasd</h1>

        <%
          ArrayList<Help> ayudas = Help.getNewHelp();
          ArrayList<Help> noAyudas = new ArrayList<>();

          for (Help h: ayudas) {
            if (h.getIdContribuyente() == u.getIdUsuario()) {
              noAyudas.add(h);

              out.print("<div class=\"div\" >");
              out.print("     Titulo: <b>" + h.getTitulo()+ "</b> <br>");
              out.print("     Descripción: " + h.getDescripcion() + "<br>");
              out.print("     Estado: " + h.getEstado() + "<br>");
              out.print("     Fecha: " + h.getFecha() + "<br>");
              out.print("     IdSolicitante: " + u.getNombre());
              out.print("     <input type=\"hidden\" name=\"takeIdAyuda\" value=\"" + h.getIdAyuda() + "\">");
              out.print("</div>");
            }
          }
          if (noAyudas.isEmpty()) {
            out.print("Esto es lo que hay primo");
          }
        %>
  </body>
</html>
