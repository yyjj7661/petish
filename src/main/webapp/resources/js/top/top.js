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
    var url="/kakaomap"
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
			alert("로그인 성공!")
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
			alert("로그아웃 성공!");
			location.reload();
		},
		error: function(error, status, xhr) {
			
		}
	})
}