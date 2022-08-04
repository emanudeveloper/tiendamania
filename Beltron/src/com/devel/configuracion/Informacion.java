package com.devel.configuracion;

import java.io.IOException;
import java.util.Properties;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public final class Informacion {
	
	private static final Informacion utilidad = new Informacion();
	private Properties propiedadesDB;
	
	public static Informacion getUtilidad() {
		return utilidad;
	}
	
	public void configuracionDB(Properties propiedad) {
		this.propiedadesDB = propiedad;
	}
	
	public Properties getConfiguracionDB() {
		return this.propiedadesDB;
	}
	
	public static void irPagina(HttpServletRequest request, HttpServletResponse response, ServletContext contexto, String url) throws ServletException, IOException {
		RequestDispatcher rd = contexto.getRequestDispatcher(url);
		rd.forward(request, response);
	}
}


