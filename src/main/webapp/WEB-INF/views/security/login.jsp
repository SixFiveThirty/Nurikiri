<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<%@ include file="../layouts/header.jsp" %>
<%-- 개별 페이지 --%>

<h1>Login Page</h1>

<c:if test="${param.error == 'true' }">
	<div class="error">
		사용자 ID 또는 비밀번호가 일치하지 않습니다.
	</div>
</c:if>
<c:if test="${param.error == 'login_required' }">
	<div class="error">
		로그인이 필요합니다.
	</div>
</c:if>

<form action="/security/login" method="post">

		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		
		<div class="form-group">
			<label for="username"> <i class="fa-solid fa-user"></i> 사용자 ID: </label>
			<input type="text" name="username" id="username" class="form-control"/>
		</div>
		
		<div class="form-group">
			<label for="password"> <i class="fa-solid fa-user"></i> 비밀번호: </label>
			<input type="password" name="password" id="password" class="form-control"/>
		</div>
		
		<div class="form-group form-check">
			<label class="form-check-label">
				<input type="checkbox" name="remember-me" class="form-check-input"/> 로그인 유지
			</label>
		</div>

		<button type="submit" class="btn btn-primary btn-block">
			<i class="fa-solid fa-right-to-bracket"></i>
			로그인
		</button>
		
		<button type="#" class="btn btn-primary btn-block">
			<i class="fa-solid fa-right-to-bracket"></i>
			회원가입
		</button>

</form>

<%@ include file="../layouts/footer.jsp" %>