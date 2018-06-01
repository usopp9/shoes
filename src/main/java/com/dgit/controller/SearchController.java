package com.dgit.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgit.domain.ProductVO;
import com.dgit.service.ProductService;


@RequestMapping("/search/*")
@Controller
public class SearchController {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value="brand", method=RequestMethod.GET)
	public void brandCategoryGet(String search,String type,Model model){
		logger.info("brand Get.......");	
		logger.info("brand : "+search);
		logger.info("type : "+type);
		model.addAttribute("brand", search);
		
		String st ="%";
		for(int i =1;i<search.length()+1;i++){
			st+=search.substring(--i,++i)+"%";			
		}
		st =  st.replace(" ", "");
		/*System.out.println(st);*/
		List<ProductVO> list = new ArrayList<>();
		if(type.equals("brand")){
			list = productService.searchBrand(st);
		}else if(type.equals("category")){
			list = productService.searchCategory(st);
		}		
	
		
		if(list.size()>0){
		logger.info("list : "+list);	
		model.addAttribute("list", list);
		}
	}	
	
	@RequestMapping(value="brand", method=RequestMethod.POST)
	public void searchAllPost(String search,Model model){
		logger.info("brand POST.......");	
		logger.info("search : "+search);
		
		model.addAttribute("brand", search);
		model.addAttribute("search", "검색결과-");
		
		List<ProductVO> list = productService.serachAll(search);
		if(list.size()>0){
			logger.info("list : "+list);	
			model.addAttribute("list", list);
		}
		model.addAttribute("size",list.size()+"개");
	}
}
