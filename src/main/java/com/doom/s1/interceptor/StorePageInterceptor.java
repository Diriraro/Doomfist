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
public class StorePageInterceptor extends HandlerInterceptorAdapter{

	@Autowired
	private StoreListService storeListService;
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception{
		boolean check = false;
		
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		
		if(memberVO == null) {
			request.setAttribute("result", "접근 권한이 없습니다.");
			request.setAttribute("path","../");
			
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
			view.forward(request, response);			
		}
		
		List<StoreListVO> ar = storeListService.storePage(memberVO.getId());
		
		int idc=0;
		for (StoreListVO storeListVO : ar) {
			if(storeListVO.getId().equals(memberVO.getId())) {
				idc=0;
			}else {
				idc++;
			}
		}
		
		if(ar.size()!=0 && idc==0) {
			check = true;
		}else {
			request.setAttribute("result", "접근 권한이 없습니다.");
			request.setAttribute("path","../");
			
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
			view.forward(request, response);	
		}
		
		return check;
	}
}
