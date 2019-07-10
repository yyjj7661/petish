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
<link rel="stylesheet"
	href="/resources/vendor/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet"
	href="/resources/vendor/font-awesome/css/font-awesome.min.css">
<!-- Google fonts - Roboto-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,700">
<!-- Bootstrap Select-->
<link rel="stylesheet"
	href="/resources/vendor/bootstrap-select/css/bootstrap-select.min.css">
<!-- owl carousel-->
<link rel="stylesheet"
	href="/resources/vendor/owl.carousel/assets/owl.carousel.css">
<link rel="stylesheet"
	href="/resources/vendor/owl.carousel/assets/owl.theme.default.css">
<!-- theme stylesheet-->
<link rel="stylesheet" href="/resources/css/style.lightblue.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="/resources/css/custom.css">
<!-- Favicon and apple touch icons-->
<link rel="shortcut icon" href="/resources/img/favicon.ico"
	type="image/x-icon">
<link rel="apple-touch-icon" href="/resources/img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="57x57"
	href="/resources/img/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="/resources/img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="/resources/img/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="/resources/img/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="/resources/img/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="/resources/img/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="/resources/img/apple-touch-icon-152x152.png">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/resources/css/mypage.css">
<script src="/resources/js/mypage.js"></script>

</head>

<body>
	<div id="all">

		<%@ include file="/WEB-INF/views/commons/top.jspf"%>

		<!-- 테이블 -->
		<div id="content">
			<div class="container">
				<div id="checkout">
					<div style="max-width: 20cm; margin: auto;">
						<!-- <form method="get" action=""> -->

						<h3 style="margin-top: 10%;">My Page</h3>
						<div class="memberInfo">
							<div style="margin: 0.5cm;">
								<img class="profile" src="/resources/img/member_detail_img.jpg"
									style="margin-right: 30px;">
								<a>달봉파더(dalb****)</a> │ 준회원 │ <a href="" class="nondeco"><i
									class="fa fa-envelope" style="margin-right: 10px;"></i>쪽지 보내기</a>
							</div>
						</div>
						<ul id="pills-tab" role="tablist"
							class="nav nav-pills nav-justified" style="margin-top: 1cm;">
							<li class="nav-item"><a id="pills-profile-tab"
								data-toggle="pill" href="#message-receive" role="tab"
								aria-controls="pills-profile" aria-selected="false"
								class="nav-link active">내가 쓴 글</a></li>
							<li class="nav-item"><a id="pills-home-tab"
								data-toggle="pill" href="#message-send" role="tab"
								aria-controls="pills-home" aria-selected="true" class="nav-link">내가
									댓글 쓴 글</a></li>
							<li class="nav-item"><a id="pills-home-tab"
								data-toggle="pill" href="#message-send" role="tab"
								aria-controls="pills-home" aria-selected="true" class="nav-link">내가
									좋아요 한 글</a></li>
						</ul>
						<div id="pills-tabContent" class="tab-content">
							<div class="text-right">
								<button id="viewMore1" class="btn btn-sm btn-template-main"
									style="margin-bottom: 0.2cm;">더보기</button>
							</div>
							<div id="message-receive" role="tabpanel"
								aria-labelledby="pills-home-tab"
								class="tab-pane fade show active">
								<div class="row">
									<div class="col-md-12">
										<div class="tile">
											<div class="tile-body">
												<table class="table table-hover table-bordered"
													id="sampleTable">

													<!-- 받은 쪽지 -->
													<tr align="center" class="font-grey">
														<th>게시판명</th>
														<th>제목</th>
														<th>작성일자</th>
														<th>조회수</th>
													</tr>
													<tr>
														<th class="font-grey">자유게시판</th>
														<th><a href="" class="nondeco">땡이 입양해왔어요~</a></th>
														<th class="font-grey">06.05.23</th>
														<th class="font-grey">100</th>
													</tr>
													<tr>
														<th class="font-grey">모임게시판</th>
														<th><a href="" class="nondeco">서울숲 산책하실분</a></th>
														<th class="font-grey">15.10.21</th>
														<th class="font-grey">40</th>
													</tr>
													<tr>
														<th class="font-grey">모임게시판</th>
														<th><a href="" class="nondeco">땡이 13번째 생일이에요^_^</a></th>
														<th class="font-grey">19.03.10</th>
														<th class="font-grey">23</th>
													</tr>
													<tr>
														<th class="font-grey">모임게시판</th>
														<th><a href="" class="nondeco">땡이 13번째 생일이에요^_^</a></th>
														<th class="font-grey">19.03.10</th>
														<th class="font-grey">23</th>
													</tr>
													<tr>
														<th class="font-grey">모임게시판</th>
														<th><a href="" class="nondeco">땡이 13번째 생일이에요^_^</a></th>
														<th class="font-grey">19.03.10</th>
														<th class="font-grey">23</th>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div id="message-send" role="tabpanel"
								aria-labelledby="pills-profile-tab" class="tab-pane fade">
								<div class="row">
									<div class="col-md-12">
										<div class="tile">
											<div class="tile-body">
												<table class="table table-hover table-bordered"
													id="sampleTable">

													<tr align="center" class="font-grey">
														<th>게시판명</th>
														<th>제목</th>
														<th>작성자</th>
														<th>작성일자</th>
														<th>조회수</th>
													</tr>
													<tr>
														<th class="font-grey">자유게시판</th>
														<th><a href="" class="nondeco">강아지가 초콜릿 먹었는데
																괜찮을까요?</a></th>
														<th><a href="" class="nondeco">뿌꾸맘</a></th>
														<th class="font-grey">10.06.18</th>
														<th class="font-grey">30</th>
													</tr>
													<tr>
														<th class="font-grey">모임게시판</th>
														<th><a href="" class="nondeco">한강에서 산책하실 분</a></th>
														<th><a href="" class="nondeco">우리아지체고</a></th>
														<th class="font-grey">17.07.09</th>
														<th class="font-grey">80</th>
													</tr>
													<tr>
														<th class="font-grey">모임게시판</th>
														<th><a href="" class="nondeco">땡이 13번째 생일이에요^_^</a></th>
														<th><a href="/mypage/member/detail" class="nondeco">땡이누나
																</p></th>
														<th class="font-grey">19.03.10</th>
														<th class="font-grey">23</th>
													</tr>
													<tr>
														<th class="font-grey">모임게시판</th>
														<th><a href="" class="nondeco">땡이 13번째 생일이에요^_^</a></th>
														<th><a href="/mypage/member/detail" class="nondeco">땡이누나
																</p></th>
														<th class="font-grey">19.03.10</th>
														<th class="font-grey">23</th>
													</tr>
													<tr>
														<th class="font-grey">모임게시판</th>
														<th><a href="" class="nondeco">땡이 13번째 생일이에요^_^</a></th>
														<th><a href="/mypage/member/detail" class="nondeco">땡이누나
																</p></th>
														<th class="font-grey">19.03.10</th>
														<th class="font-grey">23</th>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div id="message-send" role="tabpanel"
								aria-labelledby="pills-profile-tab" class="tab-pane fade">
								<div class="row">
									<div class="col-md-12">
										<div class="tile">
											<div class="tile-body">
												<table class="table table-hover table-bordered"
													id="sampleTable">

													<tr align="center" class="font-grey">
														<th>게시판명</th>
														<th>제목</th>
														<th>작성자</th>
														<th>작성일자</th>
														<th>조회수</th>
													</tr>
													<tr>
														<th class="font-grey">자유게시판</th>
														<th><a href="" class="nondeco">강아지가 초콜릿 먹었는데
																괜찮을까요?</th>
														<th><a href="" class="nondeco">뿌꾸맘</a></th>
														<th class="font-grey">10.06.18</th>
														<th class="font-grey">30</th>
													</tr>
													<tr>
														<th class="font-grey">모임게시판</th>
														<th><a href="" class="nondeco">한강에서 산책하실 분</th>
														<th><a href="" class="nondeco">우리아지체고</a></th>
														<th class="font-grey">17.07.09</th>
														<th class="font-grey">80</th>
													</tr>
													<tr>
														<th class="font-grey">모임게시판</th>
														<th><a href="" class="nondeco">땡이 13번째 생일이에요^_^</th>
														<th><a href="" class="nondeco">땡이누나</a></th>
														<th class="font-grey">19.03.10</th>
														<th class="font-grey">23</th>
													</tr>
													<tr>
														<th class="font-grey">모임게시판</th>
														<th><a href="" class="nondeco">땡이 13번째 생일이에요^_^</a></th>
														<th><a href="/mypage/member/detail" class="nondeco">땡이누나
																</p></th>
														<th class="font-grey">19.03.10</th>
														<th class="font-grey">23</th>
													</tr>
													<tr>
														<th class="font-grey">모임게시판</th>
														<th><a href="" class="nondeco">땡이 13번째 생일이에요^_^</a></th>
														<th><a href="/mypage/member/detail" class="nondeco">땡이누나
																</p></th>
														<th class="font-grey">19.03.10</th>
														<th class="font-grey">23</th>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="content">
							<div class="row">
								<!--  <div class="col-sm-6">
                        <div class="form-group">
                          <label for="email">Email</label>
                          <input id="email" type="text" class="form-control">
                        </div>
                      </div> -->
							</div>
						</div>
						<!-- </form> -->
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
	<script
		src="/resources/vendor/jquery.counterup/jquery.counterup.min.js"></script>
	<script src="/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script
		src="/resources/vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.min.js"></script>
	<script src="/resources/js/jquery.parallax-1.1.3.js"></script>
	<script
		src="/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
	<script src="/resources/vendor/jquery.scrollto/jquery.scrollTo.min.js"></script>
	<script src="/resources/js/front.js"></script>
</body>
</html>