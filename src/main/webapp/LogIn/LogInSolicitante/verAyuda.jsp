<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.project.Help" %>
<%@ page import="com.example.project.User" %>
<%  ServletContext context = request.getServletContext();   User u = (User) context.getAttribute("SesionUsuario");%>
<%--
  Created by IntelliJ IDEA.
  User: daniel14__gr
  Date: 24/05/2023
  Time: 0:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>




<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  ArrayList<Help> Ayudas = Help.getNewHelp();
  ArrayList<Help> noAyudas = new ArrayList<>();

  for (Help h: Ayudas) {
    if (h.getIdSolicitante() == u.getIdUsuario()) {
      noAyudas.add(h);

      out.print("<div class=\"div\" >");
      out.print("   Titulo: <b>" + h.getTitulo()+ "</b> <br>");
      out.print("   Descripción: " + h.getDescripcion() + "<br>");
      out.print("   Estado: " + h.getEstado() + "<br>");
      out.print("   Fecha: " + h.getFecha() + "<br>");
      out.print("   IdSolicitante: " + u.getNombre());
      out.print("   <input type=\"hidden\" name=\"takeIdAyuda\" value=\"" + h.getIdAyuda() + "\">");
      out.print("<form method=\"get\" action=\"../LogInAdmin/borrarAyuda.jsp\">" +
                  "<input type=\"hidden\" value=\"" + h.getIdAyuda() + "\" name=\"IdAyuda\">" +
                  "<input type=\"submit\" value=\"Borrar\">" +
                "</form>");
      out.print("</div>");
    }
  }
  if (noAyudas.isEmpty()) {
    out.print("Esto es lo que hay primo");
  }
%>

</body>
</html>
