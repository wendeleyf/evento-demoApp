package com.yout.evento.app.repository;

import org.springframework.data.repository.CrudRepository;
import com.yout.evento.app.model.Convidado;
import com.yout.evento.app.model.Evento;

public interface ConvidadoRepository extends CrudRepository<Convidado, String> {
	Iterable<Convidado> findByEvento(Evento evento); // buscar convidados por evento
}
