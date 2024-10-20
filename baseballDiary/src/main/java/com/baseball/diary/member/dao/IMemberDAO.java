package com.baseball.diary.member.dao;

import org.apache.ibatis.annotations.Mapper;

import com.baseball.diary.member.vo.MemberVO;

@Mapper
public interface IMemberDAO {
	// 회원가입
	public int registMember(MemberVO vo);
	// 로그인
	public MemberVO loginMember(MemberVO vo);

}
