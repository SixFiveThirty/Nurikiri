<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../layouts/header.jsp"%>
<%-- 개별 페이지 --%>

<style>
.con h1 {
	text-align: center;
	font-size: 24px;
	font-style: normal;
	font-weight: 500;
}

.loginbox {
	width: 500px;
	margin: auto;
}

.btn-group .btn {
	flex: none;
	background-color: #FEC25E;
	border-radius: 3px;
	padding: 0;
	width: 215px;
	height: 50px;
}

.btn-group {
	display: flex;
	justify-content: space-between;
}

.btn-container {
	display: flex;
	align-items: center;
}

.register-login-section {
	padding-top: 72px;
	padding-bottom: 80px;
}

.register-form h2, .login-form h2 {
	color: #252525;
	font-weight: 700;
	text-align: center;
	margin-bottom: 35px;
}

.register-form form .group-input, .login-form form .group-input {
	margin-bottom: 25px;
}

.register-form form .group-input label, .login-form form .group-input label
	{
	display: block;
	font-size: 16px;
	color: #252525;
	margin-bottom: 13px;
}

.site-btn {
	color: #ffffff;
	background: #FEC25E;
	border: 1px solid #FEC25E;
	font-weight: 700;
	text-transform: uppercase;
	padding: 13px 45px 11px;
	cursor: pointer;
}

.login-form form .group-input input.form-control{
	border: 1px solid #ebebeb;
	height: 50px;
	width: 100%;
	padding-left: 20px;
	padding-right: 15px;
}

.register-form form .register-btn, .register-form form .login-btn,
	.login-form form .register-btn, .login-form form .login-btn {
	width: 100%;
	letter-spacing: 2px;
	margin-top: 5px;
}

.register-form .switch-login, .login-form .switch-login {
	text-align: center;
	margin-top: 22px;
}

.register-form .switch-login .or-login, .login-form .switch-login .or-login
	{
	color: #252525;
	font-size: 14px;
	letter-spacing: 2px;
	text-transform: uppercase;
	position: relative;
}

.register-form .switch-login .or-login:before, .login-form .switch-login .or-login:before
	{
	position: absolute;
	left: 0;
	bottom: 0;
	height: 2px;
	width: 100%;
	background: #9f9f9f;
	content: "";
}

.login-form .group-input.gi-check {
	margin-bottom: 8px;
}

.login-form .group-input .gi-more {
	overflow: hidden;
}

.login-form .group-input .gi-more label {
	position: relative;
	cursor: pointer;
	padding-left: 28px;
	font-size: 14px;
	color: #6B6B6B;
	float: left;
}

.login-form .group-input .gi-more label input {
	position: absolute;
	visibility: hidden;
}

.login-form .group-input .gi-more label input:checked ~span {
	border-color: #6C6C6C;
}

.login-form .group-input .gi-more label input:checked ~span:after {
	border-color: #6c6c6c;
}

.login-form .group-input .gi-more label .checkmark {
	position: absolute;
	left: 0;
	top: 4px;
	height: 13px;
	width: 13px;
	border: 1px solid #6C6C6C;
	border-radius: 2px;
}

.login-form .group-input .gi-more label .checkmark:after {
	left: 2px;
	top: -2px;
	width: 13px;
	height: 6px;
	border: solid #ffffff;
	border-width: 2px 2px 0px 0px;
	-webkit-transform: rotate(127deg);
	-ms-transform: rotate(127deg);
	transform: rotate(127deg);
}

.login-form .group-input .gi-more .forget-pass {
	float: right;
	line-height: 20px;
	margin-top: -2px;
	font-size: 16px;
	color: #6B6B6B;
}

.btn-block {
	letter-spacing: 2px;
	text-transform: uppercase;
	position: relative;
}

.btn-block span{
	display: inline-block;
}

.btn-block span:after{
	display:block;
  content: '';
  border-bottom: solid 1px #000000;  
  transform: scaleX(0);  
  transition: transform 250ms ease-in-out;
}
.btn-block span:hover:after { transform: scaleX(1); }

.form-check{
}
</style>


<!-- Register Section Begin -->
<div class="register-login-section spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 offset-lg-3">
				<div class="login-form">
					<h2>로그인</h2>
					<form action="/security/login" method="post">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<div class="group-input">
							<label for="username">아이디</label> <input type="text"
								name="username" id="username" class="form-control" />
						</div>
						<div class="group-input">
							<label for="password">비밀번호</label> <input type="password"
								name="password" id="password" class="form-control">
						</div>
						<div class="group-input gi-check">
							<div class="form-group form-check">
								<label class="form-check-label"><input type="checkbox"
									name="remember-me" class="form-check-input" />로그인 상태 유지 
								</label>
							</div>
							<c:if test="${param.error == 'true' }">
								<div class="error">사용자 ID 또는 비밀번호가 일치하지 않습니다.</div>
							</c:if>
							<c:if test="${param.error == 'login_required' }">
								<div class="error">로그인이 필요합니다.</div>
							</c:if>
						</div>
						<button type="submit" class="btn btn-block site-btn">로그인</button>
					</form>
					<div class="switch-login">
						<button type="button" onclick="location.href='signup'"
							class="btn btn-block"><span>회원가입</span></button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../layouts/footer.jsp"%>