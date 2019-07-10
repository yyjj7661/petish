const handlePictureDoubleClick = (id) => {
    handlePictureClick(id);
    handleButtonClick();
}

const handlePictureClick = (id) => {
    let candidates = $('input[name="vote-candidate"]');
    for (let i = 0; i < candidates.length; i++){
        if ( candidates[i].value === id ) {
            candidates[i].checked = true;
        }
    }
    console.log(id);
}

const handleButtonClick = () => {
    
    let candidates = $('input[name="vote-candidate"]');
    let candidate = "";
    for (let i = 0; i < candidates.length; i++){
        if ( candidates[i].checked ) {
            candidate = candidates[i];
        }
    }

    if (candidate === "") {
        alert("하나를 선택해주세요");
        return;
    }

    console.log(candidate);
    console.log("전송되었습니다.")

}