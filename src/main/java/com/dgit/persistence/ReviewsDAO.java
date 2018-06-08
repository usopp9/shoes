package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.ReviewsVO;

public interface ReviewsDAO {

	public void insertReviews(ReviewsVO vo);
	
	public List<ReviewsVO> selectAllReviews();
	
	public void deleteReviews(int rNo);
	
	public void updateReviews(ReviewsVO vo);
	public void updateReviewsNoneImg(ReviewsVO vo);
}
