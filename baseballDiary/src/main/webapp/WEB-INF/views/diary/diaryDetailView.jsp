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
	.row{
		margin-bottom:0.5rem;
	}
	div .line{
		outline: 1px solid black;
		
	}
	
</style>

<title>Baseball Diary</title>
</head>

<body>
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
	<div class="container text-center d-flex justify-content-center" style="margin-bottom: 2rem; padding:2rem;">
		
		<div class="container text-center row align-items-center"> 
		<!-- Main Content-->
        <main class="mb-4">
            <div class="border container px-4 px-lg-5">
                
	            	<!-- title input -->
	            	
	                <div class="row g-3 gx-5 align-items-center" style="margin:0rem;">
	                	<table id="game" class="table table-bordered">
							<thead>
								<tr>
									<th><label for="gameday" class="col-form-label">24.09.30</label></th>
									<th><label for="gamespace" class="col-form-label">광주</label></th>
									<td><label for="diaryTitle" class="col-form-label">제목</label></td>
									<td>
										<h6 id="diaryTitle">${diary.diaryTitle }</h6>
									</td>
								</tr>
							</thead>
						</table>
					</div>

	                
	                <div class="row g-3 align-items-center">
	                	<!-- 라인업 -->
	                	<div class="col-lg-3">
	                		
							<table id="lineup" class="table table-bordered ">
								<thead>
									<tr>
										<th colspan="3">lineup</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">1</th>
										<td>박찬호</td>
										<td>SS</td>
									</tr>
									<tr>
										<th scope="row">2</th>
										<td>소크라테스</td>
										<td>LF</td>
									</tr>
									<tr>
										<th scope="row">3</th>
										<td>김도영</td>
										<td>3B</td>
									</tr>
									<tr>
										<th scope="row">4</th>
										<td>최형우</td>
										<td>DH</td>
									</tr>
									<tr>
										<th scope="row">5</th>
										<td>나성범</td>
										<td>RF</td>
									</tr>
									<tr>
										<th scope="row">6</th>
										<td>김선빈</td>
										<td>2B</td>
									</tr>
									<tr>
										<th scope="row">7</th>
										<td>이우성</td>
										<td>1B</td>
									</tr>
									<tr>
										<th scope="row">8</th>
										<td>김태군</td>
										<td>C</td>
									</tr>
									<tr>
										<th scope="row">9</th>
										<td>최원준</td>
										<td>CF</td>
									</tr>
									<tr>
										<th scope="row"></th>
										<td>양현종</td>
										<td>P</td>
									</tr>
									
								</tbody>
							
							</table>
							
						</div>
						<!-- /라인업 -->
						
						<!-- score board -->
						<div class="col-lg-9" style="margin:0;">
						
							<div class="row" style="overflow:auto;">
								<table id="diarycontent" class="table table-bordered" >
									<thead >
										<tr>
											<th colspan="17">score board</th>
										</tr>
										<tr>
											<th>Team</th>
											<th>1</th>
											<th>2</th>
											<th>3</th>
											<th>4</th>
											<th>5</th>
											<th>6</th>
											<th>7</th>
											<th>8</th>
											<th>9</th>
											<th>10</th>
											<th>11</th>
											<th>12</th>
											<th>R</th>
											<th>H</th>
											<th>E</th>
											<th>B</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">NC</th>
											<td>2</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>1</td>
											<td>0</td>
											<td>2</td>
											<td>0</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>5</td>
											<td>11</td>
											<td>3</td>
											<td>4</td>
										</tr>
										<tr>
											<th scope="row">KIA</th>
											<td>0</td>
											<td>5</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>3</td>
											<td>0</td>
											<td>2</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>10</td>
											<td>15</td>
											<td>1</td>
											<td>6</td>
										</tr>
									</tbody>
								</table>
							</div>
							
							<div style="overflow:auto; height:18.5rem;">
								<textarea class="form-control" name="diaryContent" 
		                    			style="height:100%; width:100%; resize: none;">${diary.diaryContent }</textarea>
							</div>
							
	                	</div>
	                	
					</div>

	                <!-- Submit Button-->
	                <button class="btn btn-outline-success row" type="submit">수정</button>
                        
            </div>
        </main>
		
		</div>
	</div>

	<!-- /게시판 목록 -->
    <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	
	

</body>
</html>
