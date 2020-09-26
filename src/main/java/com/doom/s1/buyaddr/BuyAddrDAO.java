package com.doom.s1.buyaddr;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BuyAddrDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.doom.s1.buyaddr.BuyAddrDAO.";
	
	public int insertBuyAddr(BuyAddrVO buyAddrVO)throws Exception{
		return sqlSession.insert(NAMESPACE+"insertBuyAddr", buyAddrVO);
	}
	
	public BuyAddrVO selectBuyAddr(String id)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"selectBuyAddr", id);
	}

}
