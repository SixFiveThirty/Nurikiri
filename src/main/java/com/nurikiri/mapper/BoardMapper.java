package com.nurikiri.mapper;

import java.util.List;

import com.nurikiri.domain.BoardVO;
import com.nurikiri.domain.Criteria;

public interface BoardMapper {
	
	//게시판 목록
	public List<BoardVO> getList();
	
	public void insert(BoardVO board);
	
	public int update(BoardVO board);
	
	public int delete(Long bno);
	
	public BoardVO read(Long bno);
	
	public List<BoardVO> getListWithPaging(Criteria cri);

	public int getTotalCount(Criteria cri);

}
