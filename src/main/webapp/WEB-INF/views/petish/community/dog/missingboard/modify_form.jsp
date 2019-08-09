<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.community.petish.dog.missingboard.dto.*"%>
<%@ page import="com.community.petish.community.dog.missingboard.dto.DogLostPostResponseDetailDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
   DogLostPostResponseDetailDTO dto = (DogLostPostResponseDetailDTO) request.getAttribute("dto");

   //페이지 번호
   String pageNum = session.getAttribute("pageNum").toString();   

   //강아지 종
   String dogSpecies = dto.getDog_species(); //강아지 종 이름
   Long speciesId = dto.getSpecies_id();
   System.out.println("종" + dto.getSpecies_id());

   //강아지 특징
   String dogDescriptions = dto.getDog_description();
   String des[] = dogDescriptions.split(" / ");
   
%>

<!DOCTYPE html>
<html>
<head>
   <script src="/resources/vendor/jquery/jquery.min.js"></script>
<meta charset="utf-8">
<title></title>

<style>
.uploadResult {
    width: 100%;
  }
  
  .btn-warning {
     background-color: #ffffff!important;
     border-color: #ffffff!important;
  }
  
  .uploadResult ul {
    display: flex;
    flex-flow: row;
    justify-content: center;
    align-items: center;
  }
  
  .uploadResult ul li {
    list-style: none;
    padding: 10px;
  }
  
  .uploadResult ul li img {
    width: 100px;
  }
  
  .bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
}

