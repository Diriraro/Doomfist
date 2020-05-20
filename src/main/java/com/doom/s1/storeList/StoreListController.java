package com.doom.s1.storeList;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.doom.s1.storeList.file.StoreFileVO;
import com.doom.s1.storeList.reviewFile.ReviewFileVO;
import com.doom.s1.storeList.storeMenu.StoreMenuVO;
import com.doom.s1.storeList.tag.StoreTagVO;
import com.doom.s1.util.Pager;

@Controller
@RequestMapping(value = "/storeList/**")
public class StoreListController {

	@Autowired
	private StoreListService storeListService;

	@GetMapping("searchStore")
	public ModelAndView searchStore(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		if(pager.getKind().equals("lt")) {
			List<StoreTagVO> storeTagVOs = storeListService.tagNumSelect(pager);
			
			List<StoreListVO> storeListVOs =  new ArrayList<StoreListVO>();
			
			for (StoreTagVO storeTagVO : storeTagVOs) {
				StoreListVO storeListVO = storeListService.listCheck2(pager, storeTagVO.getSt_key());
				storeListVOs.add(storeListVO);
			}
			mv.addObject("listt", storeListVOs.size());
			
			mv.setViewName("storeList/searchStore"); 
			long a = pager.getLastNum();
			
			mv.addObject("last", a); 
			return mv;
		}else {
			List<StoreListVO> storeListVOs = storeListService.listCheck(pager);  
			mv.addObject("listt", storeListVOs.size());
			
//			mv.addObject("pager",pager);
			mv.setViewName("storeList/searchStore"); 
			long a = pager.getLastNum();
			
			mv.addObject("last", a); 
//			System.out.println("user : "+storeListVOs.size());
			 
			return mv;
		}
	}

	@GetMapping("getList")
	public void getList(Pager pager, Model model) throws Exception {
		List<StoreListVO> storeListVOs = new ArrayList<StoreListVO>();
		
		System.out.println(pager.getKind());
		if(pager.getKind().equals("lt")) {
			
			List<StoreTagVO> storeTagVOs = storeListService.tagNumSelect(pager);
			System.out.println("tag :"+storeTagVOs.size());
			
			for (StoreTagVO storeTagVO : storeTagVOs) {
				StoreListVO storeListVO = storeListService.listCheck2(pager, storeTagVO.getSt_key());
				storeListVOs.add(storeListVO);
			}
			System.out.println("list :"+storeListVOs.size());
			
		}else {
			 storeListVOs = storeListService.listCheck(pager);
			
		}
		model.addAttribute("list", storeListVOs);
	}

	@GetMapping("storeListChecks")
	public ModelAndView storeListChecks(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<StoreListVO> storeListVOs = storeListService.listCheck(pager);
		mv.addObject("vo", storeListVOs);
		mv.addObject("pager", pager);
		mv.setViewName("storeList/storeSearch");

		return mv;
	}

	@GetMapping("storeDelete")
	public ModelAndView storeDelete(String[] st_key) throws Exception {
		ModelAndView mv = new ModelAndView();
		// 배열을 List로 변환
		List<String> list = Arrays.asList(st_key);
		int result = storeListService.storeDelete(list);
		System.out.println(result);
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
		System.out.println("admin : " + storeListVOs.size());
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

		// 태그 출력
		List<StoreTagVO> storeTagVOs = storeListService.storeTagSelect(st_key);

		mv.addObject("vo", storeListVO); // store 소개
		mv.addObject("vo_sm", storeMenuVOs);// 메뉴 소개
		mv.addObject("vor", storeListVOs); // 리뷰글 출력
		mv.addObject("vof1", sList); // 리뷰 글 안 사진들 출력
		mv.addObject("stfile", storeFileVOs);// store 사진 출력
		mv.addObject("avg", avg); // 평점 평균출력
		mv.addObject("vo_tag", storeTagVOs);// 태그 출력
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

}
