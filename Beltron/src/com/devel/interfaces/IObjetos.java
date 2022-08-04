package com.devel.interfaces;

import java.util.List;

public interface IObjetos <O>{
	public O getObject(int id) throws Exception;
	public List<O> allObject() throws Exception;
}
