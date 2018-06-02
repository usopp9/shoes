package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.BasketVO;

public interface BasketDAO {
	public void insertBasket(BasketVO vo); 
	
	public List<BasketVO> selectBasket(String bId);
}
