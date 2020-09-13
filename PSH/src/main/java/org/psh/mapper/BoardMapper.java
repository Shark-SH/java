package org.psh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.psh.domain.BoardVO;
import org.psh.domain.Criteria;

public interface BoardMapper {
	public List<BoardVO> getList();
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(int bno);
	
	public int delete(int bno);
	
	public int update(BoardVO board);
	
	public int replydelete(int bno);
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public void updateReplyCnt(@Param("bno") int bno , @Param("amount") int amount);
	
	
}
