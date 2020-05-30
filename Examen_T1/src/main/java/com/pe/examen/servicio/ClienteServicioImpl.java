package com.pe.examen.servicio;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;

import com.pe.examen.entidad.Cliente;
import com.pe.examen.repositorio.ClienteRepositorio;

@Service
public class ClienteServicioImpl implements ClienteServicio{

	@Autowired
	private ClienteRepositorio repositorio;

	@Override
	public Cliente insertaCliente(Cliente obj) {
		return repositorio.save(obj);
	} 
	


}


