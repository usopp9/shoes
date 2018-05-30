package com.dgit.shoes;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.CategoryVO;
import com.dgit.persistence.CategoryDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class CategoryDAOTest {
	
	@Autowired
	CategoryDAO dao;
	
	@Test
	public void testSelectAllCategory() throws Exception{
		List<CategoryVO> list  = dao.selectAllCategory();
		
		for(CategoryVO vo: list){
			System.out.println(vo);
		}
	}
	
}
