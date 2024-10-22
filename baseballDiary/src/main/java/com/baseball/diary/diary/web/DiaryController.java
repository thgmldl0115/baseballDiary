package com.baseball.diary.diary.web;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.baseball.diary.diary.service.DiaryService;
import com.baseball.diary.diary.vo.DiaryVO;
import com.baseball.diary.member.vo.MemberVO;


@Controller
//@RestController
public class DiaryController {
	
	@Autowired
	DiaryService diaryService;
	
	@RequestMapping("/diaryView")
	public String boardView(HttpSession session, Model model) {
		
		if(session.getAttribute("login") == null) {
			return "redirect:/loginView";
		}
		
		MemberVO vo = (MemberVO) session.getAttribute("login");
		
		ArrayList<DiaryVO> diaryList = diaryService.getDiaryList(vo);
		model.addAttribute("diaryList", diaryList);
		// key와 value값으로 저장.
		// JSP 파일 내에서 Model객체에 저장된 데이터를 사용할 수 있다.
		return "diary/diaryView";
	}
	
	@RequestMapping("/diaryWriteView")
	public String diaryWriteView(HttpSession session) {
		
		if(session.getAttribute("login") == null) {
			return "redirect:/loginView";
		}
		//세션에 로그인된 객체가 존재하지 않으면 로그인 페이지로 보낸다.
		
		return "diary/diaryWriteView";
	}
	
	@RequestMapping("/diaryWriteDo")
	public String diaryWriteDo(DiaryVO vo, HttpSession session) throws Exception {
		
		// input 태그를 통해 회원이 아이디를 가져오지는 못하므로
		// 세션 객체로부터 로그인 된 회원의 아이디를 꺼내서 board 객체에 담는다.
		MemberVO login = (MemberVO) session.getAttribute("login");
		vo.setMemId(login.getMemId());
		
		diaryService.writeDiary(vo);
		
		return "redirect:/diaryView";
	}
	
	@RequestMapping("/diaryDetailView")
	public String diaryDetailView(int diaryNo, Model model) throws Exception {
		
		DiaryVO diary = diaryService.getDiary(diaryNo);
		model.addAttribute("diary", diary);
		
		return "diary/diaryDetailView";
	}
	
	// 단순히 브라우저 주소창에 URL을 입력한 경우 글 수정이 이루어지면 안되기 때문에,
	// POST방식으로 요청한 데이터만 처리하도록 한다.
	@RequestMapping(value="/diaryEditView", method=RequestMethod.POST)
	public String diaryEditView(int diaryNo, Model model) throws Exception {
		
		DiaryVO vo = diaryService.getDiary(diaryNo);
		model.addAttribute("diary", vo);
		
		return "diary/diaryEditView";
	}
	
	// PostMapping 어노테이션을 사용하면 POST로 요청온 URL만 처리한다.
	@PostMapping("/diaryEditDo")
	public String diaryEditDo(DiaryVO vo) throws Exception {
		
		diaryService.updateDiary(vo);
		
		return "redirect:/diaryView";
	}
	
	@PostMapping("/diaryDelDo")
	public String diaryDelDo(int diaryNo) throws Exception {
		
		diaryService.deleteDiary(diaryNo);
		
		return "redirect:/diaryView";
	}

}
