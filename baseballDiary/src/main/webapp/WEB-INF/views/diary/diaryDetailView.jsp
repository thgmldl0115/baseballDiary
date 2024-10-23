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
                            <h1>Diary View</h1>
                            <span class="subheading"></span>
                        </div>
                    </div>
                </div>
            </div>
        </header>

	<!-- Contact Section Form-->
	<div class="container text-center" style="margin-bottom: 2rem;">
		<div align="right" style="padding-right:1.5rem; padding-bottom:0.5rem;">
			<button class="btn btn-outline-secondary btn-sm row" id="captureBtn" 
				style="position: static; right: 50rem;">이미지로 저장하기</button>
		</div>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
	    <script>
	        document.getElementById('captureBtn').addEventListener('click', function() {
	            html2canvas(document.body).then(canvas => {
	                // 이미지 다운로드 링크 생성
	                let link = document.createElement('a');
	                link.href = canvas.toDataURL('image/png');
	                link.download = 'screenshot.png';
	                link.click();
	            });
	        });
	    </script>
		<div class="border d-flex justify-content-center">
		
		<div class="p-0 container text-center row align-items-center"> 
		<!-- Main Content-->
        <main class="mb-4">
            <div class="container px-3 px-lg-4" >
                
	            	<!-- title input -->
	            	
	            	<div class="row p-0 g-3 gx-3 align-items-center" style="margin-top:1rem; margin-bottom:0;">
	            	
	            		<div class="p-0 m-0 col-xl-6">
	            			<table id="game" class="m-0 table table-bordered">
	            				<tr>
	            					<th><input type="date" name="gameDay" id="gameday" class="col-form-label" value="${diary.gameDay}"
									style="width:100%; border: 0;" readonly/></th>
									<td id="gameList" valign=middle></td>
	            				</tr>
	            			</table>
	            		</div>
	            		
	            		<div class="p-0 m-0 col-xl-6" >
	            			<table class="m-0 table table-bordered">
	            				<tr>
	            					<td><label for="diaryTitle" class="col-form-label">제목</label></td>
									<td>
										<input type="text" id="diaryTitle" name="diaryTitle" value="${diary.diaryTitle}"
											class="form-control" style="width:100%; border: 0;" readonly/>
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
							      </div>
							    </div>
							  </div>
							</div>
						</div>
						<!-- /라인업 -->
						
						<div class="m-0 col-xl-9">
							<p id="gamedata2" style="margin:0; padding:0; font-size:0.9rem;"></p>
							<!-- score board -->
							<div class="row" style="overflow:auto; padding:0.8rem;">
								<table class="table table-bordered">
									<thead >
									
										<tr>
											<th colspan="17" style="font-size:1.2rem;">score board</th>
										</tr>
										
										<tr id="gamedata1" valign=middle>
										</tr>
										
										<tr>
											<th>Team</th>
											<th>1</th><th>2</th><th>3</th><th>4</th><th>5</th><th>6</th>
											<th>7</th><th>8</th><th>9</th><th>10</th><th>11</th><th>12</th>
											<th>R</th><th>H</th><th>E</th><th>B</th>
										</tr>
									</thead>
									<tbody id="scoreBoard">
									</tbody>
								</table>
							</div>
							<!-- /score board -->
							
							<div style="overflow:auto; height:20rem; ">
								<textarea class="form-control" name="diaryContent"
		                    			style="height:100%; width:100%; resize: none;" readonly>${diary.diaryContent}</textarea>
							</div>
							
	                	</div>
	                	
					</div>
					
					<c:if test="${sessionScope.login.memId == diary.memId }">
						<div class="d-flex justify-content-center">
		                	<!-- Submit Button-->
		                	<form action="<c:url value="/diaryEditView"/>" method="post">
		                		<input type="hidden" name="diaryNo" value="${diary.diaryNo }">
		                		<button class="btn btn-outline-success row" type="submit" style="margin-bottom:1rem; margin-right:2rem;">수정</button>
		                	</form>
		                	<form action="/diaryDelDo" method="post" id="delForm">
		                		<input type="hidden" name="diaryNo" value="${diary.diaryNo }">
		                		<button class="btn btn-outline-dark row" type="button" 
		                			style="margin-bottom:1rem;" onclick="f_diaryDel()">삭제</button>
		            		</form>
	            		</div>
	            	</c:if>
                        
            </div>
        </main>
		
		</div>
		
		</div>
	</div>

    <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	
	<script>
		function f_diaryDel(){
			if(confirm("정말로 삭제하시겠습니까?")){
				document.getElementById("delForm").submit();
			}
		}
	
		$(document).ready(function(){

				// 화면왔을때 
				fn_ajax('homeLineup','${diary.code}');
				fn_ajax('awayLineup','${diary.code}');
				fn_gameScore('${diary.code}');
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
					
					$("#gameList").empty();
					str4 = res[0].awayTeamName + ' vs ' + res[0].homeTeamName + ' ' + res[0].gameDateTime.substr(11,5);
					$("#gameList").append(str4);
					
					
				},error:function(e){
					console.log(e);
				}
			});
		}
		

		
		
	
	</script>

</body>

</html>
