package com.dgit.shoes;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.BasketVO;
import com.dgit.domain.DetailProductVO;
import com.dgit.persistence.BasketDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class BasketDAOTest {
	
	@Autowired
	BasketDAO dao;
	
	@Test
	public void testInsert(){
		BasketVO vo = new BasketVO();
		vo.setbId("test");
		vo.setDetailProduct(new DetailProductVO(1));
		vo.setbCount(3);	
		dao.insertBasket(vo);
	}
	
	//@Test
	/*public void testSelectBasket() throws Exception{
		BasketVO vo = dao.selectBasket(5);
		System.out.println(vo);
	}*/
	
}
