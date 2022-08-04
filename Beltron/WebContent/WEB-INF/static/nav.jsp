<%@ page import="com.devel.modelo.Usuario " %>
<% Usuario sesion = (Usuario)(request.getSession().getAttribute("usuario"));%>
<nav class="white" role="navigation">
    <div class="nav-wrapper container">
      <a id="logo-container" href="" class="brand-logo"><img alt="Logo Beltron" src="img/favicon.jpg"></a>
      <ul class="right hide-on-med-and-down">
      	<li><a href=<%=request.getContextPath() %>>Inicio</a></li>
        <li><a href="Catalogo">Catálogo</a></li>
        <li><a href="http://localhost:8080/Beltron/nosotros.jsp">Nosotros</a></li>
        <li class="modal-loagin">
        	<a class=${param.clase } href=${param.opcion }>${param.valor }</a>
        	<%if (sesion != null) {%>
        		<div class="login-modal white">
	        		<div class="col s12">
	        			<ul class="row">
	        				<li class="col s12"><b>Tipo de Usuario : </b><%=sesion.isSuperUser()?"Administrador":"Cliente"%></li>
	        				<li class="col s12"><b>Usuario : </b><%=String.format("%s, %s", sesion.getNombres(), sesion.getApellidos()) %></li>
	        				<li class="col s12"><a class="btn small" href=<%=request.getContextPath().concat("/Logout") %>>Cerrar sesión</a></li>
	        			</ul>
	        		</div>
	        	</div>
        	<%} %>
        </li>
      </ul>

      <ul id="nav-mobile" class="sidenav">
        <li><a href="#">Navbar Link mobile</a></li>
      </ul>
      <a href="#" data-target="nav-mobile" class="sidenav-trigger"><i class="material-icons">menu</i></a>
    </div>
  </nav>