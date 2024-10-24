package com.baseball.diary.member.vo;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import com.baseball.diary.common.valid.Login;
import com.baseball.diary.common.valid.Regist;

public class MemberVO {
	@NotEmpty(message="아이디는 필수 입력 항목입니다.", groups= {Login.class, Regist.class})
	private String memId;   
	// \\w -> [a-zA-Z0-9], ^:시작, $:끝
	@Pattern(regexp="^\\w{4,10}$", message="영문과 숫자로 이루어진 4~10자리로 입력하세요.", groups= {Login.class, Regist.class})  // 정규식 
	private String memPw;
	@Size(min=1, max=20, message="1~20자 사이로 입력해주세요.", groups= {Regist.class})
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
		return "MemberVO [memId=" + memId + ", memPw=" + memPw + ", memNm=" + memNm + ", kboTeam=" + kboTeam
				+ ", useYn=" + useYn + ", updateDt=" + updateDt + ", createDt=" + createDt + "]";
	}

	

}
