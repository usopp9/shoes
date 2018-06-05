package com.dgit.service;

import java.util.List;
import java.util.Map;

import com.dgit.domain.DetailProductVO;

public interface DetailProductService {
	public List<String> selectDPColor(int pNo);
	
	public List<DetailProductVO>selectDPNoneColor(Map<String, Object> map); 
	public void discountDstock(Map<String, Object> map);
}
