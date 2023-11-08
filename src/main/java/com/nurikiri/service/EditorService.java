package com.nurikiri.service;

import java.util.List;

import com.nurikiri.domain.EditorVO;

public interface EditorService {
	public void register(EditorVO editor) throws Exception;
	
	public EditorVO get(Long eno);
	
	public boolean modify(EditorVO editor) throws Exception;
	
	public boolean remove(Long eno);
	
	public List<EditorVO> getList();
}