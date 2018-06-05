package com.dgit.persistence;

import java.util.List;
import java.util.Map;

import com.dgit.domain.DetailProductVO;

public interface DetailProductDAO {
	
	public List<String> selectDPColor(int pNo);
	
	public List<DetailProductVO>selectDPNoneColor(Map<String, Object> map); 
	
	public void discountDstock(Map<String, Object> map);
}
