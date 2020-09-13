package org.psh.controller;

import java.util.List;

import org.psh.domain.ReplyVO;
import org.psh.service.ReplyService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.psh.domain.Criteria;
import org.psh.domain.ReplyPageDTO;

@RestController
@RequestMapping("/replies/")
public class ReplyController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ReplyService service;
	
	@PostMapping(value = "/new",
			consumes = "application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO vo){
		
		int insertCount = service.register(vo);
		logger.info("Reply Insert Count : " + insertCount);
		
		return insertCount == 1
				? new ResponseEntity<>("success",HttpStatus.OK)
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	
	}
	
	@GetMapping(value="/pages/{bno}/{page}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyPageDTO> getList(
			@PathVariable("page") int page,
			@PathVariable("bno") int bno){
		logger.info("getList....................."+bno);
		
		Criteria cri = new Criteria(page,10);
		logger.info(""+cri);
		
		return new ResponseEntity<>(service.getListPage(cri, bno), HttpStatus.OK);
	}
	
	@GetMapping(value ="/{rno}",
	produces = { MediaType.APPLICATION_XML_VALUE,
				MediaType.APPLICATION_JSON_UTF8_VALUE})
		public ResponseEntity<ReplyVO> get(@PathVariable("rno") int rno){
			logger.info("get"+rno);
			
			return new ResponseEntity<>(service.get(rno),HttpStatus.OK);
	}
	
	@DeleteMapping(value="/{rno}",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") int rno){
		logger.info("remove"+rno);
		
		return service.remove(rno) == 1
				? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
	value ="/{rno}",
	consumes = "application/json",
	produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(
			@RequestBody ReplyVO vo,
			@PathVariable("rno") int rno
			){
		
		logger.info(""+rno);
		logger.info("modify"+vo);
		
		
		return service.modify(vo) == 1
				? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
 }
