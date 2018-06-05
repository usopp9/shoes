package com.dgit.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.DetailProductVO;
import com.dgit.persistence.DetailProductDAO;
@Service
public class DetailProductServiceImpl implements DetailProductService {
	
	@Autowired
	DetailProductDAO dao;
	
	@Override
	public List<String> selectDPColor(int pNo) {
		
		return dao.selectDPColor(pNo);
	}

	@Override
	public List<DetailProductVO> selectDPNoneColor(Map<String, Object> map) {
		
		return dao.selectDPNoneColor(map);
	}

	@Override
	public void discountDstock(Map<String, Object> map) {
		
		dao.discountDstock(map);
	}

}
