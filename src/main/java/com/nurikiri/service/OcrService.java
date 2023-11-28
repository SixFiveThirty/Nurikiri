package com.nurikiri.service;

import java.io.File;

public interface OcrService {
	public String extractTextFromImage(File imageFile) throws Exception;
}
