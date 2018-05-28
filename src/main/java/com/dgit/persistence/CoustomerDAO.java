package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.CoustomerVO;

public interface CoustomerDAO {
	public List<String> selectAllId();
	
	public void insertCoustomer(CoustomerVO vo);
}
