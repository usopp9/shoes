package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.CoustomerVO;


@Repository
public class CoustomerDAOImpl implements CoustomerDAO {
	
	@Autowired
	SqlSession session;
	
	private static final String namespace = "com.dgit.mapper.CoustomerMapper";
	@Override
	public List<String> selectAllId() {
		
		return session.selectList(namespace+".selectAllId");
	}

	@Override
	public void insertCoustomer(CoustomerVO vo) {
		
		session.insert(namespace+".insertCoustomer",vo);
	}



}
