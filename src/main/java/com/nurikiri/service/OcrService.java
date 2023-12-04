package com.nurikiri.service;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface OcrService {
	public String extractTextFromImage(MultipartFile imageFile, Principal principal, Long sno, HttpServletRequest request) throws Exception;
}
