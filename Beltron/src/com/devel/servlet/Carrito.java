package com.devel.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.devel.configuracion.Informacion;
import com.devel.modelo.Usuario;
import com.devel.controlador.CProducto;
import com.devel.modelo.Producto;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class Carrito
 */
@WebServlet("/Carrito")
public class Carrito extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Carrito() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			HttpSession sesion = request.getSession();
			Usuario usuario = (Usuario)(sesion.getAttribute("usuario"));
			if (usuario != null) {
				if (!usuario.isSuperUser()) {
					if (request.getParameter("id")!=null) {
						int id_producto = Integer.parseInt(request.getParameter("id"));
						List<Producto> lista = (List<Producto>)(sesion.getAttribute("lista"));
						Producto p = CProducto.getProducto(id_producto);
						if (p != null) {
							lista.add(p);
							sesion.setAttribute("lista", lista);
						}
						Informacion.irPagina(request, response, getServletContext(), "/Catalogo");
					}
					if (request.getParameter("del")!=null) {
						int id_producto = Integer.parseInt(request.getParameter("del"));
						List<Producto> lista = (List<Producto>)(sesion.getAttribute("lista"));
						lista.remove(id_producto);
						sesion.setAttribute("lista", lista);
						Informacion.irPagina(request, response, getServletContext(), "/detalles.jsp");
					}
					
					return;
				}
			}
			request.setAttribute("estado", false);
			Informacion.irPagina(request, response, getServletContext(), "/index.jsp");
			
		} catch(Exception e) {
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
