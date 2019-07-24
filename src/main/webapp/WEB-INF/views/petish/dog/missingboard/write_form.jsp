<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   //유저 아이디
   String str = session.getAttribute("userId").toString();
   Long userId = Long.parseLong(str);
   System.out.println("접속한 유저아이디(글 작성) : " + userId);
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title></title>


<!-- 부트스트랩 추가 -->
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

<!-- datetimepicker 추가 -->
<link rel="stylesheet" type="text/css"
   href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.css">

<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
        
<!-- CSS 파일 추가 --> 
<link rel="stylesheet" href="/resources/css/write-modify.css">
<link rel="stylesheet" href="/resources/css/commons/kakaomap.css">

</head>

<body>
   <div id="all">

      <%@ include file="/WEB-INF/views/commons/top.jspf"%>

      <div id="heading-breadcrumbs">
         <div class="container">
            <div class="row d-flex align-items-center flex-wrap">
               <div class="col-md-7">
                  <h1 class="h2">강아지 실종견게시판</h1>
               </div>
               <div class="col-md-5">
                  <ul class="breadcrumb d-flex justify-content-end">
                     <li class="breadcrumb-item"><a href="index.html">강아지</a></li>
                     <li class="breadcrumb-item active">실종견게시판</li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
      <div id="content">
         <div class="container">
            <div>
               <div id="customer-account">
                  <div class="box mt-5" style="margin-top: 20px;">
                     <div class="heading" id="head">
                        <h3 class="text-uppercase">글 쓰기</h3>
                     </div>
                     <div class="col-lg-10 text-right p-3"
                        style="display: inline-block;">
                        <a href="/dog/missingboard/list"
                           class="btn btn-template-outlined" style="margin-top: 10px;">목록</a>
                     </div>
                     <h4>[실종견 정보 작성]</h4>
                     <!-- <form name="dogLostPostForm" id="dogLostPostForm" action="/dog/missingboard/register"
                        method="post" enctype="multipart/form-data"> -->
                     <form name="dogLostPostForm" id="dogLostPostForm" method="post">
                        <input type="hidden" name="USER_ID" id="USER_ID" value=<%=userId%>>

                        <div class="row">
                           <div class="col-sm-6 col-md-2">
                              <div class="form-group">
                                 <label>이름</label> <input id="DOG_NAME" type="text"
                                    class="form-control">
                              </div>
                           </div>
                           <div class="col-sm-6 col-md-2">
                              <div class="form-group">
                                 <label>나이</label> <input type="text" class="form-control"
                                    name="DOG_AGE" id="DOG_AGE">
                              </div>
                           </div>
                        </div>
                        <div class="row">
                           <div class="col-sm-6 col-md-4">
                              <div class="form-group">
                                 <label for="category">종</label> <select name="SPECIES_ID" id="SPECIES_ID"
                                    class="form-control">
                                    <option value="">종</option>
                                    <option value="1">믹스견</option>
                                    <option value="2">스피츠</option>
                                    <option value="3">시츄</option>
                                    <option value="4">요크셔테리어</option>
                                    <option value="5">말티즈</option>
                                    <option value="6">포메라니안</option>
                                    <option value="7">푸들</option>
                                    <option value="8">치와와</option>
                                    <option value="9">미니핀</option>
                                    <option value="10">슈나우저</option>
                                    <option value="11">페키니즈</option>
                                    <option value="12">닥스훈트</option>
                                    <option value="13">빠삐용</option>
                                    <option value="14">비숑프리제</option>
                                    <option value="15">보스턴테리어</option>
                                    <option value="16">샤페이</option>
                                    <option value="17">웰시코기</option>
                                    <option value="18">비글</option>
                                    <option value="19">코카스파니엘</option>
                                    <option value="20">불독</option>
                                    <option value="21">사모에드</option>
                                    <option value="22">피레니즈</option>
                                    <option value="23">리트리버</option>
                                    <option value="24">말라뮤트</option>
                                    <option value="25">한국토종견</option>
                                    <option value="26">허스키</option>
                                    <option value="27">세퍼트</option>
                                    <option value="28">하운드</option>
                                    <option value="29">달마시안</option>
                                    <option value="30">콜리</option>
                                    <option value="31">쉽독</option>
                                    <option value="32">기타 강아지</option>
                                 </select>
                              </div>
                           </div>

                           <div class="col-sm-6 col-md-2">
                              <div class="form-group">
                                 <label>성별</label>
                                 <!-- <div class="checkbox" id="dogGender" -->
                                 <div class="checkbox" style="padding-top: 10px;">
                                    <input type="radio" value="수컷" name="DOG_GENDER" id="DOG_GENDER"> 수컷
                                    <input type="radio" value="암컷" name="DOG_GENDER" id="DOG_GENDER"> 암컷
                                 </div>
                              </div>
                           </div>
                        </div>

                        <div class="row">
                           <div class="col-md-4">
                              <div class="form-group">
                                 <label>사진</label> <input type="file" name="DOG_IMAGE" id="DOG_IMAGE">
                              </div>
                           </div>
                        </div>
                        <div class="row">
                           <div class="col-md-8">
                              <div class="form-group">
                                 <label style="display: block">특징(최대 5개까지 입력)</label>

                                 <table id="addTable">
                                    <input type="text" class="form-control" id="description1" name="DOG_DESCRIPTION"
                                       style="display: inline-block; width: 80%;">
                                       
                                    <!-- <input type="text" class="form-control" id="description2" name="DOG_DESCRIPTION"
                                       style="display: inline-block; width: 80%;">
                                    <input type="text" class="form-control" id="description3" name="DOG_DESCRIPTION"
                                       style="display: inline-block; width: 80%;">
                                    <input type="text" class="form-control" id="description4" name="DOG_DESCRIPTION"
                                       style="display: inline-block; width: 80%;">
                                    <input type="text" class="form-control" id="description5" name="DOG_DESCRIPTION"
                                       style="display: inline-block; width: 80%;"> -->   
                                       
                                    <button name="addButton" class="btn btn-sm btn-template-main" type="button"
                                    onClick="insRow()" style="font-size: 0.9rem !important;">추가</button>
                                 </table>
                                                                     
                              </div>
                           </div>
                        </div>

                        <hr>

                        <h4>[실종 관련 정보 작성]</h4>
                        <div class="row">
                           <div class="col-sm-6 col-md-4">
                              <div class="form-group">
                                 <label for="category">실종 일시</label> <input
                                    id="datetimepicker" name="DOG_LOST_DATE" id="DOG_LOST_DATE" type="datetime"
                                    class="form-control">
                                 <!-- type="datetime-local" -->
                              </div>
                           </div>
                        </div>

                        <div class="row">
                           <div class="col-md-6">
                              <div class="form-group">
                                 <label for="category">실종 장소</label>
                                 <input name="DOG_LOST_ADDRESS" id="place" type="text" class="form-control">
                              </div>
                           </div>
                           <div class="col-md-1.5" style="padding-top: 6px;">
                              <div class="form-group">
                                 <label for="category"></label> <input type="button"
                                    class="form-control" value="검색"
                                    onclick="openZipcode(this.form)" />
                              </div>
                           </div>
                        </div>
                        <div class="map_wrap">
                           <div id="map"
                              style="width: 100%; height: 350px; position: relative; overflow: hidden;"></div>
                        </div>
                        <div style="padding: 20px;"></div>

                        <div class="row">
                           <div class="col-sm-6 col-md-4">
                              <div class="form-group">
                                 <label for="category">사례금</label> <input type="text"
                                    class="form-control" name="REWARD" id="REWARD">
                              </div>
                           </div>
                        </div>

                        <div class="row">
                           <div class="col-sm-6 col-md-4">
                              <div class="form-group">
                                 <label for="category">연락처</label>
                                 <input type="text" class="form-control" name="PHONE_NUMBER" id="PHONE_NUMBER">
                                 <!-- <select name="PHONE_NUMBER1" class="form-control">
                                    <option value="010" selected>010</option>
                                    <option value="011">011</option>
                                    <option value="016">016</option>
                                    <option value="017">017</option>
                                    <option value="018">018</option>
                                    <option value="019">019</option>
                                 </select>
                                 <input type="text" class="form-control" name="PHONE_NUMBER2">
                                 <input type="text" class="form-control" name="PHONE_NUMBER3">    -->            
                              </div>
                           </div>
                        </div>

                        <div class="row" style="padding-top: 10px;">
                           <div class="col-md-12 text-right">
                              <input type="button" value="확인"
                                 class="btn btn-outline-primary" id="input_post" name="input_post" style="margin: 1rem">
                              <input type="reset" value="취소"
                                 class="btn btn-outline-primary" name="resetBtn">
                           </div>
                        </div>
                     </form>

                  </div>

               </div>

            </div>
         </div>
      </div>
   </div>
   
   <script src="https://code.jquery.com/jquery-1.11.3.js"></script>   
   <!-- 입력 AJAX -->
   <script>
   
   </script>  
   
   <script> 
   $(document).ready(function() {
	   
	   var inputBtn = $("#input_post");	   
	   
	   inputBtn.on("click", function(e){
		   e.preventDefault();
		   	alert("click");		   	
		   	
		 	//강아지 특징
	         var description = "";          
	         if($('#description1').val())
	            description += "" + $('#description1').val();
	         if($('#description2').val())
	            description += " / " + $('#description2').val();
	         if($('#description3').val())
	            description += " / " + $('#description3').val();
	         if($('#description4').val())
	            description += " / " + $('#description4').val();
	         if($('#description5').val())
	            description += " / " + $('#description5').val();
	         alert(description);
	         
	         //연락처
	         var telephone = "";
	         if($('#tel1').val() != '')
	            telephone += "" + $('#tel1').val();
	         if($('#tel2').val() != '')
	            telephone += "-" + $('#tel2').val();
	         if($('#tel3').val() != '')
	            telephone += "-" + $('#tel3').val();
	         alert(telephone);
	         
	         //입력 데이터
	         var post = {
	               "dog_name" : $('#DOG_NAME').val(),
	               "dog_age" : $("#DOG_AGE").val(),
	               "dog_gender" : $("input:radio[name=DOG_GENDER]:checked").val(),
	               "dog_description" : description,
	               "dog_image" : $('#DOG_IMAGE').val(),
	               "dog_lost_date" : $('input[name="DOG_LOST_DATE"]').val(),
	               "phone_number" : $('#PHONE_NUMBER').val(),
	               "dog_lost_address" :  $('input[name="DOG_LOST_ADDRESS"]').val(),
	               "reward" : $('#REWARD').val(),
	               "user_id" : $('#USER_ID').val(),
	               "species_id" : $('#SPECIES_ID').val()
	         };	         
	         alert(JSON.stringify(post));
	         
	         add(post, function(result){
	        	alert(post);
	        	alert(result);
	         });	         
	   });
	   
	   function add(post, callback, error){      	
	       $.ajax({
	          url : '/dog/missingboard/POST',
	          type : 'POST',
	          data : JSON.stringify(post),
	          dataType:"json",
	          contentType : 'application/json; charset=utf-8',
	          success : function(retVal) {
	        	  alert("200!!")
	          	if (retVal.res == "OK") {
						alert("입력 성공");
					} else {
						alert("입력 실패");
					}
	          },
	          error : function() {
					alert("AJAX 통신 실패");
				}
	       }); //ajax
	       //event.preventDefault();
	   } //add	   
	   
   });
   </script>
   
   <script src="/resources/vendor/jquery/jquery.min.js"></script>
   
   <script>
