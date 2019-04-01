package com.yout.evento.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EventoController {

	@RequestMapping("/addEvento")
	public String getFormAdd(){
		return "evento/formAdd";
	}
}
