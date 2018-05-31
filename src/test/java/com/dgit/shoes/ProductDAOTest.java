package com.dgit.shoes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.ProductVO;
import com.dgit.persistence.ProductDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class ProductDAOTest {

	@Autowired
	ProductDAO dao;
	
	//@Test
	public void testMainItem(){
		List<ProductVO> list = dao.selectBestItem();
		System.out.println(list.size());
		for(ProductVO vo :list){
			System.out.println(list);
		}
	}
	//@Test
	public void testWeekItem(){
		Map<String, Object> map = new HashMap<>();
		map.put("start", "2018-05-28");
		map.put("end", "2018-06-03");
		List<ProductVO> list = dao.selectWeekItem(map);
		System.out.println(list.size());
		for(ProductVO vo :list){
			System.out.println(vo);
		}
	}
	@Test
	public void testSearchBrand(){
		List<ProductVO> list = dao.searchBrand("나이키");
		System.out.println(list.size());
		for(ProductVO vo :list){
			System.out.println(vo);
		}
		
	}
}
