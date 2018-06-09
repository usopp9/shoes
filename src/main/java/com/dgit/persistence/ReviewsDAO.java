package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.Criteria;
import com.dgit.domain.ReviewsVO;

public interface ReviewsDAO {

	public void insertReviews(ReviewsVO vo);
	
	/*페이징*/
	public List<ReviewsVO> selectAllReviews(int pNo,Criteria cri);
	public int selectCount(int pNo);
	
	public void deleteReviews(int rNo);
	
	public void updateReviews(ReviewsVO vo);
	public void updateReviewsNoneImg(ReviewsVO vo);
}
