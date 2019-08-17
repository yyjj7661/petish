<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.*, java.sql.*, java.text.*,com.community.petish.community.dog.gatherboard.domain.DogSpeciesVO,com.community.petish.community.dog.gatherboard.dto.response.DogGatherListDTO" %>
<%
	Long REGION_ID = (Long)request.getAttribute("REGION_ID");
%>
<!DOCTYPE html>
<html>
<head>
<title>강아지 정모게시판</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">

<%@ include file="/WEB-INF/views/commons/link.jspf" %>
<link href="/resources/css/fonts.css" rel="stylesheet">
<link href="/resources/css/gatherboard/list.css" rel="stylesheet">      
    <style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px; line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #38a7bb; color:#fff; border-bottom: 1px solid #ddd;border-radius: 6px 6px 0 0;font-size: 14px;}
    .info .close {position: absolute;top: 6px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
</head>

<body style="font-family: 'Do Hyeon', sans-serif; letter-spacing: 1.5px; font-weight:1">
	<div id="all">		
		<%@ include file="/WEB-INF/views/commons/top.jspf" %>

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
					<ul id="pills-tab" role="tablist" class="nav nav-pills nav-justified" style="margin-top: 1cm;">
						<li class="nav-item" id="commented">
							<a data-toggle="pill" href="/dog/gatherboard" role="tab" onclick="viewBoardList()"
							aria-controls="pills-home" aria-selected="true" class="nav-link">게시판으로 보기</a></li>
						<li class="nav-item" id="writing">
							<a data-toggle="pill" href="/dog/gatherboard/mapList" role="tab"
							aria-controls="pills-profile" aria-selected="false" 
							class="nav-link active" onclick="mapListClick()">지도로 보기</a></li>
					</ul>						
				<div id="pills-tabContent" class="tab-content">
					<div role="tabpanel" aria-labelledby="pills-home-tab" class="tab-pane fade show active">																		
						<button type="submit" class="btn btn-template-outlined map-write-button" onclick="writeFormClick();">
							<a>글쓰기</a>
						</button>
					<!-- 검색 -->		
					<form id="categoryForm" action="/dog/gatherboard" method="post">		
						<div id="top-category" aria-label="Page navigation example" class="d-flex justify-content-left">
							<!-- 상단 카테고리 -->
							<div class="col-md-2 col-lg-2">
								<div class="form-group">
									<select id="region-category" class="form-control region-category" onchange="regionSearch()">
										<option value=0>지역</option>
										<option value=1>서울</option>
										<option value=2>경기</option>
										<option value=3>인천</option>
										<option value=4>강원</option>
										<option value=5>대전</option>
										<option value=6>세종</option>
										<option value=7>충남</option>
										<option value=8>충북</option>
										<option value=9>부산</option>
										<option value=10>울산</option>
										<option value=11>경남</option>
										<option value=12>경북</option>
										<option value=13>대구</option>
										<option value=14>광주</option>
										<option value=15>전남</option>
										<option value=16>전북</option>
										<option value=17>제주</option>
									</select>										
								</div>
							</div>
							<!-- 주변 정모 보기 -->		
							<label class="switch">
							  <input type="checkbox" id="chk" checked>
							  <span class="slider round"></span>
							</label>
							<p id="on-off-str">주변 정모 보기</p><p id="on-off-str" style="display:none;">주변 정모 보기</p>		
						</div>					
							<!-- 지역/크기 별 검색 -->
							<input type="hidden" name="type" value="R">
							<input type='hidden' name='keyword' id="categoryKeyword"
			                 value='<c:out value="${pageMaker.cri.keyword}"/>' class="form-control"/>
						</form>	
					<!-- 상단 카테고리 끝 -->								
					<!-- 검색 끝 -->
					<div id="content">
						<div class="container">
					      <div class="bar">
							<div class="col-md-12" id="map">		
								<div id="map" aria-label="Page navigation example" class="d-flex justify-content-left"></div>
									<form name="region-form" id="region-form">
										<input type="hidden" name="REGION_ID" value="<%=REGION_ID%>" />	
									</form>
							</div>
						  </div>
						</div>
					</div>
				
					</div>
               	</div>
            </div>  
		</div>
	</div>
	<!-- include list.js -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e74e0d9232cbccbd2962414bf135d9c&libraries=services"></script>
	<script>
	var regionID = <%=REGION_ID%>;
	//지역 시/군 을 저장할 변수
	var region = '';
	
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

	// 마커를 담을 배열입니다
	var markers = [];

	// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
	var bounds = new kakao.maps.LatLngBounds(); 
	
	var infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
	
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(map,marker,id,title,address_name,hours,fa,ga) {
		// 커스텀 오버레이에 표시할 컨텐츠 입니다
		// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
		// 별도의 이벤트 메소드를 제공하지 않습니다 
		var content = '<div class="wrap" id="overlay'+id+'">' + 
		            '    <div class="info">' + 
		            '        <div class="title">' + title + 
		            '            <div class="close" id="close'+id+'" title="닫기"></div>' + 
		            '        </div>' + 
		            '        <div class="body">' + 
		            '            <div style="padding:8px;">' + 
		            '                <div class="ellipsis">장소 : '+ address_name +'</div>' + 
		            '                <div class="ellipsis">일시 : '+ hours +'</div>' + 
		            '                <div class="jibun ellipsis text-center" style="margin-top:10px;margin-left:20px">' +
		            '                  <button class="btn btn-template-outlined btn-sm" style="padding: 0.1rem 0.5rem;"><a href="https://map.kakao.com/link/map/'+address_name+','+ga+','+fa+'" style="target="_blank">큰지도</a></button>' +
		            '                  <button class="btn btn-template-outlined btn-sm" style="padding: 0.1rem 0.5rem;"><a href="https://map.kakao.com/link/to/'+address_name+','+ga+','+fa+'" style="target="_blank">길찾기</a></button>'+
		 			'				   <a href="/dog/gatherboard/'+id+'" style="float:right; font-size:20px;"><i class="fas fa-plus-circle"></i></a>' +	
		            '                </div>' + 
		            '                <div></div>' + 
		            '            </div>' + 
		            '        </div>' + 
		            '    </div>' +    
		            '</div>';		
		// 마커 위에 커스텀오버레이를 표시합니다
		// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
		var overlay = new kakao.maps.CustomOverlay({
		    content: content,
		    map: map,
		    position: marker.getPosition()       
		});		    
          
	    overlay.setMap(map);
	    
	    $("#close"+id+"").click(function() {
	    	closeOverlay(id);
	    })
	}
	
	// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	function closeOverlay(id) {
		$("#overlay"+id+"").remove();
	}
	

	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}
	// 마커를 찍는 함수
	function createMarker(fa,ga,imgsrc,id,title,addr,hours){
		
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
	    
	  //마커 클릭시 해당 정모의 정보가 나오는 이벤트
		kakao.maps.event.addListener(marker, 'mouseover',function(){
			//displayInfowindow(map,marker,id,title,addr,hours);
		});
		kakao.maps.event.addListener(marker, 'mouseout',function(){
			//infowindow.close();
		});
		kakao.maps.event.addListener(marker, 'click',function(){
			displayInfowindow(map,marker,id,title,addr,hours,fa,ga);
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
	<script src="/resources/js/gatherboard/list.js"></script>
	<script src="/resources/js/gatherboard/mapList.js"></script>
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

</body>
</html>