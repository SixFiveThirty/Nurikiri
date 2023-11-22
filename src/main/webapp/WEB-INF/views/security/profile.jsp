<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@ include file="../layouts/header.jsp"%>


<%-- 개별 페이지 --%>
<style>
.profile {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.profile_title {
	margin-bottom: 40px;
}

.profile_title h1{
	font-size: 24px;
	font-style: normal;
	font-weight: 500;
}

.inf {
	width: 800px;
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-top: 20px;
	
}

.profile_inf {
	width: 800px;
	display: flex;
	margin-top: 20px;
	margin: 0 auto;
	margin-bottom: 35px;
}

.box1 {
	display: flex;
}

.profile_inf .photo img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.profile_inf .photo {
	border-radius: 70%;
	overflow: hidden;
	width: 250px;
	height: 250px;
	margin-left: 80px;
	
}

.profile_inf .sebu_inf{
	margin-left: 90px;
	display:flex;
	align-items: center;
}


th, td{
	padding: 10px 20px;
}


.menubox {
	width: 800px;
	display: flex;
	justify-content: space-between;
	margin: 0 auto;
}

.menu {
	display: flex;
	margin: 0 auto;
	width: 250px;
	height: 80px;
	border-radius: 3px;
	background-color:#D9D9D9;
	text-align: center;
	align-items: center;
	justify-content: space-between;
}

.menu a {
	color : #000000;
	margin: 0 auto;
	width: 100%;
}
</style>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.member" var="member" />
</sec:authorize>

<div class="profile">
	<div class="inf">
		<div class="profile_title">
			<h1>프로필</h1>
		</div>
		<div class="container">
			<div class="profile_inf">
				<div class="photo">
					<img src="/security/avatar/lg/${member.username}" />
				</div>

				<div class="sebu_inf">
					<table border="1">
						<tr>
							<th>아이디</th>
							<td>${member.username}</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>${member.name}</td>
						</tr>
						<tr>
							<th>휴대폰 번호</th>
							<td>${member.phone}</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${member.email}</td>
						</tr>

					</table>
				</div>

			</div>

			<div class="menubox set">
				<div class="menu update">
					<a href="/security/check_pwd" >회원 정보 수정</a>
				</div>
				<div class="menu mypage">
					<a href="/security/mypage">마이 페이지</a>
				</div>
			</div>
		</div>
	</div>
</div>



<%@ include file="../layouts/footer.jsp"%>