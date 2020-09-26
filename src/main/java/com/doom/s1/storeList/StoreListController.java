package com.doom.s1.storeList;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.ls.LSInput;

import com.doom.s1.member.MemberVO;
import com.doom.s1.qnacheck.QnaCheckVO;
import com.doom.s1.seller.SellCheckVO;
import com.doom.s1.storeList.file.StoreFileVO;
import com.doom.s1.storeList.reviewFile.ReviewFileVO;
import com.doom.s1.storeList.storeMenu.StoreMenuVO;
import com.doom.s1.util.Pager;

@Controller
@RequestMapping(value = "/storeList/**")
public class StoreListController {

	@Autowired
	private StoreListService storeListService;

	@GetMapping("searchStore")
	public ModelAndView searchStore(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();		
		//더보기 관련
		List<StoreListVO> storeListVOs = storeListService.listCheck(pager);  
		mv.addObject("listt", storeListVOs.size());
			
		mv.setViewName("storeList/searchStore"); 
		long a = pager.getLastNum();	
			
		mv.addObject("last", a); 
		

		return mv;
		
	}

	@GetMapping("getList")
	public void getList(Pager pager, Model model) throws Exception {
		
		List<StoreListVO> storeListVOs = new ArrayList<StoreListVO>();
		storeListVOs = storeListService.listCheck(pager);
	
		model.addAttribute("list",storeListVOs);

		List<String> ar = new ArrayList<String>();
		int index=0;
		for (StoreListVO storeListVO : storeListVOs) {
			long st_key = storeListVO.getSt_key();
//			System.out.println("B : "+st_key);
//			System.out.println(storeListService.selectFileName(st_key));
			
			ar.add(storeListService.selectFileName(st_key));
			
			index++;
		}
		
		model.addAttribute("file",ar);
	
		
	}

	@GetMapping("storeListChecks")
	public ModelAndView storeListChecks(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<StoreListVO> storeListVOs = storeListService.listCheck(pager);
		mv.addObject("vo", storeListVOs);
		mv.addObject("pager", pager);
		mv.setViewName("storeList/storeListChecks");

		return mv;
	}

	@GetMapping("storeDelete")
	public ModelAndView storeDelete(String[] st_key) throws Exception {
		ModelAndView mv = new ModelAndView();
		// 배열을 List로 변환
		List<String> list = Arrays.asList(st_key);
		int result = storeListService.storeDelete(list);
//		System.out.println(result);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");

		return mv;
	}
	

	@RequestMapping(value = "storeListCheck")
	public ModelAndView storeListCheck(Pager pager, ModelAndView mv) throws Exception {
		List<StoreListVO> storeListVOs = storeListService.listCheck(pager);
		mv.addObject("vo", storeListVOs);
		mv.addObject("pager", pager);
		mv.setViewName("storeList/storeListCheck");

		return mv;
	}
	
//	@RequestMapping(value = "storePage")
//	public ModelAndView storePage(Pager pager, ModelAndView mv) throws Exception {
//		List<StoreListVO> storeListVOs = storeListService.listCheck(pager);
//		mv.addObject("vo", storeListVOs);
//		mv.addObject("pager", pager);
//		mv.setViewName("storeList/storePage");
//		return mv;
//	}
	
	@GetMapping("storePage")
	public ModelAndView storePage(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		String id = ((MemberVO)session.getAttribute("member")).getId();
		
		List<StoreListVO> ar = storeListService.storePage(id);
		List<String> result = new ArrayList<String>();
		
		mv.addObject("liststore",ar);
		mv.addObject("result",result);
		mv.setViewName("storeList/storePage");
		
		return mv;
	}
	


