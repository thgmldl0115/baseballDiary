package com.baseball.diary.diary.web;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.baseball.diary.diary.service.DiaryService;
import com.baseball.diary.diary.vo.GameDayVO;


//@Controller
@RestController
@RequestMapping("/api")  // 하위 메소드 경로를 다 /api/ 로 시작
public class CodeController {
	
	  @Autowired
	  private RestTemplate restTemplate;
	  
	  @Autowired
	  private DiaryService diaryService;

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
      

      @GetMapping("/gameDay")
      public Map<String, Object> getGameList(@RequestParam String gameDay) {
    	  Map<String, Object> lineupList = new HashMap<>();
    	  
    	  ArrayList<GameDayVO> gameList = diaryService.getGameList(gameDay);
    	  lineupList.put("gameList", gameList);
    	  return lineupList;
      }
}
