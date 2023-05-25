<%--
  Created by IntelliJ IDEA.
  User: Daniel
  Date: 22/05/2023
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>




<html>
  <head>
    <title>Title</title>
  </head>
  <body>
        <p>Datos creados correctamente!!</p>

        <!-- Muestra un parrado que indica que el usuario esta siendo redirigido a otra pagina en 5 segundos. -->
        <p>A continuación será dirigido a la página de inicio de sesión en <span id="countdown">5 segundos</span></p>

        <!-- Este codigo javascript se encarga de realizar una cuenta regresiva de 5 segundos
        y redirigir al usuario a la pagina de inicio de sesion despues que el contador llegue a cero. -->
        <script type="text/javascript">
          var seconds = 5;
          var countdownElement = document.getElementById("countdown");

          function countdown() {
              if(seconds != 1) {
                  countdownElement.innerHTML = seconds + " segundos";
              } else {
                  countdownElement.innerHTML = seconds + " segundo";
              }

              seconds--;

              if (seconds < 0) {
                  clearInterval(countdownInterval);
                  window.location.href = "../LogIn/logIn.jsp";
              }
          }
          var countdownInterval = setInterval(countdown, 1000);
        </script>
  </body>
</html>
