<%--
  Created by IntelliJ IDEA.
  com.example.project.User: Daniel
  Date: 08/05/2023
  Time: 22:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>




<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Categoría</title>
  <link rel="stylesheet" type="text/css" href="../CSS/styleSeleccionCategoria.css">
</head>
<body>
<div class="container">
  <article>
    <a href="crearUsuario.jsp?Categoria=Contribuyente" title="Contribuyente">
      <img src="../CSS/Images/seleccionContribuyente.jpg" class="categoria" alt="Imagen 1" width="100%" height="99%">
      <p class="Contribuyente">Contribuyente</p>
    </a>
  </article>

  <article>
    <a href="crearUsuario.jsp?Categoria=Solicitante" title="Solicitante">
      <img src="../CSS/Images/seleccionSolicitante.jpg" class="categoria" alt="Imagen 2" width="100%" height="99%">
      <p class="Solicitante">Solicitante</p>
    </a>
  </article>
</div>
</body>
</html>



