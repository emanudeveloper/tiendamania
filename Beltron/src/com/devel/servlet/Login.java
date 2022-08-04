package com.devel.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.devel.configuracion.Informacion;
import com.devel.modelo.Usuario.Autenticacion;
import com.devel.modelo.Usuario;
import com.devel.modelo.Producto;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	private String usuario;
	private String contrasena;
	private String pagina;
	
    public Login() {
        super();
        this.pagina = "/index.jsp";
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			this.usuario = request.getParameter("usuario");
			this.contrasena = request.getParameter("contrasena");
			Usuario usuario = new Usuario(this.usuario, this.contrasena);
			usuario = Autenticacion.esValido(usuario); // si el usuario ingresado, existe en la base de datos, entonces el objeto usuario contendra los datos del usuario en sistema,
			//si el usuario y contraseña no existen en la base de datos, el objeto usuario sera igual a null
			if (usuario != null) {
				HttpSession sesion = request.getSession();
				sesion.setAttribute("usuario", usuario);
				
				if (usuario.isDelete()) {
					Informacion.irPagina(request, response, getServletContext(), "/error-eliminado.jsp");
				}
				
				if (usuario.isSuperUser()) {
					this.pagina = "/administrador.jsp"; // si el usuario logeado es un super usuario, se redirigira al jsp administra.jsp
				} else {
					if(!usuario.isStaff()) {
						System.out.println("Error, usuario no tiene permisos de logeo");
					}
					List<Producto> lista = new ArrayList<Producto>();
					sesion.setAttribute("lista", lista);
					this.pagina = "/index.jsp"; // si el usuario no es superusuario, se redirigira al jsp index.jsp
				}
				
				if (usuario.isActive()) { // verifica si el usuario actual ya esta logeado
					System.out.println("Error, el usuario ya inicio sesión");
					sesion.invalidate();
					usuario = null;
					this.pagina = "/error.jsp";
				} else {
					usuario.setActive(true);
					usuario.guardar();
				}
			}
			Informacion.irPagina(request, response, getServletContext(), this.pagina);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
