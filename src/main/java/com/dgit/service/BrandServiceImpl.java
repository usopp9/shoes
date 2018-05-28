package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.BrandVO;
import com.dgit.persistence.BrandDAO;

@Service
public class BrandServiceImpl implements BrandService {
	
	@Autowired
	BrandDAO dao;
	@Override
	public List<BrandVO> selectAllBrand() {
		
		return dao.selectAllBrand();
	}

}
