<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8">
	<title>PET HOSPITAL</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="robots" content="all,follow">

	<!-- 평점 별  -->
	<link rel="stylesheet" href="/resources/css/star-rating.css" media="all" type="text/css" />
	<link rel="stylesheet" href="/resources/css/theme-krajee-fa.css" media="all" type="text/css" />
	<link rel="stylesheet" href="/resources/css/theme-krajee-svg.css" media="all" type="text/css" />
	<link rel="stylesheet" href="/resources/css/theme-krajee-uni.css" media="all" type="text/css" />
	<!-- 평점 별  -->
	<link rel="stylesheet" href="/resources/css/hospital/detail.css">

</head>

<%@ include file="/WEB-INF/views/commons/link.jspf" %>


<body>
	<div id="all">

		<%@ include file="/WEB-INF/views/commons/top.jspf" %>



		<div id="content">
			<div class="container">
				<div class="bar">
					<div class="row">
						<div class="col-md-12">
							<div class="heading">
								<h2>PET HOSPITAL</h2>
							</div>
						</div>
					</div>
					<div class="row portfolio text-center">
						<div class="col-md-6">
							<div class="hospital-image">
								<div class="image">
									<img src="/resources/img/hospital/hospital.jpg" alt="" class="img-fluid">
								</div>
							</div>
						</div>
						
						<div class="col-md-6">
							<div class="icon">
							<ul>
								<li> 
									<div class="fa fa-home fa-pull-left fa-2x fa-fw" id="spec" aria-hidden="true">
										<span id="hospital_name">A동물병원</span>
									</div>
								</li>
								<li> 
									<div class="fa fa-map-marker fa-pull-left fa-2x fa-fw" id="spec" aria-hidden="true">
										<span id="hospital_address">서울특별시 강남구 비트캠프</span>
									</div>
								</li>
								<li> 
									<div class="fa fa-phone fa-pull-left fa-2x fa-fw" id="spec" aria-hidden="true">
										<span id="phone_number">02-9999-9999</span>
									</div>
								</li>
								<li> 
									<div class="fa fa-clock-o fa-pull-left fa-2x fa-fw" id="spec" aria-hidden="true">
										<span id="opertion_time">AM 09:00 ~ PM 09:00</span>
									</div>
								</li>
								<li> 
									<div class="fa fa-laptop fa-pull-left fa-2x fa-fw" id="spec" aria-hidden="true">
										<span id="site_address">www.naver.com</span>
									</div>
								</li>
								<li> 
									<div class="fa fa-car fa-pull-left fa-2x fa-fw" id="spec" aria-hidden="true">
										<span id="parking">주차가능</span>
									</div>
								</li>
								<li> 
									<div class="fa fa-plus-square fa-pull-left fa-2x fa-fw" id="spec" aria-hidden="true">
										<span id="emergency">응급진료</span>
									</div>
								</li>
							</ul>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="fa fa-list fa-2x" aria-hidden="true" id="subject">
				<span>진료 과목</span>
			</div>
			<div class="fa fa-circle" style="font-size:18px;" id="subject">
				<span>종합 검진</span>
			</div>
			<div class="fa fa-circle" style="font-size:18px;" id="subject">
				<span>수의 안과</span>
			</div>
			<div class="fa fa-circle" style="font-size:18px;" id="subject">
				<span>피부과</span>
			</div>
			<div class="fa fa-circle" style="font-size:18px;" id="subject">
				<span>치과</span>
			</div>
		</div>

		<div class="container">
			<div class="fa fa-map-marker fa-3x" aria-hidden="true" id="subject">
				<span class="menu1" style="font-size: 23px;">찾아오시는길</span>
			</div>
			<div id="map" style="width: 100%; height: 350px;"></div>
		</div>

		<div class="container">
			<div class="fa fa-comments fa-3x" aria-hidden="true" id="subject">
				<span class="menu1" style="font-size: 23px;">한 줄로 말하기</span>
			</div>
			
			<table border="0" width="100%" height="70%">
				<tr>
					<td width="20%" bgcolor="#f5f5f5">

						<form>
							 <input type="text" class="rating rating-loading" value="2.5" data-size="lg" title=""> 
						</form>
					</td>

					<td><input style="width:82%; height:100%; boder:2px solid #38A7BB;" placeholder="자유롭게 작성하되 욕설 및 상대방에게 불쾌감을 줄 수 있는 단어는 금지합니다.(100자 이내)" 
					type="text" name="star_reply" maxlength="100" autofocus/>
						<button type="button" class="btn btn-template-outlined">작성완료</button>
					</td>
				</tr>
				<tr>
				</tr>
			</table>

		
			<table class="table table-stripped" id="reviews">
				<thead>
					<tr style="font-size: 15px;">
						<th width=15%>평점</th>
						<th width=25%>아이디</th>
						<th>내용</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="review" items="${ reviews }" varStatus="status">
						<!-- 평점 기준 별표시 출력 -->

						<tr style="font-size: 15px;">
							<td><c:forEach var="rating" items="${ ratingOptions }"
									varStatus="status" begin="1" end="${ review.rating }">★</c:forEach></td>
							<td>익명</td>
							<td>으아아아아앙아아아악!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
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
		
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e74e0d9232cbccbd2962414bf135d9c&libraries=services"></script>
	<script src="/resources/js/hospital/detail.js"></script>
	<script src="/resources/js/star-rating.js" type="text/javascript"></script>

	
</body>
</html>