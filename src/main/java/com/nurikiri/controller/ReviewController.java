package com.nurikiri.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.nurikiri.domain.EditorVO;
import com.nurikiri.domain.ReviewImageVO;
import com.nurikiri.domain.ReviewVO;
import com.nurikiri.mapper.ReviewMapper;
import com.nurikiri.service.ReviewService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/api/store/review")
public class ReviewController {
	@Autowired
	ReviewMapper mapper;
	
	@Autowired
	ReviewService service;

	@GetMapping("/")
	public List<ReviewVO> readReviews(@RequestParam("sno") Long sno) {
		return mapper.readAll(sno);
	}

	@GetMapping("/{rno}")
	public ReviewVO readReview(@RequestParam("sno") Long sno, @PathVariable Long rno) {
		return mapper.get(rno);
	}
	
	@GetMapping("/{rno}/detail")
	public ReviewVO readReviewDetail(@PathVariable Long sno, @PathVariable Long rno) {
		return mapper.get(rno);
	}

	@PostMapping("/")
	public ReviewVO create(@RequestBody ReviewVO vo) {
		log.info("=========>" + vo);
		mapper.create(vo);
		return mapper.get(vo.getRno());
	}
	
//	@PostMapping("/uploadImage")
//	public String uploadImage(@Valid @ModelAttribute("image") ReviewImageVO vo, @RequestParam("file") MultipartFile file) {
////		String fileName = service.fileUpload(vo, file);
////		
////		String fileDownloadUri
//		File filename = 
//		vo.setFileName(null)
//		
//		return service.fileUpload(vo, file);
//	}

	@PutMapping("/{rno}")
	public ReviewVO update(@PathVariable Long rno, @RequestBody ReviewVO vo) {
		System.out.println("==> " + vo);
		mapper.update(vo);
		
		return mapper.get(vo.getRno());
	}

	@DeleteMapping("/{rno}")
	public String delete(@PathVariable Long rno) {
		System.out.println("delete ==>" + rno);
		mapper.delete(rno);
		return "OK";
	}
	
	/* 첨부 파일 업로드 */
	@PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<ReviewImageVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {
		
		log.info("uploadAjaxActionPOST..........");
		
		/* 이미지 파일 체크 */
		for(MultipartFile multipartFile: uploadFile) {
			
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			
			try {
				type = Files.probeContentType(checkfile.toPath());
				log.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(!type.startsWith("image")) {
				
				List<ReviewImageVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
				
			}
			
		}// for
//		String uploadFolder = "C:\\upload";
		String uploadFolder = "/Users/jeonhayoon/upload/review";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		String datePath = str.replace("-", File.separator);
		
		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		List<ReviewImageVO> list = new ArrayList();
		
		for(MultipartFile multipartFile : uploadFile) {
			
			/*이미지 정보 객체*/
			ReviewImageVO vo = new ReviewImageVO();			
			
			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);
			
			/* uuid 적용 파일 이름 */
			String uuid = UUID.randomUUID().toString();//랜덤 변수 값 설정
			vo.setUuid(uuid);
			
			uploadFileName = uuid + "_" + uploadFileName; //파일 이름 생성
			
			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);
			
			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);
				
				/* 썸네일 생성(ImageIO)*/
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
				
				BufferedImage bo_image = ImageIO.read(saveFile);
				
					/* 비율 */
					double ratio = 3;
					/*넓이 높이*/
					int width = (int) (bo_image.getWidth() / ratio);
					int height = (int) (bo_image.getHeight() / ratio);
				
				BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
								
				Graphics2D graphic = bt_image.createGraphics();
				
				graphic.drawImage(bo_image, 0, 0,width, height, null);
					
				ImageIO.write(bt_image, "jpg", thumbnailFile);
				
			} catch (Exception e) {
				
				e.printStackTrace();
				
			} 
			list.add(vo);
		}
		
		ResponseEntity<List<ReviewImageVO>> result = new ResponseEntity<List<ReviewImageVO>>(list, HttpStatus.OK);

		return result;
	}
	
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName){
		
		log.info("getImage()......." + fileName);
		
//		File file = new File("c:\\upload\\" + fileName);
		File file = new File("/Users/jeonhayoon/upload/reveiw/" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	/* 이미지 파일 삭제 */
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName){
		
		log.info("deleteFile........" + fileName);
		
		File file = null;
		
		try {
			/* 썸네일 파일 삭제 */
//			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			file = new File("/Users/jeonhayoon/upload/" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			/* 원본 파일 삭제 */
			String originFileName = file.getAbsolutePath().replace("s_", "");
			
			log.info("originFileName : " + originFileName);
			
			file = new File(originFileName);
			
			file.delete();
			
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
			
		}
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
}
