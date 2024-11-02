
<h2> Baseball Diary </h2> 
<h4> 제작의도 : KBO 경기 일정 및 경기 라인업을 추출해 화면에 제공함으로써 사용자가 야구 일기를 간편하게 작성하고 열람할 수 있도록 한다. </h4>

![Baseball Diary gif](https://github.com/user-attachments/assets/4b876493-ea8b-4839-adb0-806bcd0572b5)


## 목차
1. [핵심기능](#핵심기능)
2. [상세내용](#상세내용)
3. [트러블슈팅](#트러블슈팅)
4. [느낀점](#느낀점)

<Br>

- 제작기간 : 24.10.19 ~ 24.10.25
  
- 참여인원 : 1인 (개인프로젝트)
  
- 사용기술
  - Java, Python, HTML, CSS, JavaScript, Oracle
  - STS, Sql Developer, PyCharm
  - Spring, jQuery, Bootstrap, Ajax, Selenium, BeautifulSoup
    
- ERD
  
   <img src="https://github.com/user-attachments/assets/42b2a1fe-b984-4c3d-b2a8-744b845ad67a"  width="60%"/>


## 핵심기능
  
- 로그인 전 메인화면(home.jsp) : 로그인 / 회원가입 이동.
  
  1. 회원가입(member/registView.jsp)
      - 아이디, 비밀번호, 닉네임, 응원팀을 이용하여 회원가입.
      - 중복아이디로 가입 시도 -> error modal

  2. 로그인(member/loginView.jsp)
      - 아이디, 비밀번호로 로그인.
      - 아이디 기억 가능.
 
  
- 로그인 후 메인화면(member/main.jsp) : 다이어리 리스트/ 다이어리 작성 화면으로 이동.
  
  1. 다이어리 작성화면(diary/diaryWriteView.jsp)
     - 날짜선택 후 해당 일자 경기 리스트에서 원하는 경기 선택. (경기일정 DB)
     - 해당 경기 라인업과 경기스코어 화면에 출력. (경기 상세정보 API)
     - 제목과 본문 입력 후 저장.
  
  2. 다이어리 리스트 화면(diary/diaryView.jsp)
     - 작성한 다이어리 목록 확인.
  
  3. 다이어리 상세화면(diary/diaryDetailView.jsp)
     - 작성한 다이어리의 경기 날짜, 라인업, 스코어, 본문 내용 확인가능. 
     - 수정버튼 : 수정화면 이동
     - 삭제버튼 : 다이어리 삭제.
     - 이미지로 저장하기 : 해당 화면 캡쳐 후 이미지 저장

  4. 다이어리 수정화면(diary/diaryEditView.jsp)
     - 경기날짜, 라인업, 스코어 수정불가
     - 제목, 본문 수정 가능
  
  5. 마이페이지(member/mypage.jsp)
     - 아이디 변경불가
     - 닉네임과 응원팀 수정 가능.
     - 회원탈퇴 버튼 : 회원 비활성화.
  
 

## 상세내용


<details>
  <summary>1. 경기 일정 크롤링</summary>

  
      from selenium import webdriver
      from selenium.webdriver.common.by import By
      import time
      from bs4 import BeautifulSoup
      from selenium.webdriver.support.ui import Select
      
      import cx_Oracle
      
      conn = cx_Oracle.connect("sohee", "sohee", "localhost:1521/xe")
      
      url = "https://www.koreabaseball.com/Schedule/Schedule.aspx"
      
      driver = webdriver.Chrome()
      driver.implicitly_wait(3)
      
      driver.get(url)
      time.sleep(1)
      
      # 정규시즌 선택
      select_year = driver.find_element(By.ID, 'ddlSeries')
      select = Select(select_year)
      select.select_by_value('0,9,6')
      time.sleep(1)
      
      # 년 선택
      select_year = driver.find_element(By.ID, 'ddlYear')
      select = Select(select_year) 
      select.select_by_value('2024')
      
      # 월 선택
      select_month = driver.find_element(By.ID, 'ddlMonth')
      select = Select(select_month)
      select.select_by_value('4')
      time.sleep(1)
      
      # 해당월 경기 리스트 수집
      game = driver.find_element(By.ID, 'tblScheduleList')
      game_table = game.find_element(By.TAG_NAME, 'tbody')
      game_lists = game_table.find_elements(By.TAG_NAME, 'tr')
      game = list()
      
      cur = conn.cursor()
      sql1 = """
              INSERT INTO tb_kbo(game_day, home_team, home_team_score
                              ,away_team, away_team_score, game_space, game_note)
              VALUES(TO_DATE(:1, 'YYYY.MM.DD HH24:MI'), :2, :3, :4, :5, :6, :7)
      """
      
      soup = BeautifulSoup(driver.page_source, 'html.parser')
      trs = soup.select('#tblScheduleList tbody tr')
      
      game_day1 = '2024.01.01'
      for tr in trs:
          away_team = '-'
          away_team_score = '-'
          home_team = '-'
          home_team_score = '-'
          tds = tr.find_all('td')
          for td in tds:
              cls = td.get('class')
              if cls == ['day']:
                  game_day1 = '2024.' + td.text[:5] + ' '
              if cls == ['time']:
                  game_day = game_day1 + td.text
              if cls == ['play']:
                  spans = td.find_all('span')
                  if len(spans) == 5:
                      away_team = spans[0].text
                      away_team_score = spans[1].text
                      home_team = spans[4].text
                      home_team_score = spans[3].text
                  if len(spans) == 3:
                      home_team = spans[0].text
                      away_team = spans[2].text
          game_place = tds[-2].text
          game_note = tds[-1].text
      
          cur.execute(sql1
                      , [game_day, home_team, home_team_score
                      , away_team, away_team_score, game_place, game_note])
      
      time.sleep(1)
      
      conn.commit()
      conn.close()
      
      driver.quit()
      # print(soup.prettify())
  
</details>

<details>
  <summary>2-1. 경기 라인업 API (HOME)</summary>

        @GetMapping("/homeLineup")
        public List<Map<String, Object>> getHomeLineup(@RequestParam String code) {
        String lineupUrl = "https://api-gw.sports.naver.com/schedule/games/" + code + "/preview";
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setAcceptCharset(List.of(StandardCharsets.UTF_8));
        HttpEntity<String> entity = new HttpEntity<>(headers);

        ResponseEntity<String> response = restTemplate.exchange(lineupUrl, HttpMethod.GET, entity, String.class);
        List<Map<String, Object>> lineupList = new ArrayList<>();

        if (response.getStatusCode().is2xxSuccessful()) {
            try {
                String responseBody = new String(response.getBody().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
                JSONParser parser = new JSONParser();
                JSONObject jsonData = (JSONObject) parser.parse(responseBody);
                JSONObject result = (JSONObject) jsonData.get("result");
                JSONObject previewData = (JSONObject) result.get("previewData");
                JSONObject homeTeamLineUp = (JSONObject) previewData.get("homeTeamLineUp");
                JSONArray lineupDataArray = (JSONArray) homeTeamLineUp.get("fullLineUp");

                for (int i = 0; i < lineupDataArray.size(); i++) {
                    JSONObject lineupData = (JSONObject) lineupDataArray.get(i);
                    Map<String, Object> lineup = new HashMap<>();

                    lineup.put("positionName", lineupData.get("positionName"));
                    lineup.put("playerName", lineupData.get("playerName"));
                    lineup.put("position", lineupData.get("position"));

                    if (i != 0) {
                        lineup.put("batorder", lineupData.get("batorder"));
                    }

                    lineupList.add(lineup);
                }
            } catch (org.json.simple.parser.ParseException e) {
                e.printStackTrace();
            }
        }

        return lineupList;
    }
</details>

<details>
  <summary>2-2. 경기 라인업 API (AWAY)</summary>

      @GetMapping("/awayLineup")
      public List<Map<String, Object>> getAwayLineup(@RequestParam String code) {
      String lineupUrl = "https://api-gw.sports.naver.com/schedule/games/" + code + "/preview";
      HttpHeaders headers = new HttpHeaders();
      headers.setContentType(MediaType.APPLICATION_JSON);
      headers.setAcceptCharset(List.of(StandardCharsets.UTF_8));
      HttpEntity<String> entity = new HttpEntity<>(headers);

      ResponseEntity<String> response = restTemplate.exchange(lineupUrl, HttpMethod.GET, entity, String.class);
      List<Map<String, Object>> lineupList = new ArrayList<>();

      if (response.getStatusCode().is2xxSuccessful()) {
          try {
              String responseBody = new String(response.getBody().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
              JSONParser parser = new JSONParser();
              JSONObject jsonData = (JSONObject) parser.parse(responseBody);
              JSONObject result = (JSONObject) jsonData.get("result");
              JSONObject previewData = (JSONObject) result.get("previewData");
              JSONObject awayTeamLineUp = (JSONObject) previewData.get("awayTeamLineUp");
              JSONArray lineupDataArray = (JSONArray) awayTeamLineUp.get("fullLineUp");

              for (int i = 0; i < lineupDataArray.size(); i++) {
                  JSONObject lineupData = (JSONObject) lineupDataArray.get(i);
                  Map<String, Object> lineup = new HashMap<>();

                  lineup.put("positionName", lineupData.get("positionName"));
                  lineup.put("playerName", lineupData.get("playerName"));
                  lineup.put("position", lineupData.get("position"));

                  if (i != 0) {
                      lineup.put("batorder", lineupData.get("batorder"));
                  }

                  lineupList.add(lineup);
              }
          } catch (org.json.simple.parser.ParseException e) {
              e.printStackTrace();
          }
      }

      return lineupList;
  }
</details>

<details>
  <summary>3. 경기 스코어보드 API</summary>

      @GetMapping("/scoreBoard")
      public List<Map<String, Object>> scoreBoard(@RequestParam String code) {
      String scoreUrl = "https://api-gw.sports.naver.com/schedule/games/" + code;
      HttpHeaders headers = new HttpHeaders();
      headers.setContentType(MediaType.APPLICATION_JSON);
      headers.setAcceptCharset(List.of(StandardCharsets.UTF_8));
      HttpEntity<String> entity = new HttpEntity<>(headers);

      ResponseEntity<String> response = restTemplate.exchange(scoreUrl, HttpMethod.GET, entity, String.class);
      List<Map<String, Object>> ScoreList = new ArrayList<>();

      if (response.getStatusCode().is2xxSuccessful()) {
          try {
              String responseBody = new String(response.getBody().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
              JSONParser parser = new JSONParser();
              JSONObject jsonData = (JSONObject) parser.parse(responseBody);
              JSONObject result = (JSONObject) jsonData.get("result");
              
              Map<String, Object> gameData = new HashMap<>();
              
              JSONObject game = (JSONObject) result.get("game");
              String gameDateTime = (String) game.get("gameDateTime");
              String winner = (String) game.get("winner");
              String stadium = (String) game.get("stadium");
              String homeTeamName = (String) game.get("homeTeamName");
              String homeTeamFullName = (String) game.get("homeTeamFullName");
              String awayTeamName = (String) game.get("awayTeamName");
              String awayTeamFullName = (String) game.get("awayTeamFullName");
              String homeTeamCode = (String) game.get("homeTeamCode");
              String awayTeamCode = (String) game.get("awayTeamCode");
              
              gameData.put("gameDateTime", gameDateTime);
              gameData.put("winner", winner);
              gameData.put("stadium", stadium);
              gameData.put("homeTeamName", homeTeamName);
              gameData.put("homeTeamFullName", homeTeamFullName);
              gameData.put("homeTeamCode", homeTeamCode);
              gameData.put("awayTeamName", awayTeamName);
              gameData.put("awayTeamFullName", awayTeamFullName);
              gameData.put("awayTeamCode", awayTeamCode);
              
              
              JSONArray homeTeamScoreByInning = (JSONArray) game.get("homeTeamScoreByInning");
              ArrayList<Integer> homes = new ArrayList<>();
              for (int i = 0; i < homeTeamScoreByInning.size(); i++) {
                String ScoreByInning = (String)homeTeamScoreByInning.get(i);
                if(!ScoreByInning.equals("-")){
                  homes.add(Integer.parseInt(ScoreByInning));
                }
                 
              }
              gameData.put("homeTeamScoreByInning", homes);
              
              JSONArray awayTeamScoreByInning = (JSONArray) game.get("awayTeamScoreByInning");
              
              ArrayList<Integer> aways = new ArrayList<>();
              for (int i = 0; i < awayTeamScoreByInning.size(); i++) {
                String ScoreByInning = (String)awayTeamScoreByInning.get(i);
                if(!ScoreByInning.equals("-")){
                  aways.add(Integer.parseInt(ScoreByInning));
                }
              }
              gameData.put("awayTeamScoreByInning", aways);
              
              JSONArray homeTeamRheb = (JSONArray) game.get("homeTeamRheb");
              JSONArray awayTeamRheb = (JSONArray) game.get("awayTeamRheb");
              gameData.put("homeTeamRheb", homeTeamRheb);
              gameData.put("awayTeamRheb", awayTeamRheb);
              
              ScoreList.add(gameData);

          } catch (org.json.simple.parser.ParseException e) {
              e.printStackTrace();
          }
      }
      return ScoreList;
      
}
</details>



## 트러블슈팅
1. 경기를 선택하였으나 라인업/스코어보드가 나타나지 않음
   - 우천 등으로 취소된 경기
   - 크롤링시 받아온 비고(game_note)를 경기 셀렉시 보이도록 함
     
     <img src="https://github.com/user-attachments/assets/d271689d-aa85-4fc3-90a3-2b256f75bed3" width="50%">

   - api 호출시 응답 없는 경우 라인업란에 "경기가 없습니다!" 출력되도록 수정
     
     <img src="https://github.com/user-attachments/assets/6ddc2728-c8d0-4fc5-8682-81a3558fc118" width="50%">

     ```
     error:function(e){
            console.log(e);
            $("#" +url ).empty();
            let str="";
            str += "<table class='table table-bordered '>";
            str += "<thead> <tr> <th colspan='3'> 경기가 없습니다! </th> </tr> </thead>";
            str += "</table>";
            $("#" +url ).append(str);
     }
     ```
2. 취소된 경기가 아닌데도 라인업/스코어보드가 나타나지 않음
   - 더블헤더 편성된 경기
   - CODE 조합시 하루에 두 경기를 하는 경우를 생각하지 못함
     - yymm || away ||home || cnt || yy  as code
     - 일반적으로 하루에 1경기를 하기 때문에 ex. 20240901HTSS02024 와 같이 cnt가 0으로 설정됨
     - 더블헤더(하루에 두 경기를 진행함)를 고려하지 못하고 cnt를 전부 0으로 설정했던 것이 문제
     - 더블헤더 1차전 code 예시 : 20240921OBLG12024
     - 더블헤더 2차전 code 예시 : 20240921OBLG22024
   - 경기 셀렉시 경기 시간까지 보이도록 수정
     
     <img src="https://github.com/user-attachments/assets/2488b531-5a11-42df-a0cc-381e78bac541" width=50%>

   - diary.xml, id="getGameList", SELECT문 code조합 부분 수정
     ```
     CASE WHEN COUNT(*) OVER(PARTITION BY away_team||home_team) >1
          THEN TO_CHAR(ROW_NUMBER() OVER(PARTITION BY away_team||home_team ORDER BY game_day ASC))  
     ELSE '0' END  as cnt
     ```


## 느낀점
- 개인프로젝트 전에는 VO, xml, DAO, Service, Controller 작동 흐름을 계속 헷갈리고 있었습니다.<br>
  스스로 웹사이트를 하나 만들면서 비슷한 과정을 반복적으로 진행하다보니, 머릿속에 프로그램 작동 흐름이 서서히 잡혀가는 것을 느낄 수 있었습니다.
- API 데이터를 전보다 능숙하게 다룰 수 있게 되었습니다.<br>
  처음엔 API 데이터 추출 코드를 Python으로 작성했는데,
  이 코드를 JAVA로 변환하는 과정을 겪으면서 각 언어가 데이터를 다루는 방식을 새롭게 익힐 수 있어 좋았습니다.



