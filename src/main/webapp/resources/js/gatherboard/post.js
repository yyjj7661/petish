$(document).ready(function(){
	commentList();
});

/* 크기별 견종 분류 */
function categoryChange() {
	var size = document.getElementsByName('DOG_SIZE');
	var small = ["스피츠","꼬똥 드 툴레아","시츄","요크셔테리어","말티즈","포메라니안","푸들","치와와","미니핀","슈나우저","페키니즈","닥스훈트","빠삐용","기타 소형견"];
	var medium = ["비숑 프리제","보스턴 테리어","샤페이","웰시코기","비글","코카스파니엘","불독","기타 중형견"];
	var large = ["사모예드","피레니즈","리트리버","말라뮤트","한국 토종견","허스키","세퍼트","하운드","달마시안","콜리","쉽독","기타 대형견"];
	var target = document.getElementById("species");
	
	if(size[0].value == 1) var d = small;
	else if(size[0].value == 2) var d = medium;
	else if(size[0].value == 3) var d = large;
	
	target.options.length = 0;
	
	for(x in d) {
		var opt = document.createElement("option");
		opt.value = d[x];
		opt.innerHTML = d[x];
		target.appendChild(opt);
	}
}

$('#participantResetBtn').click(function(){
	$('#myLargeModal').modal('hide');
})

function participantCheck(size) {	
	var sizeID = size;
	var participantSizeID = document.getElementById('size');
	var requestContent = document.getElementById('requestContent');
	
	if(sizeID != participantSizeID.value) {
		alert("크기를 다시 선택해주세요!");
		return false;
	}
	
	if(requestContent.value == "" || requestContent.value == null) {
		alert("신청 내용을 입력해주세요!");
		return false;
	}
	
	return true;
}

function messageClick(participant) {
	var msg = participant.split(",");
	alert(msg);
	var participantID = msg[0];
	var participantNickName = msg[1];
	
	var actionForm = $("#message_form");
	actionForm.find("input[name='messageReceiver_id']").val(participantID);
	actionForm.find("input[name='messageNickname']").val(participantNickName);
	
    $(this).attr('data-target',"#message-modal");
    $('#message-modal').modal("show");	

}

//쪽지 전송
$('#modalSendBtn').click(function(event){          
     event.preventDefault();
     
     var newModal = $("#message-modal"); //모달창
     
     var modalInputTitle = newModal.find("input[name='messageTitle']"); //모달창 제목
     var modalInputContent = newModal.find("textarea[name='messageContent']"); //모달창 내용
     var modalInputSender_id = newModal.find("#sender_id"); // 모달창 보내는 user_id
     var modalInputReceiver_id = newModal.find("input[name='messageReceiver_id']"); //모달창 받는 user_id
     
     var modalSendBtn = $(".modalSendBtn"); //모달 보내기 버튼
     
     //var msg = $("#message_form").serialize();
     //alert(msg);
     
     var message = {
            title : modalInputTitle.val(),
            content : modalInputContent.val(),
            sender_id : modalInputSender_id.val(),
            receiver_id : modalInputReceiver_id.val()
            }
      
       $.ajax({
           url : '/mypage/api/message/new',
           type : 'post',
           data : JSON.stringify(message),
           contentType : "application/json; charset=utf-8",
           beforeSend : function(){
        	  if(message.sender_id == message.receiver_id) {
             	 alert("본인에게는 쪽지를 보낼 수 없습니다!");
             	 $("#message-modal").modal("hide");
             	 return false;
              }
              else{
                 return true;
              }
           },
           success : function(result, status, xhr) {
              if (result) {
                 alert("쪽지가 성공적으로 전송됐습니다.");
                 $("#message-modal").modal("hide");
              }
          },
          error : function(xhr, status, er) {
              if (error) {
                  error(er);
                  alert("쪽지 전송 실패");
              }
          }
       });
});   
