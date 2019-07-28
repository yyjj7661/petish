const makeImageCarousel = (file) => {
	
	let fileList = file.files;
	
	console.log("file 불러오기");
	
	if (!fileList) {
		return;
	}
	
	console.log("file null 확인");
	
	for (let file of fileList) {
		if (file.size > 2097152) {
			alert("사진 사이즈는 2MB이하만 가능합니다.");
			initializeFileInput(file);
			return;
		}
		if ( !isImage(file.name)) {
			alert("파일은 jps, gif, png, jpeg 확장자만 가능합니다.");
			initializeFileInput(file);
			return;
		}
	}
	
	console.log("file validation check");
	
	$("div").remove(".carousel-item");
	
	for (let i = 0; i < fileList.length; i++) {

		let reader = new FileReader();
		
		if (i == 0) {
			reader.onloadend = function() {
				$("#picture1").addClass("active");
			}
		}
		
		reader.onload = function(e) {

			let img = '<div class="carousel-item" id=picture' + (i + 1) +'>' + 
				'<img class="d-block w-100" src=' + e.target.result + '>' +
				'</div>';

			$('.carousel-inner').append(img);
		}
		
		reader.readAsDataURL(fileList[i]);
	}
	
}

const isImage = (fileName) => {
	let pattern = /jpg$|gif$|png$|jpeg$/i;
	return fileName.match(pattern);
}

const initializeFileInput = (fileInput) => {
	fileInput.value = "";
}

const handledPostUpload = (form) => {
	let formData = new FormData(form);
	console.log(formData.has("title"));
	console.log(formData.has("content"));
	console.log(formData.has("file"));
	
	$.ajax({
		type:"POST",
		url:"/api/mypet/posts",
		data: formData,
		processData: false,
	    contentType: false,
		success: function(result, status, xhr) {
			console.log("업로드 성공");
			
		},
		error: function(error, status, xhr) {
			console.log("업로드 실패");
		
		}
	})
}