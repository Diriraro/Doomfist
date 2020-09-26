package com.doom.s1.interceptor;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.doom.s1.member.MemberVO;
import com.doom.s1.storeList.StoreListService;
import com.doom.s1.storeList.StoreListVO;

@Component
public class StoreListDeleteReviewInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private StoreListService storeListService;
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception{
		boolean check = true;
		long re_num = Long.parseLong(request.getParameter("re_num"));
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("member");
		
		List<StoreListVO> ar = storeListService.selectReview_id(re_num);
		
		if(memberVO.getId().equals(ar.get(0).getId()) || memberVO.getId().equals("admin")) {
			check = true;
		}else {
			check = false;
			request.setAttribute("result", "삭제 권한이 없습니다.");
			request.setAttribute("path","../");
			
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
			view.forward(request, response);
		}
		
		return check;
		
	}
	
}
