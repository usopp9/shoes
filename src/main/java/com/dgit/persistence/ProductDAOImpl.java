package com.dgit.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	
	@Autowired
	SqlSession session;
	
	private static final String namespace = "com.dgit.mapper.ProductMapper";
	
	@Override
	public List<ProductVO> selectBestItem() {
		
		return session.selectList(namespace+".selectBestItem");
	}

	@Override
	public List<ProductVO> selectWeekItem(Map<String, Object> map) {
		
		return session.selectList(namespace+".selectWeekItem", map);
	}

	@Override
	public List<ProductVO> searchBrand(String brand) {
		
		return session.selectList(namespace+".searchBrand",brand);
	}

	@Override
	public List<ProductVO> searchCategory(String cName) {
		
		return session.selectList(namespace+".searchCategory",cName);
	}

	@Override
	public List<ProductVO> searchProductKor(String korName) {
		
		return session.selectList(namespace+".searchProductKor",korName);
	}

	@Override
	public List<ProductVO> searchProductEng(String engName) {
		
		return session.selectList(namespace+".searchProductEng",engName);
	}

	@Override
	public ProductVO selectDetailProduct(int pNo) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".selectDetailProduct",pNo); 
	}

}
