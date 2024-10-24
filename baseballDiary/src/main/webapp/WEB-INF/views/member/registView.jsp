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

<body>
    <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
    <!-- Page Header-->
        <header class="masthead" style="background-image: url('assets/img/baseball6.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h1>Regist</h1>
                            <span class="subheading"></span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    <!-- 회원가입 -->
    <!-- Modal -->
		<div class="modal fade" id="messageModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">${messageVO.title}</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
	              <!-- title input-->
	              <div class="mb-3">
	                  <label for="title">${messageVO.message}</label>
	              </div>
	              
		      </div>
		      <div class="modal-footer">
		      	<a href="<c:url value='${messageVO.url }' />" >
		      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		      	</a>
		      </div>
		    </div>
		  </div>
		</div>

	<!-- Contact Section Form-->
	<div class="container text-center" style="margin-bottom: 2rem;">
		<div class="border d-flex justify-content-center" style="padding:2rem;">
		
		<div class="container text-center row align-items-center"> 
			<form:form modelAttribute="member" action="/registDo" method="post">
				<!-- id input -->
				<div class="row g-3 align-items-center" style="justify-content: center;">
					<div class="col-sm-3">
						<label for="id" class="col-form-label">아이디</label>
					</div>
					<div class="col-sm-6">
						<form:input path="memId" type="text" id="id" name="memId" class="form-control" placeholder="아이디를 입력하세요"/>
						<form:errors class="err" path="memId" />
					</div>
					
					
				</div>
				<!-- password input -->
				<div class="row g-3 align-items-center" style="justify-content: center;">
					<div class="col-sm-3">
						<label for="pw" class="col-form-label">비밀번호</label>
					</div>
					<div class="col-sm-6">
						<form:input path="memPw" type="password" id="pw" name="memPw" class="form-control"
							aria-describedby="passwordHelpInline" placeholder="비밀번호를 입력하세요"/>
						<form:errors class="err" path="memPw" />
					</div>
					
				</div>
				
				<!-- 
				<div class="row g-3 align-items-center" style="justify-content: center;">
					<div class="col-sm-3">
						<label for="pw" class="col-form-label">비밀번호 확인</label>
					</div>
					<div class="col-sm-6">
						<input type="password" id="pw2" name="memPw2" class="form-control"
							aria-describedby="passwordHelpInline" placeholder="비밀번호를 다시 입력하세요"/>
					</div>
				</div>
				 -->

				<!-- name input -->
				<div class="row g-3 align-items-center" style="justify-content: center;">
					<div class="col-sm-3">
						<label for="nm" class="col-form-label">닉네임</label>
					</div>
					<div class="col-sm-6">
						<form:input path="memNm" type="text" id="nm" name="memNm" class="form-control" placeholder="닉네임을 입력하세요"/>
						<form:errors class="err" path="memNm" />
					</div>
				</div>
				
				<!-- team  -->
				<div class="row g-3 align-items-center" style="justify-content: center;">
					<div class="col-sm-3">
						<label for="kboTeam" class="col-form-label">응원팀</label>
					</div>
					<div class="col-sm-6">
						<select class="form-select" id="kboTeam" name="kboTeam">
                        <option selected disabled value="">응원팀을 선택하세요</option>
                        <option value="ALL">응원팀 없음</option>
                        <option value="LG">LG 트윈스</option>
                        <option value="KT">KT 위즈</option>
                        <option value="SK">SSG 랜더스</option>
                        <option value="NC">NC 다이노스</option>
                        <option value="OB">두산 베어스</option>
                        <option value="HT">KIA 타이거즈</option>
                        <option value="LT">롯데 자이언츠</option>
                        <option value="SS">삼성 라이온즈</option>
                        <option value="HH">한화 이글스</option>
                        <option value="WO">키움 히어로즈</option>
                    </select>
					</div>
				</div>
				
				<!-- Submit Button -->
				<button class="btn btn-outline-success" id="submitButton" style="margin-top:2rem;"
					type="submit">가입하기</button>
			</form:form>
		</div>
		
		</div>
	</div>

	<!-- /회원가입 -->
    <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	
	<script>
		$(document).ready(function(){
				var message = "${messageVO.message}";
				if(message != ''){
					$("#messageModal").modal('show');
				}
		})
	</script>
	

</body>
</html>
