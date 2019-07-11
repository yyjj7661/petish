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