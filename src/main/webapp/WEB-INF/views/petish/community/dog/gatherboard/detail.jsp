<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*,java.text.SimpleDateFormat, 
				com.community.petish.dog.gatherboard.domain.DogGatherPostVO,
				com.community.petish.dog.gatherboard.dto.response.DogGatherParticipantDTO,
				com.community.petish.dog.gatherboard.domain.DogGatherCommentVO,
				com.community.petish.user.dto.response.LoginedUser" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
	DogGatherPostVO post = (DogGatherPostVO)request.getAttribute("post");
	LoginedUser user = (LoginedUser) session.getAttribute("LOGIN_USER");

	String addr = post.getGATHERING_ADDRESS();
	String writer = (String)request.getAttribute("writer");
	String userName = user.getUsername();
	Long userId = user.getId();
	String userNickName = user.getNickname();
	
	//DogSize
	Long sizeID = (Long)request.getAttribute("sizeID");
	String size = "";
	if(sizeID == 1L) {
		size = "소";
	}
	else if(sizeID == 2L) {
		size = "중";
	}
	else if(sizeID == 3L) {
		size = "대";
	}
	
	//정모 참여자 - DTO List
	List<DogGatherParticipantDTO> participantList = (ArrayList<DogGatherParticipantDTO>)request.getAttribute("participantList");
	int participantCount = (int)request.getAttribute("participantCount");
	
	Timestamp GATHRING_DATE = post.getGATHERING_DATE();
	// 정모 날짜 지나면 신청 못하도록 구현
	// 현재 시간 Timestamp 형식으로 구하기
	// 앞에 변수가 크면 1, 작으면 -1, 같으면 0
	SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
	Calendar cal = Calendar.getInstance();
	String today = null;
	today = formatter.format(cal.getTime());
	Timestamp ts = Timestamp.valueOf(today);
	
%>
<!DOCTYPE html>
<html>
<head>
<title><%= post.getTITLE() %></title>

<%@ include file="/WEB-INF/views/commons/link.jspf" %>
<link rel="stylesheet" href="/resources/css/gatherboard/chat.css">
<link rel="stylesheet" href="/resources/css/gatherboard/detail.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Gothic+A1&display=swap&subset=korean" rel="stylesheet">
<!-- script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.js"></script> -->
</head>
<body>

	<div id="all">
<%@ include file="/WEB-INF/views/commons/top.jspf" %>

		<div id="heading-breadcrumbs">
			<div class="container">
				<div class="row d-flex align-items-center flex-wrap">
					<div class="col-md-7">
						<h1 class="h2">강아지 정모게시판</h1>
					</div>
					<div class="col-md-5">
						<ul class="breadcrumb d-flex justify-content-end">
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div id="content">
			<div class="container">
			      <div class="row bar">
					<div class="col-md-12">
						<button class="btn btn-template-outlined writeBtn">
							<a href="/dog/gatherboard/writeForm">
							글쓰기
							</a>
						</button>
						<button class="btn btn-template-outlined listBtn">					
							<i class="fa fa-align-justify"></i><a href="/dog/gatherboard" id="listBtn" onclick="listClick()">목록</a>
						</button>
				

						<div class="panel-heading">
							<h2 class="h3 panel-title"><%= post.getTITLE() %></h2>
						</div>

						<table>
								<tr>
									<td><img src="/resources/img/blog-avatar2.jpg" alt=""
										class="img-fluid rounded-circle"></td>
									<td>
										<div class="nav navbar-nav ml-auto">
											<a href="#" data-toggle="dropdown" class="dropdown"> <%= userNickName %></a>
											<div class="dropdown-menu">
												<div class="dropdown"><a href="#" class="nav-link">게시글보기</a></div>
												<div class="dropdown"><a href="#" class="nav-link">쪽지보내기</a></div>
											</div>
										</div>
									</td>
									<td class=grade>정회원</td>
									<td class=date>작성일 : <%= post.getCREATED_DATE() %></td>
									<td class=date>수정일 : <%= post.getUPDATED_DATE() %></td>
									<td class=view><i class="fa fa-eye"></i> 조회 : <%= post.getVIEW_COUNT() %></td>
								</tr>
							</table>
							<hr size="10px">
