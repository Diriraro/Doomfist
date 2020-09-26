package com.doom.s1.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.doom.s1.member.MemberVO;

@Component
public class PaymentInterceptor2 extends HandlerInterceptorAdapter {
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		boolean check = false;
		
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		String id = request.getParameter("id");
		
		if(memberVO != null && memberVO.getId().equals(id)) {
			check = true;
			
		}else {
			request.setAttribute("result", "본인만 확인 가능합니다.");
			request.setAttribute("path","../");
			
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
			view.forward(request, response);
		}
		
		
		return check;
	}

}
