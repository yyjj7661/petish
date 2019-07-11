const resizeIcon = () => {
	
    if (window.innerWidth < 576) {
    	
        $('#profile-icon').removeClass('fa-2x');
	    $('#profile-icon').addClass('fa-lg');
	    $('.like-icon').removeClass('fa-lg');
	    $('.comment-icon').removeClass('fa-lg');
    } else {
        $('#profile-icon').removeClass('fa-lg');
        $('#profile-icon').addClass('fa-2x');
        $('.like-icon').addClass('fa-lg');
        $('.comment-icon').addClass('fa-lg');
    }
}

$(window).ready(function() {
    resizeIcon();
}) 

$(window).resize(function() {
    resizeIcon();
})

const openModal = () => {
    $(".modal").modal('show');
}

likeDoubleClick = (id) => {
    console.log(id);
}

likeClick = () => {
    
    const like= $('#like-icon');
    let likeCount = parseInt($('#like-count').text());
    if (like.hasClass('s-likes-icon-active')) {
        like.removeClass('s-likes-icon-active');
        likeCount--;
    } else {
        like.addClass('s-likes-icon-active');
        likeCount++;
    }
    $('#like-count').html(likeCount);
}

handleKeyPress = (e) => {
    if (e.key === 'Enter') {
        console.log("찍히냐");
        e.target.value = '';
        addReply();
    }
}

addLike = () => {
    console.log("add되었습니다.");
}

openPost = (id) => {
    let post = mypetList[id-1];
    let postSource = "<img src=" + post.image + ">";
    $('#user-id').html(post.user);
    $('#post-picture').html(postSource);
    $('#post-title').html(post.title);
    $('#created-date').html(post.createdDate);
    $('#post-content').html(post.content);
    $('#like-count').html(post.likeCount);
    $('#comment-count').html(post.commentCount);
    openModal();
}

mypetList = [
    {"user": "abcd1234", "image": "https://c.pxhere.com/photos/46/fa/puppy_german_shepherd_tiny_cute_animal_dog_pet_young-630530.jpg!d", "title": "안녕하세요", "createdDate":"2019-3-1", "likeCount":80, "commentCount":3, "content":"날씨도 좋고 기분도 좋고"},
    {"user": "oeri0", "image": "https://c.pxhere.com/photos/79/c1/dog_face_hybrid_eyes_animal_pet_comrade_portrait-626744.jpg!d" , "title": "오랜만에~", "createdDate":"2019-3-11", "likeCount":71, "commentCount":3, "content":"날씨도 좋고 기분도 좋고"},
    {"user": "klop0", "image": "https://c.pxhere.com/photos/10/55/mouse_racing_mouse_nager_pet_sun_hand_tame_gerbil-1385729.jpg!d", "title": "심심해요", "createdDate":"2019-3-17", "likeCount":28, "commentCount":3, "content":"날씨도 좋고 기분도 좋고"},
    {"user": "vcxz", "image": "https://c.pxhere.com/photos/68/3c/dog_labrador_christmas_lights_cute_retriever_animal_pet-373153.jpg!d", "title": "오랜만에~", "createdDate":"2019-3-22", "likeCount":100, "commentCount":3, "content":"날씨도 좋고 기분도 좋고"},
    {"user": "rewopq", "image": "https://c.pxhere.com/photos/7b/38/cat_pet_look_animal_feline_animals_kitten_cute-795388.jpg!d" , "title": "냥이보러와용", "createdDate":"2019-3-25", "likeCount":88, "commentCount":3, "content":"날씨도 좋고 기분도 좋고"},
    {"user": "opfgkl", "image": "https://c.pxhere.com/images/b2/13/73dd518494efc186e51e6df93f7e-1418279.jpg!d" , "title": "댕댕이자랑", "createdDate":"2019-3-28", "likeCount":64, "commentCount":3, "content":"날씨도 좋고 기분도 좋고"},
    {"user": "erowipq", "image": "https://upload.wikimedia.org/wikipedia/en/thumb/c/c9/Puppy_Up_Close.jpg/1062px-Puppy_Up_Close.jpg", "title": "제 강아지 이쁘죠?", "createdDate":"2019-4-1", "likeCount":75, "commentCount":3, "content":"날씨도 좋고 기분도 좋고"},
    {"user": "fhdj", "image": "https://c.pxhere.com/photos/21/18/dog_animal_cute_pet_portrait-494070.jpg!d", "title": "오랜만에~", "createdDate":"2019-4-20", "likeCount":29, "commentCount":3, "content":"날씨도 좋고 기분도 좋고"},
    {"user": "fdjkls", "image": "https://c.pxhere.com/photos/7b/38/cat_pet_look_animal_feline_animals_kitten_cute-795388.jpg!d", "title": "날씨가 좋아요", "createdDate":"2019-4-26", "likeCount":36, "commentCount":3, "content":"날씨도 좋고 기분도 좋고"},
    {"user": "fkdl", "image": "https://tul.imgix.net/content/article/puppy-pinot-sydney.jpg?auto=format,compress&w=740&h=486&fit=crop&crop=edges", "title": "놀러왔어요", "createdDate":"2019-4-29", "likeCount":86, "commentCount":3, "content":"날씨도 좋고 기분도 좋고"},
    {"user": "asdf", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP_-HHVJrxrUwVgcif6cpBPCp18jayAdpwXyecnu7bxdueXa2U" , "title": "나들이~", "createdDate":"2019-5-1", "likeCount":49, "commentCount":3, "content":"날씨도 좋고 기분도 좋고"},
    {"user": "abcd2345", "image": "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12193133/German-Shepherd-Puppy-Fetch.jpg", "title": "누구게~", "createdDate":"2019-5-3", "likeCount":32, "commentCount":3, "content":"날씨도 좋고 기분도 좋고"},
    {"user": "abcd1234", "image": "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2018/05/22224952/beagle-puppy-in-large-cushion-chair.jpg", "title": "오랜만에~", "createdDate":"2019-5-11", "likeCount":43, "commentCount":3, "content":"날씨도 좋고 기분도 좋고"},
    {"user": "user1", "image": "https://c.pxhere.com/photos/b1/90/dog_puppy_pet_animal_cute_labrador-855217.jpg!d", "title": "우리 아기 이쁘죵", "createdDate":"2019-06-11", "likeCount":49, "commentCount":3, "content":"어제 찍은 우리 아기 사진이에요~~~\n이게뭐하는짓인지\n현타가 온다~~~~"}
];

replies = [
    [{"replyer":"user1", "content":"와 진짜 이쁘네요", "createdDate":"2019-6-13"}, {"replyer":"user2", "content":"헐 진짜 이쁘네요", "createdDate":"2019-6-13"}, {"replyer":"user3", "content":"그러네 진짜 이쁘네요", "createdDate":"2019-6-13"}],

]