<%
	//정모 날짜가 지나지 않았을 경우
	if(GATHRING_DATE.compareTo(ts) >= 1) {
		System.out.println("정모 날짜 남음!");
%>
					<div class="heading">
						<button id="participantBtn" class="btn btn-template-outlined" type="button" data-toggle="modal" data-target="#myLargeModal">
							<i class="fa fa-sign-in"></i> 신청
						</button>
						
						<button id="participantBtn" type="button" class="btn btn-template-outlined" data-toggle="modal" data-target="#mySmallModal">
							<i class="fa fa-users"></i>신청목록
						</button>
							<h3>참여 현황</h3>
					</div>

						<h4>
							<span class="h1 counter"><%= participantCount %></span> / <%= post.getPEOPLE_COUNT() %>
						</h4>
						<%
							if(participantCount >= post.getPEOPLE_COUNT()) {
						%>
							<p>참여 신청이 마감되었습니다.</p>
						<%
							} 
						%>
						<!-- Participant Modal -->
						<div class="modal fade" id="myLargeModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h3 class="modal-title" id="myModalLabel">참여 신청</h3>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
											</button>
									</div>
										<div class="modal-body">
											<form action="/dog/gatherboard/insertParticipant" id="participantform" method="post" onsubmit="return participantCheck(<%=sizeID%>);">	
											<input type="hidden" ID="POST_ID" name="POST_ID" value="<%= post.getID() %>">
											<input type="hidden" name="USERNAME" value="<%= userName %>">
												<div class="form-group">
													<label for="category">크기</label> 
													<select id="size" class="form-control" name="DOG_SIZE" onchange="javascript:categoryChange();">
														<option value="">크기</option>
														<option value="1">소</option>
														<option value="2">중</option>
														<option value="3">대</option>
													</select>
												</div>
												<div class="form-group">
													<label for="category">종 선택</label> 							
													<select id="species" name="SPECIES" class="form-control">
														<option value="">종 선택</option>
													</select>
												</div>	
												<div class="form-group">
													<label for="category">신청 내용</label> 
													<textarea name="REQUEST_CONTENT" id="requestContent" rows="6" cols="60" class="form-control"></textarea>
												</div>
												<div class="form-group">						
													<div class="text-center">
														<button type="submit" class="btn btn-template-outlined">확 인</button>
														<button id="participantResetBtn" type="reset" class="btn btn-template-outlined">취 소</button>
							                        </div>
												</div>
											</form>
										</div> <!-- modal-body END -->
								</div>
							</div>
						</div>
						<!-- Participant Modal END -->
						<!-- ParticipantList Modal -->
						<div class="modal fade" id="mySmallModal" tabindex="-1"
							role="dialog" aria-labelledby="mySmallModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h3 class="modal-title" id="myModalLabel">신청 목록</h3>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<%
											if(participantList.size()==0) {
										%>
										<p> 참여자가 없습니다.</p>
										<%
											} else {
										%>
										<P id="participantList-top"><i class="fa fa-user"></i> 총원 : <%= participantCount %>명</P>

						                <div class="table-responsive">
						                  <table class="table table-hover">
						                    <thead>
						                      <tr class="text-center">
						                        <th>번호</th>
						                        <th>아이디</th>
						                        <th>반려견</th>
						                        <th>내용</th>
						                        <th>신청취소</th>
						                      </tr>
						                    </thead>
						                  <tbody>
										<%
												for(int i=0; i<participantList.size(); i++) {
													DogGatherParticipantDTO participant = participantList.get(i);		
										%>
											 <tr class="text-center">
												<td><b><%= i+1 %></b></td>
												<td><%= participant.getNICKNAME() %></td>  
												<td><%= participant.getDOG_SPECIES() %></td>
												<td><%= participant.getREQUEST_CONTENT() %></td>
											<%
												// 본인이 참여 신청 한 경우
												if(userName.equals(participant.getUSERNAME())) {
											%>
												<td class="text-center">
													<form action="/dog/gatherboard/cancelParticipant" method="post">
													<input type="hidden" name="ID" value="<%=participant.getID() %>">
													<input type="hidden" name="POST_ID" value="<%= participant.getPOST_ID() %>">
														<button type="submit" class="btn btn-template-outlined btn-sm">
															신청취소
														</button>
													</form>
												</td>
											<%
												} 
											%>
											</tr>											
										<%
												}
										%>
										</tbody>
					                  </table>
					                </div>		
					                	<% 			
											}
										%>         
								</div> <!-- modal-body -->
									<div class="modal-footer">
										<button type="button" class="btn btn-outline-primary"
											data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>
						<!-- participantModl END -->
<%
	} else { 
		// 정모 날짜가 지났을 경우
		System.out.println("정모날짜 지남!");
%>
						<div class="heading">
							<h3>참여 현황</h3>
						</div>
						<p>날짜가 지난 정모입니다.</p>
<%
	}
