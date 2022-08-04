package com.devel.controlador;

import java.util.List;
import com.devel.modelo.Producto;
import com.devel.modelo.Producto.Consultas;

public class CProducto {
	
	public static Producto getProducto(int id) throws Exception {
		return new Consultas().getObject(id);
	}
	
	public static List<Producto> allProducto() throws Exception {
		return new Consultas().allObject();
	}
	
	public static List<Producto> allProducto(int paginacion) throws Exception {
		return new Consultas().allObject(paginacion);
	}
	
	public List<Producto> all() throws Exception {
		return new Consultas().allObject();
	}
	
	public static int countProduct() throws Exception {
		return Consultas.countProduct();
	}
}
