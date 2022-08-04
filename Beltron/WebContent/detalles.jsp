<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.devel.modelo.Usuario" %>
<%@ page import="com.devel.modelo.Producto" %>
<%@ page import="java.util.List" %>

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
<jsp:include page="WEB-INF/static/head.jsp">
	<jsp:param value="Beltron | Detalles de Compra" name="title"/>
</jsp:include>

<body>
  <jsp:include page="WEB-INF/static/nav.jsp">
  	<jsp:param value='<%=clase %>' name="clase"/>
  	<jsp:param value='<%=contexto %>' name="opcion"/>
  	<jsp:param value='<%=valor %>' name="valor"/>
  </jsp:include>
  <div class="container">
  
      <table class="responsive-table">
        <thead>
          <tr>
              <th>Producto</th>
              <th>Descripción</th>
              <th>Precio</th>
              <th>Acciones</th>
          </tr>
        </thead>

        <tbody>
        	<%
        	  float total = 0;
        	  short pos = 0;
        	  List<Producto> lista = (List<Producto>)(request.getSession().getAttribute("lista"));
        	  if (lista.size()>0) {
        		  for (Producto p : lista) {
        		  	total += p.getPrecio();
        		  %>
					<tr>
						<td><%=p.getNombre() %></td>
						<td><%=p.getDescripcion() %></td>
						<td><%=p.getPrecioC() %></td>
						<td><a href=<%=request.getContextPath().concat("/Carrito?del=").concat(String.valueOf(pos++)) %>><i class="material-icons red-text">delete</i></a></td>
					</tr>
        		  <%}
        	  } else {%>
					<tr>
						<td><b>No Existe Ningún registro</b></td>
					</tr>
        	  <%}%>
<!--           <tr> -->
<!--             <td>Alvin</td> -->
<!--             <td>Eclair</td> -->
<!--             <td>$0.87</td> -->
<!--           </tr> -->
        </tbody>
        <tfoot>
        	<tr style="font-weight: 700;">
        		<td>Sub total :</td>
        		<td></td>
        		<td><%=String.format("S/. %s", total) %></td>
        		<td></td>
        	</tr>
        	<tr style="font-weight: 700;">
        		<td>IGV : 18% :</td>
        		<td></td>
        		<td><%=String.format("S/. %.2f", total*0.18) %></td>
        		<td></td>
        	</tr>
        	<tr style="font-weight: 700;">
        		<td>Total :</td>
        		<td></td>
        		<td><%=String.format("S/. %.2f", total + total*0.18) %></td>
        		<td></td>
        	</tr>
        </tfoot>
      </table>
      
  </div>
  <%@include file="WEB-INF/static/footer.html" %>
</body>
</html>