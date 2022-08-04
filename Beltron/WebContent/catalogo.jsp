<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="com.devel.modelo.Producto"%>
<%@ page import="com.devel.modelo.Usuario" %>

<jsp:include page="WEB-INF/static/head.jsp">
	<jsp:param value="Beltron | Catalogo" name="title"/>
</jsp:include>

<%-- <jsp:useBean id="Productos" class="com.devel.controlador.CProducto"></jsp:useBean> --%>
<%List<Producto> Productos = (List<Producto>)(request.getAttribute("all"));
  Usuario sesion = (Usuario)(request.getSession().getAttribute("usuario"));
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

  <div class="container">
  	<h1 class="center-align">Catálogo</h1>
  	<div>
      <section class="row">
      	<%for (Producto p : Productos){ %>
      	<div class="col s12 m3">
		  <div class="card small">
		    <div class="card-image waves-effect waves-block waves-light">
		      <img class="activator" src=<%=p.getPortada()%>>
		    </div>
		    <div class="card-content">
		      <span class="card-title activator grey-text text-darken-4"><%=p.getNombre() %><i class="material-icons right">more_vert</i></span>
		      <strong><%=p.getPrecioC() %></strong>
		      <%if (sesion != null ) {%>
		      	<p><a href=<%=String.format("Carrito?id=%s",p.getIdProducto()) %>><strong>Añadir a carrito</strong></a></p>
		      <%} else {%>
		      	<p><a class="modal-trigger" href="#modal1"><strong>Añadir a carrito</strong></a></p>
		      <%} %>
		    </div>
		    <div class="card-reveal">
		      <span class="card-title grey-text text-darken-4"><%=p.getNombre() %><i class="material-icons right">close</i></span>
		      <p><strong><%=p.getPrecioC() %></strong></p>
		      <p><%=p.getDescripcion() %></p>
		    </div>
		  </div>    
	    </div>
      	<%} %>
	    
<!-- 	    <div class="col s12 m3"> -->
<!-- 		  <div class="card small"> -->
<!-- 		    <div class="card-image waves-effect waves-block waves-light"> -->
<!-- 		      <img class="activator" src="img/items/item01.jpeg"> -->
<!-- 		    </div> -->
<!-- 		    <div class="card-content"> -->
<!-- 		      <span class="card-title activator grey-text text-darken-4">Card Title<i class="material-icons right">more_vert</i></span> -->
<!-- 		      <span>234</span> -->
<!-- 		      <p><a href="#">Añadir a carrito</a></p> -->
<!-- 		    </div> -->
<!-- 		    <div class="card-reveal"> -->
<!-- 		      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span> -->
<!-- 		      <p>Here is some more information about this product that is only revealed once clicked on.</p> -->
<!-- 		    </div> -->
<!-- 		  </div>     -->
<!-- 	    </div> -->
	    
      </section>
      <section>
		<ul class="pagination">
		  <%int pag = (int)(request.getAttribute("paginacion")); %>
		  <li class="disabled"><a href=<%=String.format("Catalogo?paginacion=%s", pag!=1?(pag-1):1)%>><i class="material-icons">chevron_left</i></a></li>
		  <%for (int paginacion = 1; paginacion<=(int)(request.getAttribute("paginacion_all")); paginacion++ ) {%>
		  	<li class=<%=pag==paginacion?"active":"waves-effect" %>><a href=<%=String.format("Catalogo?paginacion=%s", paginacion) %>><%=paginacion %></a></li>
		  <%} %>
		  <li class="waves-effect"><a href=<%=String.format("Catalogo?paginacion=%s", pag<(int)(request.getAttribute("paginacion_all"))?++pag:pag)%>><i class="material-icons">chevron_right</i></a></li>
		</ul> 
      </section>
  	</div>
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
    <div class="parallax"><img src="img/bg2.jpg" alt="Unsplashed background img 3"></div>
  </div>
  <%@ include file="WEB-INF/static/login.jsp" %>
  <%@include file="WEB-INF/static/footer.html" %>
  <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="js/materialize.js"></script>
  <script src="js/init.js"></script>

  </body>
</html>
