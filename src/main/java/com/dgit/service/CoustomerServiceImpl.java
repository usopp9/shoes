package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.CoustomerVO;
import com.dgit.persistence.CoustomerDAO;

@Service
public class CoustomerServiceImpl implements CoustomerService {
	
	
	@Autowired
	CoustomerDAO dao;
	
	@Override
	public List<String> selectAllId() {
		
		return dao.selectAllId();
	}

	@Override
	public void insertCoustomer(CoustomerVO vo) {
		
		dao.insertCoustomer(vo);
	}

}
