<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<!-- 브라우저가 캐시를 전혀 사용하지 않도록 -->
<meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate" >
<!-- 과거 http/1.0 호환을 위해 -->
<meta http-equiv="Pragma" content="no-cache" >
<!-- 페이지가 만료되었음 다시 요청하도록 -->
<meta http-equiv="Expires" content="0" >

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<style>
	.error{
		color:red;, font-size:0.9em;
	}
	
	div .line{
		outline: 1px solid black;
		
	}
	

	
</style>

<title>Baseball Diary</title>
</head>

<body style="font-size:1rem;">
    <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
    <!-- Page Header-->
	<header class="masthead" style="background-image: url('assets/img/baseball5.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h1>Diary write</h1>
                            <span class="subheading"></span>
                        </div>
                    </div>
                </div>
            </div>
        </header>

	<!-- Contact Section Form-->
	<div class="container text-center" style="margin-bottom: 2rem;">
		<div class="border d-flex justify-content-center">
		
		<div class="p-0 container text-center row align-items-center"> 
		<!-- Main Content-->
        <main class="mb-4">
            <div class="container px-3 px-lg-4" >
                
	            <form action="/diaryWriteDo" method="post">
	            	<!-- title input -->
	            	
	            	<div class="row p-0 g-3 gx-3 align-items-center" style="margin-top:1rem; margin-bottom:0;">
	            	
	            		<div class="p-0 m-0 col-xl-6">
	            			<table id="game" class="m-0 table table-bordered">
	            				<tr>
	            					<th><input type="date" name="gameDay" id="gameday" class="col-form-label"
									onchange="fn_gameDay(this)" style="width:100%; border: 0;"></th>
									<th>
									
									<select id="gameList" name="code" class="form-control input-sm" 
										style="width:100%; border: 0;" >
										<!--
										<option value="T" ${searchVO.searchType eq "T" ? "selected='selected'": ""} >제목</option>
										<option value="W" ${searchVO.searchType eq "W" ? "selected='selected'": ""} >작성자</option>
										<option value="C" ${searchVO.searchType eq "C" ? "selected='selected'": ""}>내용</option>
										-->
									</select>
									
									</th>
	            				</tr>
	            			</table>
	            		</div>
	            		
	            		<div class="p-0 m-0 col-xl-6" >
	            			<table class="m-0 table table-bordered">
	            				<tr>
	            					<td><label for="diaryTitle" class="col-form-label">제목</label></td>
									<td>
										<input type="text" id="diaryTitle" name="diaryTitle" 
											class="form-control" style="width:100%; border: 0;"/>
									</td>
	            				</tr>
	            			</table>
	            		</div>
	                	
					</div>
					
	            	
	                

	                
	                <div class="row p-0 g-3 gx-3 align-items-center" style="margin-top:1rem; margin-bottom:1rem;">
	                	<!-- 라인업 -->
	                	<div class="m-0 col-xl-3" >
	                		<div class="accordion" id="accordionExample" style="margin-bottom:0.5rem;">
							  <div class="accordion-item">
							    <h2 class="accordion-header">
							      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
							        home
							      </button>
							    </h2>
							    <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
							      <div class="accordion-body" id="homeLineup" >
							      	<table class='table table-bordered '>
							      		<thead> <tr> <th colspan='3'> lineup </th> </tr> </thead>
							      		<tbody> 
							      			<tr><th scope='row'>1</th><td scope='row'>&nbsp;</td><td scope='row'>&nbsp;</td></tr>
							      			<tr><th scope='row'>2</th><td scope='row'>&nbsp;</td><td scope='row'>&nbsp;</td></tr>
							      			<tr><th scope='row'>3</th><td scope='row'>&nbsp;</td><td scope='row'>&nbsp;</td></tr>
							      			<tr><th scope='row'>4</th><td scope='row'>&nbsp;</td><td scope='row'>&nbsp;</td></tr>
							      			<tr><th scope='row'>5</th><td scope='row'>&nbsp;</td><td scope='row'>&nbsp;</td></tr>
							      			<tr><th scope='row'>6</th><td scope='row'>&nbsp;</td><td scope='row'>&nbsp;</td></tr>
							      			<tr><th scope='row'>7</th><td scope='row'>&nbsp;</td><td scope='row'>&nbsp;</td></tr>
							      			<tr><th scope='row'>8</th><td scope='row'>&nbsp;</td><td scope='row'>&nbsp;</td></tr>
							      			<tr><th scope='row'>9</th><td scope='row'>&nbsp;</td><td scope='row'>&nbsp;</td></tr>
							      			<tr><th scope='row'>&nbsp;</th><td scope='row'>&nbsp;</td><td scope='row'>&nbsp;</td></tr>
							      		</tbody>
							      	</table>
							      </div>
							    </div>
							  </div>
							  <div class="accordion-item">
							    <h2 class="accordion-header">
							      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
							        away
							      </button>
							    </h2>
							    <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
							      <div class="accordion-body" id="awayLineup">
							      	<table class='table table-bordered '>
							      		<thead> <tr> <th colspan='3'> lineup </th> </tr> </thead>
							      		<tbody> 
							      			<tr><th scope='row'>1</th><td scope='row'>&nbsp;</td><td scope='row'>&nbsp;</td></tr>
							      			<tr><th scope='row'>2</th><td scope='row'>&nbsp;</td><td scope='row'>&nbsp;</td></tr>
							      			<tr><th scope='row'>3</th><td scope='row'>&nbsp;</td><td scope='row'>&nbsp;</td></tr>
							      			<tr><th scope='row'>4</th><td scope='row'>&nbsp;</td><td scope='row'>&nbsp;</td></tr>
							      			<tr><th scope='row'>5</th><td scope='row'>&nbsp;</td><td scope='row'>&nbsp;</td></tr>
							      			<tr><th scope='row'>6</th><td scope='row'>&nbsp;</td><td scope='row'>&nbsp;</td></tr>
							      			<tr><th scope='row'>7</th><td scope='row'>&nbsp;</td><td scope='row'>&nbsp;</td></tr>
							      			<tr><th scope='row'>8</th><td scope='row'>&nbsp;</td><td scope='row'>&nbsp;</td></tr>
							      			<tr><th scope='row'>9</th><td scope='row'>&nbsp;</td><td scope='row'>&nbsp;</td></tr>
							      			<tr><th scope='row'>&nbsp;</th><td scope='row'>&nbsp;</td><td scope='row'>&nbsp;</td></tr>
							      		</tbody>
							      	</table>
							      </div>
							    </div>
							  </div>
							</div>
							
							
						</div>
						<!-- /라인업 -->
						
						<!-- score board -->
						<div class="m-0 col-xl-9">
							<p id="gamedata2" style="margin:0; padding:0; font-size:0.9rem;">
									<strong>gameTime:</strong> &nbsp;&nbsp; 
									<strong>stadium :</strong> &nbsp;&nbsp; 
									<strong>winner :</strong> &nbsp;
								</p>
							<div class="row" style="overflow:auto; padding:0.8rem;">
								
								<table class="table table-bordered">
									<thead >
									
										<tr>
											<th colspan="17" style="font-size:1.2rem;">score board</th>
										</tr>
										
										<tr id="gamedata1" valign=middle>
											<th colspan="6">away</th>
											<th colspan="2">-</th>
											<td>vs</td>
											<th colspan="2">-</th>
											<th colspan="6">home</th>
										</tr>
										
										<tr>
											<th>Team</th>
											<th>1</th><th>2</th><th>3</th><th>4</th><th>5</th><th>6</th>
											<th>7</th><th>8</th><th>9</th><th>10</th><th>11</th><th>12</th>
											<th>R</th><th>H</th><th>E</th><th>B</th>
										</tr>
									</thead>
									<tbody id="scoreBoard">
										<tr>
											<th scope="row">&nbsp;</th>
											<td></td><td></td><td></td><td></td><td></td><td></td>
											<td></td><td></td><td></td><td></td><td></td><td></td>
											<td></td><td></td><td></td><td></td>
										</tr>
										<tr>
											<th scope="row">&nbsp;</th>
											<td></td><td></td><td></td><td></td><td></td><td></td>
											<td></td><td></td><td></td><td></td><td></td><td></td>
											<td></td><td></td><td></td><td></td>
										</tr>
									</tbody>
								</table>
								
							</div>
							
							<div style="overflow:auto; height:20rem; ">
								<textarea class="form-control" name="diaryContent" 
		                    			style="height:100%; width:100%; resize: none;"></textarea>
							</div>
							
	                	</div>
	                	
					</div>

	                <!-- Submit Button-->
	                <button class="btn btn-outline-success row" type="submit" style="margin-bottom:1rem;">등록</button>
	            </form>
                        
            </div>
        </main>
		
		</div>
		
		</div>
	</div>

	<!-- /게시판 목록 -->
    <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	
	<script>
	
		$(document).ready(function(){
				$("#gameList").change(function(){
					fn_ajax('homeLineup', $(this).val());
					fn_ajax('awayLineup', $(this).val());
					fn_gameScore($(this).val());
				});
				
		});
		function fn_ajax(url, code){
			$.ajax({
				 url : '<c:url value="/api/'+url+'" />'
				,type: 'GET'
				,data:{"code":code}
				,contentType: 'application/json'
				,dataType: "json"
				,success:function(res){
					console.log(res);
					$("#" +url ).empty();
					let str="";
					str += "<table class='table table-bordered '>";
					str += "<thead> <tr> <th colspan='3'> lineup </th> </tr> </thead>";
					str += "<tbody>";
					for(let i=1; i<10; i++){
						let player = res[i];
						str += "<tr>";
						str += "<th scope='row'>" + player.batorder + "</th>";
						str += "<td scope='row'>" + player.playerName + "</td>";
						str += "<td scope='row'>" + player.positionName + "</td>";
						str += "</tr>";
					}
					str += "<tr>";
					str += "<th scope='row'>"+"</th>";
					str += "<td scope='row'>" + res[0].playerName + "</td>";
					str += "<td scope='row'>" + res[0].positionName + "</td>";
					str += "</tr>";
					
					str += "</tbody>";
					str += "</table>";
					$("#" +url ).append(str);
					
				},error:function(e){
					console.log(e);
					$("#" +url ).empty();
					let str="";
					str += "<table class='table table-bordered '>";
					str += "<thead> <tr> <th colspan='3'> 경기가 없습니다! </th> </tr> </thead>";
					str += "</table>";
					$("#" +url ).append(str);
				},complete:function(data){
				}
			});
			
		}
		
		function fn_gameScore(code){
			console.log(code);
			
			$.ajax({
				 url : '<c:url value="/api/scoreBoard" />'
				,type: 'GET'
				,data:{"code":code}
				,contentType: 'application/json'
				,dataType: "json"
				,success:function(res){
					$("#scoreBoard").empty();
					console.log(res);
					let str="";
					
					str += "<tr>";
					str += "<th scope='row'>";
					str += res[0].awayTeamName;
					str += "</th>";
					for(let i=0; i<12; i++){
						if(i<res[0].awayTeamScoreByInning.length){
							str += "<td>" + res[0].awayTeamScoreByInning[i] + "</td>";
						}else{
							str += "<td> - </td>";
						}
					}
					for(let i=0; i<res[0].awayTeamRheb.length; i++){
						if(i==0){
							str += "<th>" + res[0].awayTeamRheb[i] + "</th>";
						}else{
							str += "<td>" + res[0].awayTeamRheb[i] + "</td>";
						}
					}
					
					str += "</tr>";
					
					str += "<tr>";
					str += "<th scope='row'>";
					str += res[0].homeTeamName;
					str += "</th>";
					for(let i=0; i<12; i++){
						if(i<res[0].homeTeamScoreByInning.length){
							str += "<td>" + res[0].homeTeamScoreByInning[i] + "</td>";
						}else{
							str += "<td> - </td>";
						}
					}
					for(let i=0; i<res[0].homeTeamRheb.length; i++){
						if(i==0){
							str += "<th>" + res[0].homeTeamRheb[i] + "</th>";
						}else{
							str += "<td>" + res[0].homeTeamRheb[i] + "</td>";
						}
					}
					
					str += "</tr>";

					$("#scoreBoard").append(str);
					
					$("#gamedata1").empty();
					str2 = "";
					str2 += "<th colspan='6'>";
					str2 += "<img src='assets/img/" + res[0].awayTeamCode + ".png' width='50rem'>"+'&nbsp;'+res[0].awayTeamFullName+"</th>";
					str2 += "<th colspan='2' style='font-size:2rem;'>"+res[0].awayTeamRheb[0]+"</th>";
					str2 += "<td>vs</td>";
					str2 += "<th colspan='2' style='font-size:2rem;'>"+res[0].homeTeamRheb[0]+"</th>";
					str2 += "<th colspan='6'>";
					str2 += "<img src='assets/img/" + res[0].homeTeamCode + ".png' width='50rem'>"+'&nbsp;'+res[0].homeTeamFullName+"</th>";
					$("#gamedata1").append(str2);
					
					$("#gamedata2").empty();
					str3 = "";
					str3 += '<strong>gameTime : </strong>'+ res[0].gameDateTime.substr(0,16).replace("T", '&nbsp;') +'&nbsp;&nbsp;&nbsp;';
					str3 += '<strong>stadium : </strong>'+ res[0].stadium + '&nbsp;&nbsp;';
					str3 += '<strong>winner : </strong>' +res[0].winner ;
					$("#gamedata2").append(str3);
					
					
				},error:function(e){
					console.log(e);
				}
			});
		}
		
		function fn_gameDay(obj){
			console.log(obj.value);
			
			$.ajax({
				 url : '<c:url value="/api/gameDay" />'
				,type: 'GET'
				,data:{"gameDay":obj.value}
				,contentType: 'application/json'
				,dataType: "json"
				,success:function(res){
					console.log(res);
					$("#gameList").empty();
					let gameList = res.gameList;
					let str = "";
					
					str +=  "<option value='none'>"+'경기를 선택해주세요'+"</option>";
					
					for (let i=0; i<gameList.length; i++) {
						let game = gameList[i];
						
						str +=  "<option value='" + game.code + "'>";
						str += game.awayTeam + ' vs ' + game.homeTeam + ' ' + game.gameDay.substr(11, 5) + ' ' + game.gameNote;
						str += "</option>";
			        	
					}
					$("#gameList").append(str);
					
				},error:function(e){
					console.log(e);
				}
			});
		}
		
		
		
	
	</script>

</body>

</html>
