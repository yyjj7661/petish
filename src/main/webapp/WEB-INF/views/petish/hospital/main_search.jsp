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
	<link rel="stylesheet" href="/resources/css/commons/kakaomap.css">
	<script src="/resources/js/region.js"></script>
	

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
										<option value="0">지역</option>
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
										<option value="0" selected>시 / 군 / 구</option>
									</select>
								</div>
							</div>

							<input type="checkbox"> 응급진료

							<div class="col-md-3">
								<button type="button" id="hos_search" class="btn btn-primary btn-block" style="background-color: gray;">Search</button>
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
														<a href="/hospital/detail">A 동물병원</a>
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
	
	<script>
	//지도 api 선택한 곳 마커 표시하기(주소까지 출력)
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
 mapOption = {
     center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
     level: 3 // 지도의 확대 레벨
 };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	var marker = new kakao.maps.Marker();
	
	var infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(map, marker) {
		
	    var content = '<div class="bAddr"><span class="title">' + '비트캠프병원' + '</span><div>주소 : '+'address_name'+'</div></div>';

	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}
	//검색 하고 마커 찍어주는 함수
	function setMarker(fa, ga){
		//검색창에서 클릭한 좌표로 이동된 지도를 다시 생성
		mapOption = {
		        center: new kakao.maps.LatLng(ga, fa), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		//해당 위치에 마커를 표시
		marker.setPosition(new kakao.maps.LatLng(ga, fa));
		marker.setMap(map);
		kakao.maps.event.addListener(marker, 'click',function(){
			displayInfowindow(map, marker);
		});
	}
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	//var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	//원래 게시글의 모임장소 주소를 좌표로 바꿔주고 지도에 표시해주는 함수//********************************************************
	var callback = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        setMarker(result[0].x, result[0].y);
	        
	    }
	};
	
	
	</script>
	<script>
	$(document).ready(function(){
		$('#hos_search').click(function(event){
			if($('#sml_region').val()=="0" || $('#region').val()=="0" ){
				
				alert('지역을 선택해 주세요.');
			}
			else{
				// '서울 서초구 서초동 1303-34'에 게시글의 모임장소(db값) 넣어준다.**********************************************************
				
				gethospital($('#sml_region').val());
				
			}
		});
	});
	function gethospital(addr){
		alert(addr);
		/* $.ajax({
			url:'/hospital/search' +'?'+$.param({"hopital_addr":addr}),
			type:'GET',
			contentType:'application/x-www-form-urlencoded; charset=utf-8',
			dataType:'json',
			success:function(data){
				$.each(data, function(index, item){
					
					geocoder.addressSearch(item.hospital_addr, callback);
				})
			},
			error:function(){
				alert("ajax 통신 실패!!!");
			}
		 }); */
		window.location.href = "/hospital/search"+"?"+$.param({"hospital_addr":addr});
	}
	
	</script>
</body>
</html>