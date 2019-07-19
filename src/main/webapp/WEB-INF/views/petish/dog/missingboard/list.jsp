<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.util.*" %>
<%@ page import = "com.community.petish.dog.missingboard.dto.*" %>
<%@ page import = "com.community.petish.dog.missingboard.domain.*" %>
<%
	List<DogLostPostResponseListDTO> dtoList = (List<DogLostPostResponseListDTO>)request.getAttribute("dtoList");
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

<link href="/resources/css/dog/missingboard/list.css" rel="stylesheet">
<script src="/resources/js/dog/missingboard/post.js"></script>

<!-- <script>
$(document).ready(function(){
	
	varPostUL = $('.post');
	
	function showList(){
		console.log("게시글 리스트");
		
		service.getPostList(function(postCnt, list){
			console.log("postCnt : " + postCnt);
			console.log("list : " + list);
			console.log(list);
			
			var str = "";
			
			if(list == null || list.length==0){
				return;
			}
			
			for(var i=0, len=list.length || 0; i<len; i++){
				str += "<tr><td><span class="badge badge-info">발견 완료</span></td>"
				str += "<td><img src='/resources/img/dog.jpg' class='img-fluid'></td>"
				str += "<td colspan='10'>" + "[" +list[i].regionId+ "] "
				str += list[i].speciesId+ " / " +list[i].dogGender+ " / " +list[i].dogAge
				str += "<div style='padding:1rem'></div><span class='badge badge-secondary'>"
				str += "댓글수<span></td>"
				str += "<td>" +list[i].userId + "</td>"
				str += "<td class='test'>"+list[i].createDate+"+</td>"
				str += "<td class='test'>"+list[i].viewCount+"</td>"
			}
			
			PostUL.html(str);
			
			showPostPage(postCnt);
			
		});
	}
	
	/*
	<tr>
		<td><span class="badge badge-info">발견 완료</span></td>
		<td><img src="/resources/img/detailsquare.jpg" alt="..."
			class="img-fluid"></td>
		<td colspan="10">[인천 서구] 페키니즈 / 남 / 2 &nbsp &nbsp <span
			class="badge badge-secondary">40</span></td>
		<td>Pet</td>
		<td class=test>2019.07.01</td>
		<td class=test>11</td>
	</tr>
	*/
	
});
</script> -->

</head>

<body>
	<div id="all">

		<%@ include file="/WEB-INF/views/commons/top.jspf"%>

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
		
		<div style="padding:0.5rem"></div>
		
		<div id="content">
			<div class="container" >
				<div style="text-align:right; margin:1rem">		
				<button class="btn btn-template-outlined">
					<a href="/dog/missingboard/writeForm">
					글쓰기
					</a>
				</button>
				</div>
				
					<div id="customer-order" class="col-lg-20">
						<table class="table" id="post" style="text-align:center">
							<tr>
								<th width="130px" class="condition border-top-0">상태</th>              
                      			<th width="200px" class="image border-top-0">이미지</th>                     
                        		<th width="550px" class="title border-top-0" colspan="10">제목</th>
                       	 		<th width="100px" class="writer border-top-0">작성자</th>
                        		<th width="130px" class="test border-top-0">작성일</th>                     
                        		<th width="100px" class="test border-top-0">조회</th>
							</tr>
							
							
						<% 
							for (int i=0; i<dtoList.size(); i++)
							{
								DogLostPostResponseListDTO dto = (DogLostPostResponseListDTO)dtoList.get(i);
								
								String address = dto.getDOG_LOST_ADDRESS();
								
								String[] array = address.split(" ");
								
								String addr1 = null;
								String addr2 = null;
								
								if(array[0] != null)
								addr1 = array[0];
								
								if(array[1] != null)
								addr2 = array[1];
								
								String addrSplit = addr1 + " " + addr2;
								
						%>
							<tr>							
								<%
									if(dto.getFOUND() == 0) {
								%>
								<td><span class="badge badge-danger">미발견</span></td>
								<%
									} else{
								%>
								<td><span class="badge badge-info">발견</span></td>
								<%
									}
								%>								
								
								<td><img src="<%=dto.getDOG_IMAGE() %>" alt="..."
									class="img-fluid" style="width:30px!important; height:30px!important;"></td>
								<td colspan="10"><a href="/dog/missingboard/detail/<%=dto.getID() %>">[<%=addrSplit %>] <%=dto.getDOG_SPECIES() %> / <%=dto.getDOG_GENDER() %> / <%=dto.getDOG_AGE() %></a>
								<a style="padding:0.15rem"></a>
								<span class="badge badge-secondary">5</span>
								</td>
								<td>
									<div class="nav navbar-nav ml-auto">
										<a href="#" data-toggle="dropdown" class="dropdown"><%=dto.getUSER_ID() %></a>
										<div class="dropdown-menu">
											<div class="dropdown"><a href="#" class="nav-link">게시글보기</a></div>
											<div class="dropdown"><a href="#" class="nav-link">쪽지보내기</a></div>
										</div>
									</div>

								</td>
							  	<td class=test></td>  
                       			<td class=test><%=dto.getVIEW_COUNT()%></td>  
							</tr>
						<%
							}
						%>

						</table>
					</div>
			</div>


			<div aria-label="Page navigation example" class="d-flex justify-content-center">
				<ul class="pagination">
					<li class="page-item"><a href="#" class="page-link"> <i
							class="fa fa-angle-double-left"></i></a></li>
					<li class="page-item active"><a href="#" class="page-link">1</a></li>
					<li class="page-item"><a href="#" class="page-link">2</a></li>
					<li class="page-item"><a href="#" class="page-link">3</a></li>
					<li class="page-item"><a href="#" class="page-link">4</a></li>
					<li class="page-item"><a href="#" class="page-link">5</a></li>
					<li class="page-item"><a href="#" class="page-link"><i
							class="fa fa-angle-double-right"></i></a></li>
				</ul>
			</div>
			
			<div style="padding:1rem"></div>
				
			<div aria-label="Page navigation example" class="d-flex justify-content-center">

				<!-- 검색 기능 -->
				<div class="col-md-2 col-lg-2">
					<div class="form-group">
						<select id="state" class="form-control" style="min-width: 2cm;">
							<option>제목</option>
							<option>내용</option>
							<option>작성자</option>
						</select>
					</div>
				</div>

				<div class="panel panel-default sidebar-menu">
					<div class="panel-body">
						<form role="search" style="margin-right: 15px;">
							<div class="input-group">
								<input type="text" placeholder="Search" class="form-control"><span
									class="input-group-btn">
									<button type="submit" class="btn btn-template-main">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div>
						</form>
					</div>
				</div>				
			</div>
			
			<div style="padding:1rem"></div>

		</div>
	</div>
	
	<script src="/resources/js/dog/missingboard/list.js"></script>

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