package com.dgit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.OrderProductVO;
import com.dgit.persistence.OrderProductDAO;
@Service
public class OrderProductServiceImpl implements OrderProductService {
	
	@Autowired
	OrderProductDAO dao;
	
	@Override
	public void insertOrder(OrderProductVO vo) {
		
		dao.insertOrder(vo);
	}

}
