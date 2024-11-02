
<h2> Baseball Diary </h2> 
<h4> 제작의도 : KBO 경기 일정 및 경기 라인업을 추출해 화면에 제공함으로써 사용자가 야구 일기를 간편하게 작성하고 열람할 수 있도록 한다. </h4>

![Baseball Diary gif](https://github.com/user-attachments/assets/4b876493-ea8b-4839-adb0-806bcd0572b5)

- 제작기간 : 24.10.19 ~ 24.10.25
  
- 참여인원 : 1인 (개인프로젝트)
  
- 사용기술
  - Java, Python, HTML, CSS, JavaScript, Oracle
  - STS, Sql Developer, PyCharm
  - Spring, jQuery, Bootstrap, Ajax, Selenium, BeautifulSoup
    
- ERD
  
   <img src="https://github.com/user-attachments/assets/42b2a1fe-b984-4c3d-b2a8-744b845ad67a"  width="60%"/>
  
- 핵심기능
  
  - 로그인 전 메인화면 : 로그인 / 회원가입 이동.
  ```
  1. 회원가입 : 아이디, 비밀번호, 닉네임, 응원팀을 이용하여 회원가입.
              - 중복아이디로 가입 시도 -> error modal

  2. 로그인 : 아이디, 비밀번호로 로그인. 아이디 기억 가능.
  ```
  
  - 로그인 후 메인화면 : 다이어리 리스트/ 다이어리 작성 화면으로 이동.
  ```
  1. 다이어리 작성화면 : 날짜선택 후 해당 일자 경기 리스트에서 원하는 경기 선택. 
                        -> 해당 경기 라인업과 경기스코어 화면에 출력.
                        제목과 본문 입력 후 저장.
  
  2. 다이어리 리스트 화면 : 작성한 다이어리 목록 확인.
  
  3. 다이어리 상세화면 : 다이어리 상세 확인. hr경기 날짜, 라인업, 스코어, 본문 확인가능. 
                          수정버튼 -> 수정화면 이동 : 작성한 다이어리 수정가능.
                          삭제버튼 -> 다이어리 삭제.
  
  4. 마이페이지 : 아이디 변경불가. 닉네임과 응원팀 수정 가능.
                  회원탈퇴 버튼 -> 회원 비활성화.
  
   ```
  


  



