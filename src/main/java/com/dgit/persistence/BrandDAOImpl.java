package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.BrandVO;


@Repository
public class BrandDAOImpl implements BrandDAO {
	
	@Autowired
	SqlSession session;
	
	private static final String namespace = "com.dgit.mapper.BrandMapper";
	@Override
	public List<BrandVO> selectAllBrand() {
		
		return session.selectList(namespace+".selectAllBrand");
	}

}
