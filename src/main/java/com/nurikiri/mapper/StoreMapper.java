package com.nurikiri.mapper;

import java.security.Principal;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.StoreBookmarkVO;
import com.nurikiri.domain.StoreVO;

public interface StoreMapper {

	public List<StoreVO> getList();

	public void insert(StoreVO store);

	public int update(StoreVO store);

	public int delete(Long sno);

	public StoreVO read(Long sno);

	public List<StoreVO> getListWithPaging(Criteria cri);

	public int getTotalCount(Criteria cri);
	
	public List<StoreVO> getBookMarksList(@Param("username") String username, @Param("cri") Criteria cri);

	// 즐겨찾기 처리
	public List<Long> getStoreBookmarksList(String username);

	public int addStoreBookmark(StoreBookmarkVO storeBookmark);

	public int deleteStoreBookmark(StoreBookmarkVO storeBookmark);
	
	public int bookmarkTotalCount(@Param("username") String username, @Param("cri") Criteria cri);
}