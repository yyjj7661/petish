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
	int user_id = (int)session.getAttribute("user_id");
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
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
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
																<td align="center" class="mobile-none"><%=dto.getNickname()%></td>
																<td class="receivedMessage"><a class="messageText"
																	data-id=<%=dto.getId()%>><%=dto.getTitle()%></a></td>
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
															<%
																}
																}
															%>
														</tbody>

														<script>
															function hi() {
																alert("hello0");
																location.href = "www.naver.com";

															}
														</script>
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
																<td align="center" class="mobile-none"><%=dto.getNickname() %></td>
																<td class="sentMessage"><a class="messageText"
																	data-id=<%=dto.getId()%>><%=dto.getTitle()%></a></td>
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
	<!--  쪽지보기 모달창 -->
	<div id="messageRead_receive-modal" tabindex="-1" role="dialog"
		aria-hidden="true" class="modal fade" >
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 align="center" class="modal-title">보낸쪽지</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>닉네임</label> <input class="form-control"
							name='nickname' readonly>
					</div>
					<div class="form-group">
						<label>보낸 날짜</label> <input type="text" class="form-control"
							name='sent_date' readonly>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea id="message_content" rows="10" class="form-control"
							name='content' readonly></textarea>
					</div>
					<div class="text-right">
						<input type="button" value="삭제" class="modalDeleteBtn">
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		//쪽지 상세보기
		$(document).ready(

				function() {
					var modal = $(".modal");
					var modalInputSentNickname = modal
							.find("input[name='nickname']");
					var modalInputReceivedNickname = modal
					.find("input[name='nickname']");
					var modalInputSent_date = modal
							.find("input[name='sent_date']");
					var modalInputContent = modal
							.find("textarea[name='content']");
					var modalDeleteBtn = $(".modalDeleteBtn");
					var user_id = <%=user_id%>;
					//메세지리스트에서 a태그(메세지 제목)을 누르면, 해당 글 id의 세부데이터를 받아서 모달로 보내준다
					$(".receivedMessage").on("click", "a", function(e) {
						var id = $(this).data("id");
						messageService.receivedMessageDetail(id, function(message) {
							modalInputSentNickname.val(message.nickname);
							modalInputSent_date.val(message.sent_date);
							modalInputContent.val(message.content);
							modal.data("id", message.id);
							$(".modal").modal("show");
						});
						
						messageService.changeReadAttr(id, user_id);
						
					});
					
					//모달 닫기버튼 누르면 화면 리로드됨
					$(".close").on("click", function(e){
						location.reload();
					})
					
					$(".sentMessage").on("click", "a", function(e) {
						var id = $(this).data("id");
						messageService.sentMessageDetail(id, function(message) {
							modalInputSentNickname.val(message.nickname);
							modalInputSent_date.val(message.sent_date);
							modalInputContent.val(message.content);
							modal.data("id", message.id);
							$(".modal").modal("show");
						});
						
					});
				
					
					//모달에서 삭제버튼을 클릭하면, 해당id값의 데이터를 삭제하고 모달을 숨긴다(=>리스트 재조회 필요)
					modalDeleteBtn.on("click", function(e){
						var id = modal.data("id");
						messageService.deleteMessage(id, function(result){
							alert(result);
							modal.modal("hide");
							location.reload();
						});
					});

					
					var messageService = (function() {
						//메세지 세부조회 메서드
						function receivedMessageDetail(id, callback, error) {
							$.get("/mypage/api/message/received/" + id + ".json",
									function(result) {
										if (callback) {
											callback(result);
										}
									}).fail(function(xhr, status, err) {
								if (error) {
									error();
								}
							});
						}
						
						function sentMessageDetail(id, callback, error) {
							$.get("/mypage/api/message/sent/" + id + ".json",
									function(result) {
										if (callback) {
											callback(result);
										}
									}).fail(function(xhr, status, err) {
								if (error) {
									error();
								}
							});
						}
						function changeReadAttr(id, user_id, callback, error){
								var a = {id:id, receiver_id:user_id};
							$.ajax({
								type:'put',
								url : '/mypage/api/message/'+id+'/'+user_id,
								data : JSON.stringify(a),
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
							});
						}
						
						//메세지 삭제 메서드
						function deleteMessage(id, callback, error){
							$.ajax({
								type : 'delete',
								url : '/mypage/api/message/' + id,
								success : function(deleteResult, status, xhr){
									
									if(callback){
										callback(deleteResult);
									}
								},
								error:function(xhr,status, er){
									if(error){
										error(er);
									}
								}
							});
						}
						
						return {
							sentMessageDetail : sentMessageDetail,
							receivedMessageDetail : receivedMessageDetail,
							deleteMessage : deleteMessage,
							changeReadAttr : changeReadAttr
						};
					})();
					
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

</body>
</html>