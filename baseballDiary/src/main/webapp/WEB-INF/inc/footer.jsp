<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.icons {
    font-size: 0;
}

.icon {
    display: inline-block;
    background-size: cover;
    background-position: center;
    width: 40px;
    height: 40px;
    margin: 0 4px;
    background-repeat: no-repeat;
}

#mcea {
	 width: 163px;
     height: 40px;
	 background-image: url('assets/img/mcea2.png');
}

#github {
 	 background-image: url('assets/img/github.png');
}

#insta {
	 background-image: url('assets/img/insta.png');
}

</style>

<!-- Footer-->
        <footer class="border-top">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <ul class="list-inline text-center icons">
                            <li class="list-inline-item" style="margin-right:2rem;">
                                <a href="https://mcea.co.kr/">
                                    <div id="mcea" class="icon"></div>
                                </a>
                            </li>
                            <li class="list-inline-item" style="margin-right:2rem;">
                                <a href="https://github.com/thgmldl0115">
                                    <div id="github" class="icon"></div>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <div id="insta" class="icon" onclick="alert('와서 물어보시면 아이디 드릴게요^^')"></div>
                            </li>
                        </ul>
                        <div class="small text-center text-muted fst-italic" style="margin-top:1rem;">[계룡건설 7기] 이소희  개인프로젝트 1차</div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>