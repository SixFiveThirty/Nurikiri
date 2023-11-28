package com.nurikiri.service;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	public static final String THUMBNAIL_UPLOAD_DIR = "C:/backend_workspace/Nurikiri_workspace/nurikiri/src/main/webapp/resources/images/store";

	private StoreMapper mapper;

	@Override
	public List<StoreVO> getList(Criteria cri,Principal principal) {

		log.info("getList");
		
		List<StoreVO> list = mapper.getListWithPaging(cri);
		if (principal != null) {
			List<Long> storeBookmarks = mapper.getStoreBookmarksList(principal.getName());
			for (StoreVO store : list) {
				store.setMyStoreBookmark(storeBookmarks.contains(store.getSno()));
			}
		}
		
		return list;
//		return mapper.getListWithPaging(cri);
	}

	@Override
	public void register(StoreVO store, MultipartFile thumbnail) throws Exception {
		log.info("register...." + store);
		
		File dest = new File(THUMBNAIL_UPLOAD_DIR, thumbnail.getOriginalFilename());
		String imgSrc = dest.getPath();
		store.setImgSrc(imgSrc);
		mapper.insert(store);

		if (!thumbnail.isEmpty()) {
			thumbnail.transferTo(dest);
		}

	}

	@Override
	public void modify(StoreVO store, MultipartFile thumbnail) throws Exception {
		log.info("modify...." + store);

		File dest = new File(THUMBNAIL_UPLOAD_DIR, thumbnail.getOriginalFilename());
		String imgSrc = dest.getPath();
		store.setImgSrc(imgSrc);
		mapper.update(store);

		if (!thumbnail.isEmpty()) {
			thumbnail.transferTo(dest);
		}
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
		
		if (principal != null) {
			List<Long> storeBookmarks = mapper.getStoreBookmarksList(principal.getName());
			store.setMyStoreBookmark(storeBookmarks.contains(store.getSno()));
		}
		
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