// 강아지 특징 작성하는 input 폼 추가
   var oTbl;
   var descriptionIndex = 1;
   function insRow() {

   	oTbl = document.getElementById("addTable"); // 입력 폼

   	var oRow = oTbl.insertRow();
   	oRow.onmouseover = function() {
   		oTbl.clickedRowIndex = this.rowIndex // clickedRowIndex - 클릭한 Row의
   												// 위치를 확인;
   	};

   	var oCell = oRow.insertCell();
   	
   	// 삽입될 Form Tag
   	var frmTag = '<input type="text" class="form-control" id="description'+(++descriptionIndex)+'" name="DOG_DESCRIPTION" style="display: inline-block; width: 80%;">';
   	
   	
   	frmTag += "<button onClick='removeRow()' style='font-size: 0.9rem; margin-left:0.2rem;' class='btn btn-sm btn-template-main'>삭제</button>";

   	oCell.innerHTML = frmTag;
   }
   // 특징 input 행 삭제
   function removeRow() {
   	oTbl.deleteRow(oTbl.clickedRowIndex);
   }
   </script>
   
   
   <!-- JS 파일 추가 -->
   <script src="/resources/js/missingboard/post.js"></script>
   
   <!-- Javascript files-->
   <script src="/resources/vendor/popper.js/umd/popper.min.js"></script>
   <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
   <script src="/resources/vendor/jquery.cookie/jquery.cookie.js">
      
   </script>
   <script src="/resources/vendor/waypoints/lib/jquery.waypoints.min.js">
      
   </script>
   <script
      src="/resources/vendor/jquery.counterup/jquery.counterup.min.js">
      
   </script>
   <script src="/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
   <script
      src="/resources/vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.min.js"></script>
   <script src="/resources/js/jquery.parallax-1.1.3.js"></script>
   <script
      src="/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
   <script src="/resources/vendor/jquery.scrollto/jquery.scrollTo.min.js"></script>
   <script src="/resources/js/front.js"></script>


   <!-- 다음지도 api 추가 -->
   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59e90ffa4462049931ee4536f504c27b&libraries=services"></script>

   <script
      src="/resources/datetimepicker/build/jquery.datetimepicker.full.min.js"></script>

   <script src="/resources/js/datepicker.js"></script>
   <script src="/resources/js/boardMap/write_map.js"></script>
   <script src="/resources/js/region.js"></script>

</body>
</html>