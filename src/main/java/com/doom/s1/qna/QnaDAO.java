package com.doom.s1.qna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.doom.s1.member.MemberVO;
import com.doom.s1.util.Pager;

@Repository
public class QnaDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.doom.s1.qna.QnaDAO.";
	
	public MemberVO selectMember(String id)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"selectMember", id);
	}
	
	public long qnaNum()throws Exception{
		return sqlSession.selectOne(NAMESPACE+"qnaNum");
	}
	
	public int qnaJoin(QnaVO qnaVO)throws Exception{
		return sqlSession.insert(NAMESPACE+"qnaJoin",qnaVO);
	}
	
	public List<QnaVO> qnaList(Pager pager)throws Exception{
		return sqlSession.selectList(NAMESPACE+"qnaList",pager);
	}
	
	public long qnaCount(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"qnaCount",pager);
	}
	public QnaVO qnaSelect(long qna_storekey)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"qnaSelect",qna_storekey);
	}
	
	public int memberUpdate()throws Exception{
		return sqlSession.update(NAMESPACE+"memberUpdate");
	}
	
}
