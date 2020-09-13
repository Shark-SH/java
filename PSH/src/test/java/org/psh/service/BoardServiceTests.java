package org.psh.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.psh.domain.BoardVO;
import org.psh.domain.Criteria;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardServiceTests {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private BoardService service;

	@Test
	public void testExist() {
		logger.info(""+service);
		assertNotNull(service);
	}
	/*	
	@Test
	public void resister() {
		BoardVO board = new BoardVO();
		
	
		board.setTitle("반복문으로갯수를 늘림");
		board.setContent("반복문으로 내용을 늘림");
		board.setWriter("클론");
		
		service.register(board);
		
		logger.info("새로 생성된 번호 : "+board.getBno());
	}
		
	@Test
	public void testGetList() {
		service.getList().forEach(board->logger.info(""+board));
		
	}
	
	@Test
	public void gettest() {
		logger.info("getgetget ->"+service.get(3));
		
		
	}
	
	@Test
	public void testdelete() {
		logger.info(""+service.delete(3));
	}

	@Test
	public void testmodify() {
		
		BoardVO board = new BoardVO();
		
		if(board == null) {
			return;
		}
		board.setTitle("수정하겠습니당");
		board.setContent("수정된 내용입니다.");
		board.setWriter("수정자");
		board.setBno(5);
		
		logger.info("MODIFY RESULT"+service.modify(board));
	
	}
*/	
	@Test
public void testGetList() {
	service.getList(new Criteria(2,10)).forEach(board->logger.info(""+board));
	
}

	
	
}
