package com.doom.s1.storeList;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.doom.s1.storeList.file.StoreFileVO;
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
	public List<StoreListVO> select_id(long st_key)throws Exception{
		return sqlSession.selectList(NAMESPACE+"select_id",st_key);
	}
	public List<StoreListVO> selectReview_id(long re_num)throws Exception{
		return sqlSession.selectList(NAMESPACE+"selectReview_id",re_num);
	}
	public String selectFileName(long st_key)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"selectFileName", st_key);
	}
}
