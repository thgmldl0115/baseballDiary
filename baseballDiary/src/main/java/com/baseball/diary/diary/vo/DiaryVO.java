package com.baseball.diary.diary.vo;

public class DiaryVO {
	
	private String memId;
	private Integer diaryNo;
	private String gameDay;
	private String homeTeam;
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
	
	public Integer getDiaryNo() {
		return diaryNo;
	}
	public void setDiaryNo(Integer diaryNo) {
		this.diaryNo = diaryNo;
	}
	public String getGameDay() {
		return gameDay;
	}
	public void setGameDay(String gameDay) {
		this.gameDay = gameDay;
	}
	public String getHomeTeam() {
		return homeTeam;
	}
	public void setHomeTeam(String homeTeam) {
		this.homeTeam = homeTeam;
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
		return "DiaryVO [memId=" + memId + ", diaryNo=" + diaryNo + ", gameDay=" + gameDay + ", homeTeam=" + homeTeam
				+ ", diaryTitle=" + diaryTitle + ", diaryContent=" + diaryContent + ", useYn=" + useYn + ", updateDt="
				+ updateDt + ", createDt=" + createDt + "]";
	}
	
	
	
}
