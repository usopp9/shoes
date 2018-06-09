package com.dgit.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.OrderProductVO;
import com.dgit.persistence.OrderProductDAO;
@Service
public class OrderProductServiceImpl implements OrderProductService {
	
	@Autowired
	OrderProductDAO dao;
	
	@Override
	public void insertOrder(OrderProductVO vo) {
		
		dao.insertOrder(vo);
	}

	@Override
	public List<OrderProductVO> selectOnum(String oId) {
		
		return dao.selectOnum(oId);
	}

	/*@Override
	public List<OrderProductVO> selectOnumList(int oNum) {
		
		return dao.selectOnumList(oNum);
	}
*/
	@Override
	public List<OrderProductVO> selectMypageDetail(int oNum) {
		
		return dao.selectMypageDetail(oNum);
	}

	@Override
	public List<Integer> selectNoneMemberMypage(Map<String, Object> map) {
		
		return dao.selectNoneMemberMypage(map);
	}

	@Override
	public List<Integer> selectReviewMember(Map<String, Object> map) {
		
		return dao.selectReviewMember(map);
	}

}
