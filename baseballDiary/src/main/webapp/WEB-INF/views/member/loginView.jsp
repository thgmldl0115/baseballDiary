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
	span {
		font-size:0.8rem;
	}
	
</style>

<title>Baseball Diary</title>
</head>

<body>
    <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
    <!-- Page Header-->
        <header class="masthead" style="background-image: url('assets/img/baseball4.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h1>로그인</h1>
                            <span class="subheading"></span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    <!-- 회원가입 -->

	<!-- Contact Section Form-->
	<div class="container text-center" style="margin-bottom: 2rem;">
		<div class="border d-flex justify-content-center" style="padding:2rem;">
		
		<div class="container text-center row align-items-center"> 
			<form action="/loginDo" method="post">
				<!-- id input -->
				<div class="row g-3 align-items-center">
					<div class="col-sm-3">
						<label for="id" class="col-form-label">아이디</label>
					</div>
					<div class="col-sm-6">
						<input type="text" id="id" name="memId" class="form-control" 
							placeholder="아이디를 입력하세요" value="${cookie.rememberId.value }"/>
					</div>
				</div>
				<!-- password input -->
				<div class="row g-3 align-items-center">
					<div class="col-sm-3">
						<label for="pw" class="col-form-label">비밀번호</label>
					</div>
					<div class="col-sm-6">
						<input type="password" id="pw" name="memPw" class="form-control"
							aria-describedby="passwordHelpInline" placeholder="비밀번호를 입력하세요"/>
					</div>
					<!-- 
					<div class="col-sm-3">
						<span id="pw" class="form-text" style="font-size: 0.8rem;">
							조건 : 4~10자리 </span>
					</div>
					 -->
				</div>
				
				<div class="row d-flex justify-content-center">
                    		<span><input ${cookie.rememberId.value ==null ? "" : "checked" } type="checkbox" 
                    		class="form-check-input" name="remember"/> 아이디 기억하기 </span>
                </div>
				
				<!-- Submit Button -->
				<button class="btn btn-outline-success" id="submitButton"
					type="submit">로그인</button>
			</form>
		</div>
		
		</div>
	</div>

	<!-- /회원가입 -->
    <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	
	

</body>
</html>
