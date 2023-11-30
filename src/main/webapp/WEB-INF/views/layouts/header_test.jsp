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
<link rel="stylesheet" href="/resources/css/main.css" />

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/js/main.js"></script>

<script>
	$(document).ready(function() {
		$('.logout-link').click(function(e) {
			e.preventDefault();
			$('#logoutForm').submit();
		});
	});
</script>
<style>
header {
	background-color: green;
}

.logo_img {
	width: 200px;
	height: 120px;
}

.container2 {
	background: white;
}

#menulink {
	color: #000000;
	font-weight: bold;
}

.desktop-header {
	float: right;
	display: flex;
	justify-content: center;
}

.user-space {
	top: 27%;
	left: 78%;
	position: absolute;
}

.nav-item {
	background-color: #FEC25E;
	height: 40px;
}

.nav-link {
	font-family: Poppins-Medium;
	font-size: 14px;
}
</style>

<!--===============================================================================================-->
<link rel="icon" type="image/png" href="/resources/images/icons/favicon.png" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/resources/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/resources/vendor/slick/slick.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/resources/css/util.css">
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<!--===============================================================================================-->

</head>
<body class="animsition">
	<header>
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
							<li class="label1" data-label1="hot"><a href="/store/list">가맹점찾기</a></li>
							<li><a href="/introduction/get">서비스소개</a></li>
							<li><a href="/managers/managers_list">관리자</a></li>
						</ul>
					</div>

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m desktop-header">
						<!-- 원래 코드 -->
						<div
							class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
							<i class="zmdi zmdi-search"></i>
						</div>

						<div
							class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
							data-notify="2">
							<i class="zmdi zmdi-shopping-cart"></i>
						</div>

						<a href="#"
							class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti"
							data-notify="0"> <i class="zmdi zmdi-favorite-outline"></i>
						</a>

						<!-- 우리가 새로 추가한 코드 -->
						<%-- <div class="navbar-nav">
							<%@ include file="../common/search_bar.jsp"%>
						</div>
						<div class="user-space ml-3">
							<sec:authorize access="isAuthenticated()">
								<sec:authentication property="principal.member" var="member" />
								<li class="nav-item"><a class="nav-link"
									href="/security/profile"> <img
										src="/security/avatar/sm/${member.username}" class="avatar-sm" />
										${member.name}
								</a></li>
								<li class="nav-item"><a class="nav-link logout-link"
									href="#">로그아웃</a></li>
							</sec:authorize>
							<sec:authorize access="isAnonymous()">
								<li class="nav-item mr-2"><a class="nav-link"
									href="/security/login">로그인</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/security/signup">회원가입</a></li>
							</sec:authorize>
						</div> --%>
					</div>
				</nav>
			</div>
		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->
			<div class="logo-mobile">
				<a href="index.html"><img src="/resources/images/logo.png"
					alt="IMG-LOGO"></a>
			</div>

			<!-- Icon header -->
			<!-- 검색, 로그인, 로그아웃이 있어야 하는 곳. -->
			<div class="wrap-icon-header flex-w flex-r-m m-r-15">

				<%-- <div class="navbar-nav">
					<%@ include file="../common/search_bar.jsp"%>
				</div> --%>
				<!-- 				<div
					class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart"
					data-notify="2">
					<i class="zmdi zmdi-shopping-cart"></i>
				</div> -->

				<!-- 				<a href="#"
					class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti"
					data-notify="0"> <i class="zmdi zmdi-favorite-outline"></i>
				</a> -->

				<!-- 원래 코드 -->
				<div
					class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
					<i class="zmdi zmdi-search"></i>
				</div>

				<div
					class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart"
					data-notify="2">
					<i class="zmdi zmdi-shopping-cart"></i>
				</div>

				<a href="#"
					class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti"
					data-notify="0"> <i class="zmdi zmdi-favorite-outline"></i>
				</a>
			</div>

			<!-- Button show menu -->
			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box"> <span class="hamburger-inner"></span>
				</span>
			</div>
		</div>


		<!-- Menu Mobile -->
		<div class="menu-mobile">
			<ul class="topbar-mobile">
				<li>
					<div class="left-top-bar">Free shipping for standard order
						over $100</div>
				</li>

				<li>
					<div class="right-top-bar flex-w h-full">
						<a href="#" class="flex-c-m p-lr-10 trans-04"> Help & FAQs </a> <a
							href="#" class="flex-c-m p-lr-10 trans-04"> My Account </a> <a
							href="#" class="flex-c-m p-lr-10 trans-04"> EN </a> <a href="#"
							class="flex-c-m p-lr-10 trans-04"> USD </a>
					</div>
				</li>
			</ul>

			<ul class="main-menu-m">
				<li><a href="/board/list">공지사항</a></li>
				<li class="label1" data-label1="hot"><a href="/store/list">가맹점찾기</a></li>
				<li><a href="/introduction/get">서비스소개</a></li>
				<li><a href="/managers/managers_list">관리자</a></li>
			</ul>
		</div>
	</header>

	<form id="logoutForm" action="/security/logout" method="post">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>