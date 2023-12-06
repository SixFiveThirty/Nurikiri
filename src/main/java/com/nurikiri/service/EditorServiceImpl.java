package com.nurikiri.service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.EditorAttachmentVO;
import com.nurikiri.domain.EditorVO;
import com.nurikiri.domain.kakaomap.LocalResult;
import com.nurikiri.mapper.EditorMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;
import retrofit2.Call;
import retrofit2.Response;

@Log4j
@Service
@AllArgsConstructor
public class EditorServiceImpl implements EditorService {
public static final String THUMBNAIL_UPLOAD_DIR = "C:\\backend_workspace\\Nurikiri_workspace\\nurikiri\\src\\main\\webapp\\resources\\images\\editor";
	private EditorMapper mapper;

	@Transactional(rollbackFor = Exception.class)
	@Override
	public void register(EditorVO editor, MultipartFile thumbnail) throws Exception {
		log.info("register...." + editor);

		File dest = new File(THUMBNAIL_UPLOAD_DIR, thumbnail.getOriginalFilename());
		String imgSrc = dest.getPath();
		editor.setImgSrc(imgSrc);
		mapper.insertSelectKey(editor);

		if (!thumbnail.isEmpty()) {
			thumbnail.transferTo(dest);
		}

	}

	@Override
	public EditorVO get(Long eno) {
		log.info("get....." + eno);
		EditorVO editor = mapper.read(eno);

		String query = editor.getTitle();
		KakaoMapService service = KakaoMapService.getService();
		Call<LocalResult> call = service.searchLocal(query, 10, 1);
		Response<LocalResult> res;

		try {
			res = call.execute();
			if (res.isSuccessful()) {
				LocalResult result = res.body();
				log.info("===>" + result);
				editor.setLocals(result.getLocals());
			} else {
				log.info("호출 실패 ===> " + res);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return editor;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public void modify(EditorVO editor, MultipartFile thumbnail) throws Exception {
		log.info("register...." + editor);

		File dest = new File(THUMBNAIL_UPLOAD_DIR, thumbnail.getOriginalFilename());
		String imgSrc = dest.getPath();
		editor.setImgSrc(imgSrc);
		mapper.update(editor);

		if (!thumbnail.isEmpty()) {
			thumbnail.transferTo(dest);
		}
	}

	@Override
	public boolean remove(Long eno) {
		log.info("remove...." + eno);
		return mapper.delete(eno) == 1;
	}

	@Override
	public List<EditorVO> getList(Criteria cri) {
		log.info("get List with citeria: " + cri);

		return mapper.getListWithPaging(cri);
	}

	@Override
	public List<EditorVO> getListThree() {
		log.info("Get List 3 Recent Posts : ");
		return mapper.getListThree();
	}
	
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");

		return mapper.getTotalCount(cri);
	}
}
