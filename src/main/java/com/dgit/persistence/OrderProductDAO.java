package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.OrderProductVO;

public interface OrderProductDAO {
	public void insertOrder(OrderProductVO vo);
	
	public List<OrderProductVO> selectOnum(String oId);
	/*public List<OrderProductVO> selectOnumList(int oNum);*/
	
	public List<OrderProductVO> selectMypageDetail(int oNum);
}
