package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.CategoryVO;
import com.dgit.persistence.CategoryDAO;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	CategoryDAO dao;
	@Override
	public List<CategoryVO> selectAllCategory() {
		
		return dao.selectAllCategory();
	}

	
}
