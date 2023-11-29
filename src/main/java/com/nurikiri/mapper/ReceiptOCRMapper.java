package com.nurikiri.mapper;

import java.util.List;

import com.nurikiri.domain.ReceiptOCRVO;

public interface ReceiptOCRMapper {
	public List<ReceiptOCRVO> getList();
	public void insert(ReceiptOCRVO receipt);
}