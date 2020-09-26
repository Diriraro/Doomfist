package com.doom.s1.member;

import java.io.IOException;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.doom.s1.member.NaverLoginBO;
import com.doom.s1.util.Pager;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.Response;

@Controller
@RequestMapping//(value = "/member/**")
public class MemberController {
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
	this.naverLoginBO = naverLoginBO;
	}
	
	@Autowired
	private MemberService memberService;

	
	@RequestMapping(value = "/member/memberJoin")
	public void memberJoin() {
	}
	
	@RequestMapping(value= "/member/memberJoin", method = RequestMethod.POST)
	public ModelAndView memberJoin(ModelAndView mv, MemberVO memberVO, HttpSession session) throws Exception{
		int result = memberService.memberJoin(memberVO,session);
		String msg ="다시 입력해주세요";
		if(result>0) {
			msg = "회원가입 성공";
		}
		
		mv.addObject("result", msg);
		mv.addObject("path", "./memberLogin");
		mv.setViewName("common/result");
		
		return mv;
	}
	
	@PostMapping("/member/memberIdCheck")
	public ModelAndView memberIdCheck(ModelAndView mv, MemberVO memberVO, HttpSession session) throws Exception{
		memberVO = memberService.memberIdCheck(memberVO);
		//null -> 가입 가능1
		//null이 아니면 중복 
		int result =0;
		if (memberVO==null) {
			result=1;
			
		}
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	@PostMapping("/member/memberEmailCheck")
	public ModelAndView memberEmailCheck(ModelAndView mv, MemberVO memberVO, HttpSession session) throws Exception{
		memberVO = memberService.memberEmailCheck(memberVO);
		//null -> 가입 가능1
		//null이 아니면 중복 
		int result =0;
		if (memberVO==null) {
			result=1;
			
		}
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}

	@RequestMapping(value= "/member/memberLogin_HOME")
	public void memberLogin_HOME(@CookieValue(value = "cId", required = false) String cId, Model model) {
		
	}

	@PostMapping(value = "/member/memberLogin_HOME")
	public ModelAndView memberLogin_HOME(String remember, ModelAndView mv ,MemberVO memberVO,HttpSession session, HttpServletResponse response) throws Exception {
		Cookie cookie = new Cookie("cId", "");
		
		if (remember != null) {
			cookie.setValue(memberVO.getId());
		}
		
		response.addCookie(cookie);
		
		memberVO = memberService.memberLogin_HOME(memberVO);
		 if(memberVO != null) {
			 session.setAttribute("member", memberVO);
			 mv.setViewName("redirect:../");
		 }else {
			 mv.addObject("result", "아이디 혹은 비밀번호를 확인해주세요");
			 mv.addObject("path", "./memberLogin");
			 mv.setViewName("common/result");
		 }
		 
		 return mv;
	}
	
	@RequestMapping(value= "/member/memberIdFind")
	public void memberIdFind() {
	}
	
	@PostMapping(value = "/member/memberIdFind")
	public ModelAndView memberIdFind(MemberVO memberVO, ModelAndView mv,HttpSession session) throws Exception{
		memberVO = memberService.memberIdFind(memberVO);
		if (memberVO !=null) {
			session.setAttribute("member", memberVO);
			mv.setViewName("redirect:./memberIdFindResult");
		}else {
			mv.addObject("result","등록된 아이디가 없습니다");
			mv.setViewName("common/result");
		}
		
		return mv;
	}

	
	@RequestMapping(value = "/member/memberLogout")
	public String memberLogout(HttpSession session)throws Exception{
		session.invalidate();
		return "redirect:../";
	}
	
	@RequestMapping(value = "/member/memberUpdate")
	public void memberUpdate() {
		
	}
	
	@RequestMapping(value = "/member/memberUpdate", method = RequestMethod.POST)
	public ModelAndView memberUpdate(ModelAndView mv, MemberVO memberVO, HttpSession session ) throws Exception{
		String id = ((MemberVO)session.getAttribute("member")).getId();
		memberVO.setId(id);
		
		int result = memberService.memberUpdate(memberVO);
		
		if (result>0) {
			session.setAttribute("member", memberVO);
			mv.addObject("result", "수정 성공");
			mv.addObject("path", "./memberPage");
			mv.setViewName("common/result");
		}else {
			mv.addObject("result", "수정 실패");
			mv.addObject("path", "./memberPage");
			mv.setViewName("common/result");
		}
		return mv;
	}
	
	@RequestMapping(value= "/member/memberPage")
	public void memberPage() throws Exception {

	}
	
	@RequestMapping(value= "/member/memberIdFindResult")
	public void memberIdFindResult() throws Exception {

	}
	
	@RequestMapping(value = "/member/memberDelete")
	public ModelAndView memberDelete(ModelAndView mv, HttpSession session) throws Exception{
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		int result = memberService.memberDelete(memberVO);
		if (result>0) {
			session.invalidate();
			mv.addObject("result", "탈퇴 성공");
			mv.addObject("path", "../");
			mv.setViewName("common/result");
		}else {
			mv.addObject("result", "탈퇴 실패");
			mv.addObject("path", "../");
			mv.setViewName("common/result");
		}
		
		return mv;
	}
	
	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/member/memberLogin", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
	/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
	String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
	//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
	System.out.println("네이버:" + naverAuthUrl);
	//네이버
	model.addAttribute("url", naverAuthUrl);
	return "member/memberLogin";
	}
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/member/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
	//System.out.println("여기는 callback");
	OAuth2AccessToken oauthToken;
	oauthToken = naverLoginBO.getAccessToken(session, code, state);
	//1. 로그인 사용자 정보를 읽어온다.
	apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
	/** apiResult json 구조
	{"resultcode":"00",
	"message":"success",
	"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
	**/
	//2. String형식인 apiResult를 json형태로 바꿈
	JSONParser parser = new JSONParser();
	Object obj = parser.parse(apiResult);
	JSONObject jsonObj = (JSONObject) obj;
	//3. 데이터 파싱
	//Top레벨 단계 _response 파싱
	JSONObject response_obj = (JSONObject)jsonObj.get("response");
	//response의 nickname값 파싱
	String email = (String)response_obj.get("email");
	String name = (String)response_obj.get("name");
	//System.out.println(email);
	//4.파싱 닉네임 세션으로 저장
	session.setAttribute("sessionId",email); //세션 생성
	session.setAttribute("sessionName",name);
	model.addAttribute("result", apiResult);
	return "redirect:../";
	}
	//로그아웃
	@RequestMapping(value = "/member/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session)throws IOException {
	//System.out.println("여기는 logout");
	session.invalidate();
	return "redirect:../";
	}
	
	@GetMapping("/member/memberList")
	public ModelAndView memberList(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<MemberVO> memberVOs = memberService.memberList(pager);
		
		mv.addObject("list", memberVOs);
		mv.addObject("pager", pager);
		mv.setViewName("member/memberList");		
		
		return mv;
	}
	
	@GetMapping("/member/memberDeletes")
	public ModelAndView memberDeletes(String[] ids)throws Exception{
		//배열을 List로 변환
		ModelAndView mv = new ModelAndView();
		List<String> list = Arrays.asList(ids);
		int result = memberService.memberDeletes(list);

		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
//	
//	@GetMapping("/member/memberLists")
//	public ModelAndView memberLists(Pager pager)throws Exception{
//		ModelAndView mv = new ModelAndView();
//		List<MemberVO> ar = memberService.memberList(pager);
//		
//		mv.addObject("member", ar);
//		mv.addObject("pager", pager);
//		mv.setViewName("member/memberLists");		
//		
//		return mv;
//		
//	}

}