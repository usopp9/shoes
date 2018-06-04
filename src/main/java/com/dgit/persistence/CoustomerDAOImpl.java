package com.dgit.persistence;

import java.util.List;
import java.util.Map;

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

	@Override
	public String login(Map<String, Object> map) {
		
		return session.selectOne(namespace+".login",map);
	}

	@Override
	public CoustomerVO selectOrderCoustomer(String cId) {
		
		return session.selectOne(namespace+".selectOrderCoustomer",cId); 
	}

	@Override
	public void updateCoustomerPoint(String cId) {
		
		session.update(namespace+".updateCoustomerPoint",cId);
	}



}
