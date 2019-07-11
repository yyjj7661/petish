<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>My page</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- Bootstrap CSS-->
<link rel="stylesheet" href="/resources/vendor/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet" href="/resources/vendor/font-awesome/css/font-awesome.min.css">
<!-- Google fonts - Roboto-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,700">
<!-- Bootstrap Select-->
<link rel="stylesheet" href="/resources/vendor/bootstrap-select/css/bootstrap-select.min.css">
<!-- owl carousel-->
<link rel="stylesheet" href="/resources/vendor/owl.carousel/assets/owl.carousel.css">
<link rel="stylesheet" href="/resources/vendor/owl.carousel/assets/owl.theme.default.css">
<!-- theme stylesheet-->
<link rel="stylesheet" href="/resources/css/style.lightblue.css" id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="/resources/css/custom.css">
<!-- Favicon and apple touch icons-->
<link rel="shortcut icon" href="/resources/img/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="/resources/img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="57x57" href="/resources/img/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="72x72" href="/resources/img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="/resources/img/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="/resources/img/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="/resources/img/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="/resources/img/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="/resources/img/apple-touch-icon-152x152.png">

<link rel="stylesheet" href="/resources/css/mypage.css">
<script src="/resources/js/mypage.js"></script>

</head>

<body>
	<div id="all">
		
		<%@ include file="/WEB-INF/views/commons/top.jspf" %>
		
		<div id="heading-breadcrumbs">
			<div class="container">
				<div class="row d-flex align-items-center flex-wrap">
					<div class="col-md-7">
						<h1 class="h2">My page</h1>
					</div>
					<div class="col-md-5">
						<ul class="breadcrumb d-flex justify-content-end">
							<li class="breadcrumb-item"><a href="index.html">Home</a></li>
							<li class="breadcrumb-item active">My page</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<!-- 테이블 -->
		<div id="content">
			<div class="container">
				<div class="row bar mb-0">
					<div class="col-lg-3 mt-4 mt-lg-0" padding-left="2cm">
						<!-- CUSTOMER MENU -->
						<div class="panel panel-default sidebar-menu">
							<div class="panel-heading">
								<h3 class="h4 panel-title">Customer section</h3>
							</div>
							<div class="panel-body">
								<ul class="nav nav-pills flex-column text-sm">
									<li class="nav-item"><a href="/mypage/modifyForm"
										class="nav-link">회원정보수정</a></li>
									<li class="nav-item"><a href="/mypage/message"
										class="nav-link">쪽지함</a></li>
									<li class="nav-item"><a href="/mypage/question/list"
										class="nav-link active">문의하기</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div style="overflow-x: auto;padding-left:15px;padding-right:15px" class="contents">
						<h3>
							문의 내역
							<div class="text-right">
								<button class="btn btn-outline-primary"
									onclick="location.href='/mypage/question/writeForm'">문의하기</button>
							</div>
						</h3>
							<table class="table">
								<tr align="center" class="font-grey">
									<th>문의사유</th>
									<th>문의제목</th>
									<th>답변상태</th>
									<th>작성일자</th>
								</tr>
								<tr>
									<th class="font-grey">[등업관련]</th>
									<th><a href="/mypage/question/detail" class="nondeco">아니 제가 5월에 등업관련 문의글을 남겼는데요</a></th>
									<th><span class="badge badge-danger">답변대기</span></th>
									<th class="font-grey">19.07.04</th>
								</tr>
								<tr>
									<th class="font-grey">[등업관련]</th>
									<th><a href="/mypage/question/detail" class="nondeco">정회원
											되려면 어떻게 해야하나요?</a></th>
									<th><span class="badge badge-danger">답변대기</span></th>
									<th class="font-grey">19.05.30</th>
								</tr>
								<tr>
									<th class="font-grey">[게시판 추가요청]</th>
									<th><a href="/mypage/question/detail" class="nondeco">참새 자유게시판 요청합니다.</a></th>
									<th><span class="badge badge-info">답변완료</span></th>
									<th class="font-grey">19.03.21</th>
								</tr>
								<tr>
									<th class="font-grey">[게시판 추가요청]</th>
									<th><a href="/mypage/question/detail" class="nondeco">도마뱀 자유게시판 요청합니다.</a></th>
									<th><span class="badge badge-info">답변완료</span></th>
									<th class="font-grey">19.01.05</th>
								</tr>
								
							</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Javascript files-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/popper.js/umd/popper.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/vendor/jquery.cookie/jquery.cookie.js"></script>
	<script src="/resources/vendor/waypoints/lib/jquery.waypoints.min.js"></script>
	<script src="/resources/vendor/jquery.counterup/jquery.counterup.min.js"></script>
	<script src="/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="/resources/vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.min.js"></script>
	<script src="/resources/js/jquery.parallax-1.1.3.js"></script>
	<script src="/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
	<script src="/resources/vendor/jquery.scrollto/jquery.scrollTo.min.js"></script>
	<script src="/resources/js/front.js"></script>
</body>
</html>