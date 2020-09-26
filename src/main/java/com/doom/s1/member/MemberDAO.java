package com.doom.s1.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.doom.s1.util.Pager;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.doom.s1.member.MemberDAO.";
	
	public int memberJoin(MemberVO memberVO) throws Exception{
		return sqlSession.insert(NAMESPACE+"memberJoin", memberVO);
	}
	
	public MemberVO memberIdCheck(MemberVO memberVO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberIdCheck", memberVO);
	}
	
	public MemberVO memberEmailCheck(MemberVO memberVO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberEmailCheck", memberVO);
	}
	
	public MemberVO memberNaverCheck(MemberVO memberVO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberNaverCheck", memberVO);
	}
	
	public int memberDelete(MemberVO memberVO) throws Exception{
		return sqlSession.delete(NAMESPACE+"memberDelete", memberVO);
	}
	
	public MemberVO memberLogin_HOME(MemberVO memberVO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberLogin_HOME", memberVO);
	}
	
	public int memberUpdate(MemberVO memberVO) throws Exception{
		return sqlSession.update(NAMESPACE+"memberUpdate", memberVO);
	}
	
	public Long memberCount(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberCount", pager);
	}
	
	public List<MemberVO> memberList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"memberList", pager);
	}
	
	public int memberDeletes(List<String> list)throws Exception{
		return sqlSession.delete(NAMESPACE+"memberDeletes", list);
	}
	
	public MemberVO memberIdFind(MemberVO memberVO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberIdFind", memberVO);
	}

}