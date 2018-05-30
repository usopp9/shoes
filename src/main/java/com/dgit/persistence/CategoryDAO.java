package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.CategoryVO;

public interface CategoryDAO {
	public List<CategoryVO> selectAllCategory();
}
