package com.dgit.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.ProductVO;
import com.dgit.persistence.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductDAO dao;
	
	@Override
	public List<ProductVO> selectBestItem() {
		
		return dao.selectBestItem();
	}

	@Override
	public List<ProductVO> selectWeekItem(Map<String, Object> map) {
		
		return dao.selectWeekItem(map);
	}

	@Override
	public List<ProductVO> searchBrand(String brand) {
		
		return dao.searchBrand(brand);
	}

	
}
