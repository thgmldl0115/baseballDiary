package com.baseball.diary.member.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baseball.diary.member.service.MemberService;
import com.baseball.diary.member.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping("/registView")
	public String registView() {
		return "member/registView";
	}
	
	@RequestMapping("/main")
	public String main() {
		return "member/main";
	}
	
	@RequestMapping("/mypage")
	public String mypage() {
		return "member/mypage";
	}
	
	@RequestMapping("/registDo")
	public String registDo(HttpServletRequest request) {
		
		String id = request.getParameter("memId");
		String pw = request.getParameter("memPw");
		String nm = request.getParameter("memNm");
		String kboTeam = request.getParameter("kboTeam");
		
		MemberVO member = new MemberVO();
		
		String encodePw = passwordEncoder.encode(pw);
		
		member.setMemId(id);
		member.setMemPw(encodePw);
		member.setMemNm(nm);
		member.setKboTeam(kboTeam);
		
		
		System.out.println(member.toString());
		
		try {
			memberService.registMember(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/loginView";
	}
	
	@RequestMapping("/loginView")
	public String loginView() {
		return "member/loginView";
	}
	
	@RequestMapping("/loginDo")
	public String loginDo(MemberVO vo, HttpSession session
			, boolean remember, String fromUrl
			, HttpServletResponse response) throws Exception {
		
		MemberVO login = memberService.loginMember(vo);
		
		/*
		 * DB에서 가져온 암호화된 비밀번호(vo.getMemPw())에서 salt값 추출
		 * 사용자가 입력한 평문 비밀번호(login.getMemPw())와 추출된 salt값을 사용하여 비밀번호 재암호화
		 * 2단계에서 암호화된 값과 DB에서 가져온 암호화된 비밀번호 비료
		 * 두 값이 일치하면 true반환, 그렇지 않으면 false를 반환 
		 */
		boolean match = passwordEncoder.matches(vo.getMemPw(), login.getMemPw());
		if(login == null || !match) {
			return "redirect:/loginView";
		}
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
		return "redirect:/main";
	}
	
	@RequestMapping("/logoutDo")
	public String logoutDo(HttpSession session) {
		//세션 종료
		session.invalidate();
		
		return "redirect:/";
	}
	

}
