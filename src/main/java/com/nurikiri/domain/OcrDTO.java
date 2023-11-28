package com.nurikiri.domain;

import java.util.List;

import lombok.Data;

@Data
public class OcrDTO {
	private String version;
	private String requestId;
	private int timestamp;
	private List<OcrBodyImage> images;
}
