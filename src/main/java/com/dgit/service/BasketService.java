package com.dgit.service;

import java.util.List;

import com.dgit.domain.BasketVO;

public interface BasketService {
	public void insertBasket(BasketVO vo); 
	
	public List<BasketVO> selectBasket(String bId);
	
	public void deleteBasket(int bNo);
	
	public void updateBasket(BasketVO vo); 
	
	public BasketVO selectOneOrder(int bNo);
	
}
