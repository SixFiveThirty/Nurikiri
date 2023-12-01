<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ include file="../layouts/header.jsp"%>

<script src="/resources/js/rest.js"></script>
<%-- 개별 페이지 --%>
<style>
.con {
	width: 500px
}

.con h1 {
	text-align: center;
	font-size: 24px;
	font-style: normal;
	font-weight: 500;
}

.btn {
	background-color: #FEC25E;
}

button.btn.check-sms-btn{
	width: 105px;
	height: 50px;
}

button.btn.check-sms-btn:hover{
	width: 105px;
	height: 50px;
	color: #ffffff;
}

.num_group {
	display: flex;
	justify-content: space-between;
	position: relative;
	align-items: center;
}

.num_group .group-input {
	width: 30%;
	margin-bottom: 20px;
	display: inline-block;
	box-sizing: border-box;
	top: 50%;
}

.num_group .group-input input {
	display: block;
	margin: 0 auto;
	width: 100%;
}

.text-center .btn {
	flex: none;
	background-color: #FEC25E;
	border-radius: 3px;
	padding: 0;
	width: 180px;
	height: 50px;
}

.profile_title {
	margin-bottom: 16px;
}

.avatar {
	margin-bottom: 32px;
}

.phone-certify {
	width: 100%;
	display: flex;
}
.sms {
	width: 100%;
}
.sms:nth-child(1) {
	flex-grow: 5;
}
.sms:nth-child(2) {
	flex-grow: 1;
}
.auth {
	width: 100%;
}
.auth:nth-child(1) {
	flex-grow: 5;
}
.auth:nth-child(2) {
	flex-grow: 1;
}

/*---------------------
  Register Form
-----------------------*/

.register-login-section {
	padding-top: 72px;
	padding-bottom: 80px;
}

.register-form h2,
.login-form h2 {
	color: #252525;
	font-weight: 700;
	text-align: center;
	margin-bottom: 35px;
}

.register-form form .group-input,
.login-form form .group-input {
	margin-bottom: 25px;
}

.register-form form .group-input label,
.login-form form .group-input label {
	display: block;
	font-size: 16px;
	color: #252525;
	margin-bottom: 13px;
}

.register-form form .group-input input,
.login-form form .group-input input {
	border: 1px solid #ebebeb;
	height: 50px;
	width: 100%;
	padding-left: 20px;
	padding-right: 15px;
}

.register-form form .register-btn,
.register-form form .login-btn,
.login-form form .register-btn,
.login-form form .login-btn {
	width: 100%;
	letter-spacing: 2px;
	margin-top: 5px;
}

.register-form .switch-login{
	text-align: center;
	margin-top: 22px;
}

.register-form .switch-login .or-login{
	color: #252525;
	font-size: 14px;
	letter-spacing: 2px;
	text-transform: uppercase;
	position: relative;
}

.register-form .switch-login .or-login:before{
	position: absolute;
	left: 0;
	bottom: 0;
	height: 2px;
	width: 100%;
	background: #9f9f9f;
	content: "";
}

.group-input.gi-check {
	margin-bottom: 8px;
}

.group-input .gi-more {
	overflow: hidden;
}

.group-input .gi-more label {
	position: relative;
	cursor: pointer;
	padding-left: 28px;
	font-size: 14px;
	color: #6B6B6B;
	float: left;
}

.group-input .gi-more label input {
	position: absolute;
	visibility: hidden;
}

.group-input .gi-more label input:checked~span {
	border-color: #6C6C6C;
}

.group-input .gi-more label input:checked~span:after {
	border-color: #6c6c6c;
}

.group-input .gi-more label .checkmark {
	position: absolute;
	left: 0;
	top: 4px;
	height: 13px;
	width: 13px;
	border: 1px solid #6C6C6C;
	border-radius: 2px;
}

.group-input .gi-more label .checkmark:after {
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

.group-input .gi-more .forget-pass {
	float: right;
	line-height: 20px;
	margin-top: -2px;
	font-size: 14px;
	color: #6B6B6B;
}

</style>

<script>
let phone = "";
let auth = "";

function phone_number() {
	phone = document.getElementById("phone").value;
}

const SMS_CHECK_URL = '/api/check/sendSMS?';
const AUTH_NUMBER_CHECK_URL = '/api/check/authNum';

async function check() {
	alert("인증번호를 발송했습니다.");
	await rest_message_get(SMS_CHECK_URL, phone);
}

async function check_num() {
	auth = document.getElementById("auth").value;
	let result = await rest_auth_num_post(AUTH_NUMBER_CHECK_URL, auth);
	if(result === 'OK') {
		alert('인증성공');
		document.getElementById("submit-btn").disabled = false;
	} else {
		alert('인증실패');
	}
}
</script>

<div class="register-login-section spad">
	<div class="container">
		<div class="row">
                <div class="col-lg-6 offset-lg-3">
		<div class="register-form">
			<h2>회원가입</h2>
			<form:form modelAttribute="member" cssClass="form"
				action="/security/signup?_csrf=${_csrf.token}"
				enctype="multipart/form-data">
				<div class="group-input">
					<form:label path="username">아이디</form:label>
					<form:input path="username" cssClass="form-control" />
					<form:errors path="username" cssClass="errors" />
				</div>
				<div class="group-input">
					<form:label path="password">비밀번호</form:label>
					<form:input path="password" cssClass="form-control" type="password" />
					<form:errors path="password" cssClass="errors" />
				</div>
				<div class="group-input">
					<form:label path="confirmedPassword">비밀번호 재확인</form:label>
					<form:input path="confirmedPassword" cssClass="form-control"
						type="password" />
					<form:errors path="confirmedPassword" cssClass="errors" />
				</div>
				<div class="group-input">
					<form:label path="name">이름</form:label>
					<form:input path="name" cssClass="form-control" />
					<form:errors path="name" cssClass="errors" />
				</div>
				<div class="group-input">
					<form:label path="jumin">주민번호</form:label>
					<form:input path="jumin" cssClass="form-control"/>
					<form:errors path="jumin" cssClass="errors" />
				</div>
				<div class="group-input">
					<form:label path="email">이메일</form:label>
					<form:input path="email" cssClass="form-control" />
					<form:errors path="email" cssClass="errors" />
				</div>
				
				<div class="group-input">
					<form:label path="phone">휴대폰번호</form:label>
					<div class="phone-certify">
						<div class="sms mr-3">
							<form:input id="phone" path="phone" cssClass="form-control" onkeyup="phone_number()" />
						</div>
						<div class="sms">
							<button type="button" class="btn check-sms-btn" onclick="check()">번호 확인</button>
						</div>
					</div>
					<form:errors path="phone" cssClass="errors" />
				</div>
				
				<div class="group-input">
					<label>인증번호 입력</label>
					<div class="phone-certify">
						<div class="auth mr-3">
							<input id="auth" class="form-control" />
						</div>
						<div class="auth">
							<button type="button" class="btn check-sms-btn" onclick="check_num()">인증 확인</button>
						</div>
					</div>
				</div>

				<div class="profile_title">프로필 사진 등록</div>
				<input type="file" name="avatar" class="avatar" />

				<div class="text-center">
					<button type="submit" class="btn" id="submit-btn" disabled>회원가입</button>
				</div>
			</form:form>
		</div>
		</div>
		</div>
	</div>
</div>

<%@ include file="../layouts/footer.jsp"%>