<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@ include file="../layouts/header.jsp"%>


<%-- 개별 페이지 --%>
<style>
.profile .set {
	display: flex;
	justify-content: space-between;
}

.inf {
	width: 1046px;
}

.profile_inf {
	justify-content: space-between
}

.photo img{
	width:24px;
	height:24px;
}

.menu{
	width:490px;
	height:101px;
	}

tr {
	display: table-row;
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

		<div class="profile_inf">
			<div class="box1 set">
				<div class="photo">
					<img src="/security/avatar/lg/${member.username}" />
				</div>

				<div class="inf">
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
							<td>${member.phone1} - ${member.phone2} - ${member.phone3}</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${member.email}</td>
						</tr>

					</table>
				</div>

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



<%@ include file="../layouts/footer.jsp"%>