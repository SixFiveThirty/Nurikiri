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

.num_group {
	display: flex;
	justify-content: space-between;
	position: relative;
	align-items: center;
}

.num_group .form-group {
	width: 30%;
	margin-bottom: 20px;
	display: inline-block;
	box-sizing: border-box;
	top: 50%;
}

.num_group .form-group input {
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

.input-auth {
	width: 395px;
}
</style>

<script>
let phone = "";

function number() {
	phone = document.getElementById("phone").value;
}

const SMS_CHECK_URL = '/api/check/sendSMS?';

async function check() {
	console.log("phone", phone);
	await rest_message_get(SMS_CHECK_URL, phone);
}
</script>

<div style="width: 500px" class="mx-auto">
	<div class="container">
		<br />
		<div class="con mx-auto">
			<h1>회원가입</h1>
			<form:form modelAttribute="member" cssClass="form"
				action="/security/signup?_csrf=${_csrf.token}"
				enctype="multipart/form-data">
				<div class="form-group">
					<form:label path="username">아이디</form:label>
					<form:input path="username" cssClass="form-control" />
					<form:errors path="username" cssClass="errors" />
				</div>
				<div class="form-group">
					<form:label path="password">비밀번호</form:label>
					<form:input path="password" cssClass="form-control" type="password" />
					<form:errors path="password" cssClass="errors" />
				</div>
				<div class="form-group">
					<form:label path="confirmedPassword">비밀번호 재확인</form:label>
					<form:input path="confirmedPassword" cssClass="form-control"
						type="password" />
					<form:errors path="confirmedPassword" cssClass="errors" />
				</div>
				<div class="form-group">
					<form:label path="name">이름</form:label>
					<form:input path="name" cssClass="form-control" />
					<form:errors path="name" cssClass="errors" />
				</div>
				<div class="form-group">
					<form:label path="jumin">주민번호</form:label>
					<form:input path="jumin" cssClass="form-control" />
					<form:errors path="jumin" cssClass="errors" />
				</div>
				<div class="form-group">
					<form:label path="email">이메일</form:label>
					<form:input path="email" cssClass="form-control" />
					<form:errors path="email" cssClass="errors" />
				</div>
				
				<div class="form-group">
					<form:label path="phone">휴대폰번호</form:label>
					<div class="phone-certify">
						<form:input id="phone" path="phone" cssClass="form-control input-auth mr-3" onkeyup="number()" />
						<button type="button" class="btn check-sms-btn" onclick="check()">번호 확인</button>
					</div>
					<form:errors path="phone" cssClass="errors" />
				</div>
				
				<div class="form-group">
					<form:label path="phone">인증번호 입력</form:label>
					<div class="phone-certify">
						<form:input id="phone" path="phone" cssClass="form-control input-auth mr-3" onkeyup="number()" />
						<button type="button" class="btn check-sms-btn" onclick="check()">인증 확인</button>
					</div>
					<form:errors path="phone" cssClass="errors" />
				</div>

				<div class="profile_title">프로필 사진 등록</div>
				<input type="file" name="avatar" class="avatar" />

				<div class="text-center">
					<button type="submit" class="btn">회원가입</button>
				</div>
			</form:form>
		</div>
	</div>
</div>

<%@ include file="../layouts/footer.jsp"%>