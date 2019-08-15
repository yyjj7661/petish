$(document).ready(function(){
	regionList();
});

//지역 리스트
function regionList() {
	var params = $("#region-form").serialize(); //입력데이터를 쿼리스트링으로 만들어준다.
	$.ajax({
		url:'/dog/gatherboard/searchMap',
		type:'GET',
		data: params,
		contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		dataType:"json",
		success:function(data){
			//console.log(page);
			
			// 지도에 표시되고 있는 마커를 제거합니다
		    removeMarker();
			//console.log(data.length);
			//좌표 객체 초기화
			bounds = new kakao.maps.LatLngBounds(); 
			$.each(data, function(index, item){
				//console.log(data.scorelist.length);
				//console.log(data.scorelist[0]);
				//console.log(item.hospital_name);
				geocoder.addressSearch(item.gathering_ADDRESS, function(result, status){

						/* //새로운 마커를 찍음						
						var marker = new kakao.maps.Marker();
						//마커 위치설정
						marker.setPosition(new kakao.maps.LatLng(result[0].y, result[0].x));
						//마커 찍음
						marker.setMap(map); */
			        	// 마커 이미지의 이미지 크기 입니다
			     		createMarker(result[0].x, result[0].y,"/resources/img/gatherboard/dog.png",item.id,item.title,item.gathering_ADDRESS, item.GATHERING_DATE);
			      
					
					// LatLngBounds 객체에 좌표를 추가합니다
				    bounds.extend(new kakao.maps.LatLng(result[0].y, result[0].x));
					
					//console.log('index='+index);
					//표시된 마커들로 지도를 재조정하는 함수
					setBounds();
					
				});
			});

					
		},
		error:function() {
			alert("ajax 통신 실패!");
		}
	});
}


function regionSearch() {
	var region = document.getElementById('region-category');
	var regionForm = $("#region-form");
	if(!(region.value == "" || region.value == null)) {
		
		regionForm.find("input[name='REGION_ID']").val(region.value);
		regionList();
	}
}

function userRegionMap(regionID) {
	var regionForm = $("#region-form");
	regionForm.find("input[name='REGION_ID']").val(regionID);
	regionList();
}

function viewBoardList() {
	$.ajax({
		type: "GET",
		url: "/api/users/authenticate",
		success: function(data) {
			location.href="/dog/gatherboard";
		},
		error: function(error) {
			$("#login-modal").modal("show");
		}
	})	
}