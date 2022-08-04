package com.devel.modelo;

import com.devel.conexion.ConexionDB;
import com.devel.interfaces.IModelos;
import com.devel.interfaces.IObjetos;
import java.util.List;

public class Usuario extends ConexionDB implements IModelos{
	
	private int idUsuario;
	private String dni;
	private String nombres;
	private String apellidos;
	private boolean genero;
	private String direccion;
	private boolean isDelete;
	private boolean isStaff;
	private boolean isSuperUser;
	private boolean isActive;
	private String correo;
	private String contraseña;
	private boolean nuevo;
	
	public Usuario() {
		nuevo = true;
	}
	
	public Usuario(String usuario, String contrasena) {
		this.correo = usuario;
		this.contraseña = contrasena;
	}
	
	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getNombres() {
		return nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	
	public boolean isGenero() {
		return this.genero;
	}

	public String isGeneroToValor() {
		return genero?"Masculino":"Femenino";
	}

	public void setGenero(boolean genero) {
		this.genero = genero;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public boolean isDelete() {
		return isDelete;
	}

	public void setDelete(boolean isDelete) {
		this.isDelete = isDelete;
	}

	public boolean isStaff() {
		return isStaff;
	}

	public void setStaff(boolean isStaff) {
		this.isStaff = isStaff;
	}

	public boolean isSuperUser() {
		return isSuperUser;
	}

	public void setSuperUser(boolean isSuperUser) {
		this.isSuperUser = isSuperUser;
	}

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getContraseña() {
		return contraseña;
	}

	public void setContraseña(String contraseña) {
		this.contraseña = contraseña;
	}
	public boolean isNuevo() {
		return nuevo;
	}

	public void setNuevo(boolean estado) {
		this.nuevo = estado;
	}

	@Override
	public boolean guardar() {
		try {
			abrirConexion();
			if (isNuevo()) {
				consulta = conexion.prepareStatement("");
			} else {
				consulta = conexion.prepareStatement("UPDATE usuario_tbl SET genero=?, direccion=?, is_delete=?, is_staff=?, is_superuser=?, is_active=? WHERE id_usuario=?");
			}
			consulta.setBoolean(1, isGenero());
			consulta.setString(2, getDireccion());
			consulta.setBoolean(3, isDelete());
			consulta.setBoolean(4, isStaff());
			consulta.setBoolean(5, isSuperUser());
			consulta.setBoolean(6, isActive());
			consulta.setInt(7, getIdUsuario());
			
			return consulta.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			cerrarConexion();
		}
		return true;
	}
	
	@Override
	public boolean eliminar() {
		return true;
	}
	
	public static class Objeto extends ConexionDB implements IObjetos<Usuario>{
		@Override
		public Usuario getObject(int id) {
			return null;
		}
		
		static Usuario get(int id) {
			Usuario u = null;
			
			try {
				java.sql.PreparedStatement ps = conexion.prepareStatement("SELECT id_usuario, dni, nombres, apellidos, genero, direccion, is_delete, is_staff, is_superuser, is_active, correo, contrasena FROM usuario_tbl WHERE id_usuario=?");
				ps.setInt(1, id);
				java.sql.ResultSet rs = ps.executeQuery();
				
				if (rs.next()) {
					u = new Usuario();
					u.setIdUsuario(resultado.getInt(1));
					u.setDni(resultado.getString(2));
					u.setNombres(resultado.getString(3));
					u.setApellidos(resultado.getString(4));
					u.setGenero(resultado.getBoolean(5));
					u.setDireccion(resultado.getString(6));
					u.setDelete(resultado.getBoolean(7));
					u.setStaff(resultado.getBoolean(8));
					u.setSuperUser(resultado.getBoolean(9));
					u.setActive(resultado.getBoolean(10));
					u.setCorreo(resultado.getString(11));
					u.setContraseña(resultado.getString(12));
					u.setNuevo(false);
				}
				ps.close();
				rs.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return u;
		}
		
		@Override
		public List<Usuario> allObject() {
			return null;
		}
	}
	
	public static class Autenticacion {
		public static Usuario esValido(Usuario usuario) {
			try {
				abrirConexion();
				consulta = conexion.prepareStatement("SELECT id_usuario, dni, nombres, apellidos, genero, direccion, is_delete, is_staff, is_superuser, is_active, correo, contrasena FROM usuario_tbl WHERE correo=? AND contrasena=md5(?)");
				consulta.setString(1, usuario.getCorreo());
				consulta.setString(2, usuario.getContraseña());
				resultado = consulta.executeQuery();
				
				if (resultado.next()) {
					usuario.setIdUsuario(resultado.getInt(1));
					usuario.setDni(resultado.getString(2));
					usuario.setNombres(resultado.getString(3));
					usuario.setApellidos(resultado.getString(4));
					usuario.setGenero(resultado.getBoolean(5));
					usuario.setDireccion(resultado.getString(6));
					usuario.setDelete(resultado.getBoolean(7));
					usuario.setStaff(resultado.getBoolean(8));
					usuario.setSuperUser(resultado.getBoolean(9));
					usuario.setActive(resultado.getBoolean(10));
					usuario.setContraseña(resultado.getString(12));
					usuario.setNuevo(false);
					return usuario;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				cerrarConexion();
			}
			return null;
		}
	}
}