	@RequestMapping(value = "storeListSelect", method = RequestMethod.GET)
	public ModelAndView storeListSelect(long st_key) throws Exception {
		ModelAndView mv = new ModelAndView();
		// store 소개
		StoreListVO storeListVO = storeListService.storeListSelect(st_key);
		// 메뉴 소개
		List<StoreMenuVO> storeMenuVOs = storeListService.storeMenuSelect(st_key);
		// 리뷰글 출력
		List<StoreListVO> storeListVOs = storeListService.storeReviewSelect(st_key);
		// 리뷰글 안 사진들 출력
		List<List<ReviewFileVO>> sList = new ArrayList<List<ReviewFileVO>>();

		for (StoreListVO storeListVO2 : storeListVOs) {
			List<ReviewFileVO> reviewFileVOs = storeListService.reviewFileSelect(storeListVO2.getRe_num());

			sList.add(reviewFileVOs);
		}

		// store 사진 출력
		List<StoreFileVO> storeFileVOs = storeListService.storeFileSelect(st_key);

		// 리뷰 평점 평균 계산
		double sum = 0.0;
		double avg = 0.0;
		int check = 0;
		for (StoreListVO storeListVO2 : storeListVOs) {
			check++;
			sum = sum + storeListVO2.getRe_rating();
		}
		avg = sum / check;
		avg = Math.round(avg * 10);
		avg = avg / 10.0;

		//이 식당 구매자인지 확인
		List<SellCheckVO> sellCheckVOs = storeListService.buyCheck(st_key);	

		mv.addObject("vo", storeListVO); 		// store 소개
		mv.addObject("vo_sm", storeMenuVOs);	// 메뉴 소개
		mv.addObject("vor", storeListVOs); 		// 리뷰글 출력
		mv.addObject("vof1", sList); 			// 리뷰 글 안 사진들 출력
		mv.addObject("stfile", storeFileVOs);	// store 사진 출력
		mv.addObject("avg", avg); 				// 평점 평균출력
		mv.addObject("scvo", sellCheckVOs);		// 이 식당 구매자인지 확인
		mv.setViewName("storeList/storeListSelect");
		return mv;
	}

	@GetMapping("storeReviewWrite")
	public ModelAndView storeReviewWrite(long st_key) throws Exception {
		ModelAndView mv = new ModelAndView();
		StoreListVO storeListVO = storeListService.storeListSelect(st_key);
		mv.addObject("vo", storeListVO);
		mv.setViewName("storeList/storeReviewWrite");

		return mv;
	}

	@PostMapping("storeReviewWrite")
	public ModelAndView storeReviewWrite(StoreListVO storeListVO, MultipartFile[] files) throws Exception {
		ModelAndView mv = new ModelAndView();

		long result = storeListService.storeReviewWrite(storeListVO, files);

		String msg = "작성 실패";
		String path = "";

		if (result > 0) {
			msg = "작성 성공";
			path = "./storeListSelect?st_key=" + storeListVO.getSt_key();
		}

		mv.addObject("result", msg);
		mv.addObject("path", path);
		mv.setViewName("common/result");

		return mv;
	}

	@GetMapping("storeReviewDelete")
	public ModelAndView storeReviewDelete(long st_key, long re_num) throws Exception {
		ModelAndView mv = new ModelAndView();

		long result = storeListService.storeReviewDelete(re_num);

		String msg = "삭제되지 않았습니다.";
		String path = "";

		if (result > 0) {
			msg = "삭제되었습니다.";
			path = "./storeListSelect?st_key=" + st_key;
		}

		mv.addObject("result", msg);
		mv.addObject("path", path);
		mv.setViewName("common/result");

		return mv;
	}

	
	@RequestMapping(value = "storePageUpdate")
	public ModelAndView storePageUpdate(long st_key)throws Exception {
		ModelAndView mv = new ModelAndView();
		StoreListVO storeListVO = storeListService.storeListSelect(st_key);
		List<StoreMenuVO> storeMenuVO = storeListService.storeMenuSelect(st_key);
		mv.addObject("liststore", storeListVO);
		mv.addObject("listmenu", storeMenuVO);
		int a =storeMenuVO.size();
		mv.addObject("a", a);
		return mv;
	}
	
	@RequestMapping(value = "storePageUpdate", method = RequestMethod.POST)
	public ModelAndView storePageUpdate(StoreListVO storeListVO, StoreMenuVO storeMenuVO, long st_key) throws Exception{
		ModelAndView mv =  new ModelAndView();
		long listup= storeListService.storeListUpdate(storeListVO);
//		long tagup = storeListService.storeTagUpdate(storeTagVO);
		if (listup>0) {
			mv.addObject("result", "수정 성공");
			mv.addObject("path", "http://localhost:8080/s1/storeList/storePageUpdate?st_key=" + st_key);
			mv.setViewName("common/result");
		}else {
			mv.addObject("result", "수정 실패");
			mv.addObject("path", "./storePage");
			mv.setViewName("common/result");
		}
		return mv;
	}
	
