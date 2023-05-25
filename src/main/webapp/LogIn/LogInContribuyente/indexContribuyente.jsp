<%@ page import="com.example.project.User" %>
<%@ page import="com.example.project.Help" %>
<%@ page import="com.example.project.HelloServlet" %>
<%@ page import="java.util.ArrayList" %>
<!-- Recoje la variable "SesionUsuario" que contiene el usuario previo con el que se ha iniciado sesión-->
<%  ServletContext context = request.getServletContext();   User u = (User) context.getAttribute("SesionUsuario");%>
<%--
  Created by IntelliJ IDEA.
  User: daniel14__gr
  Date: 17/05/2023
  Time: 22:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>




<html>
  <head>
      <link rel="stylesheet" type="text/css" href="../../CSS/styleContribuyente.css">
      <title>Ayudas</title>
  </head>
  <body>
        <nav>
            <div><%=u.getNombre()%></div>
            <a href="verContribuciones.jsp">Ver contribuciones</a>
        </nav>

        <h1>Ayudas</h1>

        <%  ArrayList<Help> noAyudas = new ArrayList<>();

            for (Help h : Help.getNewHelp()) {
                User userAyuda = HelloServlet.takeUserId(h.getIdSolicitante());

                if (h.getIdContribuyente() == 0) {
                    noAyudas.add(h);

                    out.print("<div class=\"div\" >");
                    out.print("  <form method=\"post\" action=\"estadoAyuda.jsp\">");
                    out.print("     Titulo: <b>" + h.getTitulo()+ "</b> <br>");
                    out.print("     Descripción: " + h.getDescripcion() + "<br>");
                    out.print("     Estado: " + h.getEstado() + "<br>");
                    out.print("     Fecha: " + h.getFecha() + "<br>");
                    out.print("     IdSolicitante: " + userAyuda.getNombre());
                    out.print("     <input type=\"hidden\" name=\"takeIdAyuda\" value=\"" + h.getIdAyuda() + "\">");
                    out.print("     <input type=\"submit\" value=\"Ayudar\">");
                    out.print("  </form>");
                    out.print("</div>");
                }
            }
            if (noAyudas.isEmpty()) {
                out.print("Esto es lo que hay primo");
            }
        %>
  </body>
</html>
