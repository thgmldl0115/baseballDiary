package com.baseball.diary.diary.vo;

public class DiaryVO {
	
	private String memId;
	private int diaryNo;
	private String gameDay;
	private String gameDate;
	private String code;
	private String diaryTitle;
	private String diaryContent;
	private String useYn;
	private String updateDt;
	private String createDt;
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public int getDiaryNo() {
		return diaryNo;
	}
	public void setDiaryNo(int diaryNo) {
		this.diaryNo = diaryNo;
	}
	public String getGameDay() {
		return gameDay;
	}
	public void setGameDay(String gameDay) {
		this.gameDay = gameDay;
	}
	public String getGameDate() {
		return gameDate;
	}
	public void setGameDate(String gameDate) {
		this.gameDate = gameDate;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDiaryTitle() {
		return diaryTitle;
	}
	public void setDiaryTitle(String diaryTitle) {
		this.diaryTitle = diaryTitle;
	}
	public String getDiaryContent() {
		return diaryContent;
	}
	public void setDiaryContent(String diaryContent) {
		this.diaryContent = diaryContent;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getUpdateDt() {
		return updateDt;
	}
	public void setUpdateDt(String updateDt) {
		this.updateDt = updateDt;
	}
	public String getCreateDt() {
		return createDt;
	}
	public void setCreateDt(String createDt) {
		this.createDt = createDt;
	}
	@Override
	public String toString() {
		return "DiaryVO [memId=" + memId + ", diaryNo=" + diaryNo + ", gameDay=" + gameDay + ", gameDate=" + gameDate
				+ ", code=" + code + ", diaryTitle=" + diaryTitle + ", diaryContent=" + diaryContent + ", useYn="
				+ useYn + ", updateDt=" + updateDt + ", createDt=" + createDt + "]";
	}
	
	
	
	
	
	
	
	
}
