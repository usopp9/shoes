package com.dgit.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgit.domain.CoustomerVO;
import com.dgit.service.CoustomerService;

@RequestMapping("/member/*")
@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private CoustomerService service;
	  
	
	@RequestMapping(value="join", method=RequestMethod.GET)
	public void memberJoinGet(){
		logger.info("member join Get.......");	
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
	
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String joinResultPOST(CoustomerVO vo,String birth,Model model) throws ParseException{
		logger.info("join POST.......");	
		DateFormat sdFormat = new SimpleDateFormat("yyyyMMdd");
		Date tempDate = sdFormat.parse(birth);
		
		vo.setcBirth(tempDate);
		vo.setcTf(true);
		vo.setcPoint(0);
		
		model.addAttribute("name", vo.getcName());
		service.insertCoustomer(vo);
		 
		return "redirect:/member/joinResult";  
	}
	
	@RequestMapping(value="joinResult", method=RequestMethod.GET)
	public void joinResultGet(@ModelAttribute("name") String name,Model model){
		logger.info("joinResult Get.......");	
		model.addAttribute("name", name);
	}
}
