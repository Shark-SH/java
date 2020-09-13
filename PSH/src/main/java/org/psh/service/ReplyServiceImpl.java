package org.psh.service;

import java.util.List;

import org.psh.domain.Criteria;
import org.psh.domain.ReplyPageDTO;
import org.psh.domain.ReplyVO;
import org.psh.mapper.BoardMapper;
import org.psh.mapper.ReplyMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ReplyServiceImpl implements ReplyService{
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ReplyMapper mapper;
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Transactional
	@Override
	public int register(ReplyVO vo) {
		logger.info("register"+vo);
		
		boardMapper.updateReplyCnt(vo.getBno(), 1);
		
		return mapper.insert(vo);
	}
	
	@Override
	public ReplyVO get(int rno) {
		logger.info("get....."+rno);
		
		return mapper.read(rno);
	}
	@Override
	public int modify(ReplyVO vo) {
		
		logger.info("modify"+vo);
		
		return mapper.update(vo);
	}
	
	@Transactional
	@Override
	public int remove(int rno) {
		logger.info("remove"+rno);
		
		
		
		ReplyVO vo = mapper.read(rno);
		boardMapper.updateReplyCnt(vo.getBno(), -1);
		return mapper.delete(rno);
	}
	@Override
	public List<ReplyVO> getList(Criteria cri,int bno){
		logger.info("get list of a board" + bno);
		
		return mapper.getListWithPaging(cri, bno);
		
	}
	@Override
	public ReplyPageDTO getListPage(Criteria cri,int bno) {
		
		return new ReplyPageDTO(
				mapper.getCountByBno(bno),
				mapper.getListWithPaging(cri, bno));
	}

		

}
