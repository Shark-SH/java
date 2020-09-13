package org.psh.controller;

import org.psh.domain.BoardVO;
import org.psh.domain.Criteria;
import org.psh.domain.PageDTO;
import org.psh.service.BoardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/crud/*")
public class BoardController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private BoardService service;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		logger.info("list : "+ cri);
		model.addAttribute("list", service.getList(cri));
		//model.addAttribute("pageMaker", new PageDTO(cri,123));
		
		int total = service.getTotal(cri);
		logger.info("total : " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(BoardVO board,RedirectAttributes rttr) {
		//RedirectAttributes rttr은 추가적으로 새롭게 등록되는 게시물의 번호를 같이 전달하기 위함.
		logger.info("register");
		service.register(board);
		//입력메서드
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/crud/list";
		
	}
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("bno") int bno , @ModelAttribute("cri") Criteria cri, Model model) {
		
		
		logger.info("get!!!! or modify");
		model.addAttribute("board",service.get(bno));
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, Criteria cri, RedirectAttributes rttr) {
		logger.info("modify!!!!"+board);
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
			return "redirect:/crud/list"+cri.getListLink();
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") int bno , Criteria cri, RedirectAttributes rttr) {
		logger.info("remove....."+bno);
		if(service.delete(bno)) {
			rttr.addAttribute("result", "remove success");
		}
		
		return "redirect:/crud/list"+cri.getListLink();
		
	}
	
	
}