	@RequestMapping(value = "storeMenuDelete", method = RequestMethod.POST)
	public ModelAndView storeMenuDelete(StoreMenuVO storeMenuVO, long st_key) throws Exception{
		ModelAndView mv =  new ModelAndView();
		long menudel = storeListService.storeMenuDelete(storeMenuVO);
//		System.out.println(menudel);
//		long tagup = storeListService.storeTagUpdate(storeTagVO);
		if (menudel>0) {
			mv.addObject("result", "삭제 성공");
			mv.addObject("path", "http://localhost:8080/s1/storeList/storePageUpdate?st_key=" + st_key);
			mv.setViewName("common/result");
		}else {
			mv.addObject("result", "수정 실패");
			mv.addObject("path", "./storePage");
			mv.setViewName("common/result");
		}
		return mv;
	}
	
	@RequestMapping(value = "storeMenuUpdate")
	public ModelAndView storeMenuUpdate(long st_key)throws Exception {
		ModelAndView mv = new ModelAndView();
		StoreListVO storeListVO = storeListService.storeListSelect(st_key);
		List<StoreMenuVO> storeMenuVO = storeListService.storeMenuSelect(st_key);
		mv.addObject("liststore", storeListVO);
		mv.addObject("listmenu", storeMenuVO);
		int a =storeMenuVO.size();
		mv.addObject("a", a);
		return mv;
	}
	
	@RequestMapping(value = "storeMenuUpdate", method = RequestMethod.POST)
	public ModelAndView storeMenuUpdate(StoreMenuVO storeMenuVO, long st_key) throws Exception{
		ModelAndView mv =  new ModelAndView();
		
		long menuup = storeListService.storeMenuUpdate(storeMenuVO);

//		System.out.println(menuup);
//		long tagup = storeListService.storeTagUpdate(storeTagVO);
		if (menuup>0) {
			mv.addObject("result", "수정 성공");
			mv.addObject("path", "http://localhost:8080/s1/storeList/storeMenuUpdate?st_key=" + st_key);
			mv.setViewName("common/result");
		}else {
			mv.addObject("result", "수정 실패");
			//mv.addObject("path", "./storePage");
			mv.setViewName("common/result");
		}
		return mv;
	}
	
	@RequestMapping(value = "storeMenuInsert")
	public ModelAndView storeMenuInsert(long st_key)throws Exception {
		ModelAndView mv = new ModelAndView();
		StoreListVO storeListVO = storeListService.storeListSelect(st_key);
		List<StoreMenuVO> storeMenuVO = storeListService.storeMenuSelect(st_key);
		mv.addObject("liststore", storeListVO);
		mv.addObject("listmenu", storeMenuVO);
		int a =storeMenuVO.size();
		mv.addObject("a", a);
		return mv;
	}
	
	@RequestMapping(value = "storeMenuInsert", method = RequestMethod.POST)
	public ModelAndView storeMenuInsert(String[] sm_menu,long[] sm_price , long st_key) throws Exception{
		ModelAndView mv =  new ModelAndView();
		StoreMenuVO storeMenuVO = new StoreMenuVO();
		
		List<Long> menuin = new ArrayList<Long>();
		int index=0;
		
		for (int i=0; i<sm_menu.length; i++) {
			storeMenuVO.setSm_menu(sm_menu[index]);
			storeMenuVO.setSm_price(sm_price[index]);
			storeMenuVO.setSt_key(st_key);
			menuin.add(index, storeListService.storeMenuInsert(storeMenuVO));
			index++;
		}

		
//		long tagup = storeListService.storeTagUpdate(storeTagVO);
		
		boolean menuAll=false;
		int check=0;
		
		for(int i=0; i<menuin.size(); i++) {
			if(menuin.get(i)>0) {
				check++;
			}
		}
		
		if(check==menuin.size()) {
			menuAll=true;
		}
		
		if (menuAll) {
			mv.addObject("result", "수정 성공");
			mv.addObject("path", "http://localhost:8080/s1/storeList/storeMenuInsert?st_key=" + st_key);
			mv.setViewName("common/result");
		}else {
			mv.addObject("result", "수정 실패");
			//mv.addObject("path", "./storePage");
			mv.setViewName("common/result");
		}
		return mv;
	}
	
	

}
