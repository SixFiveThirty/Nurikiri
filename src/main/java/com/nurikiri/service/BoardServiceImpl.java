package com.nurikiri.service;

import java.io.File;
import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.nurikiri.domain.BoardVO;
import com.nurikiri.domain.Criteria;
import com.nurikiri.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	public static final String THUMBNAIL_UPLOAD_DIR = "";

	private BoardMapper mapper;
	
	@Override
	public List<BoardVO> getList(Criteria cri,Principal principal) {

		log.info("getList");

		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public void register(BoardVO board, MultipartFile thumbnail) throws Exception {
		log.info("register...." + board);
		
		File dest = new File(THUMBNAIL_UPLOAD_DIR, thumbnail.getOriginalFilename());
		String imgSrc = dest.getPath();
		board.setImgSrc(imgSrc);
		mapper.insert(board);

		if (!thumbnail.isEmpty()) {
			thumbnail.transferTo(dest);
		}
	}
	
	@Override
	public void modify(BoardVO board, MultipartFile thumbnail) throws Exception {
		log.info("modify...." + board);

		File dest = new File(THUMBNAIL_UPLOAD_DIR, thumbnail.getOriginalFilename());
		String imgSrc = dest.getPath();
		board.setImgSrc(imgSrc);
		mapper.update(board);

		if (!thumbnail.isEmpty()) {
			thumbnail.transferTo(dest);
		}
	}
	
	@Override
	public boolean remove(Long bno) {
		log.info("remove");
		return mapper.delete(bno) == 1;

	}
	
	@Override
	public BoardVO get(Long bno, Principal principal) {
		log.info("get");
		
		BoardVO board = mapper.read(bno);
		
		String query = board.getTitle();
		
		return board;
	}
	
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");

		return mapper.getTotalCount(cri);
	}

	
	
	}