<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.devel.modelo.Usuario" %>

<jsp:include page="WEB-INF/static/head.jsp">
	<jsp:param value="Beltron | Nosotros" name="title"/>
</jsp:include>

<% 	Usuario sesion = (Usuario)(request.getSession().getAttribute("usuario"));
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
	response.sendRedirect(request.getContextPath().concat("/index.jsp"));
}
%>
<body>
	<jsp:include page="WEB-INF/static/nav.jsp">
		<jsp:param value='<%=clase %>' name="clase"/>
		<jsp:param value='<%=contexto %>' name="opcion"/>
		<jsp:param value='<%=valor %>' name="valor"/>
	</jsp:include>
	<div class="row grey lighten-3">
		<div class="container-fluid admin-panel">
			<div class="row admin-panel-sub">
				<div class="col s3 admin-panel-sub-left">
					sdfdsfdf
				</div>
				<div class="col s9">
					<div class="row">
						<ul id="tabs-swipe-demo" class="tabs">
						    <li class="tab col s3"><a class="active" href="#test-swipe-1">Usuarios</a></li>
						    <li class="tab col s3"><a href="#test-swipe-2">Productos</a></li>
						    <buttom class="btn small right" style="">agregar</buttom>
						 </ul>
						<div id="test-swipe-1" class="col s12">
							df
						</div>
						<div id="test-swipe-2" class="col s12">
							<div class="row">
								<ul class="collapsible">
								  <li>
								    <div class="collapsible-header">
								      <i class="material-icons">filter_drama</i>First
								      <span class="badge" data-badge-caption="productos">4</span>
								    </div>
								    <div class="collapsible-body">
								    	<p>Lorem ipsum dolor sit amet.</p>
								    </div>
								  </li>
								</ul>
							</div>
						</div>
					</div>
				</div>
		    </div>
		</div>
	</div>
	<%@ include file="WEB-INF/static/login.jsp" %>
	<%@include file="WEB-INF/static/footer.html" %>
	<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="js/materialize.js"></script>
	<script src="js/init.js"></script>
</body>
</html>

