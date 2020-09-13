package org.psh.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/sample")
public class SampleController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@GetMapping(value="/getText", produces = "text/plain; charset=UTF-8")
	public String getText() {
		logger.info("MIME TYPE"+MediaType.TEXT_PLAIN_VALUE);
		
		return "안녕하세요";
		
	}
	
}
