package com.dgit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.dgit.domain.BrandVO;
import com.dgit.domain.CategoryVO;
import com.dgit.service.BrandService;
import com.dgit.service.CategoryService;
import com.dgit.service.CoustomerService;

@RestController
@RequestMapping("/header") 
public class HeaderController {

	private static final Logger logger = LoggerFactory.getLogger(HeaderController.class);

	@Autowired
	CategoryService categoryService;

	@Autowired
	BrandService brandService;

	@Autowired 
	CoustomerService coustomerService;

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

	/*loginInterceptor*/
	@RequestMapping(value ="login", method = RequestMethod.POST)
	public ResponseEntity<String> login(@RequestBody Map<String, Object> param) {
		ResponseEntity<String> entity = null;
		logger.info("login.............................................................");
		logger.info("id : " + param.get("id"));

		try {

			Map<String, Object> map = new HashMap<>();
			map.put("id", param.get("id"));

			map.put("password", param.get("password"));

			String login = coustomerService.login(map);
			System.out.println(login);

			if (login == null) {
				login = "";
				entity = new ResponseEntity<String>("fail", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("success", HttpStatus.OK);// 200
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);// 400
		}
		return entity;
	}
}