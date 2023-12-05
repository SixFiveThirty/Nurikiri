package com.nurikiri.domain;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.DecimalFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EditorAttachmentVO {
	public static final String UPLOAD_PATH = "C:\nuriphoto\store";
	
	private Long no;
	private String filename;
	private String path;
	private String contentType;
	private Long size;
	private Long eno;
	private Date regDate;
	
	//업로드 할 때 사용
	//eno : FK, part : File 임시정보. 임시파일 존재.
	public EditorAttachmentVO(Long bno,MultipartFile part) throws Exception {
		filename = part.getOriginalFilename();
		contentType = part.getContentType();
		size = part.getSize();
		this.eno = eno; //앞에 this를 빼면 자기거에 자기거를 저장하는 꼴이 되므로 안빼뜨리게 조심할것..!
		path = UPLOAD_PATH + "/" + System.currentTimeMillis() + "_" + filename;
		//new File(path) : 예외 가능, 던지는 것으로 처리.
		part.transferTo(new File(path)); //실제 저장. ~~~/upload/board에 저장.
	}
	
	public String getFormatSize() {
		if (size <= 0)
			return "0";
		final String[] units = new String[] { "Bytes", "KB", "MB", "GB", "TB" };
		int digitGroups = (int) (Math.log10(size) / Math.log10(1024));
		return new DecimalFormat("#,##0.#")
						.format(size / Math.pow(1024, digitGroups)) +
					 " " + units[digitGroups];
	}
	
	public void download(HttpServletResponse response) throws Exception {
		response.setContentType("application/download");
//		response.setContentType(contentType);
		response.setContentLength(size.intValue()); //size.intValue() 는 Long타입
		
		//다운로드의 핵심
		String filename = URLEncoder.encode(this.filename, "UTF-8"); //this.filename = 원본의 이름
		response.setHeader("Content-disposition", "attachment;filename=\"" + filename + "\""); // 중간의 filename = 디폴트 저장파일명
		
		try(OutputStream os = response.getOutputStream();
			BufferedOutputStream bos = new BufferedOutputStream(os)) {
			File file = new File(path); //path = 실제경로
			Files.copy(file.toPath(), bos); //file.toPath() = 소스, bos = 출력 스트림
		}
	}
}
