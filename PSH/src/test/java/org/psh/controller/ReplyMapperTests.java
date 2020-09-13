package org.psh.controller;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.psh.domain.Criteria;
import org.psh.domain.ReplyVO;
import org.psh.mapper.ReplyMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReplyMapperTests {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	int[] bnoArr = {55,56,57,58,59}; 
	
	
	@Autowired
	private ReplyMapper mapper;
	/*
	@Test
	public void testMapper() {
		IntStream.rangeClosed(1,10).forEach(i ->{
			
			ReplyVO vo = new ReplyVO();
			
			vo.setBno(bnoArr[i%5]);
			vo.setReply("댓글테스트"+i);
			vo.setReplyer("replyer"+i);
			
			mapper.insert(vo);
			
		});
		
		logger.info(""+mapper);
	}
	@Test
	public void replyselectTest() {
		int targetno = 3;
		
		ReplyVO vo = mapper.read(targetno);
		
		logger.info(""+vo);
		
		
	}
	
	@Test
	public void replydeleteTest() {
		int targetno = 3;
		
		mapper.delete(targetno);
		
		logger.info(""+targetno);
		
		
	}
	@Test
	public void replyUpdateTest() {
		int targetno = 5;
		
		ReplyVO vo = mapper.read(targetno);
		
		vo.setReply("update reply");
		
		int count = mapper.update(vo);
		
		logger.info("update count : " + count);
	}
	
	
	@Test
	public void testList() {
		
		Criteria cri = new Criteria();
		
		List<ReplyVO> replies = mapper.getListWithPaging(cri, bnoArr[0]);
		
		replies.forEach(reply -> logger.info(""+reply));
	}
	*/
	
	@Test
	public void testList2() {
		Criteria cri = new Criteria(2,10);
		List<ReplyVO> replies = mapper.getListWithPaging(cri, 55);
		
		replies.forEach(reply -> logger.info(""+reply));

	}
	
}
