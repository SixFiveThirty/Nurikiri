package com.nurikiri.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.StoreManagerVO;

public interface StoreManagerMapper {
	
	public StoreManagerVO read(Long sno);
	
	public List<StoreManagerVO> getListWithPaging(Criteria cri);
	
	public void update(@Param("sno") Long sno, @Param("isDeleted") String isDeleted);
	
	//public void isDeleted(@Param("sno") Long sno, @Param("isDeleted") String isDeleted);
	
	public int getTotalCount(Criteria cri);

}
