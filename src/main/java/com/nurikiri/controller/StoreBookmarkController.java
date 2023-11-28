package com.nurikiri.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.nurikiri.domain.StoreBookmarkVO;
import com.nurikiri.mapper.StoreMapper;

@RestController
@RequestMapping("/api/store/storeBookmark")
public class StoreBookmarkController {
	@Autowired
	StoreMapper mapper;

	@PostMapping("/add")
	public StoreBookmarkVO addStoreBookmark(@RequestBody StoreBookmarkVO storeBookmark) {
		mapper.addStoreBookmark(storeBookmark);
		return storeBookmark;
	}

	@DeleteMapping("/delete")
	public String deleteStoreBookmark(StoreBookmarkVO storeBookmark) {
		mapper.deleteStoreBookmark(storeBookmark);
		return "OK";
	}
}
