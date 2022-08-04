<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.devel.modelo.Usuario" %>

<jsp:include page="WEB-INF/static/head.jsp">
	<jsp:param value="Beltron" name="title"/>
</jsp:include>
<% Usuario sesion = (Usuario)(request.getSession().getAttribute("usuario"));%>
<%
String contexto, valor, clase = "none";
if (sesion != null) {
	if (sesion.isSuperUser()) {
		contexto = request.getContextPath().concat("/administrador.jsp");
	} else {
		contexto = request.getContextPath().concat("/detalles.jsp");
	}
	valor = sesion.getCorreo();
} else {
	contexto = "#modal1";
	valor = "Iniciar sesi&oacute;n";
	clase = "modal-trigger";
}
%>
<body>
  <jsp:include page="WEB-INF/static/nav.jsp">
  	<jsp:param value='<%=clase %>' name="clase"/>
  	<jsp:param value='<%=contexto %>' name="opcion"/>
  	<jsp:param value='<%=valor %>' name="valor"/>
  </jsp:include>
  
  <div class="slider">
    <ul class="slides">
      <li>
        <img src="https://lorempixel.com/580/250/nature/1">
        <div class="caption center-align">
          <h3>Nuevos Ingresos ¡Ahora!</h3>
          <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
          <a href="Catalogo" id="download-button" class="btn-large waves-effect waves-light teal lighten-1">¡Empezar a comprar ya!</a>
        </div>
      </li>
      <li>
        <img src="https://lorempixel.com/580/250/nature/2">
        <div class="caption left-align">
          <h3>Left Aligned Caption</h3>
          <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
        </div>
      </li>
      <li>
        <img src="https://lorempixel.com/580/250/nature/3">
        <div class="caption right-align">
          <h3>Right Aligned Caption</h3>
          <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
        </div>
      </li>
      <li>
        <img src="https://lorempixel.com/580/250/nature/4">
        <div class="caption center-align">
          <h3>Nuevos Ingresos ¡Ahora!</h3>
          <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
          <a href="Catalogo" id="download-button" class="btn-large waves-effect waves-light teal lighten-1">¡Empezar a comprar ya!</a>
        </div>
      </li>
    </ul>
  </div>

  <div class="container">
    <div class="section">

      <!--   Icon Section   -->
      <div class="row">
        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center brown-text"><i class="material-icons">flash_on</i></h2>
            <h5 class="center">Compra de manera rápida y segura</h5>

            <p class="light">Compra de forma rápida y segura por nuestra tienda online, escoge tus productos y procesa tu pedido y ¡Listo! 🥰 Sigue estos pasos y espera la entrega de tu pedido! 🌟 *Delivery gratis a nivel de Puerto Maldonado</p>
          </div>
        </div>

        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center brown-text"><i class="material-icons">group</i></h2>
            <h5 class="center">Experiencia única de usuario</h5>
            <p class="light">Con nuestro catálogo de productos, ahora es más facil comprar, te ofrecemos una interfaz limpia y sencila para poder escoger los productos que gustes. Con una disponibilidad de 24 horas.</p>
          </div>
        </div>

        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center brown-text"><i class="material-icons">settings</i></h2>
            <h5 class="center">Es fácil trabajar con nosotros</h5>

            <p class="light">¿Eres proveedor? Pues estas con los mejores en venta a nivel nacional, solo tienes que registrarte para empezar a comprar. :)</p>
          </div>
        </div>
      </div>

    </div>
  </div>


  <div class="parallax-container valign-wrapper">
    <div class="section no-pad-bot">
      <div class="container">
        <div class="row center">
          <h5 class="header col s12 light">A modern responsive front-end framework based on Material Design</h5>
        </div>
      </div>
    </div>
    <div class="parallax"><img src="img/bg2.jpg" alt="Unsplashed background img 2"></div>
  </div>

  <div class="container">
    <div class="section">

      <div class="row">
        <div class="col s12 center">
          <h3><i class="mdi-content-send brown-text"></i></h3>
          <h4>Cont&aacute;ctate con Nosotros</h4>
          <p class="left-align light">Gracias por tu interés en comunicarte con el equipo de Beltron. Te sugerimos que empieces escribiendo a una sola dirección de correo electrónico; si escribes a varias direcciones, podrías retrasar nuestra respuesta.
Hacemos todo lo posible por responder a todos los mensajes que recibimos.
Recuerda que no publicamos infografías ni cubrimos historias u otras campañas.</p>
        </div>
      </div>

    </div>
  </div>


  <div class="parallax-container valign-wrapper">
    <div class="section no-pad-bot">
      <div class="container">
        <div class="row center">
          <h5 class="header col s12 light">A modern responsive front-end framework based on Material Design</h5>
        </div>
      </div>
    </div>
    <div class="parallax"><img src="img/background3.jpg" alt="Unsplashed background img 3"></div>
  </div>
  <%@ include file="WEB-INF/static/login.jsp" %>
  <%@include file="WEB-INF/static/footer.html" %>

  <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="js/materialize.js"></script>
  <script src="js/init.js"></script>

  </body>
</html>