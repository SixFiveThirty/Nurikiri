<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">

<style>
	.logo_img{

		width :200px;
		height : 120px;}
</style>
			


<div class="wrap-menu-desktop how-shadow1">
				<nav class="limiter-menu-desktop container">
					<!-- Logo desktop -->		
					<a href="index.html"><img src="/resources/images/logo.png" alt="IMG-LOGO" width = "120"></a>

					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">
							<li>
								<a href="home">Home</a>
							</li>

							<li>
								<a href="/board/list">Notice</a>
							</li>
							
							<li>
								<a href="/store/list">Store</a>
							</li>

							<li class="label1" data-label1="hot">
								<a href="/recommend/editor/get">Editor</a>
							</li>

							<li class="active-menu">
								<a href="/introduction/get">About</a>
							</li>

							<li>
								<a href="/managers/managers_list">Manager</a>
							</li>
						</ul>
					</div>	

					<div class="user-space py-5">
						<sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal.member" var="member" />
							<%-- 로그인 된 상태 --%>
							<li class="nav-item photo my-3 mr-3"><a class="nav-link"
								href="/security/profile">
									<img src="/security/avatar/sm/${member.username}" class="avatar-sm" />
									${member.name}
							</a></li>
							<li class="nav-item login my-3"><a class="nav-link logout-link" href="#">로그아웃
							</a></li>
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
							<%-- 로그아웃 된 상태 --%>
							<li class="nav-item logout my-3 mr-3"><a class="nav-link"
								href="/security/login">로그인 </a></li>
							<li class="nav-item logout my-3"><a class="nav-link"
								href="/security/signup">회원가입 </a></li>
						</sec:authorize>
						</div>
					</div>

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m">
						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
							<i class="zmdi zmdi-search"></i>
						</div>

						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="2">
							<i class="zmdi zmdi-shopping-cart"></i>
						</div>

						<a href="#" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti" data-notify="0">
							<i class="zmdi zmdi-favorite-outline"></i>
						</a>
					</div>
				</nav>
			</div>	
		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->		
			<div class="logo-mobile">
				<a href="index.html"><img src="/resources/images/logo.png" alt="IMG-LOGO"></a>
			</div>

			<!-- Icon header -->
			<div class="wrap-icon-header flex-w flex-r-m m-r-15">
				<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
					<i class="zmdi zmdi-search"></i>
				</div>

				<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart" data-notify="2">
					<i class="zmdi zmdi-shopping-cart"></i>
				</div>

				<a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti" data-notify="0">
					<i class="zmdi zmdi-favorite-outline"></i>
				</a>
			</div>


			<!-- Button show menu -->
			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
				</span>
			</div>
		</div>
		
		
		
		<!-- Menu Mobile -->
		<div class="menu-mobile">
			<ul class="main-menu-m">
				<li>
					<a href="/home">Home</a>
				</li>

				<li>
					<a href="/board/list">Notice</a>
				</li>

				<li>
					<a href="/store/list">Store</a>
				</li>

				<li>
					<a href="/recommend/editor/get" class="label1 rs1" data-label1="hot">Editor</a>
				</li>

				<li>
					<a href="/introduction/get">About</a>
				</li>

				<li>
					<a href="/managers/managers_list">Manager</a>
				</li>
			</ul>
		</div>
			


				
		

		