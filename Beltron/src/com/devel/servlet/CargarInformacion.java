package com.devel.servlet;

import java.util.Properties;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import com.devel.configuracion.Informacion;

@WebListener
public class CargarInformacion implements ServletContextListener {
	 @Override
	 public void contextInitialized(ServletContextEvent sce) {
		 String servidor = sce.getServletContext().getInitParameter("server");
		 String puerto = sce.getServletContext().getInitParameter("port");
		 String db = sce.getServletContext().getInitParameter("database");
		 String usuario = sce.getServletContext().getInitParameter("user");
		 String contra = sce.getServletContext().getInitParameter("password");
		 
		 Properties propiedadesDB = new Properties();
		 propiedadesDB.setProperty("servidor", servidor);
		 propiedadesDB.setProperty("puerto", puerto);
		 propiedadesDB.setProperty("db", db);
		 propiedadesDB.setProperty("usuario", usuario);
		 propiedadesDB.setProperty("contra", contra);
		 
		 Informacion.getUtilidad().configuracionDB(propiedadesDB);
	 }
}
