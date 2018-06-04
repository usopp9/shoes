package com.dgit.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.OrderProductVO;

@Repository
public class OrderProductDAOImpl implements OrderProductDAO {

	@Autowired
	SqlSession session;
	
	private static final String namespace = "com.dgit.mapper.OrderProductMapper";
	
	
	@Override
	public void insertOrder(OrderProductVO vo) {
		session.insert(namespace+".insertOrder",vo);
	}

}
