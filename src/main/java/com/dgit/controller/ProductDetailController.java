package com.dgit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgit.domain.BasketVO;
import com.dgit.domain.DetailProductVO;
import com.dgit.domain.ProductVO;
import com.dgit.service.BasketService;
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
	
	@Autowired
	BasketService basketService;
	
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
	
	
	@ResponseBody
	@RequestMapping(value="basketOder")
	public ResponseEntity<String> basket(int dNo,int cnt,HttpServletRequest request){
		logger.info("basketOder....................................");	
		logger.info("dNo : " + dNo);
		ResponseEntity<String> entity = null;
		try{
			HttpSession session = request.getSession();
			String id =(String) session.getAttribute("id");
			System.out.println(id); 
			if(id==null){
				String serverId = request.getRemoteAddr();
				System.out.println(serverId);
				id = serverId;
			}
			/*for(int i =0;i < dNo.length;i++){ 
				logger.info("dNo : " + dNo[i]);
				logger.info("cnt : " + cnt[i]); */
				BasketVO vo = new BasketVO();
				vo.setbId(id);
				vo.setDetailProduct(new DetailProductVO(dNo));
				vo.setbCount(cnt);	 
				basketService.insertBasket(vo);
			/*} */	 
			entity = new ResponseEntity<String>("success",HttpStatus.CREATED);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	
	@RequestMapping(value="basket", method=RequestMethod.GET)
	public void basket(HttpServletRequest request,Model model){
		logger.info("basket....................................");	
		
		HttpSession session = request.getSession();
		String id =(String) session.getAttribute("id");
		System.out.println(id); 
		if(id==null){
			String serverId = request.getRemoteAddr();
			System.out.println(serverId);
			id = serverId;
		}
		List<BasketVO> vo = basketService.selectBasket(id);
		System.out.println(vo);
		/*model.addAttribute("id",id);*/
		model.addAttribute("vo",vo);
	}
	
}
 