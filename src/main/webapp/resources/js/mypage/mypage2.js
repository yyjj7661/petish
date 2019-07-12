$(document).ready(function() {

	$("#qnaList tr:odd").addClass("odd");
	$("#qnaList tr:not(.odd)").hide();
	$("#qnaList tr:first-child").show(); // 열머리글 보여주기

	$("#qnaList tr.odd").click(function() {
		$(this).next("tr").toggle();
		$(this).find(".arrow").toggleClass("up");

	});

});

function openMap(modifyForm) {

	var url = "mapDetail.jsp";
	// 새로운 창을 url+option에 맞게 띄워줌.
	open(url, "confirm", "toolbar=no,location=no," + "status=no,menubar=no,"
			+ "scrollbars=yes,resizable=no," + "width=650,height=550");

}

