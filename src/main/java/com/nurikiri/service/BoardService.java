package com.nurikiri.service;

import java.security.Principal;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.nurikiri.domain.BoardVO;
import com.nurikiri.domain.Criteria;

public interface BoardService {
	
	/*게시판 목록*/
	public List<BoardVO> getList(Criteria cri, Principal principal);
	
	/*게시판 등록*/
	public void register(BoardVO board, MultipartFile thumbnail) throws Exception;
	
	/*게시판 수정*/
	public void modify(BoardVO board, MultipartFile thumbnail) throws Exception;

	public boolean remove(Long bno);
	
	public int getTotal(Criteria cri);
	
	public BoardVO get(Long no, Principal principal);


	

}