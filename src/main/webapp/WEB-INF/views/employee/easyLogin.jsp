<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>ModernHome</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

	<!-- Favicon -->
    <link rel="icon" href="/resources/img/faviconn.svg" type="image/x-icon">
    
    <!-- Font -->
    <link rel="stylesheet" as="style" crossorigin 
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css" />
    
    <style type="text/css">
        * {
            font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
        }
    </style>
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/resources/css/style.css" rel="stylesheet">
    
    
</head>
<body>
	<div class="container-xxl position-relative bg-white d-flex p-0">

        <!-- Sign In Start -->
        <div class="container-fluid">
            <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                    <div class="bg-light rounded p-4 p-sm-5 my-4 mx-3">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <a href="/" class="">
                                <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>ModernHome</h3>
                            </a>
                        </div>
<!-- 				        <form role="form" method="post"> -->
<!-- 	                        <div class="form-floating mb-3"> -->
<!-- 	                            <input name="emp_id" type="text" class="form-control" id="floatingInput" placeholder="사원번호"> -->
<!-- 	                            <label for="floatingInput">사원번호</label> -->
<!-- 	                        </div> -->
<!-- 	                        <div class="form-floating mb-4"> -->
<!-- 	                            <input name="emp_pw" type="password" class="form-control" id="floatingPassword" placeholder="비밀번호"> -->
<!-- 	                            <label for="floatingPassword">비밀번호</label> -->
<!-- 	                        </div> -->
<!-- 	                        <div class="d-flex align-items-center justify-content-between mb-4"> -->
<!-- 	                            <div class="form-check"> -->
<!-- 	                                <input type="checkbox" class="form-check-input" id="exampleCheck1"> -->
<!-- 	                                <label class="form-check-label" for="exampleCheck1">Check me out</label> -->
<!-- 	                            </div> -->
<!-- 	                            <a href="">Forgot Password</a> -->
<!-- 	                        </div> -->
<!-- 	                        <input type="submit" class="btn btn-primary py-3 w-100 mb-4" value="Sign In"> -->
 	<!--                         <p class="text-center mb-0">Don't have an Account? <a href="">Sign Up</a></p> -->
<!-- 				        </form> -->
				        	<form action="authLogin">
		                        <input type="submit" class="btn btn-primary m-4" name="auth" value="인사팀장">
		                        <input type="submit" class="btn btn-primary m-4" name="auth" value="인사일반">
		                        <input type="submit" class="btn btn-primary m-4" name="auth" value="영업팀장">
		                        <input type="submit" class="btn btn-primary m-4" name="auth" value="영업일반">
		                        <input type="submit" class="btn btn-primary m-4" name="auth" value="생산팀장">
		                        <input type="submit" class="btn btn-primary m-4" name="auth" value="생산일반">
		                        <input type="submit" class="btn btn-primary m-4" name="auth" value="자재팀장">
		                        <input type="submit" class="btn btn-primary m-4" name="auth" value="자재일반">
		                        <input type="submit" class="btn btn-primary m-4" name="auth" value="품질팀장">
		                        <input type="submit" class="btn btn-primary m-4" name="auth" value="품질일반">
					        	<input type="submit" class="btn btn-primary m-4" name="auth" value="관리자">
	                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Sign In End -->
	</div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/lib/chart/chart.min.js"></script>
    <script src="/resources/lib/easing/easing.min.js"></script>
    <script src="/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/resources/lib/tempusdominus/js/moment.min.js"></script>
    <script src="/resources/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="/resources/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="/resources/js/main.js"></script>
</body>
</html>