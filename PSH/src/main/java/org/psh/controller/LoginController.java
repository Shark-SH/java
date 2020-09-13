package org.psh.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.psh.domain.MemberDTO;
import org.psh.mapper.MemberMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/login/*")
public class LoginController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	MemberMapper Mapper;

	@GetMapping("/main")
	public void loginmain() {
		logger.info("loginmain");

	}

	@PostMapping("/main")
	public String loginseccess(MemberDTO member, HttpSession session, HttpServletRequest hsr, Model model) {

		session = hsr.getSession();		
		MemberDTO dto = Mapper.login(member);//로그인검색 메서드를 객체변수에 저장	

		if (dto != null) {	//값이 null이 아니면
			session.setAttribute("id", dto.getId());	//세션의 id변수에 아이디 값을 저장
			session.setAttribute("ps", dto.getPs());	//세션의 ps변수에 비밀번호값을 저장
			return "redirect:/login/authentication";	//로그인이 완료되는 페이지로 이동
		} else {	//null값일 경우
			model.addAttribute("fail", "fail");	//실패 메세지를 위해 Model클래스 사용
			logger.info("실패할때 오는 로그" + dto);	//로그출력
			return "/login/main";				
		}
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {

		session.invalidate();

		logger.info("로그아웃하는 mapping");
		return "redirect:/main/front";
	}

	@GetMapping("/signup")
	public void loginsignup() {
		logger.info("signup");

	}

	@PostMapping("/signup")
	public String register(MemberDTO member) {
		logger.info("insertOK");

		Mapper.SignupInsert(member);
		// 입력메서드
		return "redirect:/login/main";
	}

	@GetMapping("/findid")
	public void getidfind() {
		logger.info("findid");
	}
	
	//아이디 찾기 Post
	@PostMapping("/findid")
	public String postfindid(RedirectAttributes rttr, MemberDTO member) {
		logger.info("member=" + member);	//member 변수에 저장된 값 체크
		List<MemberDTO> id = Mapper.findid(member);	//findid 값 검색메서드 실행 후 배열에 저장
		logger.info("id.size() : "+id.size()); //사이즈 확인
		logger.info("id=" + id);		//배열에 저장된 값 확인
		if (id.size() == 0) {	//검색된 사이즈가0이면 실패한 페이지로 이동
			return "login/findfail";
		} else {	//검색된 사이즈가 0이 아니면 찾은 값을 가지고 페이지 이동
			rttr.addFlashAttribute("id", id);
			return "redirect:/login/findidok";
		}
	}

	@GetMapping("/findps")
	public void loginpsfind() {
		logger.info("findps");

	}
	//비밀번호 찾기 Post
	@PostMapping("/findps")
	public String postfindps(RedirectAttributes rttr, MemberDTO member) {
		logger.info("member=" + member);
		List<MemberDTO> ps = Mapper.findps(member);
		logger.info("ps=" + ps);
		if (ps.size() == 0) {
			return "login/findfail";
		} else
			rttr.addFlashAttribute("ps", ps);
			return "redirect:/login/findpsok";
	}

	@GetMapping("/findidok")
	public void findidok(MemberDTO member, Model model) {
	}

	@GetMapping("/findpsok")
	public void findpsok(MemberDTO member, Model model) {
	}

	@GetMapping("/findfail")
	public void findfail() {

	}

	@RequestMapping("/idcheck")
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody String id) {

		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();

		count = Mapper.idcheck(id);
		map.put("cnt", count);
		logger.info("" + map);

		return map;
	}

	@GetMapping("/authentication")
	public void authentication() {
		logger.info("로그인완료되는 페이지");
	}
}
