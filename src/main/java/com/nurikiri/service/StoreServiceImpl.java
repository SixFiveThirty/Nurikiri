package com.nurikiri.service;

import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Service;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.StoreVO;
import com.nurikiri.mapper.StoreMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class StoreServiceImpl implements StoreService {

	private StoreMapper mapper;

	@Override
	public List<StoreVO> getList(Criteria cri,Principal principal) {

		log.info("getList");

		return mapper.getListWithPaging(cri);
	}

	@Override
	public void register(StoreVO store) {
		log.info("register");
		mapper.insert(store);

	}

	@Override
	public boolean modify(StoreVO store) {
		log.info("modify");
		return mapper.update(store) == 1;
	}

	@Override
	public boolean remove(Long sno) {
		log.info("remove");
		return mapper.delete(sno) == 1;
	}

	@Override
	public StoreVO get(Long sno, Principal principal) {
		log.info("get");

		return mapper.read(sno);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");

		return mapper.getTotalCount(cri);
	}

}
