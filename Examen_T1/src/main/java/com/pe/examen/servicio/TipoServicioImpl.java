package com.pe.examen.servicio;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pe.examen.entidad.Tipo;
import com.pe.examen.repositorio.TipoRepositorio;

@Service
public class TipoServicioImpl implements TipoServicio{

	@Autowired
	private TipoRepositorio repositorio;

	@Override
	public List<Tipo> listaTipo() {
		return repositorio.findAll();
	} 

}


