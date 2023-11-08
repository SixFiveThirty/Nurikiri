package com.nurikiri.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nurikiri.domain.EditorVO;
import com.nurikiri.mapper.EditorMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class EditorServiceImpl implements EditorService {
	private EditorMapper mapper;
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void register(EditorVO editor) throws Exception{
		log.info("register...." + editor);
		
		mapper.insertSelectKey(editor);
		Long eno = editor.getEno();

	}

	@Override
	public EditorVO get(Long eno) {
		log.info("get....." + eno);
		EditorVO editor = mapper.read(eno);
		
		
		return editor;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public boolean modify(EditorVO editor) throws Exception {
		log.info("modify........" + editor);
		
		int result = mapper.update(editor);
		Long eno = editor.getEno();
		
		return result == 1;
	}

	@Override
	public boolean remove(Long eno) {
		log.info("remove...." + eno);
		return mapper.delete(eno) == 1;
	}

	@Override
	public List<EditorVO> getList() {
		log.info("getList......");
		return mapper.getList();
	}

}
