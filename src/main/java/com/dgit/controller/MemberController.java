package com.dgit.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgit.service.CoustomerService;

@RequestMapping("/member/*")
@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private CoustomerService service;
	
	
	@RequestMapping(value="join", method=RequestMethod.GET)
	public void memberJoinGet(){
		logger.info("memberard join Get.......");	
	}
	
	
	@ResponseBody
	@RequestMapping("duplication") 
	public ResponseEntity<Boolean> duplicationById(String id)throws Exception{
		ResponseEntity<Boolean> entity = null;
		
		logger.info("duplicationById : " + id);
		Boolean tf = true; 
		try{
			List<String> list = service.selectAllId();
			for(String s: list){
				if(s.equals(id)){
					tf=false;
				}
			}		
			entity = new ResponseEntity<Boolean>(tf,HttpStatus.CREATED);
			
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Boolean>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
