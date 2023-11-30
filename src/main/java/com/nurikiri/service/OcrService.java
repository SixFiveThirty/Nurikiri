package com.nurikiri.service;

import java.io.File;
import java.security.Principal;

import org.springframework.web.multipart.MultipartFile;

public interface OcrService {
	public String extractTextFromImage(MultipartFile imageFile, Principal principal, Long sno) throws Exception;
}
