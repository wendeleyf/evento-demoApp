package com.yout.evento.app.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {


	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable().authorizeRequests()
			.antMatchers(HttpMethod.GET, "/", "/eventos").permitAll()
			.antMatchers(HttpMethod.GET, "/addEventos", "/{id}").hasRole("ROOT") // apenas administradores
			.antMatchers(HttpMethod.POST, "/addEventos", "/{id}").hasRole("ROOT") // apenas administradores
			.anyRequest() // dá permissão de vizualização dessas views a todos os usuarios
			.authenticated() // as demais view precisão de autenticação
			.and().formLogin().permitAll() // redireciona para o formulario de login do spring scurity
			.and().logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout")); // logout padrão do spring security
	}
	
	
	// não codificar ou criptografar senha
	@Bean
	public PasswordEncoder passwordEncoder() {
		return NoOpPasswordEncoder.getInstance();
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		// não bloquear as static pages quando o browser pedir acesso a essas pages
		web.ignoring().antMatchers("/bootstrap/**", "/style/**", "/js/**");
	}

	//injeção de dependencia
	@Autowired
	private ImplementsUserDetailsService userDetailsService;

	/*
	 * gerando senha criptografada
	 * 
	 * @Override protected void configure(AuthenticationManagerBuilder auth) throws
	 * Exception { auth.userDetailsService(userDetailsService) // gerando
	 * autenticação .passwordEncoder(new BCryptPasswordEncoder()); // gerando uma
	 * senha criptografada }
	 */

	/*
	 * autenticação em mémoria
	 * 
	 * @Override protected void configure(AuthenticationManagerBuilder auth) throws
	 * Exception {
	 * auth.inMemoryAuthentication().withUser("root").password("root").
	 * roles("ROOT"); }
	 */
}
