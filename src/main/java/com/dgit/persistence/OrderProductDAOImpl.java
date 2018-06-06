package com.dgit.persistence;

import java.util.List;
import java.util.Map;

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


	@Override
	public List<OrderProductVO> selectOnum(String oId) {
		
		return session.selectList(namespace+".selectOnum",oId);
	}


	/*@Override
	public List<OrderProductVO> selectOnumList(int oNum) {
		
		return session.selectList(namespace+".selectOnumList",oNum); 
	}
*/

	@Override
	public List<OrderProductVO> selectMypageDetail(int oNum) {
		
		return session.selectList(namespace+".selectMypageDetail",oNum); 
	}


	@Override
	public List<Integer> selectNoneMemberMypage(Map<String, Object> map) {
		
		return session.selectList(namespace+".selectNoneMemberMypage",map); 
	}

}
