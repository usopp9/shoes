package com.dgit.persistence;

import java.util.List;
import java.util.Map;

import com.dgit.domain.ProductVO;

public interface ProductDAO {
	public List<ProductVO> selectBestItem();
	
	public List<ProductVO> selectWeekItem(Map<String, Object> map);
	
	/*searchBrand*/
	public List<ProductVO>searchBrand(String brand);
	
	/*searchCategory*/
	public List<ProductVO>searchCategory(String cName);
	
	/*searchKor*/
	public List<ProductVO>searchProductKor(String korName);
	
	/*serachEng*/
	public List<ProductVO>searchProductEng(String engName);
	
	/*detail_page*/
	public ProductVO selectDetailProduct(int pNo);
	
}
