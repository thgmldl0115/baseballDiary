package com.baseball.diary.diary.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.baseball.diary.diary.vo.DiaryVO;
import com.baseball.diary.diary.vo.GameDayVO;
import com.baseball.diary.member.vo.MemberVO;

@Mapper
public interface IDiaryDAO {
	// 다이어리 목록 조회
	public ArrayList<DiaryVO> getDiaryList(MemberVO vo);
	// 다이어리 작성
	public int writeDiary(DiaryVO vo);
	// 다이어리 상세 조회
	public DiaryVO getDiary(int diaryNo);
	// 다이어리 수정
	public int updateDiary(DiaryVO vo);
	// 다이어리 삭제
	public int deleteDiary(int diaryNo);
	
	// 해당일 게임 리스트 조회
	public ArrayList<GameDayVO> getGameList(String gameDay);
	
	
	
}
