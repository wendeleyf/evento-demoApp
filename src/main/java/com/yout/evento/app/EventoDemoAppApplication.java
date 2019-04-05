package com.yout.evento.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootApplication
@EnableAutoConfiguration
public class EventoDemoAppApplication {

	public static void main(String[] args) {
		SpringApplication.run(EventoDemoAppApplication.class, args);
		// sempre que inicializar o sistema passará a senha criptografada
		System.out.print(new BCryptPasswordEncoder().encode("123"));
	}

}
