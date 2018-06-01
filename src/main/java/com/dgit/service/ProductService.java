package com.dgit.service;

import java.util.List;
import java.util.Map;

import com.dgit.domain.ProductVO;

public interface ProductService {
	public List<ProductVO> selectBestItem();
	public List<ProductVO> selectWeekItem(Map<String, Object> map);
	
	/*searchBrand*/
	public List<ProductVO>searchBrand(String brand);
	
	/*searchCategory*/
	public List<ProductVO>searchCategory(String cName);
	
	public List<ProductVO>serachAll(String search);
	
	/*detail_page*/
	public ProductVO selectDetailProduct(int pNo);
}
