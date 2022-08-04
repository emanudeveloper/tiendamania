package com.devel.conexion;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import com.devel.configuracion.Informacion;

public class ConexionDB {
	protected static Connection conexion;
	protected static PreparedStatement consulta;
	protected static ResultSet resultado;
	
	Properties propiedadesDB = Informacion.getUtilidad().getConfiguracionDB();
	
	private static final String DRIVER = "org.mariadb.jdbc.Driver";
	private static String DB_URL;
	private static String USER;
	private static String PASSWORD;
	
	public ConexionDB() {
		DB_URL = String.format("jdbc:mariadb://%s:%s/%s", propiedadesDB.getProperty("servidor"), propiedadesDB.getProperty("puerto"), propiedadesDB.getProperty("db"));
		USER = String.format("%s", propiedadesDB.getProperty("usuario"));
		PASSWORD = String.format("%s", propiedadesDB.getProperty("contra"));
	}
	
	protected static boolean abrirConexion() {
		try {
			Class.forName(DRIVER);
			conexion = DriverManager.getConnection(DB_URL, USER, PASSWORD);
			
		} catch (Exception e) {
			return true;
		}
		return false;
	}
	
	protected static boolean cerrarConexion() {
		try {
			if (conexion != null) {
				if (resultado!=null) {
					resultado.close();
				}
				consulta.close();
			}
			
			return false;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return true;
	}
}



