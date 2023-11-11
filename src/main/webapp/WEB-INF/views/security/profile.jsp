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
	margin-top: 20px;
}

.inf {
	width: 800px;
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-top: 20px;
	
}

.profile_inf {
	width: 90%;
	display : flex;
	margin: 0 auto;
	flex-direction: row; 
	display: flex;
	margin-bottom: 20px;
}

.box1 {
	display: flex;
}

.profile_inf .photo img {
	margin-left: 40px;
	width: 250px;
	height: 250px;
}

.profile_inf .sebu_inf{
	margin-left: 160px;
	display:flex;
	align-items: center;
}

.menubox {
	width: 800px;
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
	margin: 0 auto;
}

.menu {
	display: flex;
	margin: 0 auto;
	width: 250px;
	height: 80px;
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
					<table>
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
							<td>${member.phone1}- ${member.phone2} - ${member.phone3}</td>
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
					<a href="/security/update">회원 정보 수정</a>
				</div>
				<div class="menu mypage">
					<a href="/security/mypage">마이 페이지</a>
				</div>
			</div>
		</div>
	</div>
</div>



<%@ include file="../layouts/footer.jsp"%>