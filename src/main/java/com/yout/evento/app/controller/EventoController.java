package com.yout.evento.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yout.evento.app.model.Convidado;
import com.yout.evento.app.model.Evento;
import com.yout.evento.app.repository.ConvidadoRepository;
import com.yout.evento.app.repository.EventoRepository;

@Controller // indica ao spring que essa classe é um controller
public class EventoController {

	@Autowired // realiza injeção de dependencias
	private EventoRepository er;
	@Autowired // realiza injeção de dependencias
	private ConvidadoRepository cr;

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

	@RequestMapping(value = "/{id}", method = RequestMethod.GET) // redirecionar para o respectivo id do evento e exibir
																	// os detalhes
	public ModelAndView getDetailsEvento(@PathVariable("id") long id) {
		Evento evento = er.findById(id);
		ModelAndView mv = new ModelAndView("evento/detailsEvento.html");
		mv.addObject("evento", evento);

		Iterable<Convidado> convidados = cr.findByEvento(evento);
		mv.addObject("convidados", convidados);
		return mv;
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.POST) // adiciona convidado como participante do evento
	public String getDetailsEventoPost(@PathVariable("id") long id, Convidado convidado) {
		Evento evento = er.findById(id);
		convidado.setEvento(evento);
		cr.save(convidado);
		return "redirect:/{id}";
	}
}
