package com.paiksrecipe.persistence;

import java.util.List;

import com.paiksrecipe.domain.ProductDTO;

public interface ProductDAO {
	// @Select("SELECT COUNT(*) FROM tbl_pdt") // 간단한거 할때, 복잡할때는 mapper를 씀
	// public int getCount();
	
	// public int getCount2(); // 경로없을 때 productmapper로 감(이름이 같았던 mapper)
	
	public List<ProductDTO> bestPdtList();
}
