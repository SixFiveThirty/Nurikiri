package com.nurikiri.mapper;

import java.util.List;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.EditorAttachmentVO;
import com.nurikiri.domain.EditorVO;

public interface EditorMapper {
	public List<EditorVO> getList();
	
	public List<EditorVO> getListWithPaging(Criteria cri);
	
	public List<EditorVO> getListThree();
	
	public void insert(EditorVO editor);
	
	public void insertSelectKey(EditorVO editor);
	
	public EditorVO read(Long eno);
	
	public int delete(Long eno);
	
	public int update(EditorVO editor);
	
	public void insertAttachment(EditorAttachmentVO attach);
	
	public List<EditorAttachmentVO> getAttachmentList(Long eno);
	
	public EditorAttachmentVO getAttachment(Long no);
	
	public int removeAttachment(Long no);
	
	public int getTotalCount(Criteria cri);
}
