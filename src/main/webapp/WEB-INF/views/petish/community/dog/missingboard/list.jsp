<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.community.petish.dog.missingboard.dto.*"%>
<%@ page import="com.community.petish.dog.missingboard.domain.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
	List<DogLostPostResponseListDTO> dtoList = (List<DogLostPostResponseListDTO>) request.getAttribute("dtoList");


	//페이지  번호
	int pageNum = 1;
	if((DogLostPostPageDTO)request.getAttribute("pageMaker") != null){
		DogLostPostPageDTO pageDTO = (DogLostPostPageDTO)request.getAttribute("pageMaker");
		pageNum = pageDTO.getCri().getPageNum();		
		session.setAttribute("pageNum", pageNum);
	}
	
	//게시판 아이디 4번
	session.setAttribute("boardId", "4");
	//유저 아이디 1번
	session.setAttribute("userId", "1");
%>

<!DOCTYPE html>
<html>
<head>
<title>실종견 게시판</title>

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
	href="/resources/mg/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="/resources/img/apple-touch-icon-152x152.png">
<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->

	

<link href="/resources/css/missingboard/list.css" rel="stylesheet">


<script src="https://code.jquery.com/jquery-1.11.3.js"></script>

<script src="/resources/js/missingboard/post.js"></script>
<script src="/resources/js/missingboard/list.js"></script>

</head>

