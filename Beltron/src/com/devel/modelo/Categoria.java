package com.devel.modelo;

import com.devel.conexion.ConexionDB;
import com.devel.interfaces.IModelos;
import com.devel.interfaces.IObjetos;
import java.util.ArrayList;
import java.util.List;

public class Categoria extends ConexionDB implements IModelos {
	
	private int idCategoria;
	private String nombre;
	
	public int getIdCategoria() {
		return idCategoria;
	}

	public void setIdCategoria(int idCategoria) {
		this.idCategoria = idCategoria;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Override
	public boolean guardar(){
		return true;
	}
	
	@Override
	public boolean eliminar(){
		return true;
	}
	
	public static class Consulta extends ConexionDB implements IObjetos<Categoria>{
		@Override
		public Categoria getObject(int id) {
			Categoria c = null;
			try {
				abrirConexion();
				c = get(id);
				
			} catch  (Exception e) {
				e.printStackTrace();
			} finally {
				cerrarConexion();
			}
			
			return c;
		}
		
		static Categoria get(int id) {
			
			Categoria c = null;
			
			try {
				java.sql.PreparedStatement ps = conexion.prepareStatement("SELECT id_categoria, nombre FROM categoria_tbl WHERE id_categoria = ?");
				ps.setInt(1, id);
				java.sql.ResultSet rs = ps.executeQuery();
				
				if (rs.next()) {
					c = new Categoria();
					c.setIdCategoria(rs.getInt(1));
					c.setNombre(rs.getString(2));
				}
				ps.close();
				rs.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return c;
		}
		
		@Override
		public List<Categoria> allObject() {
			List<Categoria> ac = new ArrayList<Categoria>();
			
			try {
				abrirConexion();
				consulta = conexion.prepareStatement("SELECT id_categoria, nombre FROM categoria_tbl");
				resultado = consulta.executeQuery();
				
				while(resultado.next()) {
					Categoria c = new Categoria();
					c.setIdCategoria(resultado.getInt(1));
					c.setNombre(resultado.getString(2));
					ac.add(c);
				}
				
				return ac;
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				cerrarConexion();
			}
			return null;
		}
	}
}
