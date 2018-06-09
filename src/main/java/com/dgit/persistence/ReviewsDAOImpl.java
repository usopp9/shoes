package com.dgit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.Criteria;
import com.dgit.domain.ReviewsVO;

@Repository
public class ReviewsDAOImpl implements ReviewsDAO {
	
	@Autowired
	SqlSession session;
	
	private static final String namespace = "com.dgit.mapper.ReviewsMapper";
	
	@Override
	public void insertReviews(ReviewsVO vo) {
		
		session.insert(namespace+".insertReviews",vo);
	}

	@Override
	public List<ReviewsVO> selectAllReviews(int pNo,Criteria cri) {
		Map<String, Object> map = new HashMap<>();
		map.put("pNo", pNo);
		map.put("cri", cri);
		
		return session.selectList(namespace+".selectAllReviews",map);
	}

	@Override
	public void deleteReviews(int rNo) {
		
		session.delete(namespace+".deleteReviews",rNo);
	}

	@Override
	public void updateReviews(ReviewsVO vo) {
		
		session.update(namespace+".updateReviews",vo);
	}

	@Override
	public void updateReviewsNoneImg(ReviewsVO vo) {
		
		session.update(namespace+".updateReviewsNoneImg",vo);
	}

	@Override
	public int selectCount(int pNo) {
		
		return session.selectOne(namespace+".selectCount",pNo);
	} 

}
