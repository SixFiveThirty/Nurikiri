package com.nurikiri.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.nurikiri.service.OcrService;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

@RestController
@RequestMapping("/api")
public class OcrController {

    @Autowired
    private OcrService ocrService;

    @PostMapping("/extractText")
    public String extractText(@RequestParam("file") MultipartFile file) throws Exception {
        try {
            // Convert MultipartFile to File
            File convertedFile = convertMultiPartToFile(file);

            // Call OCR Service to extract text
            String extractedText = ocrService.extractTextFromImage(convertedFile);

            // Clean up the temporary file
            convertedFile.delete();

            return extractedText;
        } catch (IOException e) {
            e.printStackTrace();
            return "Error processing the file.";
        }
    }

    private File convertMultiPartToFile(MultipartFile file) throws IOException {
        File convertedFile = new File(file.getOriginalFilename());
        FileOutputStream fos = new FileOutputStream(convertedFile);
        fos.write(file.getBytes());
        fos.close();
        return convertedFile;
    }
}
