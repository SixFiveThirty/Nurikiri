<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../layouts/header.jsp"%>
<%-- 개별 페이지 --%>

<style>
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

.login-form{
	position:relative;
}

.btn-group{
	display: flex;
    justify-content: space-between;
	width: 450px;
	margin: 0 auto;
}

.btn-container{
	background-color: #FEC25E;
	width: 180px;
    height: 50px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 700;
    border-radius: 3px;
}

.btn-container .btn{
	font-weight: 700;
	color: #ffffff;
}

.btn-container .btn:hover{
	color: #000000;
}

button.firstBtn:focus{ 	
    border: none;
    outline: none;
    }

</style>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.member" var="member" />
</sec:authorize>


<!-- Register Section Begin -->
<div class="register-login-section spad">
	<div class="container">
	<br />
			<div class="con mx-auto">
				<h1>비밀번호 재확인</h1>
				<form:form modelAttribute="member" cssClass="form" method="post" action="/security/changeState">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
				<div class="form-group">
				<p>${member.username}</p>
				
				<input type="hidden" name="username" value="${member.username}" />
				<input type="hidden" name="password" value="${member.password}"/>
				<input type="hidden" name="isDeleted" value="${member.isDeleted}"/>
					<form:label path="confirmedPassword">비밀번호</form:label>
					<form:input path="confirmedPassword" cssClass="form-control" type="password"/>
					<form:errors path="confirmedPassword" cssClass="errors" />
				</div>
			
				
			<div class="btn-group">
					<div class="btn-container">
						<button type="submit" class="btn form-control changeState"
							data-username="${member.username}">
							확인
						</button>
					</div>
				
					<div class="btn-container">
							 <a href="/security/profile" class="btn form-control">
						        취소
						      </a>
				     </div>
			      </div>
			</form:form>
		</div>
	</div>
</div>
	<form action="changeState" method="post" name="changeStateForm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
		<input type="hidden" name="username" class="change_username" />
		<input type="hidden" name="isDeleted" class="change_state" />
	</form>
	
	
	<script>
	$(document).ready(async function() {
		$('.changeState').click(function(){
			if(!confirm('정말 삭제할까요?')) return;
			const userName = $(this).data("username");
			$(".change_username").val(userName);
			$(".change_state").val('1');
			console.log(userName);
			document.forms.changeStateForm.submit();
			
		});
	});
	
	
    /*     function confirmSubmit() {
            var confirmResult = confirm("정말 삭제하시겠습니까?");

 
            return confirmResult;
        } */
        
        
    </script>

<%@ include file="../layouts/footer.jsp"%>