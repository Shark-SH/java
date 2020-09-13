package org.psh.controller;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.psh.domain.BoardVO;
import org.psh.domain.Criteria;
import org.psh.domain.MemberDTO;
import org.psh.mapper.BoardMapper;
import org.psh.mapper.MemberMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMapperTests {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private BoardMapper mapper;
	@Autowired
	private MemberMapper member;
	
	/*
	@Test
	public void testGetList() {
		mapper.getList().forEach(board->logger.info(""+board));
	}
	
	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();	//BoardVO의 새로운 인스턴스 생성

		board.setTitle("새로작성하는 글");	
		board.setContent("새로 작성하는 내용");
		board.setWriter("newbie"); 		//setter메소드로 새로운 값을 인스턴스에다가 저장

		mapper.insertSelectKey(board);	
		
		logger.info(""+board);
	}
	
	@Test
	public void testRead() {
		BoardVO board = mapper.read(2);
		
		logger.info(""+board);
	}
	
	@Test
	public void testdelete() {
		
		logger.info(""+mapper.delete(2));
		
	}
	
	@Test
	public void testupdate() {
		BoardVO board = new BoardVO();
		board.setBno(5);
		board.setTitle("수정된제목");
		board.setContent("수정된 내용");
		board.setWriter("user00");
		
		int count = mapper.update(board);
		logger.info("update 된 갯수"+count);
		
		
	}
	

	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
			cri.setPageNum(2);
			cri.setPageNum(10);
			List<BoardVO> list = mapper.getListWithPaging(cri);	
			list.forEach(board -> logger.info(""+board.getBno()));	
		
		
		
	}
	*/
	@Test
	public void testinsert() {
		MemberDTO mem = new MemberDTO();
		
		mem.setId("kebi1229");
		mem.setPs("password");
		mem.setPh("01038151617");
		member.SignupInsert(mem);
		logger.info("인설트실행합니다.");
	}
	@Test
	public void testSelect() {
		MemberDTO mem = new MemberDTO();

		mem.setPh("01038151617");
		member.findid(mem).forEach(member -> logger.info(""+member));
		
	}
}
