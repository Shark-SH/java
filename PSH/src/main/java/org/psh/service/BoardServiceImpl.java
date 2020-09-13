package org.psh.service;

import java.util.List;

import org.psh.domain.BoardVO;
import org.psh.domain.Criteria;
import org.psh.domain.ReplyPageDTO;
import org.psh.mapper.BoardMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	//로직을 분리시키기 위함 
	// mapper에서 받아서 처리
	// 하나의 로직을 다양하게 만들수 있는 영역(service영역)
	
	
	@Autowired
	private BoardMapper mapper;
	
	@Override
	public void register(BoardVO board) {
		logger.info("register");
		
		mapper.insertSelectKey(board);
		
	}
	@Override
	public BoardVO get(int bno) {
		BoardVO vo = new BoardVO();
		
		return mapper.read(bno);
	}
	
	@Override
	public boolean modify(BoardVO board) {
		
		
		return mapper.update(board) == 1;
	}
	
	@Override
	public boolean delete(int bno) {
		
		mapper.replydelete(bno);
		
		return mapper.delete(bno) == 1;
	}
	
	@Override
	public List<BoardVO> getList(){
	
		return mapper.getList();
	}
	
	@Override
	public List<BoardVO> getList(Criteria cri){
		
		logger.info("get List with criteria : "+cri);
		
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		logger.info("get total count");
		return mapper.getTotalCount(cri);
	}
	


	
}
