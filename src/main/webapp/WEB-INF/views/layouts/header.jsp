<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>
<body>
	<div class="container">
		<header class="jumbotron mb-0 rounded-0">
			<div class="header-space">
				<a class="navbar-brand" href="/">
					<h1>로고</h1>
				</a>
				<div class="user-space">
					<a class="nav-link my-3" href="#">
						<img src="#" class="avatar-sm" />
						User
					</a>
					<button type="button" class="btn btn-light my-3">로그아웃</button>
				</div>
			</div>
			<%@ include file="menu.jsp"%>
		</header>