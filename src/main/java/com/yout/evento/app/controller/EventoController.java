package com.yout.evento.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yout.evento.app.model.Evento;
import com.yout.evento.app.repository.EventoRepository;

@Controller // indica ao spring que essa classe é um controller
public class EventoController {
	
	@Autowired // realiza injeção de dependencias
	private EventoRepository er;
	
	@RequestMapping(value="/addEvento", method=RequestMethod.GET) // busca a view de acordo com a requisição
	public String getFormAdd(){
		return "/evento/formAdd";
	}
	
	@RequestMapping(value="/addEvento", method=RequestMethod.POST)
	public String getFormAdd(Evento ev){
		er.save(ev);
		return "redirect:/addEvento";
	}
}
