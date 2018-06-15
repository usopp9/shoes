package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<ReviewsVO> selectAllReviews() {
		
		return session.selectList(namespace+".selectAllReviews");
	}

	@Override
	public void deleteReviews(int rNo) {
		
		session.delete(namespace+".deleteReviews",rNo);
	} 

}
