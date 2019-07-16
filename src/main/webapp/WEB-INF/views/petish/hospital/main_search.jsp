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

							<input id="emergency" type="checkbox"> 응급진료

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
										<div class="row text-center" id="hospList">
											
											
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
	// 마커를 담을 배열입니다
	var markers = [];

	// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
	var bounds = new kakao.maps.LatLngBounds(); 
	
	var infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(map, marker,name,address_name, isEmer) {
		
		//응급 이미지 일경우 infowindow 값 변경
		if(isEmer ==1){
			var content = '<div class="bAddr"><span class="title">' + name + '</span><div>주소 : '+address_name+'</div><div>응급진료</div></div>';
		}
		else{
			
	   		 var content = '<div class="bAddr"><span class="title">' + name + '</span><div>주소 : '+address_name+'</div></div>';
		}

	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}
	
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}
	// 마커를 찍는 함수
	function createMarker(fa,ga, imgsrc,name,addr,isemer){
		// 마커 이미지의 이미지 크기 입니다
		   var imageSize = new kakao.maps.Size(35, 35); 
		// 마커 이미지를 생성합니다    
	  	  var markerImage = new kakao.maps.MarkerImage(imgsrc, imageSize);
	 	// 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: new kakao.maps.LatLng(ga, fa),
	        image : markerImage // 마커 이미지 
	    });
	  //마커 클릭시 병원이름, 병원주소가 나오는 클릭이벤트.
		kakao.maps.event.addListener(marker, 'click',function(){
			displayInfowindow(map, marker,name,addr,isemer);
		});
	  //마커 배열에 현재마커를 추가
		markers.push(marker);
	}
		
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	//var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	//검색된 마커들 위치로 지도를 재조정
	function setBounds(){
		map.setBounds(bounds);
	}
	
	</script>
	<script>
	$(document).ready(function(){
		$('#hos_search').click(function(event){
			if($('#sml_region').val()=="0" || $('#region').val()=="0" ){
				
				alert('지역을 선택해 주세요.');
			}
			else{
				gethospital($('#sml_region').val(), $('#emergency').prop('checked'));
			}
		});
	});
	//$('#sml_region') 지역구 카테고리로 검색하고 병원리스트 가져오는 함수.
	function gethospital(addr, isEmer){
		$('#hospList').empty();
		 $.ajax({
			url:'/hospital/search/'+addr+'/'+isEmer,
			type:'GET',
			contentType:'application/json; charset=UTF-8',
			dataType:'json',
			success:function(data){
				// 지도에 표시되고 있는 마커를 제거합니다
			    removeMarker();
				//console.log(data.length);
				//좌표 객체 초기화
				bounds = new kakao.maps.LatLngBounds(); 
				$.each(data, function(index, item){
					geocoder.addressSearch(item.hospital_addr, function(result, status){
						
				        //응급지료가능 병원일경우 마커 이미지교체
				        if(item.isEmergency == 1){
				    		 createMarker(result[0].x, result[0].y, "/resources/img/placeholder_red.png",item.hospital_name, item.hospital_addr ,item.isEmergency);
				        }
				        else{
				        	
							/* //새로운 마커를 찍음						
							var marker = new kakao.maps.Marker();
							//마커 위치설정
							marker.setPosition(new kakao.maps.LatLng(result[0].y, result[0].x));
							//마커 찍음
							marker.setMap(map); */
				        	// 마커 이미지의 이미지 크기 입니다
				     		createMarker(result[0].x, result[0].y,"/resources/img/placeholder.png",item.hospital_name, item.hospital_addr ,item.isEmergency);
				        }
						
						// LatLngBounds 객체에 좌표를 추가합니다
					    bounds.extend(new kakao.maps.LatLng(result[0].y, result[0].x));
						
						//console.log('index='+index);
						//표시된 마커들로 지도를 재조정하는 함수
						setBounds();
						console.log(item.hospital_name);
						//병원 리스트 지도 밑에 출력
						var output='';
						output += '<div data-animate="fadeInUp" class="col-md-3">';
						output += '<div class="team-member">';
						output += '<div class="image">';
						output += '<a href="'+item.hospital_name+'">';
						output += '<img src="/resources/img/hospital/'+item.hospital_img+'" alt="" class="img-fluid rounded-circle" style="height: 250px;"></a>';
						output += '</div>';
						output += '<h3 style="font-size: 25px;">';
						output += '<a href="B동물병원상세페이지">'+item.hospital_name+'</a></h3>';
						output += '<p style="font-size: 25px;">★★★★★</p>';
						output += '<div class="text">';
						output += '<div>'+item.hospital_addr+'</div>'
						output += '<div>'+item.hospital_phone+'</div>';
						output += '</div></div></div>';
						$('#hospList').append(output);
						
						
					});
				});
			},
			error:function(){
				alert("ajax 통신 실패!!!");
			}
		 });
		//window.location.href = "/hospital/search"+"?"+$.param({"hospital_addr":addr});
	}
	
	</script>
</body>
</html>