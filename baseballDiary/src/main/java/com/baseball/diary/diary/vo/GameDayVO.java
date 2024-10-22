package com.baseball.diary.diary.vo;

public class GameDayVO {
	
	private String gameDay;
	private String homeTeam;
	private String homeTeamScore;
	private String awayTeam;
	private String awayTeamScore;
	private String gameSpace;
	private String gameNote;
	private String code;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
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
	public String getHomeTeamScore() {
		return homeTeamScore;
	}
	public void setHomeTeamScore(String homeTeamScore) {
		this.homeTeamScore = homeTeamScore;
	}
	public String getAwayTeam() {
		return awayTeam;
	}
	public void setAwayTeam(String awayTeam) {
		this.awayTeam = awayTeam;
	}
	public String getAwayTeamScore() {
		return awayTeamScore;
	}
	public void setAwayTeamScore(String awayTeamScore) {
		this.awayTeamScore = awayTeamScore;
	}
	public String getGameSpace() {
		return gameSpace;
	}
	public void setGameSpace(String gameSpace) {
		this.gameSpace = gameSpace;
	}
	public String getGameNote() {
		return gameNote;
	}
	public void setGameNote(String gameNote) {
		this.gameNote = gameNote;
	}
	@Override
	public String toString() {
		return "GameDayVO [gameDay=" + gameDay + ", homeTeam=" + homeTeam + ", homeTeamScore=" + homeTeamScore
				+ ", awayTeam=" + awayTeam + ", awayTeamScore=" + awayTeamScore + ", gameSpace=" + gameSpace
				+ ", gameNote=" + gameNote + "]";
	}
	
	
}
