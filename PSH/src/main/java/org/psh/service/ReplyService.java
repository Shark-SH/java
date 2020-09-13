package org.psh.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.psh.domain.Criteria;
import org.psh.domain.ReplyPageDTO;
import org.psh.domain.ReplyVO;

public interface ReplyService {

	public int register(ReplyVO vo);
	
	public ReplyVO get(int rno);
	
	public int modify(ReplyVO vo);
	
	public int remove(int rno);
	
	public List<ReplyVO> getList(
			@Param("cri") Criteria cri,
			@Param("bno") int bno
			);
	
	public ReplyPageDTO getListPage(Criteria cri,int bno);

	
}
