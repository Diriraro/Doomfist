package com.doom.s1.qnacheck;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.doom.s1.qna.QnaVO;
import com.doom.s1.storeList.StoreListVO;

@Controller
@RequestMapping("/qnacheck/**")
public class QnaCheckController {
	@Autowired
	private QnaCheckService qnaCheckService;
	
	@PostMapping("qnaCheckInsert")
	public int qnaCheckInsert(QnaCheckVO qnaCheckVO)throws Exception{
		int result = qnaCheckService.qnaCheckInsert(qnaCheckVO);
		
		return result;
	}
	
	@GetMapping("qnaOk")
	public ModelAndView qnaOK(HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		long qna_storekey = Long.parseLong(request.getParameter("qna_storekey"));
//		System.out.println(qna_storekey);
		int result = qnaCheckService.qnaOK(qna_storekey);
		mv.setViewName("redirect:../qna/qnaList");
		
		return mv;
	}
	
	@GetMapping("qnaNo")
	public ModelAndView qnaNo(HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		long qna_storekey = Long.parseLong(request.getParameter("qna_storekey"));
		
		int result = qnaCheckService.qnaNo(qna_storekey);
		mv.setViewName("redirect:../qna/qnaList");
		
		return mv;
	}
	
	@GetMapping("Statuscheck")
	public ModelAndView Statuscheck(HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		String id = request.getParameter("id");
//		System.out.println(id);
		List<QnaCheckVO> ar = qnaCheckService.Statuscheck(id);
		List<StoreListVO> aar = qnaCheckService.keycompare(id);
		List<String> result = new ArrayList<String>();
		
		String str="";
		for(int i=0;i<ar.size();i++) {
			for(int j=0;j<aar.size();j++) {
				if(ar.get(i).getQc_check()==aar.get(j).getSt_key()) {
					str="승인됨";
					break;
				}else {
					str="거절됨";
					
				}
				
			}
			result.add(str);		
		}
		

		mv.addObject("llist",aar);
		mv.addObject("list",ar);
		mv.addObject("result",result);
		mv.setViewName("qnacheck/Statuscheck");
		
		return mv;
	}
	
	
	
}
