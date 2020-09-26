package com.doom.s1.paySecond;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doom.s1.payFirst.PayFirstVO;

@Service
public class PaySecondService {

	@Autowired
	private PaySecondDAO paySecondDAO;

	public int paySecondInsert(PaySecondVO paySecondVO,String [] ps_menu, long[] ps_count, long[] ps_multi,long pf_key)	throws Exception {
			return 	paySecondDAO.paySecondInsert(paySecondVO);
	}

	public int payFirstDelete(long pf_check) throws Exception {

		return paySecondDAO.payFirstDelete(pf_check);
	}

	public int payFirstUpdate(long pf_check) throws Exception {
		return paySecondDAO.payFirstUpdate(pf_check);

	}
	
	public int paySecondDelete(long ps_count)throws Exception{
		return paySecondDAO.paySecondDelete(ps_count);
		
	}
	
	public List<PaySecondVO> payS() throws Exception {
		return paySecondDAO.payS();
	}

}
