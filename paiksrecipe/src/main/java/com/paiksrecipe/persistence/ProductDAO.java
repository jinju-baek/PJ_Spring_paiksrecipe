package com.paiksrecipe.persistence;

import java.util.List;

import com.paiksrecipe.domain.ProductDTO;

public interface ProductDAO {
	// @Select("SELECT COUNT(*) FROM tbl_pdt") // 간단한거 할때, 복잡할때는 mapper를 씀
	// public int getCount();
	
	// public int getCount2(); // 경로없을 때 productmapper로 감(이름이 같았던 mapper)
	
	public List<ProductDTO> bestPdtList();
	
	// 4. @관련 SQL이 없으면 mapper.xml에 가서 
	//  id가 newPdtList와 같은 SQL문을 찾아
	//  Oracle DB로 가서 실행 후
	// 결과를 return 받음
	
	public List<ProductDTO> newPdtList();
}
