package com.devel.modelo;
import java.sql.Date;
import java.util.List;
import java.util.ArrayList;

import com.devel.conexion.ConexionDB;
import com.devel.interfaces.IModelos;
import com.devel.interfaces.IObjetos;

public class Encabezado extends ConexionDB implements IModelos {
	
	private int idEncabezado;
	private Date fecha;
	private Usuario usuario;
	private boolean estado;
	
	public int getIdEncabezado() {
		return idEncabezado;
	}
	public void setIdEncabezado(int idEncabezado) {
		this.idEncabezado = idEncabezado;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	public boolean isEstado() {
		return estado;
	}
	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	
	@Override 
	public boolean guardar() {
		return false;
	}
	
	@Override
	public boolean eliminar() {
		return false;
	}
	
	public List<Producto> getProductos(){
		
		return null;
	}
	
	public static class Objeto extends ConexionDB implements IObjetos<Encabezado>{
		@Override
		public Encabezado getObject(int id) {
			try {
				abrirConexion();
				consulta = conexion.prepareStatement("SELECT id_encabezado, fecha, id_usuario, estado FROM venta_encabezado_tbl WHERE id_encabezado = ?");
				consulta.setInt(1, id);
				resultado = consulta.executeQuery();
				if (resultado.next()) {
					Encabezado o = new Encabezado();
					o.setIdEncabezado(resultado.getInt(1));
					o.setFecha(resultado.getDate(2));
					o.setUsuario(Usuario.Objeto.get(resultado.getInt(3)));
					o.setEstado(resultado.getBoolean(4));
					return o;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				cerrarConexion();
			}
			return null;
		}
		
		public Encabezado getObject(Usuario usuario) {
			try {
				abrirConexion();
				consulta = conexion.prepareStatement("SELECT id_encabezado, fecha, id_usuario, estado FROM venta_encabezado_tbl WHERE estado = false AND id_usuario=?");
				consulta.setInt(1, usuario.getIdUsuario());
				resultado = consulta.executeQuery();
				if (resultado.next()) {
					Encabezado o = new Encabezado();
					o.setIdEncabezado(resultado.getInt(1));
					o.setFecha(resultado.getDate(2));
					o.setUsuario(usuario);
					o.setEstado(resultado.getBoolean(4));
					return o;
				} else {
					consulta = conexion.prepareStatement("INSERT INTO venta_encabezado VALUE(NULL, ?, ?, false)");
					//consulta.setDate(1, new Date());
					consulta.setInt(2, usuario.getIdUsuario());
					resultado = consulta.executeQuery();
					
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				cerrarConexion();
			}
			return null;
		}
		
		public List<Encabezado> getObjects(Usuario usuario) {
			List<Encabezado> all = new ArrayList<Encabezado>();
			try {
				abrirConexion();
				consulta = conexion.prepareStatement("SELECT id_encabezado, fecha, id_usuario, estado FROM venta_encabezado_tbl WHERE id_usuario = ?");
				consulta.setInt(1, usuario.getIdUsuario());
				resultado = consulta.executeQuery();
				while (resultado.next()) {
					Encabezado o = new Encabezado();
					o.setIdEncabezado(resultado.getInt(1));
					o.setFecha(resultado.getDate(2));
					o.setUsuario(usuario);
					o.setEstado(resultado.getBoolean(4));
					all.add(o);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				cerrarConexion();
			}
			return all;
		}
		
		@Override
		public List<Encabezado> allObject() {
			return null;
		}
	}
}
