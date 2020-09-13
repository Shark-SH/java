package org.psh.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/content/*")
public class ContentController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@GetMapping("/itsme")
	public void getitsme() {
		logger.info("get its me page!");
	}
	@GetMapping("/trace")
	public void gettrace() {
		logger.info("get trace page!");
	}
	@GetMapping("/activity")
	public void getactivity() {
		logger.info("get activity page!");
	}
	
}
