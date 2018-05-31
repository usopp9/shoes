package com.dgit.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dgit.domain.ProductVO;
import com.dgit.service.ProductService;


@RequestMapping("/search/*")
@Controller
public class SearchController {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value="brand", method=RequestMethod.GET)
	public void memberJoinGet(String brand,Model model){
		logger.info("brand Get.......");	
		logger.info("brand : "+brand);
		
		List<ProductVO> list = productService.searchBrand(brand);
		model.addAttribute("brand", brand);
		if(list.size()>0){
		logger.info("list : "+list);	
		model.addAttribute("list", list);
		}
	}
}