.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}   
  </style>

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
                        <h3 class="text-uppercase">글 수정</h3>
                     </div>
                     <div class="col-lg-10 text-right p-3"
                        style="display: inline-block;">
                        <a href="/dog/missingboard/list?pageNum=<%=pageNum %>"
                           class="btn btn-template-outlined" style="margin-top: 10px;">목록</a>
                     </div>
                     <h4 style="display: inline-block;">[실종견 정보]</h4>
                     <div class="col-md-10 text-right" style="display: inline-block;">
                        <input type="checkbox" name="found" id="FOUND" value="0">
                        <span style="color: red;"><b> 반려견을 찾았습니다.</b></span>
                     </div>
                     <form action="/dog/missingboard/modify" id="modifyForm" method="post">
                        <div class="row">

                           <input type="hidden" id="ID" name="id" value=<%=dto.getId()%>>
                           <%-- <input type="hidden" id="USER_ID" name="user_id" value=<%=dto.getUser_id() %>> --%>

                           

                           <div class="col-sm-6 col-md-2">
                              <div class="form-group">
                                 <label for="category">이름</label>
                                 <input type="text" name="dog_name" id="DOG_NAME" value=<%=dto.getDog_name()%> class="form-control">
                              </div>
                           </div>
                           <div class="col-sm-6 col-md-2">
                              <div class="form-group">
                                 <label for="category">나이</label> <input type="text"
                                    name="dog_age" id="DOG_AGE" value=<%=dto.getDog_age()%>
                                    class="form-control">
                              </div>
                           </div>
                        </div>
                        <div class="row">
                           <div class="col-sm-6 col-md-4">
                              <div class="form-group">
                                 <label for="category">종</label>
                                 <select id="SPECIES_ID" name="species_id" value="<%=dto.getSpecies_id() %>" class="form-control">
                                    <option value="0">종</option>
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
                                 <div class="checkbox" style="padding-top: 10px;">
                                    <%
                                       if (dto.getDog_gender().equals("수컷")) {
                                    %>
                                    <input type="radio" value="수컷" name="dog_gender" id="DOG_GENDER_M" checked><label>수컷</label>
                                    <input type="radio" value="암컷" name="dog_gender" id="DOG_GENDER_F"><label>암컷</label>
                                    <%
                                       } else {
                                    %>
                                    <input type="radio" value="수컷" name="dog_gender" id="DOG_GENDER_M"><label>수컷</label>
                                    <input type="radio" value="암컷" name="dog_gender" id="DOG_GENDER_F" checked><label>암컷</label>
                                    <%
                                       }
                                    %>
                                    
                                 </div>

                              </div>
                           </div>
                        </div>
                        
                        
                        <div class="row">
                                 <div class="col-md-4">
                                      <div class="panel panel-default">
                                    
                                    <!-- <div class="form-group"> -->
                                       
                                       <!-- <div class="panel-heading">파일 첨부</div> -->
                                       <div class="panel-body">
                                          <div class="form-group uploadDiv">
                                            <label>사진 추가</label>
                                            <input type="file" id="uploadFile" name="dogImage" value=<%=dto.getDog_image() %> multiple>
                                            <input type="hidden" name='dog_image' value=<%=dto.getDog_image() %>> 
                                         </div>
                                         
                                         <div class='uploadResult'>
                                             <label>첨부된 파일</label>
                                            <ul>
                                               
                                            </ul>                                
                                         </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                        
                        
                        <div class="row">
                           <div class="col-md-8">
                              <div class="form-group">
                              
                                 <!-- 합친 특징 보냄 -->
                                 <input type="hidden" name="dog_description">                                             
                              
                                 <label for="password_old">특징</label>
                                 <% if(des.length < 5) { 
                                    //특징 5개 미만일때만 추가 버튼 보여줌 %>
                                 <button id="addButton" class="btn btn-sm btn-template-main" type="button" 
                                 onclick="insRow()" style="font-size: 0.9rem; margin-left:0.2rem;'"> + </button>
                                 <% } %>
                                 
                                 <br>
                                 
                                 <% for(int i=0; i<des.length; i++){ %>
                                 <input type="text" name="dog_description<%=i+1%>" id=description<%=i+1%> value="<%=des[i]%>" class="form-control" style="display: inline-block; width: 80%; margin-top:5px;">
                                 <button onclick="removeRow()" type="button" style="font-size: 0.9rem;" class="btn btn-sm btn-template-main">삭제</button>
                                 <%} %>
                                 
                                 <div id="addHere">
                                 <!-- 특징 추가될 위치 -->
                                          </div> 

                              </div>
                           </div>
                        </div>
                        
                        <hr>
                        <h4>[실종 관련 정보]</h4>
                        <div class="row">
                           <div class="col-sm-6 col-md-4">
                              <div class="form-group">
                                 <label for="category">연락처</label> <input type="text"
                                    name="phone_number" id="PHONE_NUMBER" value="<%=dto.getPhone_number()%>"
                                    class="form-control">

                              </div>
                           </div>
                           <div class="col-sm-6 col-md-4">
                              <div class="form-group">
                                 <label for="category">사례금</label> <input type="text"
                                    name="reward" id="REWARD" value="<%=dto.getReward()%>"
                                    class="form-control">

                              </div>
                           </div>
                        </div>

                        <div class="row">

                           <div class="col-sm-6 col-md-4">
                              <div class="form-group">
                                 <label for="category">실종 일시</label>
                                 <input id="datetimepicker" name="dog_lost_date" type="datetime"
                                    value="<fmt:formatDate pattern='yyyy/MM/dd HH:mm' value='<%=dto.getCreate_date() %>'/>" class="form-control">

                              </div>
                           </div>
                        </div>

                        <div class="row">
                           <div class="col-md-6">
                              <div class="form-group">
                                 <label for="category">실종 장소</label>
                                 <input id="place" name="dog_lost_address" type="text"
                                    value="<%=dto.getDog_lost_address()%>" class="form-control">
                              </div>
                           </div>
                           <div class="col-md-1.5" style="padding-top: 6px;">
                              <div class="form-group">
                                 <label for="category"> </label> <input type="button"
                                    class="form-control" value="검색"
                                    onclick="openZipcode(this.form)" />
                              </div>
                           </div>
                        </div>

                        <div class="map_wrap">
                           <div id="map"
                              style="width: 100%; height: 350px; position: relative; overflow: hidden;"></div>
                        </div>

                        <div class="row" style="padding-top: 10px;">
                           <div class="col-md-3">
                              <a href="/dog/missingboard/delete/<%=dto.getId()%>"
                                 class="btn btn-template-outlined" style="margin-top: 0px;">삭제</a>
                           </div>
                           <div class="col-md-9 text-right">
                              <input type="button" id="modify_post" value="수정"
                                 class="btn btn-template-outlined">
                              <button onclick="href='redirect:history.go(-1)'" class="btn btn-template-outlined">취소</button>
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
   
   <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59e90ffa4462049931ee4536f504c27b&libraries=services"></script>   
      
   <script>
   
   //특징 추가
    var addIndex = <%=des.length%>; //현재 있는 특징 갯수
    var addPlace;
    
    function insRow() {
       alert("insRow()!");
         
        addPlace = $("#addHere"); //추가할 위치 
        
         // 특징 입력 폼 추가
        var frmTag = '<div id="removeDiv"><input type="text" class="form-control" id="description'+(++addIndex)+'" name="addDescriptions" style="display: inline-block!important; margin-top:5px; width: 80%!important;">';      
        frmTag += '<button onclick="removeRow()" type="button" style="font-size: 0.9rem; margin-left:0.2rem;" class="btn btn-sm btn-template-main">삭제</button></div>';
         
        // 특징 항목 입력 5개로 제한
        if($("input[name=addDescriptions]").length + <%=des.length%> >= 5){
            alert("최대 5개 항목까지만 입력 가능합니다.");
            return;
         }      
         addPlace.append(frmTag);
     }
   
   //삭제 클릭한 특징 입력 폼 삭제 
   function removeRow(){
         alert("Remove");
         $('#removeDiv').remove();      
      }
   
   
   var species = "<%=dto.getDog_species()%>"
      
      //강아지 종류 SELECT
      $('#SPECIES_ID option').each(function() {
         if (this.innerText == species) {
            this.selected=true;            
         }
      });
   
    $(document).ready(function() {
       
       //즉시 실행 함수
       (function(){             
         var id = '<c:out value="${dto.id}"/>';          
          
         //저장된 이미지 가져옴
         $.getJSON("/dog/missingboard/getAttachList/<%=dto.getId()%>", function(arr){            
            console.log(arr);            
            var str = "";

            $(arr).each(function(i, attach){
                
                //image type
                if(attach.fileType){
                  var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
                  
                  str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
                  str +=" data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
                  str += "<span> "+ attach.fileName+"</span>";
                  str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' "
                  str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
                  str += "<img src='/display?fileName="+fileCallPath+"'>";
                  str += "</div>";
                  str +"</li>";
                }
                
             });            
            
            $(".uploadResult ul").html(str);
            
            });//end getjson
        })();//end function       
      
        
        //첨부 파일 삭제(화면에서만 삭제)
         $(".uploadResult").on("click", "button", function(e){
            
            console.log("delete file");
              
            if(confirm("이미지를 삭제하시겠습니까? ")){
            
              var targetLi = $(this).closest("li");
              targetLi.remove();

            }
         });
        
        
        var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
        var maxSize = 5242880; //5MB        
        
        //파일 크기, 확장자 체크
          function checkExtension(fileName, fileSize){
         
         if(fileSize >= maxSize){
           alert("파일 사이즈 초과");
           return false;
         }            
         if(regex.test(fileName)){
           alert("해당 종류의 파일은 업로드할 수 없습니다.");
           return false;
         }
         
            return true;
          }
     
     //첨부 파일 추가(화면에서만 추가)
       $("input[type='file']").change(function(e){

         var formData = new FormData();         
         var inputFile = $("input[id='uploadFile']");         
         var files = inputFile[0].files;
         
         for(var i = 0; i < files.length; i++){
           if(!checkExtension(files[i].name, files[i].size) ){
             return false;
           }
           formData.append("uploadFile", files[i]);
         }         
                
         
         $.ajax({
           url: '/uploadAjaxAction',
           processData: false, 
           contentType: false,
           data: formData,
           type: 'POST',
           dataType:'json',
             success: function(result){
               console.log(result); 
             showUploadResult(result); //업로드 결과 처리 함수 

           }
         }); //$.ajax
         
       });
     
    //추가한 첨부 파일 화면에 출력
      function showUploadResult(uploadResultArr){
        
         if(!uploadResultArr || uploadResultArr.length == 0){ return; }
         
         var uploadUL = $(".uploadResult ul");
         
         var str ="";
         
         $(uploadResultArr).each(function(i, obj){
           
           if(obj.image){
              
              var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
              
              str += "<li data-path='"+obj.uploadPath+"'";
              str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
              str +" ><div>";
              str += "<span> "+ obj.fileName+"</span>";
              str += "<button type='button' data-file=\'"+fileCallPath+"\' "
              str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
              str += "<img src='/display?fileName="+fileCallPath+"'>";
              str += "</div>";
              str +"</li>";
           }
         });
         
         uploadUL.append(str);
       }
    
      
   //found 수정 
    $('#FOUND').change(function(){
       var checked = $(this).prop('checked');  // checked 상태 (true, false)
    
       if(checked){
          $('#FOUND').prop("value","1");
        }
        else{
           $('#FOUND').prop("value","0");
        }

    });
   
    //게시글 수정
    var formObj = $('#modifyForm');
    
       $('#modify_post').on("click", function(e){
          
          e.preventDefault();    
          
          //강아지 특징 수정
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
          
         //특징 새로 넣어줌
           $("input[name=dog_description]").val(description); //특징 입력 폼 5개 -> 1개로 합침
          
         //첨부 이미지         
         var str = "";
         
          $(".uploadResult ul li").each(function(i, obj){
                   
                var jobj = $(obj);
                
                console.dir(jobj);
                
                console.log("-------------------------");
                console.log(jobj.data("filename"));                
                
                str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";     
                str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";             
                str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";             
                str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
                
            });
            console.log(str);
               
             //성별
            var gender = $('input[type=radio]:checked').val();
            $("input[name=dog_gender]").val(gender);
          
          formObj.append(str).submit(); //폼 전송   
          
       });

      //지도
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
               setMarker(result[0].x, result[0].y);
          }
      };
      
      //입력받은 실종 장소 출력
      geocoder.addressSearch("<%=dto.getDog_lost_address()%>", callback);
      
      var marker = new kakao.maps.Marker();

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
      }
   });
   </script>
   
   
   <!-- Javascript files-->

   <script src="/resources/vendor/popper.js/umd/popper.min.js">
      
   </script>
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
   <script src="/resources/js/boardMap/modify_map.js"></script>
   <script src="/resources/js/region.js"></script>



</body>
</html>