<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>PET HOSPITAL</title>
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

<script src="https://use.fontawesome.com/4121be3c13.js"></script>
<!-- 평점 별  -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/star-rating.css" media="all"
	type="text/css" />
<link rel="stylesheet" href="/resources/css/theme-krajee-fa.css"
	media="all" type="text/css" />
<link rel="stylesheet" href="/resources/css/theme-krajee-svg.css"
	media="all" type="text/css" />
<link rel="stylesheet" href="/resources/css/theme-krajee-uni.css"
	media="all" type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="/resources/js/star-rating.js" type="text/javascript"></script>
<!-- 평점 별  -->

<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<body>
	<div id="all">

		<%@ include file="/WEB-INF/views/commons/top.jspf" %>

		<div id="heading-breadcrumbs">
			<div class="container">
				<div class="row d-flex align-items-center flex-wrap">
					<div class="col-md-7"></div>
					<div class="col-md-5">
						<ul class="breadcrumb d-flex justify-content-end">
							<li class="breadcrumb-item"><a href="index.html">Home</a></li>
							<li class="breadcrumb-item active">Portfolio - 2 columns</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div id="content">
			<div class="container">
				<section class="bar">
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
									<img src="/resources/img/A1.jpg" alt="" class="img-fluid">
								</div>
							</div>
						</div>
						
						<div class="col-md-6">
							<div class="icon">
							<table>
								<tr>
									<td><i class="fa fa-home fa-pull-left fa-2x fa-fw"
										aria-hidden="true"></i>A 동물병원
									</td>
								</tr>
								<tr>
									<td><i class="fa fa-map-marker fa-pull-left fa-2x fa-fw"
										aria-hidden="true"></i>서울특별시 강남구 비트캠프
									
									</td>
								</tr>
								<tr>
									<td><i class="fa fa-clock-o fa-pull-left fa-2x fa-fw"
										aria-hidden="true"></i>AM 09:00 ~ PM 09:00
									</td>
								</tr>
								<tr>
									<td><i class="fa fa-laptop fa-pull-left fa-2x fa-fw"
										aria-hidden="true"></i>www.naver.com
									</td>
								</tr>
								<tr>
									<td><i class="fa fa-car fa-pull-left fa-2x fa-fw"
										aria-hidden="true"></i>주차가능
									</td>
								</tr>
								<tr>
									<td><i class="fa fa-plus fa-pull-left fa-2x fa-fw"
										aria-hidden="true"></i>응급진료
									</td>
								</tr>
							</table>
							</div>
						</div>
					</div>
				</section>
			</div>

			<div class="container">
				<div class="col-md-12">
					<div class="image">
						<img src="img/B1.jpeg" alt="" class="img-fluid"
							style="width: 1110px; height: 500px;">
					</div>
					</br>
				</div>
			</div>
			
		</div>

		<div class="container">
			<i class="fa fa-list fa-2x" aria-hidden="true"></i><span
				class="menu1" style="font-size: 23px;">진료과목</span>
			 <i class="fa fa-circle" aria-hidden="true"
				style="text-indent: 100%;"></i>종합 검진
			<i class="fa fa-circle" aria-hidden="true" style="text-indent: 100%;"></i>수의
			안과 <i class="fa fa-circle" aria-hidden="true"
				style="text-indent: 100%;"></i>피부과
			<i class="fa fa-circle" aria-hidden="true" style="text-indent: 100%;"></i>치과
			<i class="fa fa-circle" aria-hidden="true" style="text-indent: 100%;"></i>중성화
			수술 <i class="fa fa-circle" aria-hidden="true"
				style="text-indent: 100%;"></i>예방 접종
			<i class="fa fa-circle" aria-hidden="true" style="text-indent: 100%;"></i>응급
			진료
			
			
		</div>

		<div class="container">
			<i class="fa fa-map-marker fa-3x" aria-hidden="true"></i><span
				class="menu1" style="font-size: 23px;">찾아오시는길</span>
			
			<div id="map" style="width: 100%; height: 350px;"></div>

		</div>

		<div class="container">
			<i class="fa fa-comments fa-3x" aria-hidden="true"></i><span
				class="menu1" style="font-size: 23px;">한 줄로 말하기</span>

			<table border="1" width="100%" height="70%">
				<tr>
					<td width="20%" bgcolor="#f5f5f5">

						<form>
							 <input type="text" class="rating rating-loading"
								value="2.5" data-size="lg" title=""> 
						</form>
					</td>

					<td><input
						style="width: 90%; height: 40px;" type="text" name="star_reply" />
						<input style="width: 8%; height: 30px;" type="submit"
						name="confirm" value="작성 완료" onclick="" />
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
		
		
		<section class="bar background-pentagon no-mb"></section>
		<section class="bar bg-gray">
			<div class="container">

				<ul class="list-unstyled owl-carousel customers no-mb">
					<li class="item"><img src="img/customer-1.png" alt=""
						class="img-fluid"></li>
					<li class="item"><img src="img/customer-2.png" alt=""
						class="img-fluid"></li>
					<li class="item"><img src="img/customer-3.png" alt=""
						class="img-fluid"></li>
					<li class="item"><img src="img/customer-4.png" alt=""
						class="img-fluid"></li>
					<li class="item"><img src="img/customer-5.png" alt=""
						class="img-fluid"></li>
					<li class="item"><img src="img/customer-6.png" alt=""
						class="img-fluid"></li>
				</ul>
			</div>
		</section>
	</div>

	<!-- Javascript files-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/popper.js/umd/popper.min.js">
		
	</script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/vendor/jquery.cookie/jquery.cookie.js">
		
	</script>
	<script src="/resources/vendor/waypoints/lib/jquery.waypoints.min.js">
		
	</script>
	<script src="/resources/vendor/jquery.counterup/jquery.counterup.min.js">
		
	</script>
	<script src="/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="/resources/vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.min.js"></script>
	<script src="/resources/js/jquery.parallax-1.1.3.js"></script>
	<script src="/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
	<script src="/resources/vendor/jquery.scrollto/jquery.scrollTo.min.js"></script>
	<script src="/resources/js/front.js"></script>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e74e0d9232cbccbd2962414bf135d9c&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('',
			function(result, status) {
				// 정상적으로 검색이 완료됐으면 
				if (status === daum.maps.services.Status.OK) {

					var coords = new daum.maps.LatLng(
							result[0].y, result[0].x);

					// 결과값으로 받은 위치를 마커로 표시합니다
					var marker = new daum.maps.Marker({
						map : map,
						position : coords
					});

					// 인포윈도우로 장소에 대한 설명을 표시합니다
					var infowindow = new daum.maps.InfoWindow(
							{
								content : '<div style="width:150px;text-align:center;padding:6px 0;">정모 장소</div>'
							});
					infowindow.open(map, marker);

					// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					map.setCenter(coords);
				}
		});
	</script>
	<script>
		$('.rating').on('change', function() {
			console.log('Rating selected: ' + $(this).val());
		});
	</script>
	
</body>
</html>