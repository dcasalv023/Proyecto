<%--
  Created by IntelliJ IDEA.
  User: Daniel
  Date: 22/05/2023
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
      <link rel="stylesheet" type="text/css" href="../../CSS/styleCrearUsuario.css">
  </head>
  <body>
        <form method="get" action="guardaContacto.jsp">
            <%
                String cambia = request.getParameter("cambia");
                out.print("<label for=\"Cambio\">Nuevo " + cambia + "</label> <br>");

                if (cambia.equals("Email")) {
                    out.print("<input id=\"Cambio\" type=\"email\" name=\"Email\" required>");
                }

                if (cambia.equals("Telefono")) {
                    out.print("<input id=\"Cambio\" type=\"text\" maxlength=\"9\" name=\"Telefono\" required>");
                }
            %>
            <br>

            <input type="submit" value="Cambiar <%= cambia%>">
        </form>
  </body>
</html>
