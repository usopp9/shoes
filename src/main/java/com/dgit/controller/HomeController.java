package com.dgit.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dgit.domain.ProductVO;
import com.dgit.service.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	ProductService productservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		/*btestItem*/
		List<ProductVO> bestItem = productservice.selectBestItem();
	/*	for(ProductVO vo:bestItem){
			logger.info("bestItem : " +vo);
		}*/
		/*weekItem*/
		Calendar c = Calendar.getInstance();
		Map<String, Object> map = new HashMap<>();
		int day = c.get(Calendar.DATE);
		int d = c.get(Calendar.DAY_OF_WEEK);
		int start = 0;
/*		System.out.println("원래day : " +c.get(Calendar.DATE));*/
		if(d==2){
			start = 0;
		}else if(d==1){
			start = 0;
		}else if(d>2){
			start = d-2; 
			
		}
		c.set(Calendar.DATE, day-start);
		int year =c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH);
		String dd =  Integer.toString(year)+"-"+Integer.toString(month+1)+"-"+String.valueOf(c.get(Calendar.DATE));
		System.out.println(dd);
		map.put("start",dd);
	/*	System.out.println(String.valueOf(c.get(Calendar.DATE)));*/
		c.set(Calendar.DATE, (day-start)+6);
		year =c.get(Calendar.YEAR);
		month = c.get(Calendar.MONTH);
		 dd =  Integer.toString(year)+"-"+Integer.toString(month+1)+"-"+String.valueOf(c.get(Calendar.DATE));
		 System.out.println(dd);
	/*System.out.println(String.valueOf(c.get(Calendar.DATE)));*/	
		map.put("end",dd);
		List<ProductVO> weekItem = productservice.selectWeekItem(map);
		/*System.out.println(weekItem.size());*/
		/*for(ProductVO vo :weekItem){
			System.out.println(vo);
		}*/
			
		model.addAttribute("bestItem", bestItem);
		model.addAttribute("weekItem", weekItem);
		return "home";
	}	
	

	
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session){
		logger.info("logout ..................................");
		
		session.invalidate();
		return "redirect:/"; 
	}
}
