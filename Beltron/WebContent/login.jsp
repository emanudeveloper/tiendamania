<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.devel.modelo.Usuario" %>

<jsp:include page="WEB-INF/static/head.jsp">
	<jsp:param value="Iniciar sesi&oacute;n | Beltron" name="title"/>
</jsp:include>
<%boolean estado = true;
if (request.getAttribute("estado")!=null){
	estado = false;
}%>
<body>
	<div class="container login-container">
		<%if (!estado){%>
			<div>Para poder comprar primero inicia sesión</div>
		<%} %>
		<div class="row">
			<div class="col s10 offset-s1 m6 offset-m3 l4 offset-l4">
				<div class="login-betron">
					<h2 class="login-beltron-title">Beltron</h2>
					<form action="Login" method="POST">
						<div class="row">
							<div class="input-field col s12">
								<input id="last_name" type="text" class="validate" name="usuario" required>
								<label for="last_name">Usuario</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s12">
								<input id="password" type="password" class="validate" name="contrasena" required>
								<label for="password">Contraseña</label>
							</div>
						</div>
						<button class="btn teal">Iniciar sesión</button>
					</form>
				</div>
			</div>
		</div>
	</div>
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="js/materialize.js"></script>
</body>
</html>