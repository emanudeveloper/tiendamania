package com.devel.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.devel.modelo.Usuario;
import com.devel.configuracion.Informacion;

/**
 * Servlet implementation class Logout
 */
@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Logout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession sesion = request.getSession();
		Usuario usuario = (Usuario)(sesion.getAttribute("usuario"));
		if (usuario!=null) { // si usuario, es distinto de null, quiere decir que hay un usuario logeado.
			request.getSession().removeAttribute("usuario"); // elimina al usuario de la sesion activa
			request.getSession().invalidate(); // invalida la sesion (termina la sesion activa)
			usuario.setActive(false); // al usuario actual, le retorna su valor falso(en la base de datos, en el atributo is_active de la tabla usuario)
			usuario.guardar(); // guardamos el cambio del estado is_active;
			usuario = null; // eliminamos al usuario en el servlet
		}
		Informacion.irPagina(request, response, getServletContext(), "/index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