%>
						<div id="post-content">						
							<h3>모임 안내</h3>
							<blockquote class="blockquote">
									<p><strong>모임 일시 :</strong> <%= post.getGATHERING_DATE() %></p>
									<p><strong>장소 :</strong> <%= post.getGATHERING_ADDRESS() %></p>
									<p id="sizeID"><strong>크기  :</strong> <%= size %>
									<p><strong>반려견 :</strong> <%= request.getAttribute("dogSpecies") %> </p>
									<p><strong>내용 :</strong> <%= post.getCONTENT() %></p>
							</blockquote>
						</div>
						
						<div id="map" style="width:100%;height:350px;"></div>

						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e74e0d9232cbccbd2962414bf135d9c&libraries=services"></script>
						<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						    mapOption = {
						        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						        level: 3 // 지도의 확대 레벨
						    };  
						
						// 지도를 생성합니다    
						var map = new daum.maps.Map(mapContainer, mapOption); 
						
						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new daum.maps.services.Geocoder();
						
				        var imageSrc = '/resources/img/gatherboard/dog.png', // 마커이미지의 주소입니다    
				        imageSize = new kakao.maps.Size(64, 60), // 마커이미지의 크기입니다
				        imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
				          
					    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
					    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
					        markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다
							
						// 주소로 좌표를 검색합니다
						geocoder.addressSearch('<%=addr%>', function(result, status) {
						
						    // 정상적으로 검색이 완료됐으면 
						     if (status === daum.maps.services.Status.OK) {
					
						        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
						

							    // 마커를 생성합니다
							    var marker = new kakao.maps.Marker({
							        map: map,
							        image: markerImage, // 마커이미지 설정 
							        position: coords,
							    });

						
						        // 인포윈도우로 장소에 대한 설명을 표시합니다
						        var infowindow = new daum.maps.InfoWindow({
						            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=addr%></div>'
						        });
						        infowindow.open(map, marker);
						
						        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						        map.setCenter(coords);
						    } 
						});    
						</script>

					<!-- comment -->	
						<div id="comments">
							<h4 class="text-uppercase" id="commentCount"></h4>
							<section class="bar mb-0" id="commentSection">
								<div id="commentList" class="row comment">
								</div>
						
							</section>
							<!-- comment_page_form -->
							<form id="page_form">
								<input type="hidden" name="POST_ID" value=<%= post.getID() %>>
								<input type="hidden" name="USER_ID" value=<%= userId %>> <!-- 로그인 기능 구현되면 수정해야 함 -->
								<input type="hidden" name="pageNum" value='${pageMaker.cri.pageNum}'>
							</form>
	                         <div class="comment-footer d-flex justify-content-center"></div>
						</div>

						<div id="comment-form">
							<h4 class="text-uppercase comment">댓글</h4>
							<!-- comment insert form -->
							<form id="insert_form" method="post">
								<input type="hidden" name="USER_ID" value=<%= userId %>> <!-- 로그인 기능 구현되면 수정해야 함 -->
								<input type="hidden" name="POST_ID" value=<%=post.getID() %>>
								<input type="hidden" name="pageNum" value='${pageMaker.cri.pageNum}'>
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label for="name">아이디<span class="required text-primary">*</span></label> 
											<input id="NICKNAME" type="text" class="form-control" value=<%= userNickName %> readonly>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<div class="form-group">
											<label for="comment">내 용 <span class="required text-primary">*</span></label>
											<textarea id="CONTENT" name="CONTENT" rows="4" class="form-control"></textarea>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12 text-right">
										<button class="re btn btn-template-outlined" id="input_data">
											<i class="fa fa-comment-o"></i> 댓글 등록
										</button>
									</div>
								</div>
								</form>
								<!-- comment insert form END -->
								<div class="col-sm-12"> 
										<!-- 게시자일떄만 수정/삭제  -->
										<%
											if(userName.equals(writer)) {
										%>
											<button id="modifyBtn" class="btn btn-template-outlined">
												<i class="fa fa-pencil"></i> <a href="/dog/gatherboard/modifyForm/<%= post.getID()%>">수정</a>
											</button>
											<button id="deleteBtn" type="submit" class="btn btn-template-outlined">
												<i class="fa fa-trash-o"></i> <a href="/dog/gatherboard/deleteDogGatherPost/<%=post.getID()%>">삭제</a>
											</button>
										<%
											}
										%>
										<!-- 게시자일때만 수정/삭제 END -->
											<button type="button" class="btn btn-danger"
												data-toggle="modal" data-target="#myModal"
											 	id="report-btn">신고</button>
								</div>
								<!-- 신고 모달 -->
										<div class="modal fade" id="myModal" tabindex="-1"
											role="dialog" aria-labelledby="myModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h3 class="modal-title" id="myModalLabel">신고</h3>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<table>
															<tr>
																<td>신고 분류</td>
																<td>
																	<div class="form-group">
																		<select id="state" class="form-control">
																			<option>부적절한 게시글</option>
																			<option>도배 게시글</option>
																			<option>광고 목적 게시글</option>
																			<option>기타</option>
																		</select>
																	</div>
																</td>
															<tr>
																<td>내용</td>
																<td><textarea id="comment" rows="4" cols="40"
																		class="form-control"></textarea></td>
															</tr>
															<tr></tr>
															<tr>
																<td></td>
																<td>
																	<button type="button" class="btn btn-template-outlined"
																		data-dismiss="modal">확인</button>
																	<button type="button" class="btn btn-template-outlined"
																		data-dismiss="modal">취 소</button>
																</td>
															</tr>
														</table>
													</div>
												</div>
												<div class="modal-footer"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
							
			<!-- 채팅 -->
			<form id="chat_form" action="/dog/gatherboard/insertChat" method="post">
				<input type="hidden" name="POST_ID" value='<%=post.getID()%>' />
				<input type="hidden" name="USER_ID" value='<%=userId%>' />
			</form>
			<input type="hidden" value='<%=userNickName%>' id='chat_id' />
			<input type="hidden" value='<%=post.getID()%>' id='post_id' />
				<!-- 채팅창 -->
				    <div id="chat_box" style="display:none;">
				        <div class="chatBox">
				            <p class='chatTopBar'>* <%=post.getID()%>번 글 정모 채팅  *</p>
				            <div class='onUser' style="float:right"><p id="onUser">접속자</p>
				            </div>
				            <div id="messageWindow"></div>
					           <div class="input-group">
					           	 <input id="inputMessage" type="text" placeholder="메세지를 입력해주세요" class="form-control" onkeyup="enterkey()" />
					             <input id="sendBtn" class="btn" type="submit" value="입력" onclick="send()" />
				           	   </div>
				       	</div>
				  	</div>
				    <img class="chat" src="/resources/img/gatherboard/chat.png" onclick="chatClick('<%=userNickName%>');"/>
    		<!-- 채팅 끝 -->
    		
    			</div>
			</div>
		</div>

    <!-- script 파일 추가 -->
	<%@ include file="/WEB-INF/views/commons/script.jspf" %>
	<!-- include category.js -->
	<script src="/resources/js/gatherboard/post.js"></script>
	<script src="/resources/js/gatherboard/chat.js"></script>
	<script src="/resources/js/gatherboard/comment.js"></script>

