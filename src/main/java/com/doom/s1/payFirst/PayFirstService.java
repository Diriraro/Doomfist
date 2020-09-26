package com.doom.s1.payFirst;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doom.s1.paySecond.PaySecondVO;
import com.doom.s1.storeList.storeMenu.StoreMenuDAO;
import com.doom.s1.storeList.storeMenu.StoreMenuVO;

@Service
public class PayFirstService {

	@Autowired
	private PayFirstDAO payFirstDAO;
	@Autowired
	private StoreMenuDAO storeMenuDAO;
	
	public int payFirstInsert(PayFirstVO payFirstVO)  throws Exception{
		
		return payFirstDAO.payFirstInsert(payFirstVO);
	}
	
	
	public PayFirstVO payFirstSelect(long st_key) throws Exception{
		
		return payFirstDAO.payFirstSelect(st_key);
		
		
	}
	
	public List<StoreMenuVO> storeMenuSelect(long st_key)throws Exception{
		return storeMenuDAO.storeMenuList(st_key);
	}
	
	public List<PaySecondVO> payReceipt(String id) throws Exception {
		return payFirstDAO.payReceipt(id);
		
	}
	
	public List<PayFirstVO> payAll(String id) throws Exception {
		return payFirstDAO.payAll(id);
	}
	
	// 뒤로가기
	public int back() throws Exception {
		return payFirstDAO.back();
		
	}
	
	public List<PaySecondVO> pay2Receipts(long pf_key)throws Exception{
		return payFirstDAO.pay2Receipts(pf_key);
	}
	
	public PayFirstVO payOne(long pf_key)throws Exception{
		return payFirstDAO.payOne(pf_key);
	}
	

}
