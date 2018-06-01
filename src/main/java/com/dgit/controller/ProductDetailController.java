package com.dgit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgit.domain.DetailProductVO;
import com.dgit.domain.ProductVO;
import com.dgit.service.DetailProductService;
import com.dgit.service.ProductService;

@RequestMapping("/product/*")
@Controller
public class ProductDetailController {

private static final Logger logger = LoggerFactory.getLogger(ProductDetailController.class);
	
	@Autowired
	ProductService productService;
	
	@Autowired
	DetailProductService detailProductService;
	
	@RequestMapping(value="detail", method=RequestMethod.GET)
	public void detailGet(int no,Model model){
		logger.info("detail get..................................");
		logger.info("no : "+no);
		
		ProductVO product = productService.selectDetailProduct(no);
		List<String> color = detailProductService.selectDPColor(no);
		
		logger.info("product : "+product);     
		model.addAttribute("product", product);   
		model.addAttribute("color", color);    		  
	}
	
	
	@ResponseBody
	@RequestMapping(value="size")   
	public ResponseEntity<List<DetailProductVO>> size(int pNo,String color)throws Exception{
		ResponseEntity<List<DetailProductVO>> entity = null;
		logger.info("size....................................");
		logger.info("pNo : " + pNo);
		logger.info("color : " + color);
		Boolean tf = true; 
		try{
			Map<String, Object> map = new HashMap<>();
			map.put("pNo", pNo);
			map.put("dColor", color);
			List<DetailProductVO> size = detailProductService.selectDPNoneColor(map);
				
			entity = new ResponseEntity<List<DetailProductVO>>(size,HttpStatus.CREATED);
			
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<DetailProductVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
 