</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*,java.text.SimpleDateFormat,com.community.petish.community.dog.gatherboard.domain.DogGatherPostVO,com.community.petish.community.dog.gatherboard.dto.response.DogGatherParticipantDTO,com.community.petish.community.dog.gatherboard.domain.DogGatherCommentVO,
				com.community.petish.community.user.dto.response.LoginedUser" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
	DogGatherPostVO post = (DogGatherPostVO)request.getAttribute("post");
	LoginedUser user = (LoginedUser) session.getAttribute("LOGIN_USER");

	String addr = post.getGATHERING_ADDRESS();
	String writer = (String)request.getAttribute("writer");
	String userName = user.getUsername();
	Long userId = user.getId();
	String userNickName = user.getNickname();
	
	//DogSize
	Long sizeID = (Long)request.getAttribute("sizeID");
	String size = "";
	if(sizeID == 1L) {
		size = "소";
	}
	else if(sizeID == 2L) {
		size = "중";
	}
	else if(sizeID == 3L) {
		size = "대";
	}
	
	//정모 참여자 - DTO List
	List<DogGatherParticipantDTO> participantList = (ArrayList<DogGatherParticipantDTO>)request.getAttribute("participantList");
	int participantCount = (int)request.getAttribute("participantCount");
	
	Timestamp GATHRING_DATE = post.getGATHERING_DATE();
	// 정모 날짜 지나면 신청 못하도록 구현
	// 현재 시간 Timestamp 형식으로 구하기
	// 앞에 변수가 크면 1, 작으면 -1, 같으면 0
	SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
	Calendar cal = Calendar.getInstance();
	String today = null;
	today = formatter.format(cal.getTime());
	Timestamp ts = Timestamp.valueOf(today);
	
