<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Baseball Diary</title>
        
    </head>
    <body>
    <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
        
        <!-- Page Header-->
        <header class="masthead" style="background-image: url('assets/img/baseball7.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h1>Baseball Diary</h1>
                            <span class="subheading">for V12</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Main Content-->
        <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <!-- Post preview-->
                    <div class="post-preview">
                        <a href="${pageContext.request.contextPath}/diaryView">
                            <h2 class="post-title">Diary List</h2>
                        </a>
                        <p class="post-meta">
                            	작성한 야구일기를 확인해보세요!
                        </p>
                    </div>
                    <!-- Divider-->
                    <hr class="my-4" />
                    <!-- Post preview-->
                    <div class="post-preview">
                        <a href="${pageContext.request.contextPath}/diaryWriteView"><h2 class="post-title">Diary Write</h2></a>
                        <p class="post-meta">
                            	야구일기를 작성해보세요!
                        </p>
                    </div>
                    
                    <!-- Divider-->
                    <hr class="my-4" />
                </div>
            </div>
        </div>
    <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
    </body>
</html>
