package com.nurikiri.domain;

import java.util.List;

import lombok.Data;

@Data
public class OcrBodyImage {
	private String format;
	private String name;
	private String url;
	private List<Integer> templateIds;
}
