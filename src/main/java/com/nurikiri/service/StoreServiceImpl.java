package com.nurikiri.service;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Service;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.StoreVO;
import com.nurikiri.domain.kakaomap.LocalResult;
import com.nurikiri.mapper.StoreMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import retrofit2.Call;
import retrofit2.Response;

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
		mapper.insertSelectKey(store);

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
		
		StoreVO store = mapper.read(sno);
		
		String query = store.getTitle();
		KakaoMapService service = KakaoMapService.getService();
		Call<LocalResult> call = service.searchLocal(query, 10, 1);
		Response<LocalResult> res;
		
		try {
			res = call.execute();
			if(res.isSuccessful()) {
				LocalResult result = res.body();
				log.info("===>" + result);
				store.setLocals(result.getLocals());
			} else {
				log.info("호출 실패 ===> " + res);
			}
		} catch(IOException e) {
			e.printStackTrace();
		}

		return store;
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");

		return mapper.getTotalCount(cri);
	}

}
