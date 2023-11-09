package com.nurikiri.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.EditorVO;

public interface EditorService {
	public void register(EditorVO editor, List<MultipartFile> files) throws Exception;
	
	public EditorVO get(Long eno);
	
	public boolean modify(EditorVO editor, List<MultipartFile> files) throws Exception;
	
	public boolean remove(Long eno);
	
	public List<EditorVO> getList(Criteria cri);
	
	public List<EditorVO> getListThree();
}