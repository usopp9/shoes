package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.BrandVO;

public interface BrandDAO {
	public List<BrandVO> selectAllBrand();
}
