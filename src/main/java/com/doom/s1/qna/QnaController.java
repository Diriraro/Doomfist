 package com.doom.s1.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.SessionScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.doom.s1.member.MemberVO;
import com.doom.s1.qna.qnaFile.QnaFileVO;
import com.doom.s1.qnamenu.QnaMenuVO;
import com.doom.s1.util.Pager;

@Controller
@RequestMapping("/qna/**")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	
	@GetMapping("qnaJoin")
	public ModelAndView qnaJoin(QnaVO qnaVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("qna/qnaJoin");
		return mv;
	}
	
	@PostMapping("qnaJoin")
	public ModelAndView qnaJoin(QnaVO qnaVO,ModelAndView mv, MultipartFile[] files, HttpSession session, long [] qm_price, String [] qm_menu)throws Exception{
		
		int result = qnaService.qnaJoin(qnaVO,files,qm_price,qm_menu);
		
		
		if(result>0) {
			mv.addObject("result","신청 완료");
			mv.addObject("path","../");
			mv.setViewName("common/result");
		}else {
			mv.addObject("result","신청 불가");
			mv.addObject("path","../");
			mv.setViewName("common/result");
		}
		String id = ((MemberVO)session.getAttribute("member")).getId();
		MemberVO memberVO = qnaService.selectMember(id);
		session.setAttribute("member", memberVO);
		//test
		return mv;
	}
	
	@GetMapping("qnaList")
	public ModelAndView qnaList(Pager pager, ModelAndView mv)throws Exception{
		
		List<QnaVO> ar = qnaService.qnaList(pager);
		
		mv.addObject("list",ar);
		mv.addObject("pager",pager);
		mv.setViewName("qna/qnaList");
		
		return mv;
	}
	
	@GetMapping("qnaSelect")
	public ModelAndView qnaSelect(long qna_storekey)throws Exception{
		ModelAndView mv = new ModelAndView();
		QnaVO qnaVO = qnaService.qnaSelect(qna_storekey);
		List<QnaMenuVO> qnaMenuVOs = qnaService.qnaMenuSelect(qna_storekey);	//메뉴 출력
		List<QnaFileVO> qnaFileVOs = qnaService.qnaFileSelect(qna_storekey);	//사진 출력
		
		mv.addObject("vo",qnaVO);
		mv.addObject("vo_me", qnaMenuVOs);										//메뉴 출력
		mv.addObject("vo_fi", qnaFileVOs);
		mv.setViewName("qna/qnaSelect");
		
		return mv;

		
	}


}
