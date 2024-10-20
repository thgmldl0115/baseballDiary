package com.baseball.diary.diary.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baseball.diary.diary.dao.IDiaryDAO;
import com.baseball.diary.diary.vo.DiaryVO;

@Service
public class DiaryService {
	
	@Autowired
	IDiaryDAO dao;

	public ArrayList<DiaryVO> getDiaryList(){
		ArrayList<DiaryVO> result = dao.getDiaryList();
		
		return result;
	}
	
	public void writeDiary(DiaryVO vo) throws Exception {
		int result = dao.writeDiary(vo);
		if(result == 0) {
			throw new Exception();
		}
	}
	
	public DiaryVO getDiary(int diaryNo) throws Exception {
		DiaryVO result = dao.getDiary(diaryNo);
		
		if(result == null) {
			throw new Exception();
		}
		
		return result;
	}
	
	
}
