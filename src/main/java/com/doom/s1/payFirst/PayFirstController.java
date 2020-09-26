package com.doom.s1.payFirst;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.doom.s1.paySecond.PaySecondService;
import com.doom.s1.paySecond.PaySecondVO;
import com.doom.s1.storeList.storeMenu.StoreMenuVO;

@Controller
@RequestMapping("/payment/**")
public class PayFirstController {
	@Autowired
	private PayFirstService payFirstService;
	@Autowired
	private PaySecondService paySecondService;

	//진입
	@GetMapping("payFirstSelect")
	public ModelAndView payFirstSelect(PayFirstVO payFirstVO,long st_key) throws Exception{
		ModelAndView mv = new ModelAndView();
		//0 뒤로가기 눌럿으면 삭제 
		int result = payFirstService.back();
		//second의 count가 0인 데이터 삭제
		result = paySecondService.paySecondDelete(0);
		// check 0삭제
		result = paySecondService.payFirstDelete(0);
		//1인설트 하고
		result = payFirstService.payFirstInsert(payFirstVO);
		//2셀렉트
		PayFirstVO paFirstVO = payFirstService.payFirstSelect(st_key);
		List<StoreMenuVO> storeMenuVOs = payFirstService.storeMenuSelect(payFirstVO.getSt_key());
		mv.addObject("vo", paFirstVO);
		mv.addObject("vo_sm", storeMenuVOs);
		mv.setViewName("payment/payFirstSelect");
	
		return mv;
		
	}
	
	//나의 결제 목록 확인 페이지
	
		@GetMapping("payReceipt")
		public ModelAndView receiptPage(String id) throws Exception{
			ModelAndView mv = new ModelAndView();
			//first의 check 0인 데이터 삭제해서 안보여주기
			int result = paySecondService.payFirstDelete(0);
			//second 의 count 0인 데이터 삭제
			result = paySecondService.paySecondDelete(0);
			
			List<PayFirstVO> payFirstVOs = payFirstService.payAll(id);
			List<PaySecondVO> paySecondVOs =  payFirstService.payReceipt(id);
			
			mv.addObject("vo_pf", payFirstVOs);
			mv.addObject("vo_ps", paySecondVOs);
			
			mv.setViewName("payment/payReceipt");
			
			return mv;
		}
		
		@GetMapping("selectReceipt")
		public ModelAndView selectReceipt(long pf_key) throws Exception{
			ModelAndView mv = new ModelAndView();
			
			PayFirstVO payFirstVO = payFirstService.payOne(pf_key);
		
			mv.addObject("result", payFirstVO.getPf_key());
			mv.setViewName("common/ajaxResult");
			
			return mv;
		}
		
		@GetMapping("payReceipts")
		public ModelAndView receipt2Page(long pf_key)throws Exception{
			ModelAndView mv = new ModelAndView();
			
			PayFirstVO payFirstVO = payFirstService.payOne(pf_key);
			List<PaySecondVO> paySecondVOs = payFirstService.pay2Receipts(pf_key);
			
			mv.addObject("vo_pf1", payFirstVO);
			mv.addObject("vo_ps", paySecondVOs);
			mv.setViewName("payment/payReceipts");

			return mv;
		}
	
	
}
