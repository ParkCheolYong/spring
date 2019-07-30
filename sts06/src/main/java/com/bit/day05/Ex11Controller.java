package com.bit.day05;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Ex11Controller {
	Logger log=LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/ex11/{msg}")
	public String ex11(@PathVariable("msg") String msg) {
		log.debug(msg);
		return "ex11";
	}
}
