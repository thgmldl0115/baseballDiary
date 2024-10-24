package com.baseball.diary.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import com.baseball.diary.common.exception.BizException;
import com.baseball.diary.member.dao.IMemberDAO;
import com.baseball.diary.member.vo.MemberVO;



@Service
public class MemberService {
	
	@Autowired
	IMemberDAO dao;

	public void registMember(MemberVO vo) throws DuplicateKeyException
												, DataAccessException
												, BizException{
		int result = dao.registMember(vo);
		if (result == 0) {
			throw new BizException();
		}
	}
	
	public MemberVO loginMember(MemberVO vo) throws Exception{
		
		MemberVO result = dao.loginMember(vo);
		System.out.println(result);
		
		if(result == null) {
			throw new Exception();
		}
		
		return result;
	}
	
	public void updateMypage(MemberVO vo) throws Exception {
		System.out.println(vo.toString());
		int result = dao.updateMypage(vo);
		
		if(result == 0) {
			throw new Exception();
		}
	}
	
	public void deleteMember(String memId) throws Exception {
		int result = dao.deleteMember(memId);
		
		if(result == 0) {
			throw new Exception();
		}
	}

}
