package com.yout.evento.app.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;

@Entity
@Table(name = "role")
public class Role implements GrantedAuthority {

	@Id
	private String nameRole;

	@ManyToMany(mappedBy = "roles")
	private List<Usuario> usuarios;

	/**
	 * @return the nameRole
	 */
	public String getNameRole() {
		return nameRole;
	}

	/**
	 * @return the usuarios
	 */
	public List<Usuario> getUsuarios() {
		return usuarios;
	}

	/**
	 * @param usuarios the usuarios to set
	 */
	public void setUsuarios(List<Usuario> usuarios) {
		this.usuarios = usuarios;
	}

	/**
	 * @param nameRole the nameRole to set
	 */
	public void setNameRole(String nameRole) {
		this.nameRole = nameRole;
	}

	@Override
	public String getAuthority() {
		return this.nameRole;
	}

}
