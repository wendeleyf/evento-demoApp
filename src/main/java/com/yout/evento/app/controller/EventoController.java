package com.yout.evento.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yout.evento.app.model.Evento;
import com.yout.evento.app.repository.EventoRepository;

@Controller // indica ao spring que essa classe é um controller
public class EventoController {

	@Autowired // realiza injeção de dependencias
	private EventoRepository er;

	@RequestMapping(value = "/addEvento", method = RequestMethod.GET) // busca a view de acordo com a requisição
	public String getFormAdd() {
		return "evento/formAdd.html";
	}

	@RequestMapping(value = "/addEvento", method = RequestMethod.POST)
	public String getFormAdd(Evento evento) {
		er.save(evento);
		return "redirect:/eventos";
	}

	@RequestMapping(value = "/eventos")
	public ModelAndView getListEventos() { // listando eventos na view index
		ModelAndView mv = new ModelAndView("index.html");
		Iterable<Evento> eventos = er.findAll();
		mv.addObject("eventos", eventos);
		return mv;
	}

	@RequestMapping(value = "/{id}") // redirecionar para o respectivo id do evento e exibir os detalhes
	public ModelAndView detailsEvento(@PathVariable("id") long id) {
		Evento evento = er.findById(id);
		ModelAndView mv = new ModelAndView("evento/detailsEvento.html");
		mv.addObject("evento", evento);
		return mv;
	}
}
