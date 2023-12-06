<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />

<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/animate/animate.css">
<!--===============================================================================================-->    
    <link rel="stylesheet" type="text/css" href="/resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->    
    <link rel="stylesheet" type="text/css" href="/resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/slick/slick.css">
<!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/resources/css/util.css">
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<!--===============================================================================================-->

<!--===============================================================================================-->	
<!-- <script src="/resources/vendor/jquery/jquery-3.2.1.min.js"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/vendor/bootstrap/js/popper.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="/resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="/resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="/resources/vendor/slick/slick.min.js"></script>
	<script src="/resources/js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script src="/resources/vendor/parallax100/parallax100.js"></script>
	<script>
        $('.parallax100').parallax100();
	</script>
<!--===============================================================================================-->
	<script src="/resources/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
		        delegate: 'a', // the selector for gallery item
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
<!--===============================================================================================-->
	<script src="/resources/vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2').on('click', function(e){
			e.preventDefault();
		});

		$('.js-addwish-b2').each(function(){
			var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-b2');
				$(this).off('click');
			});
		});

		$('.js-addwish-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});
	
	</script>
<!--===============================================================================================-->
	<script src="/resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<script defer src="/resources/js/main.js"></script>
<script src="/resources/js/number.js"></script>
<!-- Template Stylesheet -->

<script>
	$(document).ready(function() {
		$('.logout-link').click(function(e) {
			e.preventDefault();
			$('#logoutForm').submit();
		});
	});
</script>
<style>
.header-css{
	padding-bottom:100px;
}
.logo_img {
	width: 200px;
	height: 120px;
}

#menulink {
	color: #000000;
	font-weight: bold;
}

.desktop-header {
	float: right;
	display: flex;
}

.user-space {
	top: 27%;
	left: 78%;
	position: absolute;
}

.nav-item {
	height: 40px;
	display: flex;
	align-items: center;
	margin-top: 10px;
}

.nav-link {
	font-family: Poppins-Medium;
	font-size: 14px;
}

.login-div {
	height: 100%;
	position: relative;
	font-size: 14px;
	line-height: 1;
	cursor: pointer;
}

.logout-link {
	height: 100%;
}
</style>
</head>

<body class="animsition">
	<header class="header-css">
		<!-- Header desktop -->
		<div class="container-menu-desktop">
			<!-- Topbar -->
			<div class="wrap-menu-desktop">
				<nav class="limiter-menu-desktop container">

					<!-- Logo desktop -->
					<a href="/" class="logo"> <img src="/resources/images/logo.png"
						alt="IMG-LOGO">
					</a>

					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">
							<li><a href="/board/list">공지사항</a></li>
							<li><a href="/store/list">가맹점찾기</a></li>
							<li><a href="/introduction/get">서비스소개</a></li>
							<sec:authorize access="hasRole('ROLE_MANAGER') or hasRole('ROLE_ADMIN')">
								<li><a href="/managers/managers_list">관리자</a></li>
							</sec:authorize>
						</ul>
					</div>

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m desktop-header">
						<div
							class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
							<%@ include file="../common/search_bar.jsp"%>
						</div>

						<sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal.member" var="member" />
							<li class="nav-item"><a
								class="dis-block cl2 hov-cl1 trans-04 p-l-22 p-r-11 login-div"
								href="/security/profile"> <img
									src="/security/avatar/sm/${member.username}" class="avatar-sm" />
									${member.name}
							</a></li>
							<li class="nav-item"><a
								class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 logout-link"
								href="#"> <i class="fa-solid fa-right-from-bracket"></i>
							</a></li>
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
							<a
								class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11"
								href="/security/login"> <i
								class="fa-solid fa-right-to-bracket"></i>
							</a>
							<a
								class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11"
								href="/security/signup"> <i class="fa-solid fa-user-plus"></i>
							</a>
						</sec:authorize>
					</div>
				</nav>
			</div>
		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->
			<div class="logo-mobile">
				<a href="/"><img src="/resources/images/logo.png"
					alt="IMG-LOGO"></a>
			</div>

			<!-- Icon header -->
			<!-- 검색, 로그인, 로그아웃이 있어야 하는 곳. -->
			<div class="wrap-icon-header flex-w flex-r-m m-r-15">
				<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal.member" var="member" />
					<li class="nav-item"><a
						class="dis-block cl2 hov-cl1 trans-04 p-l-22 p-r-11 login-div"
						href="/security/profile"> <img
							src="/security/avatar/sm/${member.username}" class="avatar-sm" />
							${member.name}
					</a></li>
					<li class="nav-item"><a
						class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 logout-link"
						href="#"> <i class="fa-solid fa-right-from-bracket"></i>
					</a></li>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
					<a
						class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11"
						href="/security/login"> <i
						class="fa-solid fa-right-to-bracket"></i>
					</a>
					<a
						class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11"
						href="/security/signup"> <i class="fa-solid fa-user-plus"></i>
					</a>
				</sec:authorize>
			</div>

			<!-- Button show menu -->
			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box"> <span class="hamburger-inner"></span>
				</span>
			</div>
		</div>


		<!-- Menu Mobile -->
		<div class="menu-mobile">
			<%-- <ul class=topbar-mobile">
				<li><a href="/board/list">공지사항</a></li>
				<li class="label1" data-label1="hot"><a href="/store/list">가맹점찾기</a></li>
				<li><a href="/introduction/get">서비스소개</a></li>
				<sec:authorize access="hasRole('ROLE_MANAGER') or hasRole('ROLE_ADMIN')">
				<li><a href="/managers/managers_list">관리자</a></li>
				</sec:authorize>
			</ul> --%>
			<ul class="main-menu-m">
				<li><a href="/board/list">공지사항</a></li>
				<li><a href="/store/list">가맹점찾기</a></li>
				<li><a href="/introduction/get">서비스소개</a></li>
				<sec:authorize access="hasRole('ROLE_MANAGER') or hasRole('ROLE_ADMIN')">
				<li><a href="/managers/managers_list">관리자</a></li>
				</sec:authorize>
			</ul>
		</div>
		
		<!-- Back to top -->
		<div class="btn-back-to-top" id="myBtn">
			<span class="symbol-btn-back-to-top">
				<i class="zmdi zmdi-chevron-up"></i>
			</span>
		</div>
	</header>

	<form id="logoutForm" action="/security/logout" method="post">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>