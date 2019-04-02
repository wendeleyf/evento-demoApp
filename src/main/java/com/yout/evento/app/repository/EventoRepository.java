package com.yout.evento.app.repository;

import org.springframework.data.repository.CrudRepository;
import com.yout.evento.app.model.Evento;

public interface EventoRepository extends CrudRepository<Evento, String> {
	Evento findById(long id); // buscar por id
}
