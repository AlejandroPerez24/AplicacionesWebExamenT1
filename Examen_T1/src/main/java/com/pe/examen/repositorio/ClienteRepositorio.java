package com.pe.examen.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pe.examen.entidad.Cliente;

public interface ClienteRepositorio extends JpaRepository<Cliente, Integer>{

}
