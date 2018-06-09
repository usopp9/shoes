package com.dgit.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
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
import com.dgit.domain.CoustomerVO;
import com.dgit.domain.DetailProductVO;
import com.dgit.domain.OrderProductVO;
import com.dgit.domain.ProductVO;
import com.dgit.domain.ReviewsVO;
import com.dgit.service.BasketService;
import com.dgit.service.CoustomerService;
import com.dgit.service.DetailProductService;
import com.dgit.service.OrderProductService;
import com.dgit.service.ProductService;
import com.dgit.service.ReviewsService;

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
	
	@Autowired
	CoustomerService coustomerService;
	
	@Autowired
	OrderProductService orderProductService;
	
	@Autowired
	ReviewsService  reviewsService;
	@RequestMapping(value="detail", method=RequestMethod.GET)
	public void detailGet(int no,Model model){
		logger.info("detail get..................................");
		logger.info("no : "+no);
		
		ProductVO product = productService.selectDetailProduct(no);
		List<String> color = detailProductService.selectDPColor(no);
		
		/*List<ReviewsVO> reviews = reviewsService.selectAllReviews(no);*/
	/*	logger.info("reviews : "+reviews);      */
		model.addAttribute("product", product);   
		model.addAttribute("color", color);    
		model.addAttribute("dNo", no);
		/*model.addAttribute("reviews", reviews);*/
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
		if(id==null){
			String serverId = request.getRemoteAddr();
			id = serverId;
		}
		List<BasketVO> vo = basketService.selectBasket(id);	
		model.addAttribute("vo",vo);
	}
	
	@ResponseBody
	@RequestMapping(value="deleleBasket", method=RequestMethod.GET)
	public ResponseEntity<String> deleleBasket(int bNo){
		logger.info("deleleBasket....................................");	
		logger.info("bNo : " + bNo);
		ResponseEntity<String> entity = null;
		try{
			basketService.deleteBasket(bNo);
			entity = new ResponseEntity<String>("success",HttpStatus.CREATED);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
		
	@RequestMapping(value="updateBasket", method=RequestMethod.POST)
	public ResponseEntity<String> updateBasket(@RequestBody BasketVO vo){
		logger.info("updateBasket....................................");	
		logger.info("vo : " + vo.toString());
		ResponseEntity<String> entity = null; 
		try{ 
			basketService.updateBasket(vo);
			entity = new ResponseEntity<String>("success",HttpStatus.CREATED);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="orderNow", method=RequestMethod.POST)
	public void orderNow(int[] bNo,HttpServletRequest request,Model model){
		logger.info("orderNow POST..................................");
		
		List<BasketVO> basket = new ArrayList<BasketVO>();
		for(int i =0;i<bNo.length;i++){
			logger.info("bNo : "+bNo[i]);
			BasketVO vo = basketService.selectOneOrder(bNo[i]);
			basket.add(vo); 
		}    
		HttpSession session = request.getSession();
		String id =(String) session.getAttribute("id");
		
		CoustomerVO coustomer = new CoustomerVO();
		if(id!=null){
			coustomer = coustomerService.selectOrderCoustomer(id);
		}
		   
		/*BasketVO basket = basketService.selectOneOrder(bNo);*/
		System.out.println(coustomer);     
		System.out.println(basket.size());  
		System.out.println(basket);    
		model.addAttribute("coustomer", coustomer);
		model.addAttribute("basket",basket);	
	}
	
	@RequestMapping(value="detailNowOrder", method=RequestMethod.POST)
	public void detailNowOrder(int[] bNo,int[] cnt, HttpServletRequest request,Model model){
		logger.info("detailNowOrder POST..................................");
		
		List<DetailProductVO> detail = new ArrayList<DetailProductVO>();
		List<Integer> count = new ArrayList<>();
		for(int i =0;i<bNo.length;i++){
			logger.info("bNo : "+bNo[i]);
			DetailProductVO vo = detailProductService.selectDetailOrderNow(bNo[i]);
			count.add(cnt[i]);
			detail.add(vo); 
		}    
		HttpSession session = request.getSession();
		String id =(String) session.getAttribute("id");
		
		CoustomerVO coustomer = new CoustomerVO();
		if(id!=null){
			coustomer = coustomerService.selectOrderCoustomer(id);
		}
		   
		/*BasketVO basket = basketService.selectOneOrder(bNo);*/
		System.out.println(coustomer);     
		System.out.println(detail.size());  
		System.out.println(detail);    
		model.addAttribute("coustomer", coustomer);
		model.addAttribute("detail",detail);	
		model.addAttribute("count",count);	
	}
	
	
	
	
	@RequestMapping(value="orderProduct", method=RequestMethod.POST)
	public void orderProduct(int[] dNo,int[] detailNo,int[] count,OrderProductVO vo,HttpServletRequest request,Model model){
		logger.info("orderProduct POST..................................");
		logger.info("detailNo : " + detailNo[0]);  
		HttpSession session = request.getSession();
		String id =(String) session.getAttribute("id");
		long nowTime = System.currentTimeMillis();
		vo.setoNum(-(int)nowTime); 
		
		if(id !=null){
			vo.setoId(id);
			coustomerService.updateCoustomerPoint(vo);
			 
		}else if(id ==null){
			String serverId = request.getRemoteAddr();
			vo.setoId(serverId);
			vo.setoPoint(0);
		}
		

		for(int i = 0; i<dNo.length;i++){
			logger.info("detailNo : "+detailNo[i]); 

			/*d.addAll(Arrays.asList(new DetailProductVO(detailNo[i])));*/

 
			/*List<DetailProductVO> d = new ArrayList<>();
			d.add(new DetailProductVO(detailNo[i]));*/  
			vo.setDetailProduct(detailNo[i]);  
			vo.setoCount(count[i]);  
			logger.info("vo : " + vo.toString());   
			orderProductService.insertOrder(vo); 
			
				basketService.deleteBasket(dNo[i]); 
		
			Map<String, Object> map = new HashMap<>();
			map.put("count", count[i]);
			map.put("dNo", detailNo[i]);
			detailProductService.discountDstock(map);		
		}		
		model.addAttribute("orderNum", vo.getoNum());
	}
	
	@RequestMapping(value="mypage",method=RequestMethod.GET)
	public void mypage(HttpServletRequest request,Model model){
		logger.info("mypage GET ..................................");	 
		
		HttpSession session = request.getSession();
		String id =(String) session.getAttribute("id");
		
		List<OrderProductVO> mypageList = orderProductService.selectOnum(id);

		logger.info("mypageList : "+mypageList);	 
		logger.info("mypageListSize : "+mypageList.size());	
		model.addAttribute("mypageList",mypageList);		
	} 
	
	@RequestMapping(value="nonmember",method=RequestMethod.GET)
	public void myPage(HttpServletRequest request){
		logger.info("mypagenonmember GET ..................................");	 
		
	
		/*String serverId = request.getRemoteAddr();
		
		logger.info("serverId : "+ serverId);	 */
	 
	} 
	
	
	@RequestMapping(value="mypageDetail",method=RequestMethod.GET)
	public void mypageDetail(int no,Model model){
		logger.info("mypageDetail GET ..................................");	 
		
		logger.info("no : "+ no);	
		List<OrderProductVO> detailList = orderProductService.selectMypageDetail(no);

		for(OrderProductVO orderVo : detailList){
			
			for(DetailProductVO vo : orderVo.getDetail()){
				logger.info("vo : "+vo);
			}
		}  
		
		logger.info("detailListSize : "+ detailList.get(0).getDetail().size());	
		logger.info("detailListSize : "+ detailList.size());	
		model.addAttribute("detailList",detailList);
		model.addAttribute("size",detailList.get(0).getDetail());
		
	}  
}
 