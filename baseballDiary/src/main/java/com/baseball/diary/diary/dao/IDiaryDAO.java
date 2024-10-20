package com.baseball.diary.diary.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.baseball.diary.diary.vo.DiaryVO;

@Mapper
public interface IDiaryDAO {
	// 다이어리 목록 조회
	public ArrayList<DiaryVO> getDiaryList();
	// 다이어리 작성
	public int writeDiary(DiaryVO vo);
	// 다이어리 상세 조회
	public DiaryVO getDiary(int diaryNo);
	
}
