package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.BasketVO;
@Repository
public class BasketDAOImpl implements BasketDAO {
	
	@Autowired
	SqlSession session;
	
	private static final String namespace = "com.dgit.mapper.BasketMapper";
	

	@Override
	public void insertBasket(BasketVO vo) {
		
		session.insert(namespace+".insertBasket",vo);
	}
	
	@Override
	public List<BasketVO> selectBasket(String bId) {
		
		return session.selectList(namespace+".selectBasket",bId);
	}


}
