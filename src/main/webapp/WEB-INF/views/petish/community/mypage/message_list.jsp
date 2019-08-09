<%@page import="com.community.petish.community.mypage.dto.MessageRequestDTO"%>
<%@page import="com.community.petish.community.mypage.dto.MessageResponseDTO"%>
<%@ page import="java.util.*"%>
<%@ page import="com.community.petish.mypage.*"%>
<%
	ArrayList<MessageResponseDTO> receivedList = (ArrayList) request.getAttribute("receivedList");
	int undeletedReceived = (int) request.getAttribute("undeletedReceived");
	ArrayList<MessageResponseDTO> sentList = (ArrayList) request.getAttribute("sentList");
	int undeletedSent = (int) request.getAttribute("undeletedSent");
	MessageResponseDTO dto = null;
	Long user_id = (Long)session.getAttribute("user_id");
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
														id="receivedMessageList">

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
																	class="received-check-one" name="check" value=<%=dto.getId() %>></th>
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
																	class="sent-check-one" value=<%=dto.getId() %>></th>
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
							<div
								class="box-footer d-flex flex-wrap align-items-center justify-content-between">
									<a href="" class="btn btn-secondary mt-0" id="delete-choice">선택
										삭제</a>
							</div>
							<!-- </form> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--  받은 쪽지 모달창 -->
	<div id="receive-modal" tabindex="-1" role="dialog"
		aria-hidden="true" class="modal fade" >
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 align="center" class="modal-title">받은쪽지</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>보낸사람</label> <input class="form-control"
							name='nickname1' readonly>
					</div>
					<div class="form-group">
						<label>날짜</label> <input type="text" class="form-control"
							name='sent_date1' readonly>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea id="message_content" rows="10" class="form-control"
							name='content1' readonly></textarea>
					</div>
					<input type="hidden" name="sender_id">
					<div class="text-left">
						<input type="button" value="삭제" class="modalDeleteBtn">
					</div>
						<div class="text-right">
						<input type="button" value="답장" class="modalAnswerBtn">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 보낸 쪽지 모달창 -->
	<div id="sent-modal" tabindex="-1" role="dialog"
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
						<label>받는사람</label> <input class="form-control"
							name='nickname2' readonly>
					</div>
					<div class="form-group">
						<label>날짜</label> <input type="text" class="form-control"
							name='sent_date2' readonly>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea id="message_content" rows="10" class="form-control"
							name='content2' readonly></textarea>
					</div>
					<div class="text-left">
						<input type="button" value="삭제" class="modalDeleteBtn">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 쪽지보내기 모달창 -->
	<div id="new-modal" tabindex="-1" role="dialog"
		aria-hidden="true" class="modal fade" >
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
						<label>받는사람</label> <input class="form-control"
							name='nickname' readonly>
					</div>
					<input type="hidden" name="receiver_id">
					<div class="form-group">
						<label>제목</label> <input class="form-control"
							name='title'>
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
		//쪽지 상세보기
		$(document).ready(
				function() {
					//받은 쪽지 모달
					var receivedModal = $("#receive-modal");
					var modalInputSentNickname1 = receivedModal
					.find("input[name='nickname1']");
					var modalInputSent_date1 = receivedModal
					.find("input[name='sent_date1']");
					var modalInputContent1 = receivedModal
					.find("textarea[name='content1']");
					var modalInputSender_id1 = receivedModal
					.find("input[name='sender_id']");
					
					//보낸 쪽지 모달
					var sentModal = $("#sent-modal");
					var modalInputReceivedNickname2 = sentModal
					.find("input[name='nickname2']");
					var modalInputSent_date2 = sentModal
					.find("input[name='sent_date2']");
					var modalInputContent2 = sentModal
					.find("textarea[name='content2']");
					
					//쪽지보내기 모달
					var newModal = $("#new-modal");
					var modalInputReceivedNickname3 = newModal
					.find("input[name='nickname']");
					var modalInputTitle3 = newModal
					.find("input[name='title']");
					var modalInputContent3 = newModal
					.find("textarea[name='content']");
					var modalInputReceiver_id3 = newModal
					.find("input[name='receiver_id']");
					
					//버튼 
					var modalDeleteBtn = $(".modalDeleteBtn");
					var modalAnswerBtn = $(".modalAnswerBtn");
					var modalSendBtn = $(".modalSendBtn");
					var user_id = <%=user_id%>;
					
					//메세지리스트에서 a태그(메세지 제목)을 누르면, 해당 글 id의 세부데이터를 받아서 모달로 보내준다
					
					//받은 쪽지 상세보기
					$(".receivedMessage").on("click", "a", function(e) {
						var id = $(this).data("id");
						messageService.receivedMessageDetail(id, function(message) {
							modalInputSentNickname1.val(message.nickname);
							modalInputSent_date1.val(message.sent_date);
							modalInputContent1.val(message.content);
							modalInputSender_id1.val(message.sender_id);
							receivedModal.data("id", message.id);
							$("#receive-modal").modal("show");
						});
						
						messageService.changeReadAttr(id, user_id);
						
					});
					
					//보낸 쪽지 상세보기
					$(".sentMessage").on("click", "a", function(e) {
						var id = $(this).data("id");
						messageService.sentMessageDetail(id, function(message) {
							modalInputReceivedNickname2.val(message.nickname);
							modalInputSent_date2.val(message.sent_date);
							modalInputContent2.val(message.content);
							sentModal.data("id", message.id);
							$("#sent-modal").modal("show");
						});	
					});
					
			
					
					//받은쪽지에서 답장하기 누르면 기존 모달 꺼지고 새로운 모달 열림 
					modalAnswerBtn.on("click", function(e){
						$("#receive-modal").modal("hide");
						modalInputReceivedNickname3.val(modalInputSentNickname1.val());
						modalInputReceiver_id3.val(modalInputSender_id1.val());
						$("#new-modal").modal("show");
					})
					
					
					//쪽지보내기 창에서 쪽지보내기 버튼 클릭시 ajax연결				
					modalSendBtn.on("click", function(e){
						<%System.out.println(user_id);%>
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
					
					
					//공통
					//모달에서 삭제버튼을 클릭하면, 해당id값의 데이터를 삭제하고 모달을 숨긴다(=>리스트 재조회 필요)
					modalDeleteBtn.on("click", function(e){
						var id = receivedModal.data("id");
						messageService.deleteMessage(id, function(result){
							alert(result);
							receivedModal.modal("hide");
							location.reload();
						});
					});
					
					//모달 닫기버튼 누르면 화면 리로드됨
					$(".close").on("click", function(e){
						location.reload();
					})

					
					
					
					//ajax메서드 정의
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
								success : function(result, status, xhr){
									if(callback){
										callback(result);
									}
								},
								error:function(xhr,status, er){
									if(error){
										error(er);
									}
								}
							});
						}
						
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
							sentMessageDetail : sentMessageDetail,
							receivedMessageDetail : receivedMessageDetail,
							deleteMessage : deleteMessage,
							changeReadAttr : changeReadAttr,
							writeMessage : writeMessage
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
				          	var list = $(":checked");
				          	for(var i=0; i<list.length; i++){
				          		messageService.deleteMessage(list[i].value, function(result){
									alert(result);
									location.reload();
								});
				          	};
				         });


				     	var modalInputReceivedNickname3 = newModal
						.find("input[name='nickname']");

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