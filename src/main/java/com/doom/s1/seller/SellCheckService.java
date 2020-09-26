package com.doom.s1.seller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doom.s1.buyaddr.BuyAddrDAO;
import com.doom.s1.buyaddr.BuyAddrVO;
import com.doom.s1.payFirst.PayFirstVO;
import com.doom.s1.paySecond.PaySecondVO;

@Service
public class SellCheckService {

	@Autowired
	private SellCheckDAO sellCheckDAO;
	@Autowired
	private BuyAddrDAO buyAddrDAO;
	
	public List<SellCheckVO> sellCheck(long st_key)throws Exception{
		return sellCheckDAO.sellCheck(st_key);
	}
	
	public int insertBuyAddr(BuyAddrVO buyAddrVO)throws Exception{
		return buyAddrDAO.insertBuyAddr(buyAddrVO);
	}
	
	public BuyAddrVO selectBuyAddr(String id)throws Exception{
		return buyAddrDAO.selectBuyAddr(id);
	}
	
	public int insertSelCheck(PayFirstVO payFirstVO)throws Exception{
		return sellCheckDAO.insertSelCheck(payFirstVO);
	}
	
	public List<PaySecondVO> selectMenu(long pf_key)throws Exception{
		return sellCheckDAO.selectMenu(pf_key);
	}
	
	public int updateMenu(String meco)throws Exception{
		return sellCheckDAO.updateMenu(meco);
	}
	
	public long orderCount(long st_key) throws Exception{
		return sellCheckDAO.orderCount(st_key);
	}
	
	public int updateOkCheck(SellCheckVO sellCheckVO)throws Exception{
		return sellCheckDAO.updateOkCheck(sellCheckVO);
	}
	
	public int deletePayFirst(SellCheckVO sellCheckVO)throws Exception{
		return sellCheckDAO.deletePayFirst(sellCheckVO);
	}
	
	public int orderDel(long sel_key)throws Exception{
		return sellCheckDAO.orderDel(sel_key);
	}
	
}
