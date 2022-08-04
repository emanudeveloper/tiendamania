package com.devel.controlador;

import java.util.List;
import com.devel.modelo.Categoria;
import com.devel.modelo.Categoria.Consulta;

public class CCategoria {
	
	public static Categoria getCategoria(int id) throws Exception {
		return new Consulta().getObject(id);
	}
	
	public static List<Categoria> allCategoria() throws Exception {
		return new Consulta().allObject();
	}
}
