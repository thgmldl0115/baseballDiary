package com.baseball.diary.member.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baseball.diary.common.exception.BizException;
import com.baseball.diary.common.valid.Login;
import com.baseball.diary.common.valid.Regist;
import com.baseball.diary.common.vo.MessageVO;
import com.baseball.diary.member.service.MemberService;
import com.baseball.diary.member.vo.MemberVO;


@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping("/registView")
	public String registView(@ModelAttribute("member") MemberVO member) {
		return "member/registView";
	}
	
	@RequestMapping("/main")
	public String main() {
		return "member/main";
	}
	
	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		if(session.getAttribute("login") == null) {
			return "redirect:/loginView";
		}
		return "member/mypage";
	}
	
	@RequestMapping("/registDo")
	public String registDo(@Validated(Regist.class) @ModelAttribute("member") MemberVO member
			 , BindingResult result
			 , Model model) {
		
		if(result.hasErrors()) {
			return "member/registView";
		}
		try {
			member.setMemPw(passwordEncoder.encode(member.getMemPw()));
			memberService.registMember(member);
		} catch (DuplicateKeyException e) {
			MessageVO messageVO = new MessageVO(false, "회원가입", "중복 아이디입니다!", "/registView", "회원가입");
			model.addAttribute("messageVO", messageVO);
			return "member/registView";
		} catch (DataAccessException e) {
			MessageVO messageVO = new MessageVO(false, "회원가입", "잘못된 입력입니다!", "/registView", "회원가입");
			model.addAttribute("messageVO", messageVO);
			return "member/registView";
		} catch (BizException e) {
			MessageVO messageVO = new MessageVO(false, "회원가입", "회원가입이 되지 않았습니다!", "/registView", "회원가입");
			model.addAttribute("messageVO", messageVO);
			return "member/registView";
		}
		
		MessageVO messageVO = new MessageVO(true, "회원가입", "회원가입이 완료되었습니다.", "/loginView", "로그인");
		// 리다이렉트시 데이터 전달
		model.addAttribute("messageVO", messageVO);
		
		return "redirect:/";
	}
	
	@RequestMapping("/loginView")
	public String loginView(@ModelAttribute("member") MemberVO member) {
		return "member/loginView";
	}
	
	@RequestMapping("/loginDo")
	public String loginDo(@ModelAttribute("member") MemberVO vo, boolean remember
			, HttpSession session
			, HttpServletResponse response
			, @Validated(Login.class) @ModelAttribute("member") MemberVO member
			, BindingResult result, Model model) throws Exception {
		
		if(result.hasErrors()) {
			
			return "member/loginView";
		}
		MemberVO login = memberService.loginMember(vo);
		
		boolean match = passwordEncoder.matches(vo.getMemPw(), login.getMemPw());
		if(login == null || !match) {
			return "redirect:/loginView";
		}
		session.setAttribute("login", login);
		// 세션 객체에 key값은 login, value값은 login객체로 저장
		
		if(remember) {
			// 쿠키 생성
			Cookie cookie = new Cookie("rememberId", login.getMemId());
			// 응답하는 객체에 붙여준다.
			response.addCookie(cookie);
		}else {
			// 쿠키 삭제 (동일한 key값을 가지는 쿠키를 생성 후 유효기간을 0으로 만든다)
			Cookie cookie = new Cookie("rememberId", "");
			cookie.setMaxAge(0);
			// 유효기간 0짜리인 쿠키를 응답하는 객체에 붙여준다.
			response.addCookie(cookie);
		}

		// 로그인시 해당 페이지로 들어가기
		return "redirect:/main";
	}
	
	@RequestMapping("/logoutDo")
	public String logoutDo(HttpSession session) {
		//세션 종료
		session.invalidate();
		
		return "redirect:/";
	}
	
	@PostMapping("/mypageEditDo")
	public String mypageEditDo(Model model, MemberVO vo) throws Exception {
		
		memberService.updateMypage(vo);
		
		return "redirect:/loginView";
	}
	
	@PostMapping("/memberDelDo")
	public String memberDelDo(String memId) throws Exception {
		
		memberService.deleteMember(memId);
		
		return "redirect:/";
	}
	

}
