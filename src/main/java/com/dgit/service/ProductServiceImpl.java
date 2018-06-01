package com.dgit.service;

import java.util.ArrayList;
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

	@Override
	public List<ProductVO> searchCategory(String cName) {
		
		return dao.searchCategory(cName);
	}

	@Override
	public List<ProductVO> serachAll(String search) {
		List<ProductVO> list = new ArrayList<>();
		
		String st ="%";
		for(int i =1;i<search.length()+1;i++){
			st+=search.substring(--i,++i)+"%";			
		}
		st =  st.replace(" ", "");
		list = dao.searchBrand(st);	
		if(list.size()==0){
			list = dao.searchProductEng(st);
		}
		if(list.size()==0){
			list = dao.searchProductKor(st);
		}  
		if(list.size()==0){			
			list = dao.searchCategory(st);
		}		
		return list;
	}

	@Override
	public ProductVO selectDetailProduct(int pNo) {
		
		return dao.selectDetailProduct(pNo);
	}
	
}
