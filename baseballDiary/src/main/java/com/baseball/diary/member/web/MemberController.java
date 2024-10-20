package com.baseball.diary.member.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baseball.diary.member.service.MemberService;
import com.baseball.diary.member.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/registView")
	public String registView() {
		return "member/registView";
	}
	
	@RequestMapping("/registDo")
	public String registDo(HttpServletRequest request) {
		
		String id = request.getParameter("memId");
		String pw = request.getParameter("memPw");
		String nm = request.getParameter("memNm");
		String kboTeam = request.getParameter("kboTeam");
		
		MemberVO member = new MemberVO();
		
		member.setMemId(id);
		member.setMemPw(pw);
		member.setMemNm(nm);
		member.setKboTeam(kboTeam);
		
		System.out.println(member.toString());
		
		try {
			memberService.registMember(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "member/registView";
	}
	
	@RequestMapping("/loginView")
	public String loginView() {
		return "member/loginView";
	}
	
	@RequestMapping("/loginDo")
	public String loginDo(MemberVO vo, HttpSession session
			, boolean remember, String fromUrl
			, HttpServletResponse response) throws Exception {
		
		System.out.println(vo.toString());
		
		MemberVO login = memberService.loginMember(vo);
		session.setAttribute("login", login);
		// 세션 객체에 key값은 login, value값은 login객체로 저장
		
		if(remember) {
			// 쿠키 생성
			Cookie cookie = new Cookie("rememberId", vo.getMemId());
			// 응답하는 객체에 붙여준다.
			response.addCookie(cookie);
		}else {
			// 쿠키 삭제 (동일한 key값을 가지는 쿠키를 생성 후 유효기간을 0으로 만든다)
			Cookie cookie = new Cookie("rememberId", "");
			cookie.setMaxAge(0);
			// 유효기간 0짜리인 쿠키를 응답하는 객체에 붙여준다.
			response.addCookie(cookie);
		}
		
		System.out.println(login);
		// 로그인시 해당 페이지로 들어가기
		return "redirect:"+ fromUrl ;
	}
	
	@RequestMapping("/logoutDo")
	public String logoutDo(HttpSession session) {
		//세션 종료
		session.invalidate();
		
		return "redirect:/";
	}
	

}
