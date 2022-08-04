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
}
%>
<body>
  <jsp:include page="WEB-INF/static/nav.jsp">
  	<jsp:param value='<%=clase %>' name="clase"/>
  	<jsp:param value='<%=contexto %>' name="opcion"/>
  	<jsp:param value='<%=valor %>' name="valor"/>
  </jsp:include>
 	<%@ include file="WEB-INF/static/login.jsp" %>
	<%@include file="WEB-INF/static/footer.html" %>
	<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="js/materialize.js"></script>
	<script src="js/init.js"></script>
</body>
</html>