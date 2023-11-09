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

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/js/main.js"></script>

<script>
$(document).ready(function(){
	$('.logout-link').click(function(e) {
		e.preventDefault();
		$('#logoutForm').submit();
	});
});
</script>

</head>
<body>
	<div class="container">
		<header class="jumbotron mb-0 rounded-0">
			<div class="header-space mx-3">
				<a class="navbar-brand" href="/">
					<h1>로고</h1>
				</a>
				<div class="user-space">
					<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal.username" var="username" />
						<%-- 로그인 된 상태 --%>
						<li class="nav-item"><a class="nav-link"
							href="/security/profile">
								<img src="/security/avatar/sm/${username}" class="avatar-sm" />
								${username}
						</a></li>
						<li class="nav-item"><a class="nav-link logout-link" href="#">로그아웃
						</a></li>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<%-- 로그아웃 된 상태 --%>
						<li class="nav-item my-3 mr-3"><a class="nav-link"
							href="/security/login">로그인 </a></li>
						<li class="nav-item my-3"><a class="nav-link"
							href="/security/signup">회원가입 </a></li>
					</sec:authorize>
				</div>
			</div>
			<%@ include file="menu.jsp"%>
		</header>

		<form id="logoutForm" action="/security/logout" method="post">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>