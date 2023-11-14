<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ include file="../layouts/header.jsp"%>
<%-- 개별 페이지 --%>
<style>

	.form-group label {
	 margin-bottom: 5px;
	 display: block; 
	}

	.con{
	width: 500px
	}
	
	h1{
	text-align:center;
	}

   .btn{
	background-color: #FEC25E;
	}
	
	.num_group{
	display: flex;
    justify-content: space-between;
	}
	
	.num_group .form-group{
	width: 30%; 
    margin-bottom: 20px;
	}
	
	.num_group .form-group input {
    display: block;
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
</style>

<div style="width: 500px" class="mx-auto">

	
	<div class="container">
	<br />
			<div class="con mx-auto">
				<h1>회원가입</h1>
				<form:form modelAttribute="member"
					action="/security/signup?_csrf=${_csrf.token}"
					enctype="multipart/form-data">
				<div class="form-group">
					<form:label path="username">아이디</form:label>
					<form:input path="username" cssclass="form-control" />
					<form:errors path="username" cssclass="errors" />
				</div>
				<div class="form-group">
					<form:label path="password">비밀번호</form:label>
					<form:input path="password" cssclass="form-control" type="password"/>
					<form:errors path="password" cssclass="errors" />
				</div>
				<div class="form-group">
					<form:label path="confirmedPassword">비밀번호 재확인</form:label>
					<form:input path="confirmedPassword" cssclass="form-control" type="password"/>
					<form:errors path="confirmedPassword" cssclass="errors" />
				</div>
				<div class="form-group">
					<form:label path="name">이름</form:label>
					<form:input path="name" cssclass="form-control" />
					<form:errors path="name" cssclass="errors" />
				</div>
				<div class="form-group">
					<form:label path="jumin">주민번호</form:label>
					<form:input path="jumin" cssclass="form-control" />
					<form:errors path="jumin" cssclass="errors" />
				</div>
				<div class="form-group">
					<form:label path="email"> Email</form:label>
					<form:input path="email" cssclass="form-control" />
					<form:errors path="email" cssclass="errors" />
				</div>
				<div class="num_group">
					<div class="form-group num first">
						<form:label path="phone1">phone</form:label>
						<form:input path="phone1" cssclass="form-control" />
						<form:errors path="phone1" cssclass="errors" />
					</div>
					<div class="form-group num middle">
						<form:label path="phone2"></form:label>
						<form:input path="phone2" cssclass="form-control" />
						<form:errors path="phone2" cssclass="errors" />
					</div>
					<div class="form-group num last">
						<form:label path="phone3"></form:label>
						<form:input path="phone3" cssclass="form-control" />
						<form:errors path="phone3" cssclass="errors" />
					</div>
				</div>


			<input type="file" name="avatar" />
			<!-- multiple 추가하면 여러개 파일 선택 가능 -->

			<div class="text-center">
				<button type="submit" class="btn">회원가입
				</button>
			</div>




		</form:form>
		</div>
	</div>
</div>

<%@ include file="../layouts/footer.jsp"%>