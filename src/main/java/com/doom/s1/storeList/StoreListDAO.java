package com.doom.s1.storeList;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.doom.s1.qnacheck.QnaCheckVO;
import com.doom.s1.seller.SellCheckVO;
import com.doom.s1.storeList.storeMenu.StoreMenuVO;
import com.doom.s1.util.Pager;



@Repository
public class StoreListDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.doom.s1.storeList.StoreListDAO.";
	
	public int storeDelete(List<String> list)throws Exception{
		return sqlSession.delete(NAMESPACE+"storeDelete", list);
	}
	
	public long listCount(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"listCount", pager);
	}
	
	public List<StoreListVO> listCheck(Pager pager)throws Exception{
		return sqlSession.selectList(NAMESPACE+"listCheck", pager);
	}
	
	public List<StoreListVO> storePage(String id)throws Exception{
		return sqlSession.selectList(NAMESPACE+"storePage",id);
	}
	
	public long reviewNum() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"reviewNum");
	}
	
	public StoreListVO storeListSelect(long st_key) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"storeListSelect", st_key);
	}

	public long storeReviewWrite(StoreListVO storeListVO)throws Exception{
		return sqlSession.insert(NAMESPACE+"storeReviewWrite", storeListVO);
	}
	
	public List<StoreListVO> storeReviewSelect(long st_key)throws Exception{
		return sqlSession.selectList(NAMESPACE+"storeReviewSelect", st_key);
	}
	
	public long storeReviewDelete(long re_num)throws Exception{
		return sqlSession.delete(NAMESPACE+"storeReviewDelete", re_num);
	}
	
	//StoreListSelectInterceptor에서 사용 
	public List<StoreListVO> select_stKey(long st_key)throws Exception{
		return sqlSession.selectList(NAMESPACE+"select_stKey",st_key);
	}
	public StoreListVO select_id(long st_key)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"select_id",st_key);
	}
	public List<StoreListVO> selectReview_id(long re_num)throws Exception{
		return sqlSession.selectList(NAMESPACE+"selectReview_id",re_num);
	}
	public long storeListUpdate(StoreListVO storeListVO) throws Exception{
		return sqlSession.update(NAMESPACE+"storeListUpdate", storeListVO);
	}

	public long storeMenuUpdate(StoreMenuVO storeMenuVO) throws Exception{
		return sqlSession.update(NAMESPACE+"storeMenuUpdate", storeMenuVO);
	}
	
	public long storeMenuInsert(StoreMenuVO storeMenuVO) throws Exception{
		return sqlSession.update(NAMESPACE+"storeMenuInsert", storeMenuVO);
	}
	
	public long storeMenuDelete(StoreMenuVO storeMenuVO) throws Exception{
		return sqlSession.delete(NAMESPACE+"storeMenuDelete", storeMenuVO);

	}
	public String selectFileName(long st_key)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"selectFileName",st_key);
	}
	
	public List<StoreListVO> listAll()	throws Exception{
		return sqlSession.selectList(NAMESPACE+"listAll");
	}
	
	public List<SellCheckVO> buyCheck(long st_key)throws Exception{
		return sqlSession.selectList(NAMESPACE+"buyCheck", st_key);
	}
	
}
