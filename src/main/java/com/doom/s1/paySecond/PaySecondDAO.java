package com.doom.s1.paySecond;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaySecondDAO {
	@Autowired
	private SqlSession session;
	private final String NAMESPACE="com.doom.s1.paySecond.PaySecondDAO.";
	
	//결제 끝나면 1로 변경할것
	public int payFirstUpdate(long pf_check) throws Exception {
		
		return session.update(NAMESPACE+"payFirstUpdate", pf_check);
	}
	
	//결제 끝나면 쓰레기값 삭제  pf_check 0인거 
	public int payFirstDelete(long pf_check) throws Exception {
		
		return session.delete(NAMESPACE+"payFirstDelete", pf_check);
	}
	
	//db에 입력한 값 삽입
	public int paySecondInsert(PaySecondVO paySecondVO) throws Exception {
		return session.insert(NAMESPACE+"paySecondInsert", paySecondVO);
	}
	
	// 메뉴의 카운트 0 인 테이블 삭제
	
	public int paySecondDelete(long ps_count) throws Exception{
		
		return session.delete(NAMESPACE+"paySecondDelete", ps_count);
	}
	
	public List<PaySecondVO> payS() throws Exception {
		return session.selectList(NAMESPACE+"payS");
	}


}
