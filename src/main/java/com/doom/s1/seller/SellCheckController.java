package com.doom.s1.seller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.doom.s1.member.MemberVO;
import com.doom.s1.storeList.StoreListService;
import com.doom.s1.storeList.StoreListVO;

@Controller
@RequestMapping(value = "/seller/**")
public class SellCheckController {
	
	@Autowired
	private SellCheckService sellCheckService;
	@Autowired
	private StoreListService storeListService;
	
	@GetMapping("sellList")
	public ModelAndView sellList(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		String id = ((MemberVO)session.getAttribute("member")).getId();
		
		List<StoreListVO> ar = storeListService.storePage(id);		
		List<String> result = new ArrayList<String>();
		
		List<Long> orderCount = new ArrayList<Long>(); 
		
		for (StoreListVO storeListVO : ar) {
			orderCount.add(sellCheckService.orderCount(storeListVO.getSt_key()));
		}
		
		mv.addObject("or_co", orderCount);
		mv.addObject("sel_list",ar);
		mv.addObject("result",result);
		mv.setViewName("seller/sellList");
		
		return mv;
	}
	
	@GetMapping("orderCheck")
	public ModelAndView orderCheck(long st_key)throws Exception{
		ModelAndView mv = new ModelAndView();
		SimpleDateFormat sd = new SimpleDateFormat("yyMMdd");
		Date today = new Date();
		String todayDate = sd.format(today);
		List<SellCheckVO> sellCheckVOs = sellCheckService.sellCheck(st_key);
		StoreListVO storeListVO = storeListService.storeListSelect(st_key);
		
		mv.addObject("today", todayDate);
		mv.addObject("se_list", sellCheckVOs);
		mv.addObject("stvo", storeListVO);
		mv.setViewName("seller/orderCheck");
		
		
		return mv;
	}
	
	@PostMapping("orderCheck")
	public ModelAndView orderCheck(SellCheckVO sellCheckVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = sellCheckService.updateOkCheck(sellCheckVO);
		
		String msg = "";
		String path = "";
		
		if(result>0 && sellCheckVO.getSel_okcheck()==1) {
			msg="배달상태가 변경되었습니다!";
			path="./orderCheck?st_key=" + sellCheckVO.getSt_key();
		}else if(result>0 && sellCheckVO.getSel_okcheck()==2) {
			msg="주문이 취소되었습니다.";
			path="./orderCheck?st_key=" + sellCheckVO.getSt_key();
			int del = sellCheckService.deletePayFirst(sellCheckVO);
		}else if(result<0) {
			msg="입력이 정상적으로 실행되지 않았습니다.";
			path="./orderCheck?st_key=" + sellCheckVO.getSt_key();
		}
		
		mv.addObject("result", msg);
		mv.addObject("path", path);
		mv.setViewName("common/result");
		
		return mv;
	}
	
	@GetMapping("orderDel")
	public ModelAndView orderDel(long sel_key, long st_key)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = sellCheckService.orderDel(sel_key);
		
		String msg = "삭제되지 않았습니다.";
		String path = "";
		
		if(result>0) {
			msg = "삭제되었습니다.";
			path = "./orderCheck?st_key="+st_key;
		}
		
		mv.addObject("result", msg);
		mv.addObject("path", path);
		mv.setViewName("common/result");
		
		return mv;
	}

}
