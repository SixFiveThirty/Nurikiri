<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../layouts/header.jsp"%>
<%-- 개별 페이지 --%>
<style>


  .text-center .btn {
   margin: 30px;
   background-color: #FEC25E;
   color: #FFFFFF;
   }
   .num {
   width:155px;
   }
</style>

<div style="width: 1216px" class="mx-auto">

	<h1 class="my-5">회원가입</h1>
	<div class="container">
		<form:form modelAttribute="member"
			action="/security/signup?_csrf=${_csrf.token}"
			enctype="multipart/form-data">
			<div class="form-group">
				<form:label path="username"> 아이디</form:label>
				<form:input path="username" cssclass="form-control" />
				<form:errors path="username" cssclass="errors" />
			</div>
			<div class="form-group">
				<form:label path="password">비밀번호</form:label>
				<form:input path="password" cssclass="form-control" type="password"/>
				<form:errors path="password" cssclass="errors" />
			</div>
			<div class="form-group">
				<form:label path="password2">비밀번호 재확인</form:label>
				<form:input path="password2" cssclass="form-control" type="password"/>
				<form:errors path="password2" cssclass="errors" />
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
			<div class="form-group num">
				<form:label path="phone1">phone</form:label>
				<form:input path="phone1" cssclass="form-control" />
				<form:errors path="phone1" cssclass="errors" />
			</div>
			<div class="form-group num">
				<form:label path="phone2"></form:label>
				<form:input path="phone2" cssclass="form-control" />
				<form:errors path="phone2" cssclass="errors" />
			</div>
			<div class="form-group num">
				<form:label path="phone3"></form:label>
				<form:input path="phone3" cssclass="form-control" />
				<form:errors path="phone3" cssclass="errors" />
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

<%@ include file="../layouts/footer.jsp"%>