package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.CategoryVO;

@Repository
public class CategoryDAOImpl implements CategoryDAO {

	@Autowired
	SqlSession session;
	
	private static final String namespace = "com.dgit.mapper.CategoryMapper";
	
	@Override
	public List<CategoryVO> selectAllCategory() {
		
		return session.selectList(namespace+".selectAllCategory");
	}

}
