<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%Long id = (Long)session.getAttribute("id"); %>
<html>
<head>
	<meta charset="utf-8">
	<title>PET HOSPITAL</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="robots" content="all,follow">

	<!-- 평점 별  -->
	<link rel="stylesheet" href="/resources/css/hospital/star.css">
	<!-- 평점 별  -->
	<link rel="stylesheet" href="/resources/css/hospital/detail.css">
	<link rel="stylesheet" href="/resources/css/write-modify.css">

</head>

<%@ include file="/WEB-INF/views/commons/link.jspf" %>


<body>
	<div id="all">

		<%@ include file="/WEB-INF/views/commons/top.jspf" %>



		<div id="content">
			<div class="container">
				<div class="bar">
					
						<div class="col-md-12">
							<div class="heading" id="head">
								<h2 class="text-uppercase">PET HOSPITAL</h2>
							</div>
							<div class="col-lg-8 text-right p-3" style="display:inline-block;">
										<a href="/dog/freeboard/list" class="btn btn-template-outlined"
											style="margin-top: 10px;">목록</a>
							</div>
						</div>
					
					<div class="row portfolio text-center">
						<div class="col-md-6">
							<div class="hospital-image">
								<div class="image">
									<img src="/resources/img/hospital/${hospital.hospital_img }" alt="" class="img-fluid">
								</div>
							</div>
						</div>
						
						<div class="col-md-6">
							<div class="icon">
							<ul>
									<div class="fa fa-star" id="spec" aria-hidden="true"style="font-size:24px;">
										평점 : <span class='star-rating'>
											<span style ="width:${score }%"></span>
										</span>
									</div>
								
									<div class="fa fa-home fa-pull-left fa-fw" id="spec" aria-hidden="true"style="font-size:24px;">
										<span id="hospital_name">${hospital.hospital_name }</span>
									</div>
								
								
									<div class="fa fa-map-marker fa-pull-left fa-fw" id="spec" aria-hidden="true"style="font-size:24px;">
										<span id="hospital_address">${hospital.hospital_addr }</span>
									</div>
								
								
									<div class="fa fa-phone fa-pull-left fa-fw" id="spec" aria-hidden="true"style="font-size:24px;">
										<span id="phone_number">${hospital.hospital_phone }</span>
									</div>
								
								
									<div class="fa fa-clock-o fa-pull-left fa-fw" id="spec" aria-hidden="true"style="font-size:24px;">
										<span id="opertion_time">${hospital.hospital_hours }</span>
									</div>
								
								
									<div class="fa fa-laptop fa-pull-left fa-fw" id="spec" aria-hidden="true"style="font-size:24px;">
										<span id="site_address">${hospital.hospital_website }</span>
									</div>
								
								<c:if test="${hospital.isParking == 1 }">
									<div class="fa fa-car fa-pull-left fa-fw" id="spec" aria-hidden="true" style="font-size:24px;">
										<span id="parking">주차가능</span>
									</div>
								</c:if>
								 
								 <c:if test="${hospital.isEmergency == 1 }">
									<div class="fa fa-plus-square fa-pull-left fa-fw" id="spec" aria-hidden="true" style="font-size:24px;">
										<span id="emergency">응급진료</span>
									</div>
								</c:if>
								
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
			<c:forTokens var="jinryo" items="${hospital.hospital_check }" delims=",">
				<div class="fa fa-circle" style="font-size:18px;" id="subject">
					<span>${ jinryo}</span>
				</div>
			</c:forTokens>
			
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
			
			<table border="0" width="100%" height="150%">
				<tr>
					<td width="10%" bgcolor="#f5f5f5" id=superbee>

					<span class="star-input">
						  <span class="input">
						    <input style="visibility: hidden;" type="radio" name="star-input" id="p1" value="1"><label for="p1">1</label>
						    <input style="visibility: hidden;" type="radio" name="star-input" id="p2" value="2"><label for="p2">2</label>
						    <input style="visibility: hidden;" type="radio" name="star-input" id="p3" value="3"><label for="p3">3</label>
						    <input style="visibility: hidden;" type="radio" name="star-input" id="p4" value="4"><label for="p4">4</label>
						    <input style="visibility: hidden;" type="radio" name="star-input" id="p5" value="5"><label for="p5">5</label>
						  </span>
	  					<output style="line-height: 50px; vertical-align: middle;" for="star-input"><b>0</b>점</output>
					</span>
					</td>

					<td><input style="width:90%; height:100%; boder:2px solid #38A7BB;" placeholder="자유롭게 작성하되 욕설 및 상대방에게 불쾌감을 줄 수 있는 단어는 금지합니다.(100자 이내)" 
					type="text" id="review_content" maxlength="100" />
						<button type="button" class="btn btn-template-outlined" id="reInsert">작성완료</button>
					</td>			
				</tr>
				<tr>
				</tr>
			</table>

		
			<table class="table table-stripped" >
				<thead>
					<tr style="font-size: 15px;">
						<th width=15%>평점</th>
						<th width=25%>아이디</th>
						<th>내용</th>
					</tr>
				</thead>

				<tbody id="reviews">
				
				</tbody>
			</table>
			<!-- 번호   -->
			<div aria-label="Page navigation" class="d-flex justify-content-center">
				<ul class="pagination" id="paging">
												
           		</ul>
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
		
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e74e0d9232cbccbd2962414bf135d9c&libraries=services"></script>
	
	<script src="/resources/js/hospital/star.js"></script>
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

	//원래 게시글의 모임장소 주소를 좌표로 바꿔주고 지도에 표시해주는 함수//********************************************************
	var callback = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        setMarker(result[0].x, result[0].y,"${hospital.hospital_name }");
	    }
	};
	// '서울 서초구 서초동 1303-34'에 게시글의 모임장소(db값) 넣어준다.**********************************************************
	geocoder.addressSearch("${hospital.hospital_addr }", callback);
	
	var marker = new kakao.maps.Marker();

	//검색 하고 마커 찍어주는 함수
	function setMarker(fa, ga, name){
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
			clickInfowindow(map,marker,name,fa,ga);
		});
	}
	
	function clickInfowindow(map, marker, name,fa,ga){
		var iwContent = '<div style="padding:5px;">'+name+' <br><a href="https://map.kakao.com/link/map/'+name+','+ga+','+fa+'" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/'+name+','+ga+','+fa+'" style="color:blue" target="_blank">길찾기</a></div>';
		 infowindow= new kakao.maps.InfoWindow({
		        position : new kakao.maps.LatLng(ga, fa), 
		        content : iwContent 
		    });
		    
		    infowindow.open(map,marker);
	}
	
	//페이지 버튼 클릭 이벤트
	function pageClick(page){
		getReview("${hospital.id}",page);
	}
	</script>
	
	<script>
	$(document).ready(function(){
		
		getReview("${hospital.id}",1);
		
		$('#reInsert').click(function(event){
			
			var user_id = <%=session.getAttribute("id")%>;
			if(user_id ==null){
				user_id = 4;
			}
			var params = {
					'user_id' : user_id,
					'content' : $('#review_content').val(),
					'score' : $("input[name=star-input]:checked").val(),
					'hospital_id' : "${hospital.id}",
			};
			$.ajax({
				url:'/hospital/review/',
				type:'POST',
				data:JSON.stringify(params),
				contentType:'application/json; charset=utf-8',
				dataType:'json',
				success: function(retVal){
					if(retVal.res == "OK"){
						//데이타 성공일때 이벤트 작성
						getReview("${hospital.id}",1);
						//초기화
						$('#review_content').val('');
					
						
					}
					else{
						alert("Insert Fail!!!");
					}
				},
				error:function(request,status,error){
					alert("ajax 통신 실패!!!");
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

				}
			}); 
			//별점라디오버튼 초기화
			$("input[name=star-input]:radio").prop("checked",false);
			//평점 0점으로 초기화
			$(".star-input").find("output>b").text(0);
			
		});
	});
	
	function getReview(id,page){
		$('#reviews').empty();
		$('#paging').empty();
		$.ajax({
			url:'/hospital/review/'+id+'/'+page,
			type:'GET',
			contentType:'application/json; charset=UTF-8',
			dataType:'json',
			success:function(data){
				
				$.each(data.rlist, function(index, item){
					var output='';
					output += '<tr style="font-size: 15px;">';
					output += '<td>';
					output += '<span class="star-rating"style="text-align:left;">';
					output += '<span style ="width:'+(item.score*20.0)+'%"></span>';
					output += '</span>';
					output += '</td>';
					output += '<td>'+item.user_id+'</td>';
					output += '<td>'+item.content+'</td>';
					output += '</tr>';
					
					
					$('#reviews').append(output);
				});
				//페이징 처리 반복문
				for(var i = data.paging.startPage; i<=data.paging.endPage; i++){
					var output='';
					if(i == data.paging.startPage){
						output += '<li class="page-item"><a class="page-link" onclick="pageClick('+1+')"> <i class="fa fa-angle-double-left"></i></a></li>';
						if(page != 1){
							output += '<li class="page-item"><a class="page-link" onclick="pageClick('+(page-1)+')"> <i class="fa fa-angle-left"></i></a></li>';
						}
					}
					output += '<li class="page-item"id="page'+i+'"><a class="page-link" onclick="pageClick('+i+');">'+i+'</a></li>';
					if(i == data.paging.endPage){
						if(page != data.paging.realEnd){
							output += '<li class="page-item"><a class="page-link" onclick="pageClick('+(page+1)+')"> <i class="fa fa-angle-right"></i></a></li>';
						}
						output += '<li class="page-item"><a class="page-link" onclick="pageClick('+data.paging.realEnd+')"> <i class="fa fa-angle-double-right"></i></a></li>';
					}
					$('#paging').append(output);
					$("#page"+page).attr('class','page-item active');
				}
			},
			error:function(){
				alert("ajax 통신 실패!!!");
			}
		});
		
		
	}
	</script>

	
</body>
</html>