package com.paiksrecipe.service.index;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paiksrecipe.domain.ProductDTO;
import com.paiksrecipe.persistence.ProductDAO;
import com.paiksrecipe.service.index.IndexServiceImpl;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class IndexServiceImpl implements IndexService {
	// 기존에는 DAO -> Mybatis -> DB(Oracle) 순차적으로
		// 동작해서 비효율적이던 실행방법을 다음과 같이
		// DAO+Mapper를 결합해서 사용하는 방식을 사용
		
		// sqlSession을 사용하기 위한 의존성 주입
		// : root-context.xml에서 생성된 sqlSession빈즈를 주입받음
		@Autowired
		private SqlSession sqlSession;
		
		ProductDAO pDao; // 전역변수, 값이 없으면 null
		@Autowired
		public void newProductDAO() {
			pDao = sqlSession.getMapper(ProductDAO.class);
		} //  여기 pDao는 sqlSession 실행할 것을 담음(ProductDAO.class에 있는)
		
		@Override
		public List<ProductDTO> bestPdtList() {
			// log.info("@을 사용한 방법 : " +pDao.getViews());
			// log.info("xml을 사용한 방법 : "+ pDao.getViews2());
			
			// 비즈니스 로직
			// : best상품 5건을 조회해서 View(main)단에 출력
			// List<ProductDTO> list = pDao.bestPdtList();
			// 5개담아서 list에 담음
			
			// for(ProductDTO productDTO : list){
			//	 	log.info(productDTO.toString());
			// } db에서 서비스단으로 보내는것
			return pDao.bestPdtList();
		}
}
