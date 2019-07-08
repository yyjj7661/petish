<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Mypage</title>
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
<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<style>
tr {
	height: 0.7cm;
	border: 1px solid #ddd;
}

#viewMore1, #viewMore2, #viewMore3 {
	margin-left: 1cm;
}

.nondeco {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: lighter;
	color: black;
}

.font-grey {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: lighter;
}
/* 여기부터 예지꺼 */
.top-bar {
	background: #38a7bb;
}

.form-group {
	width: 450px;
}

#email-login {
	width: 365px;
}

#name-login {
	width: 365px;
}

#adress1-login {
	width: 305px;
}

#jumin1, #jumin2 {
	width: 215px;
}

#logo {
	width: 170px;
}

li {
	list-style: none;
}

/* 드랍다운 메뉴 글씨 크기*/
.nav-link {
	font-size: 0.9rem;
}
</style>

<body>
	<div id="all">
	
		<%@ include file="/WEB-INF/views/commons/top.jspf" %>

		<div id="heading-breadcrumbs">
			<div class="container">
				<div class="row d-flex align-items-center flex-wrap">
					<div class="col-md-7">
						<h1 class="h2">My Page</h1>
					</div>
					<div class="col-md-5">
						<ul class="breadcrumb d-flex justify-content-end">
							<li class="breadcrumb-item"><a href="index.html">Home</a></li>
							<li class="breadcrumb-item active">My Page</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<br>

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
										"
										class="nav-link">쪽지함</a></li>
									<li class="nav-item"><a href="/mypage/question/list"
										class="nav-link">문의하기</a></li>
								</ul>
							</div>
						</div>
					</div>

					<div style="overflow-x: auto;padding-left:15px;padding-right:15px" class="contents">
						<h5>
							내가 쓴 글
							<div class="text-right">
								<button id="viewMore1" class="btn btn-outline-primary">더보기</button>
							</div>
						</h5>
						<div>
							<table class="table">
								<tr align="center" class="font-grey">
									<th>게시판명</th>
									<th>제목</th>
									<th>작성일자</th>
									<th>조회수</th>
								</tr>
								<tr>
									<th class="font-grey"><center>자유게시판</center></th>
									<th><a href="" class="nondeco">땡이 입양해왔어요~</a></th>
									<th class="font-grey"><center>06.05.23</center></th>
									<th class="font-grey"><center>100</center></th>
								</tr>
								<tr>
									<th class="font-grey"><center>모임게시판</center></th>
									<th><a href="" class="nondeco">서울숲 산책하실분</a></th>
									<th class="font-grey">
										<center>15.10.21</center>
									</th>
									<th class="font-grey"><center>40</center></th>
								</tr>
								<tr>
									<th class="font-grey"><center>모임게시판</center></th>
									<th><a href="" class="nondeco">땡이 13번째 생일이에요^_^</a></th>
									<th class="font-grey"><center>19.03.10</center></th>
									<th class="font-grey"><center>23</center></th>
								</tr>
							</table>
						</div>
						<br> <br>
						<h5>
							내가 쓴 댓글
							<div class="text-right">
								<button id="viewMore2" class="btn btn-outline-primary">더보기</button>
							</div>
						</h5>
						<div>
							<table class="table">
								<tr align="center" class="font-grey">
									<th>게시판명</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일자</th>
									<th>조회수</th>
								</tr>
								<tr>
									<th class="font-grey"><center>자유게시판</center></th>
									<th><a href="" class="nondeco">강아지가 초콜릿 먹었는데 괜찮을까요?</a></th>
									<th><center>
											<a href="" class="nondeco">뿌꾸맘</a>
										</center></th>
									<th class="font-grey"><center>10.06.18</center></th>
									<th class="font-grey"><center>30</center></th>
								</tr>
								<tr class="font-grey">
									<th class="font-grey"><center>모임게시판</center></th>
									<th><a href="" class="nondeco">한강에서 산책하실 분</a></th>
									<th><center>
											<a href="" class="nondeco">우리아지체고</a>
										</center></th>
									<th class="font-grey"><center>17.07.09</center></th>
									<th class="font-grey"><center>80</center></th>
								</tr>
								<tr class="font-grey">
									<th class="font-grey"><center>모임게시판</center></th>
									<th><a href="" class="nondeco">땡이 13번째 생일이에요^_^</a></th>
									<th><center>
											<a href="memberDetail.html" class="nondeco">땡이누나
												</p>
										</center></th>
									<th class="font-grey"><center>19.03.10</center></th>
									<th class="font-grey"><center>23</center></th>
								</tr>
							</table>
						</div>
						<br> <br>
						<h5>
							내가 좋아요 한 글
							<div class="text-right">
								<button id="viewMore3" class="btn btn-outline-primary">더보기</button>
							</div>
						</h5>
						<div>
							<table class="table">
								<tr align="center" class="font-grey">
									<th>게시판명</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일자</th>
									<th>조회수</th>
								</tr>
								<tr class="font-grey">
									<th class="font-grey"><center>자유게시판</center></th>
									<th><a href="" class="nondeco">강아지가 초콜릿 먹었는데 괜찮을까요?</th>
									<th><center>
											<a href="" class="nondeco">뿌꾸맘</a>
										</center></th>
									<th class="font-grey"><center>10.06.18</center></th>
									<th class="font-grey"><center>30</center></th>
								</tr>
								<tr class="font-grey">
									<th class="font-grey"><center>모임게시판</center></th>
									<th><a href="" class="nondeco">한강에서 산책하실 분</th>
									<th><center>
											<a href="" class="nondeco">우리아지체고</a>
										</center></th>
									<th class="font-grey"><center>17.07.09</center></th>
									<th class="font-grey"><center>80</center></th>
								</tr>
								<tr class="font-grey">
									<th class="font-grey"><center>모임게시판</center></th>
									<th><a href="" class="nondeco">땡이 13번째 생일이에요^_^</th>
									<th><center>
											<a href="" class="nondeco">땡이누나</a>
										</center></th>
									<th class="font-grey"><center>19.03.10</center></th>
									<th class="font-grey"><center>23</center></th>
								</tr>
							</table>
						</div>
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