package com.baseball.diary.member.vo;

public class MemverVO {
	private String memId;    
	private String memPw;
	private String memNm;
	private String kboTeam;
	private String useYn;
	private String updateDt;
	private String createDt;
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemNm() {
		return memNm;
	}
	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}
	public String getKboTeam() {
		return kboTeam;
	}
	public void setKboTeam(String kboTeam) {
		this.kboTeam = kboTeam;
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
		return "MemverVO [memId=" + memId + ", memPw=" + memPw + ", memNm=" + memNm + ", kboTeam=" + kboTeam
				+ ", useYn=" + useYn + ", updateDt=" + updateDt + ", createDt=" + createDt + "]";
	}

	

}
