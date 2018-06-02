package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.BasketVO;
import com.dgit.persistence.BasketDAO;

@Service
public class BasketServiceImpl implements BasketService{
	
	@Autowired
	BasketDAO dao;
	
	@Override
	public void insertBasket(BasketVO vo) {
		
		dao.insertBasket(vo);
	}
	
	@Override
	public List<BasketVO> selectBasket(String bId) {
		
		return dao.selectBasket(bId);
	}

	

}
