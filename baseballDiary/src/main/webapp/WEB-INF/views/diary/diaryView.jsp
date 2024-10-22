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
	div .row{
		margin-bottom:0.5rem;
	}

</style>

<title>Baseball Diary</title>
</head>

<body style="font-size:1rem;">
    <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
    <!-- Page Header-->
        <header class="masthead" style="background-image: url('assets/img/baseball3.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h1>Diary List</h1>
                            <span class="subheading"></span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    	
	<!-- Contact Section Form-->
	<div class="container text-center" style="margin-bottom: 2rem;">
		<div class="border d-flex justify-content-center" style="padding:2rem;">
		
		<div class="container text-center row align-items-center"> 
			<table class="table table-hover">
				<thead>
					<tr>
						<th>경기일</th>
						<th>제목</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
				<!-- 데이터의 수만큼 반복되는 부분 -->
					<c:forEach items="${diaryList }" var="diary">
					<tr>
						<td><a href="<c:url value="/getDiary?diaryNo=${diary.diaryNo }"/> ">${diary.gameDay }</a></td>
						<td><a href="<c:url value="/getDiary?diaryNo=${diary.diaryNo }"/> ">${diary.diaryTitle }</a></td>
						
						<td>${diary.createDt }</td>
					</tr>
					</c:forEach>
				</tbody>
			
			</table>
			
			<a href="<c:url value="/diaryWriteView" /> ">
    			<button type="button" class="btn btn-outline-success">일기쓰기</button>
    		</a>
			
		</div>
		
		</div>
	</div>

	<!-- /게시판 목록 -->
    <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	
	

</body>
</html>
