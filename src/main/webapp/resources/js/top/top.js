/* login-modal close */
$(function(){
	var forms = document.getElementById("joinform");
	var html = '<div>h</div>'
	$('#joinBtn').click(function(){
		$('#login-modal').modal('hide');
	})
	
	$('#findBtn').click(function(){
		$('#login-modal').modal('hide');
	})
	

	$('#nicknameBtn').click(function(){
		alert('hh');
	})

})

function check() {		

	var password1 = document.getElementById('password1');
	var password2 = document.getElementById('password2');

	if(password1.value != password2.value) {
		alert('비밀번호가 일치하지 않습니다!');
		return false;
	} 
	return true;
}

function openZipcode(){			
    var url="/resources/api/searchMap.jsp"
    open(url, "confirm", "toolbar=no,location=no,"
              +"status=no,menubar=no,"
              +"scrollbars=yes,resizable=no,"
              +"width=700,height=500");
  }

const handledLoginClick = (e) => {
	let username = $("#email_input").val();
	let password = $("#password_input").val();
	
	if (username == "" || username == null) {
		return
	}
	if (password == "" || password == null) {
		return
	}
	
	let loginUserParams = {
			"username" : username,
			"password" : password
	}
	
	$.ajax({
		type: "POST",
		url: "/api/users/login",
		contentType:"application/json; charset=utf-8",
		data: JSON.stringify(loginUserParams),
		success: function(result, status, xhr) {
			location.reload();
		},
		error: function(error, status, xhr) {
			if (error) {
				alert("error : " + JSON.stringify(error) + "\n" + "status: " + status + "\n" + "xhr : " + xhr);
			}
		}
		
	})
}

const handledLogoutClick = (e) => {
	e.preventDefault();
	
	$.ajax({
		type: "POST",
		url:"/api/users/logout",
		success: function(result, status, xhr) {
			location.reload();
		},
		error: function(error, status, xhr) {
			
		}
	})
}

const handledJoinClick = (e) => {

	let username = $('#usernameInput').val();
	if (username == '' || username == null) {
		alert("username을 입력해주세요")
		$('#usernameInput').focus();
		return;
	}
	
	let password = $('#passwordInput').val();
	if (password == '' || password == null ) {
		alert('password를 입력해주세요');
		$('#passwordInput').focus();
		return;
	}
	
	let passwordCheck = $('#passwordCheckInput').val();
	if (passwordCheck == '' || passwordCheck == null ) {
		alert('password 확인을 입력해주세요');
		$('#passwordCheckInput').focus();
		return;
	}
	
	if (password !== passwordCheck) {
		alert("password가 일치하지 않습니다.");
		$('#passwordCheckInput').focus();
		return;
	}
	
	let nickname = $('#nicknameInput').val();
	if (nickname == '' || nickname == null ) {
		alert('nickname을 입력해주세요');
		$('#nicknameInput').focus();
		return;
	}
	let nicknameCheck = $('#nicknameDuplicateCheck').val();
	if ( nicknameCheck === 'false' || nicknameCheck == null) {
		alert("nickname 중복 체크를 해주세요");
		$("nicknameInput").focus();
		return;
	}
	
	let address = $('#addressInput').val();
	if (address == '' || address == null ) {
		alert('주소를 입력해주세요');
		$('#addressInput').focus();
		return;
	}
	
	let genders = $('input[name="gender"]');
	let gender;
	for (let i = 0; i < genders.length; i++) {
		if ( genders[i].checked ) {
			gender = genders[i].value;
			break;
		}
	}
	if (gender == '' || gender == null ) {
		alert('성별을 선택해주세요');
		$('#genderInput').focus();
		return;
	}
	
	let concerns = $('input[name="concern"]');
	let concern;
	for (let i = 0; i < concerns.length; i++) {
		if ( concerns[i].checked ) {
			concern = concerns[i].value;
			break;
		}
	}
	if (concern == '' || concern == null ) {
		alert('관심사를 선택해주세요');
		$('#genderInput').focus();
		return;
	}
	
	let saveUserParams = {
			"username" : username,
			"password" : password,
			"nickname" : nickname,
			"address" : address,
			"gender" : gender,
			"concern" : concern,
	};
	
	$.ajax({
		type: "POST",
		url: "/api/users",
		contentType:"application/json; charset=utf-8",
		data: JSON.stringify(saveUserParams),
		success: function(result, status, xhr) {
			alert("회원가입 성공!")
			location.reload();
		},
		error: function(error, status, xhr) {
			if (error) {
				alert("error : " + JSON.stringify(error) + "\n" + "status: " + status + "\n" + "xhr : " + xhr);
			}
		}
	})
	
}

const handledPasswordMatchCheck = () => {
	let password1 = $('#passwordInput').val();
	let password2 = $('#passwordCheckInput').val();
	
	if ( password1 !== password2 ) {
		$('#passwordCheckFalseResult').css("display", "inline-block");
	} else {
		$('#passwordCheckFalseResult').css('display', 'none');
	}
}

const initializeNicknameCheck = () => {
	let nicknameCheck = $('#nicknameDuplicateCheck').val("false");
}

$('#nicknameInput').on("propertychange change keyup paste input", initializeNicknameCheck);

const checkNicknameDuplicate = () => {
	let nickname = $("#nicknameInput").val();
	
	if(nickname == '' || nickname == null) {
		alert("nickname을 입력하세요.");
		$('#nicknameInput').focus();
		return;
	}
	
	$.ajax({
		type: "GET",
		url: "/api/users/duplicate/" + nickname,
		success: function(result, status, xhr) {
			if (result === true) {
				$('#nicknameCheckFalseResult').css('display', 'inline-block');
			} else {
				alert("사용하실 수 있는 nickname입니다.");
				$('#nicknameCheckFalseResult').css('display', 'none');
				$('#nicknameDuplicateCheck').val('true');
			}
		}
	})
}