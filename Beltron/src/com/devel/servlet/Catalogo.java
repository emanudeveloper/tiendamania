package com.devel.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.devel.configuracion.Informacion;
import com.devel.modelo.Producto;
import com.devel.controlador.CProducto;
import java.util.List;

/**
 * Servlet implementation class Catalogo
 */
@WebServlet("/Catalogo")
public class Catalogo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	private int paginacion;
	private List<Producto> all;
    public Catalogo() {
        super();
        paginacion = 1;
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			if (request.getParameter("paginacion")!=null) {
				this.paginacion = Integer.parseInt(request.getParameter("paginacion"));
			}
			this.all = CProducto.allProducto(this.paginacion);
			request.setAttribute("all", this.all);
			request.setAttribute("paginacion_all", CProducto.countProduct()/13 + 1);
			request.setAttribute("paginacion", this.paginacion);
		} catch (Exception e) {
			e.printStackTrace();
		}
		Informacion.irPagina(request, response, getServletContext(), "/catalogo.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
