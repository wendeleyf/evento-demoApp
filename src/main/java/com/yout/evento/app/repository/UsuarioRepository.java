package com.yout.evento.app.repository;

import org.springframework.data.repository.CrudRepository;
import com.yout.evento.app.model.Usuario;

public interface UsuarioRepository extends CrudRepository<Usuario, String> {
	Usuario findByLogin(String login); // busca usuario pelo login
}
