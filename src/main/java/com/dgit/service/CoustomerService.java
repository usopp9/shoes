package com.dgit.service;

import java.util.List;

import com.dgit.domain.CoustomerVO;

public interface CoustomerService {
	public List<String> selectAllId();
	
	public void insertCoustomer(CoustomerVO vo);
	
}
