package com.nurikiri.mapper;

import java.util.List;

import com.nurikiri.domain.BoardAttachmentVO;
import com.nurikiri.domain.BoardVO;
import com.nurikiri.domain.Criteria;

public interface BoardMapper {
	
	//공지사항
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(Long bno);
	
	public int update(BoardVO board);
	
	public int delete(Long bno);
	
	public int getTotalCount(Criteria cri);

	
	//파일 업로드
	public void insertAttachment(BoardAttachmentVO attach);
	
	public List<BoardAttachmentVO> getAttachmentList(Long bno);

	public BoardAttachmentVO getAttachment(Long no);

	public int removeAttachment(Long no);

	

}