%>
<!DOCTYPE html>
<html>
<head>
<title><%= post.getTITLE() %></title>

<%@ include file="/WEB-INF/views/commons/link.jspf" %>
<link rel="stylesheet" href="/resources/css/gatherboard/chat.css">
<link rel="stylesheet" href="/resources/css/gatherboard/detail.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Gothic+A1&display=swap&subset=korean" rel="stylesheet">
<!-- script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.js"></script> -->
</head>
<body>

	<div id="all">
<%@ include file="/WEB-INF/views/commons/top.jspf" %>

		<div id="heading-breadcrumbs">
			<div class="container">
				<div class="row d-flex align-items-center flex-wrap">
					<div class="col-md-7">
						<h1 class="h2">강아지 정모게시판</h1>
					</div>
					<div class="col-md-5">
						<ul class="breadcrumb d-flex justify-content-end">
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div id="content">
			<div class="container">
			      <div class="row bar">
					<div class="col-md-12">
						<button class="btn btn-template-outlined writeBtn">
							<a href="/dog/gatherboard/writeForm">
							글쓰기
							</a>
						</button>
						<button class="btn btn-template-outlined listBtn">					
							<i class="fa fa-align-justify"></i><a href="/dog/gatherboard" id="listBtn" onclick="listClick()">목록</a>
						</button>
				

						<div class="panel-heading">
							<h2 class="h3 panel-title"><%= post.getTITLE() %></h2>
						</div>

						<table>
								<tr>
									<td><img src="/resources/img/blog-avatar2.jpg" alt=""
										class="img-fluid rounded-circle"></td>
									<td>
										<div class="nav navbar-nav ml-auto">
											<a href="#" data-toggle="dropdown" class="dropdown"> <%= userNickName %></a>
											<div class="dropdown-menu">
												<div class="dropdown"><a href="#" class="nav-link">게시글보기</a></div>
												<div class="dropdown"><a href="#" class="nav-link">쪽지보내기</a></div>
											</div>
										</div>
									</td>
									<td class=grade>정회원</td>
									<td class=date>작성일 : <%= post.getCREATED_DATE() %></td>
									<td class=date>수정일 : <%= post.getUPDATED_DATE() %></td>
									<td class=view><i class="fa fa-eye"></i> 조회 : <%= post.getVIEW_COUNT() %></td>
								</tr>
							</table>
							<hr size="10px">
