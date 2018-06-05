package com.dgit.persistence;

import java.util.List;
import java.util.Map;

import com.dgit.domain.CoustomerVO;
import com.dgit.domain.OrderProductVO;

public interface CoustomerDAO {
	public List<String> selectAllId();
	
	public void insertCoustomer(CoustomerVO vo);
	
	/*로그인*/
	public String login(Map<String,Object> map);
	
	/*주문*/
	public CoustomerVO selectOrderCoustomer(String cId);
	
	/*포인트삭제*/
	public void updateCoustomerPoint(OrderProductVO vo);
	
	/*포인트추가*/
	public void updateCoustomerPointAdd(OrderProductVO vo);
}
