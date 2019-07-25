<%@page import="com.community.petish.user.dto.UserResponseDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="com.community.petish.mypage.dto.Writings_LikedDTO"%>
<%@page import="com.community.petish.mypage.dto.Writings_CommentedDTO"%>
<%@page import="com.community.petish.mypage.dto.MyWritingsDTO"%>
<%
	ArrayList<MyWritingsDTO> writingList = (ArrayList) request.getAttribute("writingList");
	ArrayList<Writings_CommentedDTO> writingCommented = (ArrayList) request.getAttribute("writingCommented");
	ArrayList<Writings_LikedDTO> writingLiked = (ArrayList) request.getAttribute("writingLiked");
	MyWritingsDTO dto1 = null;
	Writings_CommentedDTO dto2 = null;
	Writings_LikedDTO dto3 = null;
	UserResponseDTO member = (UserResponseDTO)request.getAttribute("member");
	int user_id = (int)session.getAttribute("user_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Mypage</title>
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

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/resources/css/mypage/mypage.css">
<script src="/resources/js/mypage/mypage.js"></script>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<style>
.dropdown_ {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: grey;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #ddd;
}

.dropdown_:hover .dropdown-content {
	display: block;
}

</style>
</head>

<body>
	<div id="all">

		<%@ include file="/WEB-INF/views/commons/top.jspf"%>

		<!-- 테이블 -->
		<div id="content">
			<div class="container">
				<div id="checkout">
					<div style="max-width: 20cm; margin: auto;">
						<!-- <form method="get" action=""> -->

						<h3 style="margin-top: 10%;">My Page</h3>
						<div class="memberInfo">
							<div style="margin: 0.5cm;">
								<img class="profile" src="/resources/img/member_detail_img.jpg"
									style="margin-right: 30px;"> <a><%=member.getNickname() %>(<%=member.getUsername().substring(0,5) %>***)</a> │ 준회원
								│ <a href="" data-toggle="modal"
									data-target="#messageWrite-modal" class="showmodal" data-id=<%=member.getId() %> data-nick=<%=member.getNickname() %>><i
									class="fa fa-envelope" style="margin-right: 10px;"></i>쪽지 보내기</a>
							</div>
						</div>
						<ul id="pills-tab" role="tablist"
							class="nav nav-pills nav-justified" style="margin-top: 1cm;">
							<li class="nav-item"><a id="pills-profile-tab"
								data-toggle="pill" href="#writingList" role="tab"
								aria-controls="pills-profile" aria-selected="false"
								class="nav-link active">내가 쓴 글</a></li>
							<li class="nav-item"><a id="pills-home-tab"
								data-toggle="pill" href="#writingCommented" role="tab"
								aria-controls="pills-home" aria-selected="true" class="nav-link">내가
									댓글 쓴 글</a></li>
							<li class="nav-item"><a id="pills-home-tab"
								data-toggle="pill" href="#writingLiked" role="tab"
								aria-controls="pills-home" aria-selected="true" class="nav-link">내가
									좋아요 한 글</a></li>
						</ul>

						<div id="pills-tabContent" class="tab-content">
							<div class="text-right">
								<button id="viewMore1" class="btn btn-sm btn-template-main"
									style="margin-bottom: 0.2cm;">더보기</button>
							</div>
							<div id="writingList" role="tabpanel"
								aria-labelledby="pills-home-tab"
								class="tab-pane fade show active">
								<div class="row">
									<div class="col-md-12">
										<div class="tile">
											<div class="tile-body">
												<table class="table table-hover table-bordered"
													id="sampleTable">

													<!-- 받은 쪽지 -->
													<tr align="center" class="font-grey">
														<th>게시판명</th>
														<th>제목</th>
														<th>작성일자</th>
														<th>조회수</th>
													</tr>
													<%
														for (int i = 0; i < writingList.size(); i++) {
															dto1 = writingList.get(i);
													%>
													<tr>
														<th class="font-grey">자유게시판</th>
														<th><a href="" class="nondeco"><%=dto1.getTitle()%></a></th>
														<th class="font-grey"><%=dto1.getCreated_date().substring(2, 4) + "/" + dto1.getCreated_date().substring(4, 6) + "/"
														+ dto1.getCreated_date().substring(6, 8)%></th>
														<th class="font-grey"><%=dto1.getView_count()%></th>
													</tr>
													<%
														}
													%>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div id="writingCommented" role="tabpanel"
								aria-labelledby="pills-profile-tab" class="tab-pane fade">
								<div class="row">
									<div class="col-md-12">
										<div class="tile">
											<div class="tile-body">
												<table class="table table-hover table-bordered"
													id="sampleTable">

													<tr align="center" class="font-grey">
														<th>게시판명</th>
														<th>제목</th>
														<th>작성자</th>
														<th>작성일자</th>
														<th>조회수</th>
													</tr>
													<%
														for (int i = 0; i < writingCommented.size(); i++) {
															dto2 = writingCommented.get(i);
													%>
													<tr>
														<th class="font-grey">자유게시판</th>
														<th><a href="" class="nondeco"><%=dto2.getTitle()%></a></th>
														<%
															long a = dto2.getUser_id();
														%>
														<!-- 1.먼저 해당 구역(이름이 들어가는 tr)안 모든 부분을 div(class="dropdown")으로 묶음 -->
														<th><div class="dropdown_">
																<a href="#" class="nondeco"><%=dto2.getNickname()%></a>
																<!-- db의 닉네임값 들어가는 밑에 div(class="dropdown-content")추가 -->
																<div class="dropdown-content">
																	<a href="./detail?user_id=<%=dto2.getUser_id()%>">작성게시글
																		보기</a> <a href="#" data-toggle="modal"
																		data-target="#new-modal" class="showmodal"
																		data-id=<%=dto2.getUser_id()%> data-nick=<%=dto2.getNickname() %>
																		>쪽지보내기</a>
																</div>
															</div></th>
														<th class="font-grey"><%=dto2.getCreated_date().substring(2, 4) + "/" + dto2.getCreated_date().substring(4, 6) + "/"
															+ dto2.getCreated_date().substring(6, 8)%></th>
														<th class="font-grey">30</th>
													</tr>
													<%
														}
													%>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div id="writingLiked" role="tabpanel"
								aria-labelledby="pills-profile-tab" class="tab-pane fade">
								<div class="row">
									<div class="col-md-12">
										<div class="tile">
											<div class="tile-body">
												<table class="table table-hover table-bordered"
													id="sampleTable">

													<tr align="center" class="font-grey">
														<th>게시판명</th>
														<th>제목</th>
														<th>작성자</th>
														<th>작성일자</th>
														<th>조회수</th>
													</tr>
													<%
														for (int i = 0; i < writingLiked.size(); i++) {
															dto3 = writingLiked.get(i);
													%>
													<tr>
														<th class="font-grey">자유게시판</th>
														<th><a href="" class="nondeco"><%=dto3.getTitle()%></th>
														<th><div class="dropdown_">
																<a href="#" class="nondeco"><%=dto3.getNickname()%></a>
																<!-- db의 닉네임값 들어가는 밑에 div(class="dropdown-content")추가 -->
																<div class="dropdown-content">
																	<a href="./detail?user_id=<%=dto3.getUser_id()%>">작성게시글
																		보기</a> <a href="#" data-toggle="modal"
																		data-target="#new-modal" class="showmodal"
																		data-id=<%=dto3.getUser_id()%>
																		data-nick=<%=dto3.getNickname() %>
																		>쪽지보내기</a>
																</div>
															</div></th>
																<input type="hidden" value=<%=dto3.getUser_id() %> class="receiver_id">
																<input type="hidden" value=<%=dto3.getNickname() %> class="nickname">
														<th class="font-grey"><%=dto3.getCreated_date().substring(2, 4) + "/" + dto3.getCreated_date().substring(5, 7) + "/"
															+ dto3.getCreated_date().substring(8, 10)%></th>
														<th class="font-grey"><%=dto3.getView_count()%></th>
													</tr>
													<%
											
														}
													%>
												</table>
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
	</div>

	<!-- 쪽지보내기 모달창 -->
	<div id="new-modal" tabindex="-1" role="dialog" aria-hidden="true"
		class="modal fade">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 align="center" class="modal-title">쪽지보내기</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>받는사람</label> <input class="form-control" name='nickname'
							readonly>
					</div>
					<input type="hidden" name="receiver_id">
					<div class="form-group">
						<label>제목</label> <input class="form-control" name='title'>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea id="message_content" rows="10" class="form-control"
							name='content'></textarea>
					</div>
					<div class="text-left">
						<input type="button" value="보내기" class="modalSendBtn">
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
	$(document).ready(
			function() {
	var newModal = $("#new-modal");
	var showmodal = $(".showmodal");
	var modalInputReceivedNickname3 = newModal
	.find("input[name='nickname']");
	var modalInputTitle3 = newModal
	.find("input[name='title']");
	var modalInputContent3 = newModal
	.find("textarea[name='content']");
	var modalInputReceiver_id3 = newModal
	.find("input[name='receiver_id']");

	var modalSendBtn = $(".modalSendBtn");
	var user_id = <%=user_id%>;
	
	showmodal.on("click", function(e){
		var id = $(this).data("id");
		var nick = $(this).data("nick");
		modalInputReceiver_id3.val(id);
		modalInputReceivedNickname3.val(nick);
		$("#new-modal").modal("show");
	});
	
	modalSendBtn.on("click", function(e){
						var message = {
								title : modalInputTitle3.val(),	
								content : modalInputContent3.val(),
								sender_id : user_id,
								receiver_id : modalInputReceiver_id3.val()
								
						}
						messageService.writeMessage(message, function(result){
							alert("result : "+result);
						$("#new-modal").modal("hide");
						location.reload();
						});
	});
	//ajax메서드 정의
	var messageService = (function() {
		
		//메세지 작성 메서드
		
		function writeMessage(message, callback, error){
			$.ajax({
				type:'post',
				url : '/mypage/api/message/new',
				data : JSON.stringify(message),
				contentType : "application/json; charset=utf-8",
				success : function(result, status, xhr){
					if(callback){
						callback(result);
					}
				},
				error : function(xhr, status, er){
					if(error){
						error(er);
					}
				}
			})
		}
		return {
			writeMessage : writeMessage
		};
	})();
	
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