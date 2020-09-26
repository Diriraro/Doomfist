package com.doom.s1.seller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.doom.s1.buyaddr.BuyAddrVO;
import com.doom.s1.payFirst.PayFirstVO;
import com.doom.s1.paySecond.PaySecondVO;

@Repository
public class SellCheckDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.doom.s1.seller.SellCheckDAO.";
	
	public List<SellCheckVO> sellCheck(long st_key)throws Exception{
		return sqlSession.selectList(NAMESPACE+"sellCheck", st_key);
	}
	
	public int insertSelCheck(PayFirstVO payFirstVO)throws Exception{
		return sqlSession.insert(NAMESPACE+"insertSelCheck", payFirstVO);
	}
	
	public List<PaySecondVO> selectMenu(long pf_key)throws Exception{
		return sqlSession.selectList(NAMESPACE+"selectMenu", pf_key);
	}
	
	public int updateMenu(String meco)throws Exception{
		return sqlSession.update(NAMESPACE+"updateMenu", meco);
	}
	
	public long orderCount(long st_key)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"orderCount", st_key);
	}
	
	public int updateOkCheck(SellCheckVO sellCheckVO)throws Exception{
		return sqlSession.update(NAMESPACE+"updateOkCheck", sellCheckVO);
	}
	
	public int deletePayFirst(SellCheckVO sellCheckVO)throws Exception{
		return sqlSession.delete(NAMESPACE+"deletePayFirst", sellCheckVO);
	}
	
	public int orderDel(long sel_key)throws Exception{
		return sqlSession.delete(NAMESPACE+"orderDel", sel_key);
	}
	
}
