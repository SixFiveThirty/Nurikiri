package com.nurikiri.mapper;

import java.util.List;

import com.nurikiri.domain.EditorVO;

public interface EditorMapper {
	public List<EditorVO> getList();
	
	public void insert(EditorVO editor);
	
	public void insertSelectKey(EditorVO editor);
	
	public EditorVO read(Long eno);
	
	public int delete(Long eno);
	
	public int update(EditorVO editor);
}
