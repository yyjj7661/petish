$(document).ready(function(){

gatherboardList();

});

//게시글 목록
function gatherboardList(params) {
	var params = $("#page_form").serialize(); //입력데이터를 쿼리스트링으로 만들어준다.
	$('#gatherboardList').empty();
	$('#postCount').empty();
	
	$.ajax({
		url:'/admin/dog/gatherboard/gatherboardList',
		type:'GET',
		data: params,
		contentType:'application/x-www-form-urlencoded; charset=UTF-8',
		dataType:"json",
		success:function(result) {
			for(var i in result) {
				var count = '<p>게시물 개수 : ' + result[i].count + '</p>';
				var countVal = '';
				var output = '';
				countVal += '<input type="hidden" id="postCountVal" value='+result[i].count+' />';
				output += '<tr role="row" class="odd">';
				output += '<td class="sorting_1" class="text-center">' + result[i].id + '</td>';
				output += '<td class="text-center">' + result[i].region_NAME + '</td>';
				output += '<td class="text-center">' + result[i].dog_SIZE + '형견</td>';
				output += '<td class="text-center"><a href="/dog/gatherboard/'+result[i].id+'">' + result[i].title + '</a></td>';
				output += '<td class="text-center">' + result[i].nickname + '</td>';
				output += '<td class="text-center">' + result[i].CREATED_DATE + '</td>';
				output += '<td class="text-center">' + result[i].view_COUNT + '</td>';
				output += '<td class="text-center">' + result[i].deleted + '</td>';
				output += '<td class="text-center">' + '<button type="button" onclick="removePost('+result[i].id+')" id="deletebtn" class="btn btn-template-outlined">삭제</button>' + '</td>';
				output += '</tr>';
				
				$('#gatherboardList').append(output);
			}
			$("#postCount").append(count);
			$("#postCount").append(countVal);
			postCount();
		},
		error:function() {
			alert("ajax 통신 실패!");
		}
	});
}

var pageNum = 1;
var postPageFooter = $(".post-footer");

//댓글 페이지 번호 출력
function postCount() {
	var postCnt = document.getElementById('postCountVal').value;
		
	var endNum = Math.ceil(pageNum / 10.0) * 10;
	var startNum = endNum - 9;
	
	var prev = startNum != 1;
	var next = false;
	
	if(endNum * 10 >= postCnt) {
		endNum = Math.ceil(postCnt/10.0);
	}
	
	if(endNum * 10 < postCnt) {
		next = true;
	}
	
	var str = "<ul class='pagination'>";
	
	if(prev) {
		str += "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'><<</a></li>";
	}
	
	for(var i = startNum ; i <= endNum; i++) {
		var active = pageNum == i? "active":"";
		
		str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
	}
	
	if(next) {
		str += "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>>></a></li>";
	}
	
	str += "</ul></div>";
	
	console.log(str);
	
	postPageFooter.html(str);
}

//페이지의 번호를 클릭했을 때 새로운 댓글을 가져오도록 하기
postPageFooter.on("click", "li a", function(e){
	e.preventDefault();
	console.log("page click");
	
	var targetPageNum = $(this).attr("href");
	
	console.log("targetPageNum: " + targetPageNum);
	
	pageNum = targetPageNum;
	
	var actionForm = $("#page_form");
	actionForm.find("input[name='pageNum']").val(pageNum);
	
	var params = $("#page_form").serialize();
	gatherboardList(params);
});


//게시물 삭제
//댓글 삭제
function removePost(postID) {
	if(confirm("삭제하시겠습니까?")) {		
		$.ajax({
			type : 'put',
			url : '/admin/dog/gatherboard/removePost/' + postID,
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if(result) {
					//alert('게시물 삭제!');
					gatherboardList();
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					alert('삭제 실패!');
					error(er);
				}
			}
		});
	}
	else {
		alert('게시물 삭제 취소!');
	}
}