package com.dgit.shoes;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.CoustomerVO;
import com.dgit.persistence.CoustomerDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class CoustomerDAOTest {
	
	@Autowired
	CoustomerDAO dao;
	
	//@Test
	public void testSelectAllId() throws Exception{
		List<String> list  = dao.selectAllId();	
		for(String s: list){
			System.out.println(s);
		}
	}
	/*@Test
	public void testLogin() throws Exception{
		CoustomerVO vo = new CoustomerVO();
		
		vo.setcId("test10");
		vo.setcPassword("dddd");
		
		List<String> login = dao.login(vo);
		if(login != null){
			System.out.println(login);
		}
	}*/
}
