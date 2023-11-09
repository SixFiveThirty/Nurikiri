<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../layouts/header.jsp"%>
<%-- 개별 페이지 --%>

<style>
h1 {
	text-align: center;
}

.loginbox {
	width: 500px;
	margin: auto;
}

.btn-group .btn {
	background-color: #FEC25E;
	border-radius: 3px;
	margin: 0 auto;
	padding: 0;
	width: 215px;
	height: 50px;
}

.btn-group {
	display: flex;
	justify-content: space-between;
}
</style>

<h1>로그인</h1>

<c:if test="${param.error == 'true' }">
	<div class="error">사용자 ID 또는 비밀번호가 일치하지 않습니다.</div>
</c:if>
<c:if test="${param.error == 'login_required' }">
	<div class="error">로그인이 필요합니다.</div>
</c:if>

<form action="/security/login" method="post">

	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
	<div class="loginbox">
		<div class="form-group">
			<label for="username"></label> <input type="text" name="username"
				id="username" class="form-control" />
		</div>

		<div class="form-group">
			<label for="password"></label> <input type="password" name="password"
				id="password" class="form-control" />
		</div>

		<div class="form-group form-check">
			<label class="form-check-label"> <input type="checkbox"
				name="remember-me" class="form-check-input" /> 로그인 유지
			</label>
		</div>

		<div class="btn-group">
			<button type="submit" class="btn btn-block">로그인</button>

			<button type="button" onclick="location.href='signup'" class="btn btn-block">회원가입</button>
		</div>
	</div>

</form>

<%@ include file="../layouts/footer.jsp"%>