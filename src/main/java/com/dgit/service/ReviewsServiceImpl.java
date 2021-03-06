package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.Criteria;
import com.dgit.domain.ReviewsVO;
import com.dgit.persistence.ReviewsDAO;

@Service
public class ReviewsServiceImpl implements ReviewsService {
	

	@Autowired
	ReviewsDAO dao;
	
	@Override
	public void insertReviews(ReviewsVO vo) {
		
		dao.insertReviews(vo);
	}

	@Override
	public List<ReviewsVO> selectAllReviews(int pNo,Criteria cri) {
		
		return dao.selectAllReviews(pNo,cri);
	}

	@Override
	public void deleteReviews(int rNo) {
		
		dao.deleteReviews(rNo);
	}

	@Override
	public void updateReviews(ReviewsVO vo) {
		
		dao.updateReviews(vo);
	}

	@Override
	public void updateReviewsNoneImg(ReviewsVO vo) {
		
		dao.updateReviewsNoneImg(vo);
	}

	@Override
	public int selectCount(int pNo) {
		
		return dao.selectCount(pNo);
	}

}
