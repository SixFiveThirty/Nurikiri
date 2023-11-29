package com.nurikiri.service;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

public interface OcrService {
	public String extractTextFromImage(MultipartFile imageFile) throws Exception;
}
