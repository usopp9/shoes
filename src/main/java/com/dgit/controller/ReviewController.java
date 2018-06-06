package com.dgit.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.dgit.domain.ReviewsVO;

@Controller
@RequestMapping("/review") 
public class ReviewController {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="write", method=RequestMethod.POST)
	public ResponseEntity<String> write(@RequestBody ReviewsVO vo,@RequestBody MultipartFile fileObj){
		logger.info("write Post.......");
		logger.info("vo : "+vo.toString()); 
		logger.info("fileObj +" +fileObj); 
		return null;
		 
	}
}
 