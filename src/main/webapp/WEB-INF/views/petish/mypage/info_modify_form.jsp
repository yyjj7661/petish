<%@page import="com.community.petish.user.dto.UserResponseDTO"%>
<%@page import="com.community.petish.user.dto.UserModifyRequestDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
UserResponseDTO dto = (UserResponseDTO)request.getAttribute("dto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원정보 수정</title>
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
<link rel="stylesheet" href="/resources/css/mypage/mypage.css"></script>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="/resources/js/mypage/mypage.js"></script>
</head>

<body>
	<div id="all">

		<%@ include file="/WEB-INF/views/commons/top.jspf"%>

		<!-- 테이블 -->
		<div id="content">
			<div class="container">
				<div id="checkout" style="margin-bottom:2cm;">
					<div style="max-width: 20cm; margin: auto;">
						<!-- <form method="get" action=""> -->

						<h3 style="margin-top: 10%;font-weight:700;">회원정보 수정</h3>
						<div class="memberInfo" style="margin-bottom:1cm;">
							<div style="margin: 0.5cm;">
								<img class="profile" src="/resources/img/member_detail_demo.JPG"
									style="margin-right: 30px;">
							</div>
							<button id="modifyPictureBtn">사진변경</button>
							<input type="file" name="picture" id="file"/>
						</div>
						<form action="./modifyUserInfo" method = "POST">
							<input type="hidden" value=<%=dto.getId() %> name="id">
							<table class="col-md-12">
								<tr style="height: 1.5cm;">
									<td class="font-grey"><label
										class="control-label col-md-8">이메일</label></td>
									<td style="padding-right: 15px;"><input type="text"
										value=<%=dto.getUsername() %> readonly class="form-control"
										></td>
								</tr>
								<tr style="height: 1.5cm;">
									<td rowspan="3" class="font-grey"><label
										class="control-label col-md-10">비밀번호</label></td>
									<td style="padding-right: 15px;"><input type="password"
										placeholder="기존비밀번호 입력" class="form-control" ></td>
								</tr>
								<tr style="height: 1.5cm;">
									<td style="padding-right: 15px;"><input type="password"
										placeholder="새 비밀번호 입력" class="form-control" ">
								</tr>
								<tr style="height: 1.5cm;">
									<td style="padding-right: 15px;"><input type="password"
										placeholder="새 비밀번호 확인" class="form-control"
										name="password" value=<%=dto.getPassword() %>>
								</tr>
								<tr style="height: 1.5cm;">
									<td class="font-grey"><label
										class="control-label col-md-8">닉네임</label></td>
									<td style="padding-right: 15px;"><input type="text"
										value=<%=dto.getNickname() %> class="form-control" name="nickname"></td>
								</tr>
								<tr style="height: 1.5cm;">
									<td class="font-grey"><label
										class="control-label col-md-8">휴대폰</label></td>
									<td><input type="button" value="휴대폰인증"> <input
										type="hidden" value="" name="phone"></td>
								</tr>
								<tr style="height: 1.5cm;">
									<td class="font-grey"><label
										class="control-label col-md-8">주소</label></td>
									<td><div>
											<input type="text" value="1234567"
												style="width: 70%; height: 0.961cm;" name="address">
										</div></td>
								</tr>
								
								
							</table>
							<div class="box-footer d-flex flex-wrap align-items-center justify-content-between"
								style="margin-top: 1cm;">
								<div class="left-col">
									<a href="" class="btn btn-secondary mt-0" id="deleteUser">회원
										탈퇴</a>
								</div>

								<div class="right-col">
									<button type="submit">
									수정하기<i
										class="fa fa-save"></i></button>
								</div>
							</div>
						</form>
						<!-- </form> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	$(document).ready(function(){
		
		$('#modifyPictureBtn').on("click", function(e){
			$("input:file").click();
		})
		var userModifyService = (function(){
			function modifyUserPicture(id, picture, callback, error){
				var a = {id:id, picture:picture};
				$.ajax({
					type:'put',
					url : '/mypage/api/modifyPicture/'+id+'/'+picture,
					data : JSON.stringify(a),
					contentType : "application/json;charset = utf-8",
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
			
		});			
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