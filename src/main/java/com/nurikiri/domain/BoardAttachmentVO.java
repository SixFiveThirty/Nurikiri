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
public class BoardAttachmentVO {
	public static final String UPLOAD_PATH = "/c:/upload/board";
	
	private Long no;
	private String filename;
	private String path;
	private String contentType;
	private Long size;
	private Long bno;
	private Date regDate;
	
	public BoardAttachmentVO(Long bno, MultipartFile part) throws Exception{
		filename = part.getOriginalFilename();
		contentType = part.getContentType();
		size = part.getSize();
		this.bno = bno; //foreign 키
		path = UPLOAD_PATH + "/" +System.currentTimeMillis() + "_" + filename;
		part.transferTo(new File(path));
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
	
	public void download(HttpServletResponse response) throws Exception{
		
		//response.setContentType("application/download");
		response.setContentType(contentType);
		response.setContentLength(size.intValue());  //Long타입이라서 int로 (int) 직접 못함
		
		String filename = URLEncoder.encode(this.filename,"UTF-8"); // 원본 파일 명
		response.setHeader("Content-disposition","attachment;filename=\"" + filename + "\"");  // filename 은 디폴트 저장 파일명
		
		try(OutputStream os = response.getOutputStream();
			BufferedOutputStream bos = new BufferedOutputStream(os)){
			File file = new File(path); //실제경로
			Files.copy(file.toPath(), bos);  // 소스, 출력 스트림
		}
		
	}
	
}
