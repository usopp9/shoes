package com.dgit.persistence;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.DetailProductVO;
@Repository
public class DetailProductImpl implements DetailProductDAO {
	
	@Autowired
	SqlSession session;
	
	private static final String namespace = "com.dgit.mapper.DetailProductMapper";
	@Override
	public List<String> selectDPColor(int pNo) {
		
		return session.selectList(namespace+".selectDPColor",pNo);
	}

	@Override
	public List<DetailProductVO> selectDPNoneColor(Map<String, Object> map) {
		
		return session.selectList(namespace+".selectDPNoneColor",map);
	}

	@Override
	public void discountDstock(Map<String, Object> map) {
		
		session.update(namespace+".discountDstock",map);
	}

	@Override
	public DetailProductVO selectDetailOrderNow(int dNo) {
		
		return session.selectOne(namespace+".selectDetailOrderNow",dNo);
	}

}
