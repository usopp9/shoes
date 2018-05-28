package com.dgit.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.dgit.domain.BrandVO;
import com.dgit.domain.CategoryVO;
import com.dgit.service.BrandService;
import com.dgit.service.CategoryService;

@RestController
@RequestMapping("/header")
public class HeaderController {

	private static final Logger logger = LoggerFactory.getLogger(HeaderController.class);

	@Autowired
	CategoryService categoryService;

	@Autowired
	BrandService brandService;
	
	@ResponseBody
	@RequestMapping(value = "")
	public ResponseEntity<List<CategoryVO>> selectAllCategory() {
		ResponseEntity<List<CategoryVO>> entity = null;
		try {
			List<CategoryVO> list = categoryService.selectAllCategory();
			logger.info(list.toString());
			entity = new ResponseEntity<List<CategoryVO>>(list, HttpStatus.OK);// 200
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<CategoryVO>>(HttpStatus.BAD_REQUEST);// 400
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "brand")
	public ResponseEntity<List<BrandVO>> selectAllBrand() {
		ResponseEntity<List<BrandVO>> entity = null;
		try {
			List<BrandVO> list = brandService.selectAllBrand();
			logger.info(list.toString());
			entity = new ResponseEntity<List<BrandVO>>(list, HttpStatus.OK);// 200
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<BrandVO>>(HttpStatus.BAD_REQUEST);// 400
		}
		return entity;
	}
}