package com.devel.modelo;

import com.devel.conexion.ConexionDB;
import com.devel.interfaces.IModelos;
import com.devel.interfaces.IObjetos;
import java.util.ArrayList;
import java.util.List;

public class Producto extends ConexionDB implements IModelos{
	
	private int idProducto;
	private String nombre;
	private String descripcion;
	private String portada;
	private float precio;
	private int existencia;
	private Categoria categoria;
	private boolean esNuevo;
	
	public int getIdProducto() {
		return idProducto;
	}

	public void setIdProducto(int idProducto) {
		this.idProducto = idProducto;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getPortada() {
		return String.format("img/items/%s", portada);
	}

	public void setPortada(String portada) {
		this.portada = portada;
	}

	public float getPrecio() {
		return precio;
	}
	
	public String getPrecioC() {
		return String.format("S/.%s", precio);
	}

	public void setPrecio(float precio) {
		this.precio = precio;
	}

	public int getExistencia() {
		return existencia;
	}

	public void setExistencia(int existencia) {
		this.existencia = existencia;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	public boolean isEsNuevo() {
		return esNuevo;
	}

	public void setEsNuevo(boolean esNuevo) {
		this.esNuevo = esNuevo;
	}

	@Override
	public boolean guardar(){
		return false;
	}
	
	@Override
	public boolean eliminar(){
		return true;
	}
	
	public static class Consultas extends ConexionDB implements IObjetos<Producto>{
		@Override
		public Producto getObject(int id) {
			Producto p = null;
			try {
				abrirConexion();
				consulta = conexion.prepareStatement("SELECT id_producto, nombre, descripcion, portada, precio, existencia, id_categoria FROM producto_tbl WHERE id_producto=?");
				consulta.setInt(1, id);
				resultado = consulta.executeQuery();
				
				if(resultado.next()) {
					p = new Producto();
					p.setIdProducto(resultado.getInt(1));
					p.setNombre(resultado.getString(2));
					p.setDescripcion(resultado.getString(3));
					p.setPortada(resultado.getString(4));
					p.setPrecio(resultado.getFloat(5));
					p.setExistencia(resultado.getInt(6));
					p.setCategoria(Categoria.Consulta.get(resultado.getInt(7)));
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				cerrarConexion();
			}
			return p;
		}
		
		@Override
		public List<Producto> allObject() {
			List<Producto> all = new ArrayList<Producto>();
			
			try {
				
				abrirConexion();
				consulta = conexion.prepareStatement("SELECT id_producto, nombre, descripcion, portada, precio, existencia, id_categoria FROM producto_tbl");
				resultado = consulta.executeQuery();
				
				while(resultado.next()) {
					Producto p = new Producto();
					p.setIdProducto(resultado.getInt(1));
					p.setNombre(resultado.getString(2));
					p.setDescripcion(resultado.getString(3));
					p.setPortada(resultado.getString(4));
					p.setPrecio(resultado.getFloat(5));
					p.setExistencia(resultado.getInt(6));
					p.setCategoria(Categoria.Consulta.get(resultado.getInt(7)));
					all.add(p);
				}
				
				return all;
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				cerrarConexion();
			}
			
			return null;
		}
		
		public List<Producto> allObject(int paginacion) {
			List<Producto> all = new ArrayList<Producto>();
			
			try {
				
				abrirConexion();
				consulta = conexion.prepareStatement("SELECT id_producto, nombre, descripcion, portada, precio, existencia, id_categoria FROM producto_tbl ORDER BY id_producto LIMIT 12 OFFSET ?");
				consulta.setInt(1, (paginacion-1)*12);
				resultado = consulta.executeQuery();
				
				while(resultado.next()) {
					Producto p = new Producto();
					p.setIdProducto(resultado.getInt(1));
					p.setNombre(resultado.getString(2));
					p.setDescripcion(resultado.getString(3));
					p.setPortada(resultado.getString(4));
					p.setPrecio(resultado.getFloat(5));
					p.setExistencia(resultado.getInt(6));
					p.setCategoria(Categoria.Consulta.get(resultado.getInt(7)));
					all.add(p);
				}
				
				return all;
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				cerrarConexion();
			}
			
			return null;
		}
		
		public static int countProduct() {
			try {
				
				abrirConexion();
				consulta = conexion.prepareStatement("SELECT COUNT(id_producto) FROM producto_tbl");
				resultado = consulta.executeQuery();
				
				if(resultado.next()) {
					return resultado.getInt(1);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				cerrarConexion();
			}
			return 0;
		}
	}
}
