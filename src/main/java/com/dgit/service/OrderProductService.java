package com.dgit.service;

import java.util.List;
import java.util.Map;

import com.dgit.domain.OrderProductVO;

public interface OrderProductService {
	public void insertOrder(OrderProductVO vo);
	
	public List<OrderProductVO> selectOnum(String oId);
	/*public List<OrderProductVO> selectOnumList(int oNum);*/
	
	public List<OrderProductVO> selectMypageDetail(int oNum);
	
	public List<Integer> selectNoneMemberMypage(Map<String, Object> map);
}