<%
	//정모 날짜가 지나지 않았을 경우
	if(GATHRING_DATE.compareTo(ts) >= 1) {
		System.out.println("정모 날짜 남음!");
%>
					<div class="heading">
						<button id="participantBtn" class="btn btn-template-outlined" type="button" data-toggle="modal" data-target="#myLargeModal">
							<i class="fa fa-sign-in"></i> 신청
						</button>
						
						<button id="participantBtn" type="button" class="btn btn-template-outlined" data-toggle="modal" data-target="#mySmallModal">
							<i class="fa fa-users"></i>신청목록
						</button>
							<h3>참여 현황</h3>
					</div>

						<h4>
							<span class="h1 counter"><%= participantCount %></span> / <%= post.getPEOPLE_COUNT() %>
						</h4>
						<%
							if(participantCount >= post.getPEOPLE_COUNT()) {
						%>
							<p>참여 신청이 마감되었습니다.</p>
						<%
							} 
						%>
						<!-- Participant Modal -->
						<div class="modal fade" id="myLargeModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h3 class="modal-title" id="myModalLabel">참여 신청</h3>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
											</button>
									</div>
										<div class="modal-body">
											<form action="/dog/gatherboard/insertParticipant" id="participantform" method="post" onsubmit="return participantCheck(<%=sizeID%>);">	
											<input type="hidden" ID="POST_ID" name="POST_ID" value="<%= post.getID() %>">
											<input type="hidden" name="USERNAME" value="<%= userName %>">
												<div class="form-group">
													<label for="category">크기</label> 
													<select id="size" class="form-control" name="DOG_SIZE" onchange="javascript:categoryChange();">
														<option value="">크기</option>
														<option value="1">소</option>
														<option value="2">중</option>
														<option value="3">대</option>
													</select>
												</div>
												<div class="form-group">
													<label for="category">종 선택</label> 							
													<select id="species" name="SPECIES" class="form-control">
														<option value="">종 선택</option>
													</select>
												</div>	
												<div class="form-group">
													<label for="category">신청 내용</label> 
													<textarea name="REQUEST_CONTENT" id="requestContent" rows="6" cols="60" class="form-control"></textarea>
												</div>
												<div class="form-group">						
													<div class="text-center">
														<button type="submit" class="btn btn-template-outlined">확 인</button>
														<button id="participantResetBtn" type="reset" class="btn btn-template-outlined">취 소</button>
							                        </div>
												</div>
											</form>
										</div> <!-- modal-body END -->
								</div>
							</div>
						</div>
						<!-- Participant Modal END -->
						<!-- ParticipantList Modal -->
						<div class="modal fade" id="mySmallModal" tabindex="-1"
							role="dialog" aria-labelledby="mySmallModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h3 class="modal-title" id="myModalLabel">신청 목록</h3>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<%
											if(participantList.size()==0) {
										%>
										<p> 참여자가 없습니다.</p>
										<%
											} else {
										%>
										<P id="participantList-top"><i class="fa fa-user"></i> 총원 : <%= participantCount %>명</P>

						                <div class="table-responsive">
						                  <table class="table table-hover">
						                    <thead>
						                      <tr class="text-center">
						                        <th>번호</th>
						                        <th>아이디</th>
						                        <th>반려견</th>
						                        <th>내용</th>
						                        <th>신청취소</th>
						                      </tr>
						                    </thead>
						                  <tbody>
										<%
												for(int i=0; i<participantList.size(); i++) {
													DogGatherParticipantDTO participant = participantList.get(i);		
										%>
											 <tr class="text-center">
												<td><b><%= i+1 %></b></td>
												<td><%= participant.getNICKNAME() %></td>  
												<td><%= participant.getDOG_SPECIES() %></td>
												<td><%= participant.getREQUEST_CONTENT() %></td>
											<%
												// 본인이 참여 신청 한 경우
												if(userName.equals(participant.getUSERNAME())) {
											%>
												<td class="text-center">
													<form action="/dog/gatherboard/cancelParticipant" method="post">
													<input type="hidden" name="ID" value="<%=participant.getID() %>">
													<input type="hidden" name="POST_ID" value="<%= participant.getPOST_ID() %>">
														<button type="submit" class="btn btn-template-outlined btn-sm">
															신청취소
														</button>
													</form>
												</td>
											<%
												} 
											%>
											</tr>											
										<%
												}
										%>
										</tbody>
					                  </table>
					                </div>		
					                	<% 			
											}
										%>         
								</div> <!-- modal-body -->
									<div class="modal-footer">
										<button type="button" class="btn btn-outline-primary"
											data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>
						<!-- participantModl END -->
<%
	} else { 
		// 정모 날짜가 지났을 경우
		System.out.println("정모날짜 지남!");
%>
						<div class="heading">
							<h3>참여 현황</h3>
						</div>
						<p>날짜가 지난 정모입니다.</p>
<%
	}
