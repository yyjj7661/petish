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
<style>
/* 이미지 업로드 관련 */
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

#description1, .description2, .description3, .description4, .description5{
    display: inline-block;
    width: 80%;
    border-radius: 0;
    height: calc(1.5em + .75rem + 2px);
    padding: .375rem .75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: .25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
  }
</style>


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
                        <a href="/dog/missingboard/list" class="btn btn-template-outlined" style="margin-top: 10px;">목록</a>
                     </div>
                     <h4>[실종견 정보 작성]</h4>
                     <!-- <form name="dogLostPostForm" id="dogLostPostForm" action="/dog/missingboard/register"
                        method="post" enctype="multipart/form-data"> -->
                        
                     <form role="form" name="dogLostPostForm" id="dogLostPostForm"
                     action="/dog/missingboard/register" method="post">
                     	<!-- user_id -->
                        <input type="hidden" name="user_id" id="USER_ID" value=<%=userId%>>

                        <div class="row">
                           <div class="col-sm-6 col-md-2">
                              <div class="form-group">
                                 <label>이름</label> <input id="DOG_NAME" name="dog_name" type="text"
                                    class="form-control">
                              </div>
                           </div>
                           <div class="col-sm-6 col-md-2">
                              <div class="form-group">
                                 <label>나이</label> <input type="text" class="form-control"
                                    name="dog_age" id="DOG_AGE">
                              </div>
                           </div>
                        </div>
                        <div class="row">
                           <div class="col-sm-6 col-md-4">
                              <div class="form-group">
                                 <label for="category">종</label> <select name="species_id" id="SPECIES_ID"
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
                                    <input type="radio" value="수컷" id="male"> 수컷
                                    <input type="radio" value="암컷" id="female"> 암컷
                                    <input type="hidden" value="" name="dog_gender">
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
                                      <label>사진</label>
                                      <input type="file" id="uploadFile" name='dog_image' multiple>
                                   </div>
                                   
                                   <div class='uploadResult'>
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
                                 <label style="display: block">특징(최대 5개까지 입력)</label>

                                 <table class="addTable">
                                    <input type="text" class="form-control" id="description1" name="dog_description"
                                       style="display: inline-block; width: 80%;">
                                    <!-- 추가 버튼 -->
                                    <button id="addButton" class="btn btn-sm btn-template-main" type="button"
                                    onClick="insRow()" style="font-size: 0.9rem; margin-left:0.2rem;'">추가</button>                                    
                                    
                                    <div id="addHere">
                                    </div>                                    
                                    <!-- <input type="text" class="form-control" id="description2" name="DOG_DESCRIPTION"
                                       style="display: inline-block; width: 80%;">
                                       
                                    <!-- 폼 추가될 자리 -->
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
                                    id="datetimepicker" name="dog_lost_date" id="DOG_LOST_DATE" type="datetime"
                                    class="form-control">
                                 <!-- type="datetime-local" -->
                              </div>
                           </div>
                        </div>

                        <div class="row">
                           <div class="col-md-6">
                              <div class="form-group">
                                 <label for="category">실종 장소</label>
                                 <input name="dog_lost_address" id="place" type="text" class="form-control">
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
                                    class="form-control" name="reward" id="REWARD">
                              </div>
                           </div>
                        </div>

                        <div class="row">
                           <div class="col-sm-6 col-md-4">
                              <div class="form-group">
                                 <label for="category">연락처</label>
                                 <input type="text" class="form-control" name="phone_number" id="PHONE_NUMBER">
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
   $(document).ready(function() {      
      
      var formObj = $("form[role='form']");
      
      
     /*  function imageAttach(){
         
       e.preventDefault();        
        console.log("imageAttach clicked");
        
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
        formObj.append(str).submit();      
        
      }; */

      
      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
      var maxSize = 5242880; //5MB
      
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
      
      $("input[type='file']").change(function(e){

        var formData = new FormData();
        
        var inputFile = $("#uploadFile");
        
        var files = inputFile[0].files;
        
        for(var i = 0; i < files.length; i++){

          if(!checkExtension(files[i].name, files[i].size) ){
            return false;
          }
          formData.append("uploadFile", files[i]);
          
        }
        
        //사진 등록(경로 C:\\)
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
      
      
      //파일 첨부 시 미리보기 썸네일 출력
      function showUploadResult(uploadResultArr){
   
       alert("showUploadResult 호출");
         
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
                 
                 console.log("(obj.image)str : " + str);
              }
          else{
             var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);               
              var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
                
             str += "<li "
             str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
             str += "<span> "+ obj.fileName+"</span>";
             str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
             str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
             str += "<img src='/resources/img/attach.png'></a>";
             str += "</div>";
             str +"</li>";
             
             console.log("str : " + str)
          }

        });
        
        //console.log("[append 전 ]str : " + str)
        uploadUL.append(str);
      }
      
      
      //첨부 파일 미리보기에서 삭제
      $(".uploadResult").on("click", "button", function(e){
           
        console.log("delete file");
          
        var targetFile = $(this).data("file");
        var type = $(this).data("type");
        
        var targetLi = $(this).closest("li"); //미리보기에서 삭제
        
        console.log("targetFile : " + targetFile); 
        console.log("type : " + type); 
        
        
        $.ajax({
          url: '/deleteFile',
          data: {fileName: targetFile, type:type},
          dataType:'text',
          type: 'POST',
            success: function(result){
               alert(result);
               
               targetLi.remove();
             }
        }); //$.ajax
       });
      
      
      
      
      //글 입력 버튼
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
            
           //첨부 이미지     
           console.log("imageAttach clicked");
        
           var str = "";
           
           var fileName = "";
           var uuid = "";
           var uploadPath = "";
           var fileType = "";
           
           //성별 바뀔때마다           
           $('#input[name=dog_gender]').change(function(){
		    var checked = $(this).prop('checked');  // checked 상태 (true, false)
		   
		    var gender = $("input[name='dog_gender']:checked").val(); 
	        alert(gender);	           
		    
		    if(gender == "수컷"){
		    	$("input[name='dog_gender']").prop("value","수컷")
	        }
	        else{
	        	$("input[name='dog_gender']").prop("value","암컷")
	        }
		    
		 });
           
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
           
           //console.log(str);       
           
           //특징
           $("input[name=dog_description]").val(description); //특징 입력 폼 5개 내용 1개로
           
           //성별
           var gender = $('input[type=radio]:checked').val();
           alert(gender);
           $("input[name=dog_gender]").val(gender);
           
           
           formObj.append(str).submit(); //폼 전송
           
           
            //입력 데이터
            /* var post = {
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
             
                  "attachList" : [
                     {"fileName", $(jobj).data("filename")},
                     {"fileName", $(jobj).data("filename")},
                     {"fileName", $(jobj).data("filename")},
                     {"fileName", $(jobj).data("filename")},                     
                  ]
                  
            };            
            alert(JSON.stringify(post));
            
            add(post, function(result){
              alert(post);
              alert(result);
            });             */
            
      });
      
      function add(post, callback, error){         
          $.ajax({
             url : '/dog/missingboard/POST',
             type : 'POST',
             data : JSON.stringify(post),
             dataType:"json",
             contentType : 'application/json; charset=utf-8',
             success : function(retVal) {
                alert("200!!");
                if (retVal.res == "OK") {
                  alert("입력 성공");
                  //location.href="/dog/missingboard/list";
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
   
   
   <script>

// 강아지 특징 작성하는 input 폼 추가
   var addPlace; 
   var descriptionIndex = 1;
   
   //특징 입력 폼 추가
   function insRow() {
	   alert("insRow()!");
      //oTbl = document.getElementById("addTable");

      //var oRow = oTbl.insertRow(); // <tr> 추가
      //oRow.onmouseover = function() {
      //   oTbl.clickedRowIndex = this.rowIndex; // clickedRowIndex : 클릭한 Row의 위치
      //};

      //var oCell = oRow.insertCell(); // <td> 추가
      
      addPlace = $("#addHere"); //추가할 위치      
      
      // 특징 입력 폼 추가
      var frmTag = '<input type="text" class="form-control" id="description'+(++descriptionIndex)+'" name="addDescriptions" style="display: inline-block!important; margin-top:5px; width: 80%!important;">';      
      frmTag += '<button id="removeBtn'+(++descriptionIndex)+'" onclick="removeRow(descriptionIndex)" type="button" style="font-size: 0.9rem; margin-left:0.2rem;" class="btn btn-sm btn-template-main">삭제</button>';
      
      // 특징 항목 입력 5개
      if($("input[name=addDescriptions]").length >= 4){
    	  alert("최대 5개 항목까지만 입력 가능합니다.");
    	  return;
      }      
      addPlace.append(frmTag);      
      //oCell.innerHTML = frmTag;
   }   
   // 특징 input 행 삭제
   function removeRow(i){
	   
	   alert("Remove");
	   alert(i);
	   
	   //$( 'button' ).remove('$(button[id="removeBtn'+i+'"])');
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