package com.nurikiri.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.nurikiri.domain.BoardAttachmentVO;
import com.nurikiri.domain.BoardVO;
import com.nurikiri.domain.Criteria;

public interface BoardService {
	
	/*공지사항 목록*/
	public List<BoardVO> getList(Criteria cri);
	
	public BoardVO get(Long bno);
	
	/*공지사항 등록*/
	public void register(BoardVO board, List<MultipartFile> files, String username) throws Exception;
	
	/*공지사항 수정*/
	public boolean modify(BoardVO board, List<MultipartFile> files) throws Exception;

	public boolean remove(Long bno);
	
	public int getTotal(Criteria cri);
	
	public BoardAttachmentVO getAttachment(Long no);
	
	public boolean removeAttachment(Long no);
	
	


	

}