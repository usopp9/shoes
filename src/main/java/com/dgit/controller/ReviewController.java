package com.dgit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dgit.domain.ReviewsVO;
import com.dgit.service.ReviewsService;
import com.dgit.util.MediaUtils;
import com.dgit.util.UploadFileUtils;

@Controller
@RequestMapping("/review") 
public class ReviewController {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	ReviewsService  reviewsService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="write", method=RequestMethod.POST)
	public ResponseEntity<String> write(MultipartFile file,ReviewsVO vo,HttpServletRequest request){
		logger.info("write Post.......");
		logger.info("vo : "+vo.toString());
		logger.info("fileObj +" +file.getOriginalFilename());      
		
		ResponseEntity<String> entity = null;
		try {
			ReviewsVO reviews = new ReviewsVO();	
			File dirPath = new File(uploadPath);
			if(dirPath.exists() == false){
				dirPath.mkdirs();
			}
			if(!file.equals("")){  
				
				String thumb =  UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());  
				vo.setrPic(thumb);	
			}
			reviewsService.insertReviews(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);// 200
				
		} catch (Exception e) {    
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);// 400
		}
		return entity;	    
	}  
	
	/*사진외부 보여주기*/
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String filename)throws Exception{
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;
		
		logger.info("[displayFile] filename" + filename);
		try{
			String format = filename.substring(filename.lastIndexOf(".")+1);  
			/*String format = filename.substring(filename.lastIndexOf("."));*/
			MediaType mType = MediaUtils.getMediaType(format);  
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(mType);
			
			in = new FileInputStream(uploadPath+"/"+filename);
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
			
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			in.close();
		}
		return entity;
	}
	
	
	@RequestMapping(value="deleteReview", method=RequestMethod.GET)
	public ResponseEntity<String> write(int rNo,String rPic){
		logger.info("write Post.......");
		logger.info("rNo : "+rNo);
     
		
		ResponseEntity<String> entity = null;
		try {
			
			/*사진삭제수정 해야함*/
			UploadFileUtils.deleteFile(uploadPath, rPic); 
			reviewsService.deleteReviews(rNo);		
			entity = new ResponseEntity<String>("success", HttpStatus.OK);// 200
				
		} catch (Exception e) {    
			e.printStackTrace();  
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);// 400
		}
		return entity;	    
	}  
}
 