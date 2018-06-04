package com.dgit.persistence;

import java.util.List;
import java.util.Map;

import com.dgit.domain.CoustomerVO;

public interface CoustomerDAO {
	public List<String> selectAllId();
	
	public void insertCoustomer(CoustomerVO vo);
	
	/*로그인*/
	public String login(Map<String,Object> map);
	
	/*주문*/
	public CoustomerVO selectOrderCoustomer(String cId);
	
	/*포인트삭제*/
	public void updateCoustomerPoint(String cId);
}
