<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>강아지 정모게시판</title>
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
<link rel="apple-touch-icon" sizes="144x144" href="/resources/mg/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="/resources/img/apple-touch-icon-152x152.png">
<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<body>
	<div id="all">
	
		<%@ include file="/WEB-INF/views/commons/top.jspf" %>s

		<div id="heading-breadcrumbs">
			<div class="container">
				<div class="row d-flex align-items-center flex-wrap">
					<div class="col-md-7">
						<h1 class="h2">강아지 정모게시판</h1>
					</div>
					<div class="col-md-5">
						<ul class="breadcrumb d-flex justify-content-end">

						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<div id="content">
			<div class="container">
				<P></P>
				<P></P>
				<P></P>
				<P></P>
				<P></P>
				<button class="btn btn-template-outlined" style="float: right;">
					<a href="/dog/gatherboard/writeForm">
					글쓰기
					</a>
				</button>
				<div class="row bar">
					<div id="customer-order" class="col-lg-20">
						<table class="table" style="margin: auto; text-align: center;">
							<thead>
								<tr>
									<th width="110px" class="border-top-0 lead">번호</th>
									<th width="70px" class="border-top-0 lead">지역</th>
									<th width="70px" class="border-top-0 lead">종별</th>
									<th width="550px" class="border-top-0 lead" colspan="10">제목</th>
									<th width="100px" class="border-top-0 lead">작성자</th>
									<th width="130px" class="border-top-0 lead">작성일자</th>
									<th width="100px" class="border-top-0 lead">조회</th>
									<th width="100px" class="border-top-0 lead">좋아요</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td>100</td>
									<td>서울</td>
									<td>소형견</td>
									<td colspan="10"><a href="/dog/gatherboard/detail">비트캠프에서 만나요&&</a></td>
									<td>
										<ul class="nav navbar-nav ml-auto">
											<a href="#" data-toggle="dropdown" class="dropdown">Pet</a>
											<ul class="dropdown-menu">
												<li class="dropdown"><a href="#" class="nav-link">게시글보기</a></li>
												<li class="dropdown"><a href="#" class="nav-link">쪽지보내기</a></li>
											</ul>
										</ul>
									</td>
									<td>2019.07.01</td>
									<td>11</td>
									<td>11</td>
								</tr>
								<tr>
									<td>99</td>
									<td>서울</td>
									<td>중형견</td>
									<td colspan="10">비트캠프에서 만나요1^^ <span
										class="badge badge-secondary">42</span>
									</td>
									<td>
										<ul class="nav navbar-nav ml-auto">
											<a href="#" data-toggle="dropdown" class="dropdown">PET</a>
											<ul class="dropdown-menu">
												<li class="dropdown"><a href="#" class="nav-link">게시글보기</a></li>
												<li class="dropdown"><a href="#" class="nav-link">쪽지보내기</a></li>
											</ul>
										</ul>
									</td>
									<td>2019.07.01</td>
									<td>11</td>
									<td>11</td>
								</tr>
								<tr>
									<td>98</td>
									<td>인천</td>
									<td>소형견</td>
									<td colspan="10">비트캠프에서 만나요%% &nbsp &nbsp <span
										class="badge badge-secondary">40</span></td>
									<td>Pet</td>
									<td>2019.07.01</td>
									<td>11</td>
									<td>11</td>
								</tr>
								<tr>
									<td>97</td>
									<td>인천</td>
									<td>중형견</td>
									<td colspan="10">비트캠프에서 만나요$$&nbsp &nbsp <span
										class="badge badge-secondary">82</span></td>
									<td>Pet</td>
									<td>2019.07.01</td>
									<td>11</td>
									<td>11</td>
								</tr>
								<tr>
									<td>96</td>
									<td></td>
									<td>소형견</td>
									<td colspan="10">비트캠프에서 만나요1##</td>
									<td>Pet1</td>
									<td>2019.07.01</td>
									<td>11</td>
									<td>11</td>
								</tr>
								<tr>
									<td>95</td>
									<td></td>
									<td>중형견</td>
									<td colspan="10">비트캠프에서 만나요1##</td>
									<td>Pet1</td>
									<td>2019.07.01</td>
									<td>11</td>
									<td>11</td>
								</tr>
								<tr>
									<td>94</td>
									<td>서울</td>
									<td>대형견</td>
									<td colspan="10">비트캠프에서 만나요!!</td>
									<td>Pet</td>
									<td>2019.07.01</td>
									<td>11</td>
									<td>11</td>
								</tr>
								<tr>
									<td>93</td>
									<td></td>
									<td>중형견</td>
									<td colspan="10">비트캠프에서 만나요1</td>
									<td>Pet1</td>
									<td>2019.07.01</td>
									<td>11</td>
									<td>11</td>
								</tr>
								<tr>
									<td>92</td>
									<td></td>
									<td>소형견</td>
									<td colspan="10">비트캠프에서 만나요23</td>
									<td>Pet</td>
									<td>2019.07.01</td>
									<td>11</td>
									<td>11</td>
								</tr>
								<tr>
									<td>91</td>
									<td></td>
									<td>중형견</td>
									<td colspan="10">비트캠프에서 만나요234</td>
									<td>Pet</td>
									<td>2019.07.01</td>
									<td>11</td>
									<td>11</td>
								</tr>
								<tr>
									<td>90</td>
									<td></td>
									<td>중형견</td>
									<td colspan="10">비트캠프에서 만나요12</td>
									<td>Pet1</td>
									<td>2019.07.01</td>
									<td>11</td>
									<td>11</td>
								</tr>
								<tr>
									<td>89</td>
									<td></td>
									<td>소형견</td>
									<td colspan="10">비트캠프에서 만나요24</td>
									<td>Pet</td>
									<td>2019.07.01</td>
									<td>11</td>
									<td>11</td>
								</tr>
								<tr>
									<td>88</td>
									<td>서울</td>
									<td>소형견</td>
									<td colspan="10">비트캠프에서 만나요43</td>
									<td>Pet</td>
									<td>2019.07.01</td>
									<td>11</td>
									<td>11</td>
								<tr>
									<td>87</td>
									<td>서울</td>
									<td>중형견</td>
									<td colspan="10">비트캠프에서 만나요61</td>
									<td>Pet1</td>
									<td>2019.07.01</td>
									<td>11</td>
									<td>11</td>
								</tr>
								<tr>
									<td>86</td>
									<td>서울</td>
									<td>소형견</td>
									<td colspan="10">비트캠프에서 만나요</td>
									<td>Pet</td>
									<td>2019.07.01</td>
									<td>11</td>
									<td>11</td>
								</tr>
								<tr>
									<td>85</td>
									<td>인천</td>
									<td>중형견</td>
									<td colspan="10">비트캠프에서 만나요32</td>
									<td>Pet</td>
									<td>2019.07.01</td>
									<td>11</td>
									<td>11</td>
								</tr>
								<tr>
									<td>84</td>
									<td></td>
									<td>소형견</td>
									<td colspan="10">비트캠프에서 만나요1</td>
									<td>Pet1</td>
									<td>2019.07.01</td>
									<td>11</td>
									<td>11</td>
								</tr>
								<tr>
									<td>83</td>
									<td></td>
									<td>중형견</td>
									<td colspan="10">비트캠프에서 만나요12</td>
									<td>Pet</td>
									<td>2019.07.01</td>
									<td>11</td>
									<td>11</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
	<P></P>
	<P></P>
	<P></P>
				<!-- 번호   -->
			
				<nav aria-label="Page navigation example" class="d-flex justify-content-center">
					<ul class="pagination">
						<li class="page-item"><a href="#" class="page-link"> <i
								class="fa fa-angle-double-left"></i></a></li>
						<li class="page-item active"><a href="#" class="page-link">1</a></li>
						<li class="page-item"><a href="#" class="page-link">2</a></li>
						<li class="page-item"><a href="#" class="page-link">3</a></li>
						<li class="page-item"><a href="#" class="page-link">4</a></li>
						<li class="page-item"><a href="#" class="page-link">5</a></li>
						<li class="page-item"><a href="#" class="page-link"><i class="fa fa-angle-double-right"></i></a></li>
					</ul>
				</nav>
				<P></P>
				<P></P>
				<P></P>
				<P></P>
				<P></P>
			
				<nav aria-label="Page navigation example" class="d-flex justify-content-center">
					<!-- 검색 기능 -->
					<div class="col-md-2 col-lg-2">
						<div class="form-group">
							<select id="state" class="form-control">
								<option>지역 전체</option>
								<option>서울</option>
								<option>부산</option>
								<option>대구</option>
								<option>인천</option>
								<option>광주</option>
								<option>대전</option>
								<option>울산</option>
								<option>세종</option>
								<option>경기</option>
								<option>강원</option>
								<option>충북</option>
								<option>충남</option>
								<option>전북</option>
								<option>전남</option>
								<option>경남</option>
								<option>경북</option>
								<option>제주</option>
							</select>
						</div>
					</div>
			
					<div class="col-md-2 col-lg-2">
						<div class="form-group">
							<select id="state" class="form-control">
								<option>견종별</option>
								<option>소형견</option>
								<option>중형견</option>
								<option>대형견</option>
							</select>
						</div>
					</div>
					<div class="col-md-2 col-lg-2">
						<div class="form-group">
							<select id="state" class="form-control">
								<option>제목</option>
								<option>내용</option>
								<option>작성자</option>
							</select>
						</div>
					</div>
			
					<div class="panel panel-default sidebar-menu">
						<div class="panel-body">
							<form role="search">
								<div class="input-group">
									<input type="text" placeholder="Search" class="form-control"><span
										class="input-group-btn">
										<button type="submit" class="btn btn-template-main">
											<i class="fa fa-search"></i>
										</button>
									</span>
								</div>
							</form>
						</div>
					</div>
				</nav>
	
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