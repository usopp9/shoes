package com.dgit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dgit.domain.Criteria;
import com.dgit.domain.PageMaker;
import com.dgit.domain.ReviewsVO;
import com.dgit.service.OrderProductService;
import com.dgit.service.ReviewsService;
import com.dgit.util.MediaUtils;
import com.dgit.util.UploadFileUtils;

@Controller
/*@RestController*/
@RequestMapping("/review") 
public class ReviewController {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	ReviewsService  reviewsService;
	
	@Autowired  
	OrderProductService orderProductService;
	
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
			if(!file.getOriginalFilename().equals("")){  		  	  
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
	
	
	@RequestMapping(value="writeMember", method=RequestMethod.GET)
	public ResponseEntity<String> writeMember(int pNo,HttpServletRequest request){
		logger.info("writeMember Post.......");  
		logger.info("pNo : "+ pNo);         
 		
		ResponseEntity<String> entity = null;    
		try {    
			HttpSession session = request.getSession();
			String id =(String) session.getAttribute("id");
			 
			Map<String, Object> map = new HashMap<>();
			map.put("id", id);
			map.put("pNo", pNo);
			
			List<Integer> list = orderProductService.selectReviewMember(map);
			
			if(list.size()==0){
				entity = new ResponseEntity<String>("fail", HttpStatus.OK);// 200
			}else{
				entity = new ResponseEntity<String>("success", HttpStatus.OK);// 200	
			}			
		} catch (Exception e) {    
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);// 400
		}
		return entity;	    
	}   
	
	
	@RequestMapping(value="writeUpdate", method=RequestMethod.POST)
	public ResponseEntity<String> writeUpdate(MultipartFile file,ReviewsVO vo,HttpServletRequest request,String oldPic){
		logger.info("writeUpdate Post.......");
		logger.info("vo : "+vo.toString());
		logger.info("oldPic : "+oldPic);  
		logger.info("fileObj +" +file.getOriginalFilename());  
		
		
		ResponseEntity<String> entity = null;  
		try {
			
			if(oldPic != null){
				oldPic = oldPic.substring(35, oldPic.length());  
				UploadFileUtils.deleteFile(uploadPath, oldPic); 
			}  

			if(oldPic ==null){
				System.out.println("nulll");  
				reviewsService.updateReviewsNoneImg(vo);
			}
			if(!file.getOriginalFilename().equals("")){  	
				
				String thumb =  UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());  
				vo.setrPic(thumb);	
				reviewsService.updateReviews(vo);
			}
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);// 200
				
		} catch (Exception e) {    
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);// 400
		}
		return entity;	    
	}  
	
	
	/*사진외부 보여주기*/
	@ResponseBody
	@RequestMapping("displayFile") 
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
		logger.info("deleteReview GET.......");
		logger.info("rNo : "+rNo);
		logger.info("rPic : "+rPic);  
		
		ResponseEntity<String> entity = null;
		try {
			
			
			/*사진삭제수정 해야함*/
			if(!rPic.equals("null")){         
				logger.info("찍히냐");               
				UploadFileUtils.deleteFile(uploadPath, rPic); 
			}         
			reviewsService.deleteReviews(rNo);	    	
			entity = new ResponseEntity<String>("success", HttpStatus.OK);// 200
				
		} catch (Exception e) {    
			e.printStackTrace();  
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);// 400
		}
		return entity;	    
	}  
	
	/*댓글 페이징*/
	
	// /{bno}/{page}
	@RequestMapping(value="{pNo}/{page}",method=RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> listPage(@PathVariable("pNo")int pNo,@PathVariable("page")int page){
		logger.info("listPage");       
		logger.info("pNo : "+pNo);   
		logger.info("page : "+page); 
		ResponseEntity<Map<String,Object>> entity = null;
		 
		try {   
			Criteria cri = new Criteria();
			cri.setPage(page);
			List<ReviewsVO> list = reviewsService.selectAllReviews(pNo, cri);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(reviewsService.selectCount(pNo));
			
			Map<String,Object> map = new HashMap<>();
			map.put("list", list);  
			map.put("pageMaker", pageMaker);
			
			entity = new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
			
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}
 