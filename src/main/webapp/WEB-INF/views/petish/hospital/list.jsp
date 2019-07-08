<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Hospital List</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="/resources/vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="/resources/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Google fonts - Roboto-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,700">
    <!-- Bootstrap Select-->
    <link rel="stylesheet" href="/resources/vendor/bootstrap-select/css/bootstrap-select.min.css">
    <!-- owl carousel-->
    <link rel="stylesheet" href="/resources/vendor/owl.carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="/resources/vendor/owl.carousel/assets/owl.theme.default.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="/resources/css/style.lightblue.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="/resources/css/custom.css">
    <!-- Favicon and apple touch icons-->
    <link rel="shortcut icon" href="/resources/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="/resources/img/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="57x57" href="/resources/img/apple-touch-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/resources/img/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/resources/img/apple-touch-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/resources/img/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/resources/img/apple-touch-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/resources/img/apple-touch-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/resources/img/apple-touch-icon-152x152.png">
    
    <!-- 평점 별  -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/css/star-rating.css" media="all" type="text/css"/>
    <link rel="stylesheet" href="/resources/css/theme-krajee-fa.css" media="all" type="text/css"/>
    <link rel="stylesheet" href="/resources/css/theme-krajee-svg.css" media="all" type="text/css"/>
    <link rel="stylesheet" href="/resources/css/theme-krajee-uni.css" media="all" type="text/css"/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="/resources/js/star-rating.js" type="text/javascript"></script>
    <!-- 평점 별  -->
    
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  </head>
  <body>
    <div id="all">
    
      <%@ include file="/WEB-INF/views/commons/top.jspf" %>
      
      <div id="heading-breadcrumbs">
        <div class="container">
          <div class="row d-flex align-items-center flex-wrap">
            <div class="col-md-7">
            </div>
            <div class="col-md-5">
              <ul class="breadcrumb d-flex justify-content-end">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item active">Our Team</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      
      <div id="content">
        
        <div class="container">
          <section class="bar mb-0">
            <div class="row">
              <div class="col-md-12">
                <div class="heading">
                  <h2>PET Hospital</h2>
                </div>
                <p class="lead"></p>
                <div class="row text-center">
                  <div class="col-md-3">
                    <div data-animate="fadeInUp" class="team-member">
                      <div class="image"><a href="team-member.html"><img src="/resources/img/A1.jpg" alt="" class="img-fluid rounded-circle"></a></div>
                      <h3 style="font-size:25px;"><a href="team-member.html">A 동물병원</a></h3><p></p>
							<form>
						        <input type="text" class="rating rating-loading" value="2" data-size="xs" title="">
        					</form>
                      <div class="text">
                        <a>02-9999-9999</a>
                        <p>응급진료</p>
                      </div>
                    </div>
                  </div>
                  
                  <!-- /.team-member-->
                  <div data-animate="fadeInUp" class="col-md-3">
                    <div class="team-member">
                      <div class="image"><a href="team-member.html"><img src="/resources/img/A2.jpg" alt="" class="img-fluid rounded-circle"></a></div>
                      <h3 style="font-size:25px;"><a href="team-member.html">B 동물병원</a></h3><p style="font-size:25px;">★★★★★</p>
                      
                      <div class="text">
                        <a>02-9999-9999</a>
                        <p>응급진료</p>
                      </div>
                    </div>
                  </div>
                  
                  <!-- /.team-member-->
                  <div data-animate="fadeInUp" class="col-md-3">
                    <div class="team-member">
                      <div class="image"><a href="team-member.html"><img src="/resources/img/A3.jpg" alt="" class="img-fluid rounded-circle"></a></div>
                      <h3 style="font-size:25px;"><a href="team-member.html">C 동물병원</a></h3><p style="font-size:25px;">★★★★★</p>
                      
                      <div class="text">
                        <a>02-9999-9999</a>
                        <p>응급진료</p>
                      </div>
                    </div>
                  </div>
                  
                  <!-- /.team-member-->
                  <div data-animate="fadeInUp" class="col-md-3">
                    <div class="team-member">
                      <div class="image"><a href="team-member.html"><img src="/resources/img/A4.jpg" alt="" class="img-fluid rounded-circle"></a></div>
                      <h3 style="font-size:25px;"><a href="team-member.html">D 동물병원</a></h3><p style="font-size:25px;">★★★★★</p>
                     
                      <div class="text">
                        <a>02-9999-9999</a>
                        <p>응급진료</p>
                      </div>
                    </div>
                  </div>
                </div>
                
              </div>
            </div>
          </section>
        </div>
        
      </div>
      
      <!-- GET IT-->
      <div class="get-it">
        <div class="container">
          <div class="row">
            <div class="col-lg-8 text-center p-3">
              <h3>Do you want cool website like this one?</h3>
            </div>
            <div class="col-lg-4 text-center p-3">   <a href="#" class="btn btn-template-outlined-white">Buy this template now</a></div>
          </div>
        </div>
      </div>
      
      <!-- FOOTER -->
      <footer class="main-footer">
        <div class="container">
          <div class="row">
            <div class="col-lg-3">
              <h4 class="h6">About Us</h4>
              <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>
              <hr>
              <h4 class="h6">Join Our Monthly Newsletter</h4>
              <form>
                <div class="input-group">
                  <input type="text" class="form-control">
                  <div class="input-group-append">
                    <button type="button" class="btn btn-secondary"><i class="fa fa-send"></i></button>
                  </div>
                </div>
              </form>
              <hr class="d-block d-lg-none">
            </div>
            <div class="col-lg-3">
              <h4 class="h6">Blog</h4>
              <ul class="list-unstyled footer-blog-list">
                <li class="d-flex align-items-center">
                  <div class="image"><img src="/resources/img/detailsquare.jpg" alt="..." class="img-fluid"></div>
                  <div class="text">
                    <h5 class="mb-0"> <a href="post.html">Blog post name</a></h5>
                  </div>
                </li>
                <li class="d-flex align-items-center">
                  <div class="image"><img src="/resources/img/detailsquare.jpg" alt="..." class="img-fluid"></div>
                  <div class="text">
                    <h5 class="mb-0"> <a href="post.html">Blog post name</a></h5>
                  </div>
                </li>
                <li class="d-flex align-items-center">
                  <div class="image"><img src="/resources/simg/detailsquare.jpg" alt="..." class="img-fluid"></div>
                  <div class="text">
                    <h5 class="mb-0"> <a href="post.html">Very very long blog post name</a></h5>
                  </div>
                </li>
              </ul>
              <hr class="d-block d-lg-none">
            </div>
            <div class="col-lg-3">
              <h4 class="h6">Contact</h4>
              <p class="text-uppercase"><strong>Universal Ltd.</strong><br>13/25 New Avenue <br>Newtown upon River <br>45Y 73J <br>England <br><strong>Great Britain</strong></p><a href="contact.html" class="btn btn-template-main">Go to contact page</a>
              <hr class="d-block d-lg-none">
            </div>
            <div class="col-lg-3">
              <ul class="list-inline photo-stream">
                <li class="list-inline-item"><a href="#"><img src="/resources/img/detailsquare.jpg" alt="..." class="img-fluid"></a></li>
                <li class="list-inline-item"><a href="#"><img src="/resources/img/detailsquare2.jpg" alt="..." class="img-fluid"></a></li>
                <li class="list-inline-item"><a href="#"><img src="/resources/img/detailsquare3.jpg" alt="..." class="img-fluid"></a></li>
                <li class="list-inline-item"><a href="#"><img src="/resources/img/detailsquare3.jpg" alt="..." class="img-fluid"></a></li>
                <li class="list-inline-item"><a href="#"><img src="/resources/img/detailsquare2.jpg" alt="..." class="img-fluid"></a></li>
                <li class="list-inline-item"><a href="#"><img src="/resources/img/detailsquare.jpg" alt="..." class="img-fluid"></a></li>
              </ul>
            </div>
          </div>
        </div>
        <div class="copyrights">
          <div class="container">
            <div class="row">
              <div class="col-lg-4 text-center-md">
                <p>&copy; 2019. Your company / name goes here</p>
              </div>
              <div class="col-lg-8 text-right text-center-md">
                <p>Template design by <a href="https://bootstrapious.com/p/big-bootstrap-tutorial">Bootstrapious </a>& <a href="https://fity.cz/ostrava">Fity</a></p>
                <!-- Please do not remove the backlink to us unless you purchase the Attribution-free License at https://bootstrapious.com/donate. Thank you. -->
              </div>
            </div>
          </div>
        </div>
      </footer>
    </div>
    <!-- Javascript files-->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/popper.js/umd/popper.min.js"> </script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="/resources/vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="/resources/vendor/waypoints/lib/jquery.waypoints.min.js"> </script>
    <script src="/resources/vendor/jquery.counterup/jquery.counterup.min.js"> </script>
    <script src="/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
    <script src="/resources/vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.min.js"></script>
    <script src="/resources/js/jquery.parallax-1.1.3.js"></script>
    <script src="/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
    <script src="/resources/vendor/jquery.scrollto/jquery.scrollTo.min.js"></script>
    <script src="/resources/js/front.js"></script>
  </body>
</html>