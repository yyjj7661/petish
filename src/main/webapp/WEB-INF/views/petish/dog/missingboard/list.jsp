<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>실종견 게시판</title>
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
	href="/resources/mg/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="/resources/img/apple-touch-icon-152x152.png">	
<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->

<link href="/resources/css/dog/missingboard/list.css" rel="stylesheet">
</head>

<body>
	<div id="all">

		<%@ include file="/WEB-INF/views/commons/top.jspf"%>

		<div id="heading-breadcrumbs">
			<div class="container">
				<div class="row d-flex align-items-center flex-wrap">
					<div class="col-md-7">
						<h1 class="h2">실종견 게시판</h1>
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
				<button class="btn btn-template-outlined">
					<a href="/dog/missingboard/writeForm">
					글쓰기
					</a>
				</button>
				
					<div id="customer-order" class="col-lg-20">
						<table class="table">							
							<tr>
								<th width="130px" class="condition border-top-0">상태</th>              
                      			<th width="200px" class="image border-top-0">이미지</th>                     
                        		<th width="550px" class="title border-top-0" colspan="10">제목</th>
                       	 		<th width="100px" class="writer border-top-0">작성자</th>
                        		<th width="130px" class="test border-top-0">작성일자</th>                     
                        		<th width="100px" class="test border-top-0">조회</th>
							</tr>
						

	
							<tr>
								<td><span class="badge badge-danger">미발견</span></td>
								<td><img src="/resources/img/detailsquare.jpg" alt="..."
									class="img-fluid"></td>
								<td colspan="10"><a href="/dog/missingboard/detail">[인천 서구] 페키니즈 / 여 / 3</a></td>
								<td>
									<div class="nav navbar-nav ml-auto">
										<a href="#" data-toggle="dropdown" class="dropdown">Pet</a>
										<div class="dropdown-menu">
											<div class="dropdown"><a href="#" class="nav-link">게시글보기</a></div>
											<div class="dropdown"><a href="#" class="nav-link">쪽지보내기</a></div>
										</div>
									</div>

								</td>
							  	<td class=test>2019.07.01</td>  
                       			<td class=test>11</td>  
							</tr>

							<tr>
								<td><span class="badge badge-info">발견 완료</span></td>
								<td><img src="/resources/img/detailsquare.jpg" alt="..."
									class="img-fluid"></td>

								<td colspan="10">[인천 서구] 페키니즈 / 여 / 31^^ <span
									class="badge badge-secondary">42</span>
								</td>
								<td>
									<div class="nav navbar-nav ml-auto">
										<a href="#" data-toggle="dropdown" class="dropdown">PET</a>
										<div class="dropdown-menu">
											<div class="dropdown"><a href="#" class="nav-link">게시글보기</a></div>
											<div class="dropdown"><a href="#" class="nav-link">쪽지보내기</a></div>
										</div>
									</div>
								</td>
								<td class=test>2019.07.01</td>
								<td class=test>11</td>
							</tr>

							<tr>
								<td><span class="badge badge-info">발견 완료</span></td>
								<td><img src="/resources/img/detailsquare.jpg" alt="..."
									class="img-fluid"></td>
								<td colspan="10">[인천 서구] 페키니즈 / 남 / 2 &nbsp &nbsp <span
									class="badge badge-secondary">40</span></td>
								<td>Pet</td>
								<td class=test>2019.07.01</td>
								<td class=test>11</td>
							</tr>

							<tr>
								<td><span class="badge badge-info">발견 완료</span></td>
								<td><img src="/resources/img/detailsquare.jpg" alt="..."
									class="img-fluid"></td>
								<td colspan="10">[인천 서구] 페키니즈 / 남 / 3 <span
									class="badge badge-secondary">82</span></td>
								<td>Pet</td>
								<td class=test>2019.07.01</td>
								<td class=test>11</td>
							</tr>

							<tr>
								<td></td>
								<td><img src="/resources/img/detailsquare.jpg" alt="..."
									class="img-fluid"></td>
								<td colspan="10">[인천 서구] 페키니즈 / 여 / 31##</td>
								<td>Pet1</td>
								<td class=test>2019.07.01</td>
								<td class=test>11</td>
							</tr>

							<tr>
								<td></td>
								<td><img src="/resources/img/detailsquare.jpg" alt="..."
									class="img-fluid"></td>
								<td colspan="10">[인천 서구] 페키니즈 / 여 / 31##</td>
								<td>Pet1</td>
								<td class=test>2019.07.01</td>
								<td class=test>11</td>
							</tr>

							<tr>
								<td><span class="badge badge-danger">미발견</span></td>
								<td><img src="/resources/img/detailsquare.jpg" alt="..."
									class="img-fluid"></td>
								<td colspan="10">[인천 서구] 페키니즈 / 여 / 3!!</td>
								<td>Pet</td>
								<td class=test>2019.07.01</td>
								<td class=test>11</td>
							</tr>

							<tr>
								<td></td>
								<td><img src="/resources/img/detailsquare.jpg" alt="..."
									class="img-fluid"></td>
								<td colspan="10">[인천 서구] 페키니즈 / 여 / 31</td>
								<td>Pet1</td>
								<td class=test>2019.07.01</td>
								<td class=test>11</td>
							</tr>

							<tr>
								<td></td>
								<td><img src="/resources/img/detailsquare.jpg" alt="..."
									class="img-fluid"></td>
								<td colspan="10">[인천 서구] 페키니즈 / 여 / 323</td>
								<td>Pet</td>
								<td class=test>2019.07.01</td>
								<td class=test>11</td>
							</tr>

							<tr>
								<td></td>
								<td><img src="/resources/img/detailsquare.jpg" alt="..."
									class="img-fluid"></td>
								<td colspan="10">[인천 서구] 페키니즈 / 여 / 3234</td>
								<td>Pet</td>
								<td class=test>2019.07.01</td>
								<td class=test>11</td>
							</tr>

							<tr>
								<td></td>
								<td><img src="/resources/img/detailsquare.jpg" alt="..."
									class="img-fluid"></td>
								<td colspan="10">[인천 서구] 페키니즈 / 여 / 312</td>
								<td>Pet1</td>
								<td class=test>2019.07.01</td>
								<td class=test>11</td>
							</tr>

							<tr>
								<td></td>
								<td><img src="/resources/img/detailsquare.jpg" alt="..."
									class="img-fluid"></td>
								<td colspan="10">[인천 서구] 페키니즈 / 여 / 324</td>
								<td>Pet</td>
								<td class=test>2019.07.01</td>
								<td class=test>11</td>
							</tr>

							<tr>
								<td><span class="badge badge-danger">미발견</span></td>
								<td><img src="/resources/img/detailsquare.jpg" alt="..."
									class="img-fluid"></td>
								<td colspan="10">[인천 서구] 페키니즈 / 여 / 343</td>
								<td>Pet</td>
								<td class=test>2019.07.01</td>
								<td class=test>11</td>
							</tr>

							<tr>
								<td><span class="badge badge-danger">미발견</span></td>
								<td><img src="/resources/img/detailsquare.jpg" alt="..."
									class="img-fluid"></td>
								<td colspan="10">[인천 서구] 페키니즈 / 여 / 361</td>
								<td>Pet1</td>
								<td class=test>2019.07.01</td>
								<td class=test>11</td>
							</tr>

							<tr>
								<td><span class="badge badge-danger">미발견</span></td>
								<td><img src="/resources/img/detailsquare.jpg" alt="..."
									class="img-fluid"></td>
								<td colspan="10">[인천 서구] 페키니즈 / 여 / 3</td>
								<td>Pet</td>
								<td class=test>2019.07.01</td>
								<td class=test>11</td>
							</tr>

							<tr>
								<td><span class="badge badge-info">발견 완료</span></td>
								<td><img src="/resources/img/detailsquare.jpg" alt="..."
									class="img-fluid"></td>
								<td colspan="10">[인천 서구] 페키니즈 / 여 / 3</td>
								<td>Pet</td>
								<td class=test>2019.07.01</td>
								<td class=test>11</td>
							</tr>

							<tr>
								<td></td>
								<td><img src="/resources/img/detailsquare.jpg" alt="..."
									class="img-fluid"></td>
								<td colspan="10">[인천 서구] 페키니즈 / 여 / 3</td>
								<td>Pet1</td>
								<td class=test>2019.07.01</td>
								<td class=test>11</td>
							</tr>

							<tr>
								<td></td>
								<td><img src="/resources/img/detailsquare.jpg" alt="..."
									class="img-fluid"></td>
								<td colspan="10">[인천 서구] 페키니즈 / 여 / 312</td>
								<td>Pet</td>
								<td class=test>2019.07.01</td>
								<td class=test>11</td>
							</tr>
						</table>
					</div>
			</div>


			<div aria-label="Page navigation example" class="d-flex justify-content-center">
				<ul class="pagination">
					<li class="page-item"><a href="#" class="page-link"> <i
							class="fa fa-angle-double-left"></i></a></li>
					<li class="page-item active"><a href="#" class="page-link">1</a></li>
					<li class="page-item"><a href="#" class="page-link">2</a></li>
					<li class="page-item"><a href="#" class="page-link">3</a></li>
					<li class="page-item"><a href="#" class="page-link">4</a></li>
					<li class="page-item"><a href="#" class="page-link">5</a></li>
					<li class="page-item"><a href="#" class="page-link"><i
							class="fa fa-angle-double-right"></i></a></li>
				</ul>
			</div>
				
			<div aria-label="Page navigation example" class="d-flex justify-content-center">

				<!-- 검색 기능 -->
				<div class="col-md-2 col-lg-2">
					<div class="form-group">

						<select id="region" onchange="categoryChange(this)"
							class="form-control">
							<option value="">지역</option>
							<option value="1">서울</option>
							<option value="2">경기</option>
							<option value="3">인천</option>
							<option value="4">강원</option>
							<option value="5">대전</option>
							<option value="6">세종</option>
							<option value="7">충남</option>
							<option value="8">충북</option>
							<option value="9">부산</option>
							<option value="10">울산</option>
							<option value="11">경남</option>
							<option value="12">경북</option>
							<option value="13">대구</option>
							<option value="14">광주</option>
							<option value="15">전남</option>
							<option value="16">전북</option>
							<option value="17">제주</option>
						</select>
					</div>
				</div>
				
				<div class="si col-md-2 col-lg-2">
					<div class="form-group">
						<select id="sml_region" class="form-control"
							>
							<option>시/구</option>
						</select>
					</div>
				</div>
		
				<div class="condition col-md-2 col-lg-2">
					<div class="form-group">
						<select id="state" class="form-control">
							<option>싱태</option>
							<option>발견완료</option>
							<option>미발견</option>
						</select>
					</div>
				</div>

				<div class="col-md-2 col-lg-2">
					<div class="form-group">
						<select id="state" class="form-control" style="min-width: 2cm;">
							<option>제목</option>
							<option>내용</option>
							<option>작성자</option>
						</select>
					</div>
				</div>

				<div class="panel panel-default sidebar-menu">
					<div class="panel-body">
						<form role="search" style="margin-right: 15px;">
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
				
			</div>

		</div>
	</div>
	
	<script src="/resources/js/dog/missingboard/list.js"></script>

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