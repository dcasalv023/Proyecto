<%@ page import="com.example.project.User" %>
<%@ page import="com.example.project.HelloServlet" %>
<%@ page import="com.example.project.Help" %>
<!-- Recoje la variable "SesionUsuario" que contiene el usuario previo con el que se ha iniciado sesión-->
<%  ServletContext context = request.getServletContext();   User u = (User) context.getAttribute("SesionUsuario");%>
<%--
  Created by IntelliJ IDEA.
  User: Daniel
  Date: 17/05/2023
  Time: 22:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>




<html>
  <head>
    <title>Title</title>
      <link rel="stylesheet" type="text/css" href="../../CSS/styleIndexAdmin.css">
  </head>
  <body>
        <h1>Bienvendio <%= u.getNameUsuario() %></h1>
        <h1>Admin</h1>
        <table border="2">
            <tr class="trUsuario">
                <th>IDUsuario</th>
                <th>NameUsuario</th>
                <th>Email</th>
                <th>Contraseña</th>
                <th>Categoria</th>
                <th>Imagen</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Telefono</th>
                <th>Edad</th>
                <th>FechaCreacion</th>
            </tr>
            <%  for(User uAdm : User.newUsers) {
                if (uAdm.getCategoria().equals("Admin")) {
                    out.print("<tr class=\"rowUsuario\">");
                    out.print("<td>" + uAdm.getIdUsuario() + "</td>");
                    out.print("<td>" + uAdm.getNameUsuario() + "</td>");
                    out.print("<td>" + uAdm.getEmail() + "</td>");
                    out.print("<td>" + uAdm.getContrasena() + "</td>");
                    out.print("<td>" + uAdm.getCategoria() + "</td>");
                    out.print("<td>" + uAdm.getImagen() + "</td>");
                    out.print("<td>" + uAdm.getNombre() + "</td>");
                    out.print("<td>" + uAdm.getApellido() + "</td>");
                    out.print("<td>" + uAdm.getTelefono() + "</td>");
                    out.print("<td>" + uAdm.getEdad() + "</td>");
                    out.print("<td>" + uAdm.getFechaCreacion() + "</td>");
                    out.print("<td>" +
                                "<form method=\"get\" action=\"./editarUsuario.jsp\">" +
                                    "<input type=\"hidden\" value=\"" + uAdm.getIdUsuario() + "\" name=\"IdUsuario\">" +
                                    "<input type=\"submit\" value=\"Editar\">" +
                                "</form>" +
                              "</td>");
                    out.print("<td>" +
                                "<form method=\"get\" action=\"./borrarUsuario.jsp\">" +
                                    "<input type=\"hidden\" value=\"" + uAdm.getIdUsuario() + "\" name=\"IdUsuario\">" +
                                    "<input type=\"submit\" value=\"Borrar\">" +
                                "</form>" +
                              "</td>");
                    out.print("</tr>");
                    out.print("</tr>");
                }
            } %>
            <tr class="rowAdd">
                <form method="get" action="../../CrearCuenta/guardaUsuario.jsp">
                    <td></td>
                    <td><input type="text" name="NameUsuario" required></td>
                    <td><input type="text" name="Email" required></td>
                    <td><input type="password" name="Contrasena" required></td>
                    <td><input type="hidden" name="Categoria" value="Admin">Admin</td>
                    <td><input type="image" name="Imagen" required></td>
                    <td><input type="text" name="Nombre" required></td>
                    <td><input type="text" name="Apellido" required></td>
                    <td><input type="text"  maxlength="9" name="Telefono" required></td>
                    <td><input type="number" min="18" name="Edad" required></td>
                    <td>AA MM DD hh:mm</td>
                    <td colspan="2"><input type="submit" value="+"></td>
                </form>
            </tr>
        </table>






        <h1>Contribuyente</h1>
        <table border="2" >
            <tr class="trUsuario">
                <th>IDUsuario</th>
                <th>NameUsuario</th>
                <th>Email</th>
                <th>Contraseña</th>
                <th>Categoria</th>
                <th>Habilidad</th>
                <th>Imagen</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Telefono</th>
                <th>Edad</th>
                <th>FechaCreacion</th>
            </tr>
            <%  for(User uCon : User.newUsers) {
                if (uCon.getCategoria().equals("Contribuyente")) {
                    out.print("<tr class=\"rowUsuario\">");
                    out.print("<td>" + uCon.getIdUsuario() + "</td>");
                    out.print("<td>" + uCon.getNameUsuario() + "</td>");
                    out.print("<td>" + uCon.getEmail() + "</td>");
                    out.print("<td>" + uCon.getContrasena() + "</td>");
                    out.print("<td>" + uCon.getCategoria() + "</td>");
                    out.print("<td>" + uCon.getHabilidad() + "</td>");
                    out.print("<td>" + uCon.getImagen() + "</td>");
                    out.print("<td>" + uCon.getNombre() + "</td>");
                    out.print("<td>" + uCon.getApellido() + "</td>");
                    out.print("<td>" + uCon.getTelefono() + "</td>");
                    out.print("<td>" + uCon.getEdad() + "</td>");
                    out.print("<td>" + uCon.getFechaCreacion() + "</td>");
                    out.print("<td>" +
                                "<form method=\"get\" action=\"./editarUsuario.jsp\">" +
                                    "<input type=\"hidden\" value=\"" + uCon.getIdUsuario() + "\" name=\"IdUsuario\">" +
                                    "<input type=\"submit\" value=\"Editar\">" +
                                "</form>" +
                              "</td>");
                    out.print("<td>" +
                                    "<form method=\"get\" action=\"./borrarUsuario.jsp\">" +
                                        "<input type=\"hidden\" value=\"" + uCon.getIdUsuario() + "\" name=\"IdUsuario\">" +
                                        "<input type=\"submit\" value=\"Borrar\">" +
                                    "</form>" +
                              "</td>");
                    out.print("</tr>");
                }
            } %>
            <tr class="rowAdd">
                <form method="get" action="../../CrearCuenta/guardaUsuario.jsp">
                    <td></td>
                    <td><input type="text" name="NameUsuario" required></td>
                    <td><input type="text" name="Email" required></td>
                    <td><input type="password" name="Contrasena" required></td>
                    <td><input type="hidden" name="Categoria" value="Contribuyente">Contribuyente</td>
                    <td><input type="text" name="Habilidad"></td>
                    <td><input type="image" name="Imagen" required></td>
                    <td><input type="text" name="Nombre" required></td>
                    <td><input type="text" name="Apellido" required></td>
                    <td><input type="text" maxlength="9" name="Telefono" required></td>
                    <td><input type="number" min="18" name="Edad" required></td>
                    <td>AA MM DD hh:mm</td>
                    <td colspan="2"><input type="submit" value="+"></td>
                </form>
            </tr>
        </table>






        <h1>Solicitantes</h1>
        <table border="2">
            <tr class="trUsuario">
                <th>IDUsuario</th>
                <th>NameUsuario</th>
                <th>Email</th>
                <th>Contraseña</th>
                <th>Categoria</th>
                <th>Imagen</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Telefono</th>
                <th>Edad</th>
                <th>FechaCreacion</th>
            </tr>
            <%  for (User uSoli : User.newUsers) {
                if (uSoli.getCategoria().equals("Solicitante")) {
                    out.print("<tr class=\"rowUsuario\">");
                    out.print("<td>" + uSoli.getIdUsuario() + "</td>");
                    out.print("<td>" + uSoli.getNameUsuario() + "</td>");
                    out.print("<td>" + uSoli.getEmail() + "</td>");
                    out.print("<td>" + uSoli.getContrasena() + "</td>");
                    out.print("<td>" + uSoli.getCategoria() + "</td>");
                    out.print("<td>" + uSoli.getImagen() + "</td>");
                    out.print("<td>" + uSoli.getNombre() + "</td>");
                    out.print("<td>" + uSoli.getApellido() + "</td>");
                    out.print("<td>" + uSoli.getTelefono() + "</td>");
                    out.print("<td>" + uSoli.getEdad() + "</td>");
                    out.print("<td>" + uSoli.getFechaCreacion() + "</td>");
                    out.print("<td>" +
                                "<form method=\"get\" action=\"./editarUsuario.jsp\">" +
                                    "<input type=\"hidden\" value=\"" + uSoli.getIdUsuario() + "\" name=\"IdUsuario\">" +
                                    "<input type=\"submit\" value=\"Editar\">" +
                                "</form>" +
                              "</td>");
                    out.print("<td>" +
                                "<form method=\"get\" action=\"./borrarUsuario.jsp\">" +
                                    "<input type=\"hidden\" value=\"" + uSoli.getIdUsuario() + "\" name=\"IdUsuario\">" +
                                    "<input type=\"submit\" value=\"Borrar\">" +
                                "</form>" +
                              "</td>");
                    out.print("</tr>");
                    out.print("</tr>");
                }
            }
            %>
            <tr class="rowAdd">
                <form method="get" action="../../CrearCuenta/guardaUsuario.jsp">
                    <td></td>
                    <td><input type="text" name="NameUsuario" required></td>
                    <td><input type="text" name="Email" required></td>
                    <td><input type="password" name="Contrasena" required></td>
                    <td><input type="hidden" name="Categoria" value="Solicitante">Solicitante</td>
                    <td><input type="image" name="Imagen" required></td>
                    <td><input type="text" name="Nombre" required></td>
                    <td><input type="text" name="Apellido" required></td>
                    <td><input type="text" maxlength="9" name="Telefono" required></td>
                    <td><input type="number" min="18" name="Edad" required></td>
                    <td>AA MM DD hh:mm</td>
                    <td colspan="2"><input type="submit" value="+"></td>
                </form>
            </tr>
        </table>






        <h1>Ayudas</h1>
        <table border="2">
            <tr class="trAyuda">
                <th>IdAyuda</th>
                <th>Título</th>
                <th>Descripción</th>
                <th>Fecha</th>
                <th>Estado</th>
                <th>IdSolicitante</th>
                <th>IdContribuyente</th>
            </tr>
            <%  for(Help h : Help.newHelps) {
                out.print("<tr class=\"rowAyuda\">");
                out.print("<td>" + h.getIdAyuda() + "</td>");
                out.print("<td>" + h.getTitulo() + "</td>");
                out.print("<td>" + h.getDescripcion() + "</td>");
                out.print("<td>" + h.getFecha() + "</td>");
                out.print("<td>" + h.getEstado() + "</td>");
                out.print("<td>" + h.getIdSolicitante() + "</td>");
                out.print("<td>" + h.getIdContribuyente() + "</td>");
                out.print("<td>" +
                            "<form method=\"get\" action=\"./editarAyuda.jsp\">" +
                                "<input type=\"hidden\" value=\"" + h.getIdAyuda() + "\" name=\"IdAyuda\">" +
                                "<input type=\"submit\" value=\"Editar\">" +
                            "</form>" +
                          "</td>");
                out.print("<td>" +
                            "<form method=\"get\" action=\"./borrarAyuda.jsp\">" +
                                "<input type=\"hidden\" value=\"" + h.getIdAyuda() + "\" name=\"IdAyuda\">" +
                                "<input type=\"submit\" value=\"Borrar\">" +
                            "</form>" +
                          "</td>");
                out.print("</tr>");
            } %>
        </table>
  </body>
</html>
