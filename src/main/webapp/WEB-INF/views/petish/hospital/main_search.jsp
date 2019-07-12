<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Search Hospital</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="robots" content="all,follow">

	<!-- 평점 별  -->
	<link rel="stylesheet" href="/resources/css/hospital/star.css">
	<!-- 평점 별  -->
	
	<link rel="stylesheet" href="/resources/css/hospital/main_search.css">
	<script src="/resources/js/hospital/hospital.js"></script>
	

</head>

<%@ include file="/WEB-INF/views/commons/link.jspf" %>
<body>
	
	<%@ include file="/WEB-INF/views/commons/top.jspf"%>
	
	<div class="container">

		<div class="container">
			<div class="row">
				<div class="col-md-12" style="background-color: #38A7BB;">
					<div class="card-body">
						<div class="row pb-2">
							<div class="col-md-12">
								<h4>Search Hospital</h4>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<div class="form-group">
									<select id="region" onchange="categoryChange(this)" class="form-control">
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
							<div class="col-md-3">
								<div class="form-group">
									<select id="sml_region" class="form-control">
										<option selected>시 / 군 / 구</option>
									</select>
								</div>
							</div>

							<input type="checkbox"> 응급진료

							<div class="col-md-3">
								<button type="button" class="btn btn-primary btn-block" style="background-color: gray;">Search</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<br>

		<!-- 지도 화면 시작-->
				<div class="container">
					<div class="map_wrap">
						<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
					</div>
					<br>
					<!-- 지도 화면 끝 -->
					<div id="content">
						<div class="container">
								<div class="row">
									<div class="col-md-12">
										<div class="hospital_list">
											<h2>PET Hospital List</h2>
										</div>
										<p class="lead"></p>
										<div class="row text-center">
											<div class="col-md-3">
												<div data-animate="fadeInUp" class="team-member">
													<div class="image">
														<a href="A동물병원상세페이지"><img
															src="/resources/img/hospital/hospital.jpg" alt=""
															class="img-fluid rounded-circle"></a>
													</div>
													<h3 style="font-size: 25px;">
														<a href="A동물병원상세페이지">A 동물병원</a>
													</h3>
													<p style="font-size: 25px;">★★★★★</p>
													
													<div class="text">
														<div>02-9999-9999</div>
														<div>응급진료</div>
													</div>
												</div>
											</div>
											
											<div data-animate="fadeInUp" class="col-md-3">
												<div class="team-member">
													<div class="image">
														<a href="B동물병원상세페이지"><img
															src="/resources/img/hospital/hospital.jpg" alt=""
															class="img-fluid rounded-circle"></a>
													</div>
													<h3 style="font-size: 25px;">
														<a href="B동물병원상세페이지">B 동물병원</a>
													</h3>
													<p style="font-size: 25px;">★★★★★</p>

													<div class="text">
														<div>02-9999-9999</div>
														<div>응급진료</div>
													</div>
												</div>
											</div>
											
											<div data-animate="fadeInUp" class="col-md-3">
												<div class="team-member">
													<div class="image">
														<a href="C동물병원상세페이지"><img
															src="/resources/img/hospital/hospital.jpg" alt=""
															class="img-fluid rounded-circle"></a>
													</div>
													<h3 style="font-size: 25px;">
														<a href="C동물병원상세페이지">C 동물병원</a>
													</h3>
													<p style="font-size: 25px;">★★★★★</p>

													<div class="text">
														<div>02-9999-9999</div>
														<div>응급진료</div>
													</div>
												</div>
											</div>
											
											<div data-animate="fadeInUp" class="col-md-3">
												<div class="team-member">
													<div class="image">
														<a href="D동물병원상세페이지"><img
															src="/resources/img/hospital/hospital.jpg" alt=""
															class="img-fluid rounded-circle"></a>
													</div>
													<h3 style="font-size: 25px;">
														<a href="D동물병원상세페이지">D 동물병원</a>
													</h3>
													<p style="font-size: 25px;">★★★★★</p>

													<div class="text">
														<div>02-9999-9999</div>
														<div>응급진료</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>				
							</div>
						</div>
					</div>
				</div>

	<!-- /////////////////////////////////// 지  도  //////////////////////////////////////// -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59e90ffa4462049931ee4536f504c27b&libraries=services"></script>
	<script src="/resources/js/hospital/hospital.js"></script>

	<!-- Javascript files-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/popper.js/umd/popper.min.js"> </script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/vendor/jquery.cookie/jquery.cookie.js"> </script>
	<script src="/resources/vendor/waypoints/lib/jquery.waypoints.min.js"> </script>
	<script src="/resources/vendor/jquery.counterup/jquery.counterup.min.js"> </script>
	<script src="/resources/js/jquery.parallax-1.1.3.js"></script>
	<script src="/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
	<script src="/resources/vendor/jquery.scrollto/jquery.scrollTo.min.js"></script>
	<script src="/resources/js/front.js"></script>
</body>
</html>