%>
						<div id="post-content">						
							<h3>모임 안내</h3>
							<blockquote class="blockquote">
									<p><strong>모임 일시 :</strong> <%= post.getGATHERING_DATE() %></p>
									<p><strong>장소 :</strong> <%= post.getGATHERING_ADDRESS() %></p>
									<p id="sizeID"><strong>크기  :</strong> <%= size %>
									<p><strong>반려견 :</strong> <%= request.getAttribute("dogSpecies") %> </p>
									<p><strong>내용 :</strong> <%= post.getCONTENT() %></p>
							</blockquote>
						</div>
						
						<div id="map" style="width:100%;height:350px;"></div>

						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e74e0d9232cbccbd2962414bf135d9c&libraries=services"></script>
						<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						    mapOption = {
						        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						        level: 3 // 지도의 확대 레벨
						    };  
						
						// 지도를 생성합니다    
						var map = new daum.maps.Map(mapContainer, mapOption); 
						
						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new daum.maps.services.Geocoder();
						
				        var imageSrc = '/resources/img/gatherboard/dog.png', // 마커이미지의 주소입니다    
				        imageSize = new kakao.maps.Size(64, 60), // 마커이미지의 크기입니다
				        imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
				          
					    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
					    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
					        markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다
							
						// 주소로 좌표를 검색합니다
						geocoder.addressSearch('<%=addr%>', function(result, status) {
						
						    // 정상적으로 검색이 완료됐으면 
						     if (status === daum.maps.services.Status.OK) {
					
						        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
						

							    // 마커를 생성합니다
							    var marker = new kakao.maps.Marker({
							        map: map,
							        image: markerImage, // 마커이미지 설정 
							        position: coords,
							    });

						
						        // 인포윈도우로 장소에 대한 설명을 표시합니다
						        var infowindow = new daum.maps.InfoWindow({
						            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=addr%></div>'
						        });
						        infowindow.open(map, marker);
						
						        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						        map.setCenter(coords);
						    } 
						});    
						</script>

					<!-- comment -->	
						<div id="comments">
							<h4 class="text-uppercase" id="commentCount"></h4>
							<section class="bar mb-0" id="commentSection">
								<div id="commentList" class="row comment">
								</div>
						
							</section>
							<!-- comment_page_form -->
							<form id="page_form">
								<input type="hidden" name="POST_ID" value=<%= post.getID() %>>
								<input type="hidden" name="USER_ID" value=<%= userId %>> <!-- 로그인 기능 구현되면 수정해야 함 -->
								<input type="hidden" name="pageNum" value='${pageMaker.cri.pageNum}'>
							</form>
	                         <div class="comment-footer d-flex justify-content-center"></div>
						</div>

						<div id="comment-form">
							<h4 class="text-uppercase comment">댓글</h4>
							<!-- comment insert form -->
							<form id="insert_form" method="post">
								<input type="hidden" name="USER_ID" value=<%= userId %>> <!-- 로그인 기능 구현되면 수정해야 함 -->
								<input type="hidden" name="POST_ID" value=<%=post.getID() %>>
								<input type="hidden" name="pageNum" value='${pageMaker.cri.pageNum}'>
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label for="name">아이디<span class="required text-primary">*</span></label> 
											<input id="NICKNAME" type="text" class="form-control" value=<%= userNickName %> readonly>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<div class="form-group">
											<label for="comment">내 용 <span class="required text-primary">*</span></label>
											<textarea id="CONTENT" name="CONTENT" rows="4" class="form-control"></textarea>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12 text-right">
										<button class="re btn btn-template-outlined" id="input_data">
											<i class="fa fa-comment-o"></i> 댓글 등록
										</button>
									</div>
								</div>
								</form>
								<!-- comment insert form END -->
								<div class="col-sm-12"> 
										<!-- 게시자일떄만 수정/삭제  -->
										<%
											if(userName.equals(writer)) {
										%>
											<button id="modifyBtn" class="btn btn-template-outlined">
												<i class="fa fa-pencil"></i> <a href="/dog/gatherboard/modifyForm/<%= post.getID()%>">수정</a>
											</button>
											<button id="deleteBtn" type="submit" class="btn btn-template-outlined">
												<i class="fa fa-trash-o"></i> <a href="/dog/gatherboard/deleteDogGatherPost/<%=post.getID()%>">삭제</a>
											</button>
										<%
											}
										%>
										<!-- 게시자일때만 수정/삭제 END -->
											<button type="button" class="btn btn-danger"
												data-toggle="modal" data-target="#myModal"
											 	id="report-btn">신고</button>
								</div>
								<!-- 신고 모달 -->
										<div class="modal fade" id="myModal" tabindex="-1"
											role="dialog" aria-labelledby="myModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h3 class="modal-title" id="myModalLabel">신고</h3>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<table>
															<tr>
																<td>신고 분류</td>
																<td>
																	<div class="form-group">
																		<select id="state" class="form-control">
																			<option>부적절한 게시글</option>
																			<option>도배 게시글</option>
																			<option>광고 목적 게시글</option>
																			<option>기타</option>
																		</select>
																	</div>
																</td>
															<tr>
																<td>내용</td>
																<td><textarea id="comment" rows="4" cols="40"
																		class="form-control"></textarea></td>
															</tr>
															<tr></tr>
															<tr>
																<td></td>
																<td>
																	<button type="button" class="btn btn-template-outlined"
																		data-dismiss="modal">확인</button>
																	<button type="button" class="btn btn-template-outlined"
																		data-dismiss="modal">취 소</button>
																</td>
															</tr>
														</table>
													</div>
												</div>
												<div class="modal-footer"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
							
			<!-- 채팅 -->
			<form id="chat_form" action="/dog/gatherboard/insertChat" method="post">
				<input type="hidden" name="POST_ID" value='<%=post.getID()%>' />
				<input type="hidden" name="USER_ID" value='<%=userId%>' />
			</form>
			<input type="hidden" value='<%=userNickName%>' id='chat_id' />
			<input type="hidden" value='<%=post.getID()%>' id='post_id' />
				<!-- 채팅창 -->
				    <div id="chat_box" style="display:none;">
				        <div class="chatBox">
				            <p class='chatTopBar'>* <%=post.getID()%>번 글 정모 채팅  *</p>
				            <div class='onUser' style="float:right"><p id="onUser">접속자</p>
				            </div>
				            <div id="messageWindow"></div>
					           <div class="input-group">
					           	 <input id="inputMessage" type="text" placeholder="메세지를 입력해주세요" class="form-control" onkeyup="enterkey()" />
					             <input id="sendBtn" class="btn" type="submit" value="입력" onclick="send()" />
				           	   </div>
				       	</div>
				  	</div>
				    <img class="chat" src="/resources/img/gatherboard/chat.png" onclick="chatClick('<%=userNickName%>');"/>
    		<!-- 채팅 끝 -->
    		
    			</div>
			</div>
		</div>

    <!-- script 파일 추가 -->
	<%@ include file="/WEB-INF/views/commons/script.jspf" %>
	<!-- include category.js -->
	<script src="/resources/js/gatherboard/post.js"></script>
	<script src="/resources/js/gatherboard/chat.js"></script>
	<script src="/resources/js/gatherboard/comment.js"></script>

</body>
>>>>>>> d4ac11e1ca086192a7ab09a2f965138a74a15af5
</html>