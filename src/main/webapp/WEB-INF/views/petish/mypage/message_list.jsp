<%@page import="com.community.petish.mypage.dto.MessageRequestDTO"%>
<%@page import="com.community.petish.mypage.dto.MessageResponseDTO"%>
<%@ page import="java.util.*"%>
<%@ page import="com.community.petish.mypage.*"%>
<%
	ArrayList<MessageResponseDTO> receivedList = (ArrayList) request.getAttribute("receivedList");
	int undeletedReceived = (int) request.getAttribute("undeletedReceived");
	ArrayList<MessageResponseDTO> sentList = (ArrayList) request.getAttribute("sentList");
	int undeletedSent = (int) request.getAttribute("undeletedSent");
	MessageResponseDTO dto = null;
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CSS파일 추가 -->
<link rel="stylesheet" href="/resources/css/mypage/mypage.css">

<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<style>
.modal {
	position: fixed;
	top: 15%;
	left: 0;
	z-index: 1050;
	display: none;
	width: 100%;
	height: 100%;
	overflow: hidden;
	outline: 0
}
</style>


<body>
	<!-- 테이블 -->
	<div id="all">

		<%@ include file="/WEB-INF/views/commons/top.jspf"%>

		<div id="content">
			<div class="container">

				<div>
					<div style="max-width: 20cm; margin: auto;" id="checkout">
						<div style="margin-top: 5rem;">
							<h3>쪽지함</h3>
						</div>
						<div class="box border-bottom-0" style="margin-top: 0rem;">

							<!-- <form method="get" action=""> -->

							<ul id="pills-tab" role="tablist"
								class="nav nav-pills nav-justified">
								<li class="nav-item"><a id="pills-profile-tab"
									data-toggle="pill" href="#message-receive" role="tab"
									aria-controls="pills-profile" aria-selected="false"
									class="nav-link active">받은 쪽지함</a></li>
								<li class="nav-item"><a id="pills-home-tab"
									data-toggle="pill" href="#message-send" role="tab"
									aria-controls="pills-home" aria-selected="true"
									class="nav-link">보낸 쪽지함</a></li>
							</ul>

							<div id="pills-tabContent" class="tab-content">
								<div id="message-receive" role="tabpanel"
									aria-labelledby="pills-home-tab"
									class="tab-pane fade show active">
									<div class="row">
										<div class="col-md-12">
											<div class="tile">
												<div class="tile-body">
													<table class="table table-hover table-bordered"
														id="sampleTable">

														<!-- 받은 쪽지 -->
														<thead>
															<tr align="center">
																<th><input type="checkbox" id="received-check-all"></th>
																<th class="mobile-none">보낸사람</th>
																<th class="mobile-none">제목</th>
																<th class="mobile-none">날짜</th>
																<th class="mobile-none">수신확인</th>
															</tr>
														</thead>
														<tbody>
															<%
																for (int i = 0; i < receivedList.size(); i++) {
																	dto = receivedList.get(i);
																	if (dto.getDeleted() == 0) {
															%>
															<tr align="center">
																<th><input type="checkbox"
																	class="received-check-one"></th>
																<td align="center" class="mobile-none"><%=dto.getSender_id()%></td>
																<td><a href="#" class="messageText"
																	data-toggle="modal"
																	data-target="#messageRead_receive-modal" ><%=dto.getTitle()%></a></td>
																<td class="mobile-none"><%=dto.getSent_date().substring(2, 4) + "/" + dto.getSent_date().substring(4, 6) + "/"
																+ dto.getSent_date().substring(6, 8)%></td>
																<td class="mobile-none">
																	<%
																		if (dto.getRead() == 0) {
																	%> <i class="fa fa-envelope" style="font-size: 24px;"></i>
																	<%
																		} else if (dto.getRead() == 1) {
																	%> <i class="fa fa-envelope-open"
																	style="font-size: 24px; color: grey"></i> <%
 	}
 %>
																</td>
															</tr>
															<!-- 받은 쪽지 보기 모달창 -->
															<div id="messageRead_receive-modal" tabindex="-1"
																role="dialog" aria-hidden="true" class="modal fade">
																<div role="document" class="modal-dialog">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h4 align="center" class="modal-title">받은 쪽지</h4>
																			<button type="button" data-dismiss="modal"
																				aria-label="Close" class="close">
																				<span aria-hidden="true">×</span>
																			</button>
																		</div>
																		<div class="modal-body">
																			<form action="" method="get">
																				<div class="form-group">
																					<label>보낸 사람</label> <input id="message_sender"
																						type="text" class="form-control"
																						value=<%=dto.getSender_id()%> readonly>
																				</div>
																				<div class="form-group">
																					<label>보낸 날짜</label> <input id="message_date"
																						type="text" class="form-control"
																						value=<%=dto.getSent_date()%> readonly>
																				</div>
																				<div class="form-group">
																					<textarea id="message_content" rows="10"
																						class="form-control" readonly>
																						<%=dto.getContent() %>
																						</textarea>
																				</div>
																				<div class="text-center">
																					<a href='./detail?id=<%=dto.getId()%>'>확인</a>
																					<a href='./delete?id=<%=dto.getId()%>'>삭제</a>
																				</div>
																			</form>
																		</div>
																	</div>
																</div>
															</div>
															<%
																}
																}
															%>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div id="message-send" role="tabpanel"
									aria-labelledby="pills-profile-tab" class="tab-pane fade">
									<div class="row">
										<div class="col-md-12">
											<div class="tile">
												<div class="tile-body">
													<table class="table table-hover table-bordered"
														id="sampleTable">

														<!-- 보낸 쪽지 -->
														<thead>
															<tr align="center">
																<th><input type="checkbox" id="sent-check-all"></th>
																<th class="mobile-none">받는사람</th>
																<th class="mobile-none">제목</th>
																<th class="mobile-none">날짜</th>
																<th class="mobile-none">수신확인</th>
															</tr>
														</thead>
														<tbody>
															<%
																for (int i = 0; i < sentList.size(); i++) {
																	dto = sentList.get(i);
																	if (dto.getDeleted() == 0) {
															%>
															<tr align="center">
																<th><input type="checkbox"
																	class="received-check-one"></th>
																<td align="center" class="mobile-none"><%=dto.getReceiver_id()%></td>
																<td><a href="#" class="messageText"
																	data-toggle="modal"
																	data-target="#messageRead_send-modal"><%=dto.getTitle()%></a></td>
																<td class="mobile-none"><%=dto.getSent_date().substring(2, 4) + "/" + dto.getSent_date().substring(4, 6) + "/"
																+ dto.getSent_date().substring(6, 8)%></td>
																<td class="mobile-none">
																	<%
																		if (dto.getRead() == 0) {
																	%> <i class="fa fa-envelope" style="font-size: 24px;"></i>
																	<%
																		} else if (dto.getRead() == 1) {
																	%> <i class="fa fa-envelope-open"
																	style="font-size: 24px; color: grey"></i> <%
 	}
 %>
																</td>
															</tr>
															<!-- 보낸 쪽지 보기 모달창 -->
															<div id="messageRead_send-modal" tabindex="-1"
																role="dialog" aria-hidden="true" class="modal fade">
																<div role="document" class="modal-dialog">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h4 align="center" class="modal-title">보낸 쪽지</h4>
																			<button type="button" data-dismiss="modal"
																				aria-label="Close" class="close">
																				<span aria-hidden="true">×</span>
																			</button>
																		</div>
																		<div class="modal-body">
																			<form action="" method="get">
																				<div class="form-group">
																					<label>받는 사람</label> <input id="message_sender"
																						type="text" class="form-control" value=<%=dto.getReceiver_id() %> readonly>
																				</div>
																				<div class="form-group">
																					<label>보낸 날짜</label> <input id="message_date"
																						type="text" class="form-control" value=<%=dto.getSent_date() %> readonly>
																				</div>
																				<div class="form-group">
																					<label>내용</label>
																					<textarea id="message_content" rows="10"
																						class="form-control" readonly><%=dto.getContent() %></textarea>
																				</div>
																				<div class="text-right"><a href='./delete?id=<%=dto.getId()%>'>삭제</a></div>
																			</form>
																		</div>
																	</div>
																</div>
															</div>
															<%
																}
																}
															%>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- 페이징 -->
							<div class="d-flex justify-content-center">
								<div>
									<!-- class="col-lg-9 -->
									<div id="pagination" class="wp-example">
										<div class="row">
											<nav aria-label="Page navigation example">
												<ul class="pagination">
													<li class="page-item"><a href="#" class="page-link">«</a></li>
													<li class="page-item active"><a href="#"
														class="page-link">1</a></li>
													<li class="page-item"><a href="#" class="page-link">2</a></li>
													<li class="page-item"><a href="#" class="page-link">3</a></li>
													<li class="page-item"><a href="#" class="page-link">4</a></li>
													<li class="page-item"><a href="#" class="page-link">5</a></li>
													<li class="page-item"><a href="#" class="page-link">»</a></li>
												</ul>
											</nav>
										</div>
									</div>
								</div>
							</div>


							<div class="content">
								<div class="row"></div>
							</div>

							<div
								class="box-footer d-flex flex-wrap align-items-center justify-content-between">
								<div class="left-col">
									<a href="" class="btn btn-secondary mt-0" id="delete-choice">선택
										삭제</a> <a href="" class="btn btn-secondary mt-0" id="delete-all">전체
										삭제</a>
								</div>
							</div>
							<!-- </form> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
	<script>
		$(document).ready(function() {

			$('#received-check-all').change(function() { //전체 체크 변화 다루는 함수        	
				if (this.checked) { //전체(All) 체크된 경우
					$('.received-check-one').prop('checked', true);
				}

				else { //전체(All) 체크되지 않은 경우(체크 해제)

					$('.received-check-one').prop('checked', false);
				}
			});

			$('#sent-check-all').change(function() { //전체 체크 변화 다루는 함수        	
				if (this.checked) { //전체(All) 체크된 경우
					$('.sent-check-one').prop('checked', true);
				}

				else { //전체(All) 체크되지 않은 경우(체크 해제)

					$('.sent-check-one').prop('checked', false);
				}
			});

			//선택 삭제 버튼
			$('#delete-choice').click(function() {
				alert("선택 삭제");
			});

			//전체 삭제 버튼
			$('#delete-all').click(function() {
				alert("전체 삭제");
			});

		});
	</script>

	<!-- Javascript files-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/popper.js/umd/popper.min.js">
		
	</script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/vendor/jquery.cookie/jquery.cookie.js"></script>
	<script src="/resources/vendor/waypoints/lib/jquery.waypoints.min.js"></script>
	<script
		src="/resources/vendor/jquery.counterup/jquery.counterup.min.js"></script>
	<script src="/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script
		src="/resources/vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.min.js"></script>
	<script
		src="/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
	<script src="/resources/vendor/jquery.scrollto/jquery.scrollTo.min.js"></script>
	<script src="/resources/js/front.js"></script>

	<script>
		/* 테이블 반응형 */
		$(window).resize(function() {

			if (window.innerWidth < 400) { //0~399
				alert("400");
				$('.mobile-none').css('display', 'none');
			}

			/* if (window.innerWidth >= 400 && window.innerWidth < 700) { //401~700
				alert("700");
				$('.mobile-none').css('display', 'inline-block');
			} */

		})
	</script>

</body>
</html>