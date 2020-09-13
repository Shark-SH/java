package org.psh.service;

import java.util.List;

import org.psh.domain.BoardVO;
import org.psh.domain.Criteria;
import org.psh.domain.ReplyPageDTO;
import org.springframework.stereotype.Service;

@Service
public interface BoardService {

	public void register(BoardVO board);
	
	public BoardVO get(int bno);
	
	public boolean modify(BoardVO board);
	
	public boolean delete(int bno);
	
	public List<BoardVO> getList();
	
	public List<BoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
}