<body>
	<div id="all">

		<%@ include file="/WEB-INF/views/commons/top.jspf"%>

		<form action="/dog/missingboard/<%=pageNum %>" method="post">
			<input type="hidden" value=<%=pageNum %>>
		</form>

		<div id="heading-breadcrumbs">
			<div class="container">
				<div class="row d-flex align-items-center flex-wrap">
					<div class="col-md-7">
						<h1 class="h2">실종견 게시판</h1>
					</div>
					<div class="col-md-5">
						<ul class="breadcrumb d-flex justify-content-end">

						</ul>
					</div>
				</div>
			</div>
		</div>

		<div style="padding: 0.5rem"></div>

		<div id="content">
			<div class="container">
				<div style="text-align: right; margin: 1rem">
					<button class="btn btn-template-outlined">
						<a href="/dog/missingboard/writeForm"> 글쓰기 </a>						
					</button>
				</div>

				<div id="customer-order" class="col-lg-20">
					<table class="table" id="post" style="text-align: center">
						<tr>
							<th width="130px" class="condition border-top-0">상태</th>
							<th width="200px" class="image border-top-0">이미지</th>
							<th width="550px" class="title border-top-0" colspan="10">제목</th>
							<th width="100px" class="writer border-top-0">작성자</th>
							<th width="130px" class="test border-top-0">작성일</th>
							<th width="100px" class="test border-top-0">조회</th>
						</tr>
						
						<%
						if(dtoList.size() != 0){
							for (int i = 0; i < dtoList.size() ; i++) {
								DogLostPostResponseListDTO dto = (DogLostPostResponseListDTO) dtoList.get(i);

								int index = i;
								
								//실종 장소
								String address = dto.getDog_lost_address();								
								String[] array = address.split(" ");
								
								String addr1 = null;
								String addr2 = null;
								
								if (array.length >0 && array[0] != null)
									addr1 = array[0];

								if (array.length >0 && array[1] != null)
									addr2 = array[1];

								String addrSplit = addr1 + " " + addr2;
								
								
						%>
						<tr>
							<%
								if (dto.getFound() == 0) {
							%>
							<td><span class="badge badge-danger">미발견</span></td>
							<%
								} else {
							%>
							<td><span class="badge badge-info">발견</span></td>
							<%
								}
							%>
							
							<td id="imageInsert<%=index%>">
								<%-- <img src="<%=dto.getDog_image()%>" alt="..." class="img-fluid" 
								style="width: 30px !important; height: 30px !important;"> --%>
								
							</td>
								
							<td colspan="10"><a
								href="/dog/missingboard/detail/<%=dto.getId()%>">[<%=addrSplit%>]
									<%=dto.getDog_species()%> / <%=dto.getDog_gender()%> / <%=dto.getDog_age()%></a>
								<a style="padding: 0.15rem"></a> <span
								class="badge badge-secondary">5</span></td>
							<td>
								<div class="nav navbar-nav ml-auto">
									<a href="#" data-toggle="dropdown" class="dropdown"><%=dto.getNickname() %></a>
									<div class="dropdown-menu">
										<div class="dropdown">
											<a href="/mypage/member/detail" class="nav-link">게시글보기</a>
										</div>
										<div class="dropdown">
											<a href="#" class="nav-link">쪽지보내기</a>
										</div>
									</div>
								</div>

							</td>
							<td class=test>
							<fmt:formatDate pattern="yyyy-MM-dd" value="<%=dto.getCreate_date() %>"/>
							</td>
							<td class=test><%=dto.getView_count()%></td>
						</tr>
						<%
							}
						}
						%>

					</table>
					
					<!-- 페이징  -->			
					<div aria-label="Page navigation example" class="d-flex justify-content-center">
						<ul class="pagination">
						
						<c:if test="${pageMaker.prev }">
							<li class="page-item"><a href="${pageMaker.startPage-1 }" name="pagination_button" class="page-link">
							<i class="fa fa-angle-double-legt"></i></a></li>
						</c:if>
						
						<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
							<li class="page-item ${pageMaker.cri.pageNum == num ? "active" : ""}" >
							<a href="${num }" class="page-link" name="pagination_button">${num }</a></li>
						</c:forEach>
						
						<c:if test="${pageMaker.next }">
							<li class="page-item">
							<a href="${pageMaker.endPage+1 }" class="page-link" name="pagination_button">
							<i class="fa fa-angle-double-right"></i></a></li>
						</c:if>
						
						</ul>
					</div>
					
					
				</div>
			</div>	

			<div style="padding: 1rem"></div>	
			
			<!-- 검색 -->
			<div aria-label="Page navigation example"
				class="d-flex justify-content-center">
				<div class="col-md-2 col-lg-2">
					<div class="form-group">
           				<form id="searchForm" action="/dog/missingboard/list" style="margin-right: 15px;">
							<select id="state" name="type" class="form-control" style="min-width: 2cm;">
		           				<option value=""
	           					<c:out value="${pageMaker.cri.type == null ? 'selected':''}"/>>--</option>
	           					<option value="T"
	           					<c:out value="${pageMaker.cri.type eq 'T' ? 'selected':''}"/>>제목</option>	           				
	           					<option value="W"
	           					<c:out value="${pageMaker.cri.type eq 'W' ? 'selected':''}"/>>작성자</option>
	           				<%--<option value="C"
	           			    	<c:out value="${pageMaker.cri.type eq 'C' ? 'selected':''}"/>>내용</option>
	           					<option value="TC"
	           					<c:out value="${pageMaker.cri.type eq 'TC' ? 'selected':''}"/>>제목 or 내용</option>
	           					<option value="TW"
	           					<c:out value="${pageMaker.cri.type eq 'TW' ? 'selected':''}"/>>제목 or 작성자</option>
	           					<option value="TWC"
	           					<c:out value="${pageMaker.cri.type eq 'TWC' ? 'selected':''}"/>>제목 or 내용 or 작성자</option> --%>	
	           					</select>
	           		
								<div class="input-group">
			           			<input type='text' name='keyword' placeholder="Search" class="form-control" 
			           			value='<c:out value="${pageMaker.cri.keyword}"/>' />
			           			
			           			<input type='hidden' name='pageNum'
			           			value='<c:out value="${pageMaker.cri.pageNum}"/>' />
			           			<input type='hidden' name='amount'
			           			value='<c:out value="${pageMaker.cri.amount}"/>' />
			           			
			           			
			           			<span class="input-group-btn">
									<button type="submit" id="searchBtn" class="btn btn-template-main">
									<i class="fa fa-search"></i>
									</button>
								</span>
								
								</div>
							</form>
						</div>
					</div>
				</div>				
			</div>
       
            
			<div style="padding: 1rem"></div>
		</div>
	</div>
	
	<!-- 페이징.
	 -->
	<form id='actionForm' action="/dog/missingboard/list" method='get'>
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
		<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type }"/>'>
		<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>'>
	</form>


	<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
	<script>
	$(document).ready(function(){
		
				 
		//즉시 실행 함수
		   (function(){
			 <% 
			 	for (int i = 0; i < dtoList.size() ; i++) {
			 		
					DogLostPostResponseListDTO dto = (DogLostPostResponseListDTO) dtoList.get(i);
					
					int index = i;
			 %>
	          
			  var id = <%=dto.getId()%>;
	          
	          $.getJSON("/dog/missingboard/getAttachList/<%=dto.getId()%>", function(arr){              
	              
                  var str = "";
	              //첨부된 이미지 파일 출력
	              $(arr).each(function(i, attach){
	            	  
	                  if(attach.fileType){	                	
	                    var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/"+attach.uuid +"_"+attach.fileName); //파일 이름(썸네일)
	              			                   
	                    str += "<img id='lostdog' style='width:150px!important; height:150px!important; max-width:150px!important; max-heigth:150px!important;' src='/display?fileName="+fileCallPath+"'>";                                   
	                  	
	                    return false; //첨부된 사진들 중 맨 첫번쨰 사진만 출력	                    
	                   }	                  
	              });

	              $("#imageInsert<%=index%>").append(str);
	                
	              });//end getjson 
	              
	          <%	      
			 	}
			 %>
	        })();//end function
	        
	     
	        
		
		
		//삭제 확인 메세지
		if ('${delete_msg}' == "success")
			alert("게시글 삭제 완료");
		else if ('${delete_msg}' == "failure")
			alert("게시글 삭제 실패");
		
		//각각 페이지 버튼
		 var actionForm = $("#actionForm");
	 	 //var paginateBtn = $(""')
		
	 	 $("a[name='pagination_button']").on("click", function(e){
	 	 
		 //$(".paginate_button a").on("click", function(e) {

				e.preventDefault();

				console.log('click');

				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
		 
		 /* $(".move").on("click", function(e) {
			 e.preventDefault();
			 actionForm.append("<input type='hidden' name='bno' value='"
								+ $(this).attr("href")
								+ "'>");
			 actionForm.attr("action", "/board/get");
			 actionForm.submit();

			}); */ 
		 
		//검색
		 var searchForm = $("#searchForm");
		 $("#searchBtn").on("click", function(e){
			 
			 alert("click");
			 
			 if(!searchForm.find("option:selected").val()){
				 alert("검색종류를 선택하세요");
				 return false;
			 }
			 
			 if(!searchForm.find("input[name='keyword']").val()){
				 alert("키워드를 입력하세요");
				 return false;
			 }
			 
			 //검색 결과 페이지 1페이지
			 searchForm.find("input[name='pageNum']").val("1");
			 e.preventDefault();
			 
			 searchForm.submit();
		 })
		 
		
        
		
	});
	</script>
	
	<!-- Javascript files-->

	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/popper.js/umd/popper.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/vendor/jquery.cookie/jquery.cookie.js"></script>
	<script src="/resources/vendor/waypoints/lib/jquery.waypoints.min.js"></script>
	<script
		src="/resources/vendor/jquery.counterup/jquery.counterup.min.js"></script>
	<script src="/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script
		src="/resources/vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.min.js"></script>
	<script src="/resources/js/jquery.parallax-1.1.3.js"></script>
	<script
		src="/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
	<script src="/resources/vendor/jquery.scrollto/jquery.scrollTo.min.js"></script>
	<script src="/resources/js/front.js"></script>

</body>
</html>